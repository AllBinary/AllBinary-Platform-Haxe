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
package org.allbinary.input.automation.module.generic.configuration.profile.actions;

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
import org.allbinary.input.automation.module.generic.configuration.profile.GenericProfiles;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.io.file.CommonDataFileStrings;
import org.allbinary.logic.io.path.AbPath;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

class GenericProfileActions implements DomNodeInterface implements DomDocumentMappingInterface {
    public static final DEFAULT_PROFILE_ACTIONS_PATH : String = GenericProfiles.DEFAULT_PROFILES_PATH + "actions/";
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final commonFileStrings : CommonDataFileStrings = CommonDataFileStrings.getInstance();
    private var name : String = null;
    private var genericProfileActionsJPanel : GenericProfileActionsJPanel = null;
    private var actionsDefaultListModelHelper : DefaultListModelHelper = null;
    private var hashMap : HashMap = null;
    public function new(genericProfileActionsJPanel : GenericProfileActionsJPanel, name : String) {
        this.setName(name);
        this.init(genericProfileActionsJPanel);
        this.load();
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(genericProfileActionsJPanel : GenericProfileActionsJPanel, abPath : AbPath, name : String) {
        this.setName(name);
        this.init(genericProfileActionsJPanel);
        this.load();
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(genericProfileActionsJPanel : GenericProfileActionsJPanel, fileInputStream : FileInputStream, name : String) {
        this.setName(name);
        this.init(genericProfileActionsJPanel);
        this.fileInit(fileInputStream);
    }

    // throws Exception
    private function init(genericProfileActionsJPanel : GenericProfileActionsJPanel) : Void {
        this.setGenericProfileActionsJPanel(genericProfileActionsJPanel);
        this.actionsDefaultListModelHelper = new DefaultListModelHelper();
        this.setHashMap(new HashMap());
    }

    // throws Exception
    public function save() : Void {
        var idFile : FileOutputStream = new FileOutputStream(GenericProfileActions.DEFAULT_PROFILE_ACTIONS_PATH + getName() + this.commonFileStrings._XML);
        var idOutData : DataOutputStream = new DataOutputStream(idFile);
        idOutData.writeBytes(XmlDocumentHelper.toString(this.toXmlDoc()));
    }

    public function getFile(name : String) : File {
        var fileName : String = DEFAULT_PROFILE_ACTIONS_PATH + name + this.commonFileStrings._XML;
        return new File(fileName);
    }

    // throws Exception
    private function load() : Void {
        var file : File = this.getFile(getName());
        if (file.isFile()) {
            var idFile : FileInputStream = new FileInputStream(file);
            this.fileInit(idFile);
        } else {
            this.logUtil.putF("No Profile: " + file.getAbsolutePath(), this, "Contructor");
        }
    }

    // throws Exception
    private function fileInit(fileInputStream : FileInputStream) : Void {
        var bytes : haxe.ds.Vector<Int> = haxe.ds.Vector.fromArrayCopy([for (index in 0...100000) 0]);
        var length : Int = fileInputStream.read(bytes);
        var data : String = haxe.io.Bytes.ofData(bytes).toString();
        var endIndex : Int = data.lastIndexOf(">".code);
        var document : Document = DomDocumentHelper.create(data.substring(0, endIndex + 1));
        var nameNodeList : NodeList = document.getElementsByTagName(GenericProfileActionsData.NAME);
        this.logUtil.putF("Number Of Profiles Specified: " + nameNodeList.getLength(), this, "Contructor");
        for (index in 0...nameNodeList.getLength()) {
            var node : Node = nameNodeList.item(index);
            var nodeList : NodeList = node.getChildNodes();
            if (nodeList != null) {
                this.initActions(nodeList);
            } else {
                throw new haxe.Exception(GenericProfileActionData.NAME + " Name Node Node Children");
            }
        }
        this.logUtil.putF("Loaded: " + this.getHashMap().size() + " Configuration Profile Action(s)", this, "Contructor");
        this.getDefaultListModelHelper().initDefaultModelList();
    }

    // throws Exception
    private function initActions(nodeList : NodeList) : Void {
        for (index in 0...nodeList.getLength()) {
            var actionNode : Node = nodeList.item(index);
            if (actionNode != null) {
                var genericConfigurationProfileAction : GenericProfileAction = new GenericProfileAction(this.getGenericProfileActionsJPanel().getGenericProfileActionJPanel(), actionNode);
                this.getHashMap().put(genericConfigurationProfileAction.getName(), genericConfigurationProfileAction);
                this.getDefaultListModelHelper().add(genericConfigurationProfileAction.getName());
            } else {
                throw new haxe.Exception(GenericProfileActionData.NAME + " Node Null");
            }
        }
    }

    public function getDefaultListModelHelper() : DefaultListModelHelper {
        return this.actionsDefaultListModelHelper;
    }

    public function getAction(string : String) : GenericProfileAction {
        return (cast this.getHashMap().get(string) : GenericProfileAction);
    }

    // throws Exception
    public function add(name : String) : Void {
        var genericProfileAction : GenericProfileAction = new GenericProfileAction(name);
        this.getHashMap().put(genericProfileAction.getName(), genericProfileAction);
        this.getDefaultListModelHelper().add(genericProfileAction.getName());
        this.getDefaultListModelHelper().initDefaultModelList();
        this.save();
    }

    // throws Exception
    public function remove(name : String) : Void {
        this.getHashMap().remove(name);
        this.getDefaultListModelHelper().remove(name);
        this.getDefaultListModelHelper().initDefaultModelList();
        this.save();
    }

    public function toHashMap() : HashMap {
        var hashMap : HashMap = StdUtil.getInstance().createHashMap();
        this.logUtil.putF("HashMap: " + hashMap.toString(), this, "toHashMap()");
        return hashMap;
    }

    // throws Exception
    public function toXmlNode(document : Document) : Node {
        var node : Node = document.createElement(GenericProfileActionsData.NAME);
        var set : Set = this.getHashMap().keySet();
        final actionNameArray : haxe.ds.Vector<Any> = set.toArray();
        final size : Int = actionNameArray.length;
        for (index in 0...size) {
            var nextActionName : String = (cast actionNameArray[index] : String);
            var nextGenericProfileAction : GenericProfileAction = (cast this.getAction(nextActionName) : GenericProfileAction);
            node.appendChild(nextGenericProfileAction.toXmlNode(document));
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

    public function getGenericProfileActionsJPanel() : GenericProfileActionsJPanel {
        return this.genericProfileActionsJPanel;
    }

    public function setGenericProfileActionsJPanel(genericProfileActionsJPanel : GenericProfileActionsJPanel) : Void {
        this.genericProfileActionsJPanel = genericProfileActionsJPanel;
    }

    public function getHashMap() : HashMap {
        return this.hashMap;
    }

    public function setHashMap(hashMap : HashMap) : Void {
        this.hashMap = hashMap;
    }

    public function getName() : String {
        return this.name;
    }

    public function setName(name : String) : Void {
        this.name = name;
    }

}

