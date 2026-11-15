/*
 *
 * AllBinary Open License Version 1
 * Copyright (c) 2011 AllBinary
 * 
 * By agreeing to this license you and any business entity you represent are
 * legally bound to the AllBinary Open License Version 1 legal agreement.
 * 
 * You may obtain the AllBinary Open License Version 1 legal agreement from
 * AllBinary or the root directory of AllBinary's AllBinary Platform repository.
 * 
 * Created By: Travis Berthelot
 *  
 */
// Generated Code Do Not Modify
package org.allbinary.input.automation.module.generic.configuration.profile;

//import java.io.DataOutputStream;
//import java.io.File;
//import java.io.FileInputStream;
//import java.io.FileOutputStream;
//import java.util.HashMap;
//import java.util.Set;
import org.allbinary.data.tree.dom.DomNodeInterface;
import org.allbinary.data.tree.dom.document.DomDocumentHelper;
import org.allbinary.data.tree.dom.document.XmlDocumentHelper;
import org.allbinary.data.tree.dom.document.mapping.DomDocumentMappingInterface;
import org.allbinary.input.automation.module.DefaultListModelHelper;
import org.allbinary.input.automation.module.generic.configuration.profile.actions.GenericProfileActionData;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

class GenericProfiles implements DomNodeInterface implements DomDocumentMappingInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public static final DEFAULT_PROFILES_PATH : String = "./modules/configs/profiles/";
    public static final DEFAULT_PROFILE_ACTIONS_PATH : String = GenericProfiles.DEFAULT_PROFILES_PATH + "actions/";
    public static final DEFAULT_FILE : String = GenericProfiles.DEFAULT_PROFILES_PATH + "profiles.xml";
    private var hashMap : HashMap;
    private var profilesDefaultListModelHelper : DefaultListModelHelper;
    private final fileName : String;
    public function new(fileName : String) {
        this.fileName = fileName;
        this.profilesDefaultListModelHelper = new DefaultListModelHelper();
        this.hashMap = StdUtil.getInstance().createHashMap();
        if (new File(fileName).isFile()) {
            var bytes : haxe.ds.Vector<Int> = haxe.ds.Vector.fromArrayCopy([for (index in 0...100000) 0]);
            var idFile : FileInputStream = new FileInputStream(fileName);
            var length : Int = idFile.read(bytes);
            var data : String = haxe.io.Bytes.ofData(bytes).toString();
            var endIndex : Int = data.lastIndexOf(">".code);
            var document : Document = DomDocumentHelper.create(data.substring(0, endIndex + 1));
            var nodeList : NodeList = document.getElementsByTagName(GenericProfilesData.NAME);
            this.logUtil.putF("Number Of Profiles Specified: " + nodeList.getLength(), this, "Contructor");
            if (nodeList != null) {
                this.initProfiles(nodeList.item(0));
            } else {
                throw new haxe.Exception(GenericProfileActionData.NAME + " Name Node Node Children");
            }
            this.logUtil.putF("Loaded: " + this.hashMap.size() + " Configuration Profile Actions", this, "Contructor");
        } else {
            this.logUtil.putF("No Generic Profile: " + fileName, this, "Contructor");
        }
        this.getDefaultListModelHelper().initDefaultModelList();
    }

    // throws Exception
    private function initProfiles(node : Node) : Void {
        var nodeList : NodeList = node.getChildNodes();
        for (index in 0...nodeList.getLength()) {
            var profileNameNode : Node = nodeList.item(index);
            if (profileNameNode.getNodeName().compareTo(GenericProfileData.NAME) == 0) {
                var genericProfile : GenericProfile = new GenericProfile(profileNameNode);
                this.hashMap.put(genericProfile.getName(), genericProfile);
                this.getDefaultListModelHelper().add(genericProfile.getName());
            }
        }
    }

    public function getDefaultListModelHelper() : DefaultListModelHelper {
        return this.profilesDefaultListModelHelper;
    }

    // throws Exception
    public function get(name : String) : GenericProfile {
        var genericProfile : GenericProfile = (cast this.hashMap.get(name) : GenericProfile);
        if (genericProfile == null) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            this.logUtil.putF("No Generic Profile Named: " + name + " availability was: " + this.hashMap, this, commonStrings.GET);
        }
        return genericProfile;
    }

    // throws Exception
    public function add(name : String) : Void {
        this.hashMap.put(name, new GenericProfile(name));
        this.getDefaultListModelHelper().add(name);
        this.getDefaultListModelHelper().initDefaultModelList();
        this.save();
    }

    // throws Exception
    public function remove(name : String) : Void {
        this.hashMap.remove(name);
        this.getDefaultListModelHelper().remove(name);
        this.getDefaultListModelHelper().initDefaultModelList();
        this.save();
    }

    // throws Exception
    public function toXmlNode(document : Document) : Node {
        var node : Node = document.createElement(GenericProfilesData.NAME);
        var set : Set = this.hashMap.keySet();
        final nameArray : haxe.ds.Vector<Any> = set.toArray();
        final size : Int = nameArray.length;
        for (index in 0...size) {
            var genericProfile : GenericProfile = (cast this.hashMap.get((cast nameArray[index] : String)) : GenericProfile);
            node.appendChild(genericProfile.toXmlNode(document));
        }
        return node;
    }

    // throws Exception
    public function toXmlDoc() : Document {
        var document : Document = DomDocumentHelper.create();
        var node : Node = this.toXmlNode(document);
        document.appendChild(node);
        return document;
    }

    // throws Exception
    public function save() : Void {
        var idFile : FileOutputStream = new FileOutputStream(this.fileName);
        var idOutData : DataOutputStream = new DataOutputStream(idFile);
        var documentString : String = XmlDocumentHelper.toString(this.toXmlDoc());
        idOutData.writeBytes(documentString);
    }

}

