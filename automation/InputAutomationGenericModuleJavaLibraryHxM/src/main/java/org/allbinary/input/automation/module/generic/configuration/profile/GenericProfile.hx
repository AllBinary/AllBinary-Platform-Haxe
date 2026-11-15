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

import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.data.tree.dom.DomNodeHelper;
import org.allbinary.data.tree.dom.ModDomHelper;
import org.allbinary.input.automation.module.generic.configuration.profile.actions.GenericProfileActions;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

class GenericProfile {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var name : String = null;
    private var vector : BasicArrayList;
    private var genericProfileActions : GenericProfileActions = null;
    public function new(node : Node) {
        this.setName(DomNodeHelper.getTextNodeValue(node));
        this.vector = new BasicArrayListD();
        var nodeList : NodeList = node.getChildNodes();
        this.logUtil.putF("Name: " + this.getName() + " Child Nodes: " + nodeList.getLength(), this, "Contructor");
        for (index in 0...nodeList.getLength()) {
            var profileNode : Node = nodeList.item(index);
            if (profileNode.getNodeName().compareTo(GenericProfileDataWorkerData.NAME) == 0) {
                var genericProfileDataWorkerType : GenericProfileDataWorkerType = GenericProfileDataWorkerType.getInstance(profileNode);
                this.logUtil.putF("Adding GenericProfileDataWorkerType: " + genericProfileDataWorkerType.toString(), this, "Contructor");
                this.vector.add(genericProfileDataWorkerType);
            }
        }
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(name : String) {
        this.setName(name);
        this.vector = new BasicArrayListD();
    }

    public function getGenericProfileDataWorkerTypeVector() : BasicArrayList {
        return this.vector;
    }

    public function add(genericProfileDataWorkerType : GenericProfileDataWorkerType) : Void {
        if (!this.vector.contains(genericProfileDataWorkerType)) {
            this.vector.add(genericProfileDataWorkerType);
        }
    }

    public function remove(genericProfileDataWorkerType : GenericProfileDataWorkerType) : Void {
        this.vector.remove(genericProfileDataWorkerType);
    }

    // throws Exception
    public function toXmlNode(document : Document) : Node {
        var node : Node = ModDomHelper.createTextNode(document, GenericProfileData.NAME, this.name);
        final size : Int = this.vector.size();
        for (index in 0...size) {
            var genericProfileDataWorkerType : GenericProfileDataWorkerType = (cast this.vector.get(index) : GenericProfileDataWorkerType);
            node.appendChild(genericProfileDataWorkerType.toXmlNode(document));
        }
        return node;
    }

    public function getName() : String {
        return this.name;
    }

    public function setName(name : String) : Void {
        this.name = name;
    }

    public function getGenericProfileActions() : GenericProfileActions {
        return this.genericProfileActions;
    }

    public function setGenericProfileActions(genericProfileActions : GenericProfileActions) : Void {
        this.genericProfileActions = genericProfileActions;
    }

}

