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

//import java.util.HashMap;
import org.allbinary.data.tree.dom.DomNodeHelper;
import org.allbinary.data.tree.dom.DomNodeInterface;
import org.allbinary.data.tree.dom.DomSearchHelper;
import org.allbinary.data.tree.dom.ModDomHelper;
import org.allbinary.input.automation.module.generic.configuration.profile.actions.script.GenericProfileActionScript;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.w3c.dom.Document;
import org.w3c.dom.Node;

class GenericProfileAction implements DomNodeInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var name : String;
    private var genericProfileActionScript : GenericProfileActionScript = null;
    private var genericProfileActionJPanel : GenericProfileActionJPanel = null;
    public function new(genericProfileActionJPanel : GenericProfileActionJPanel, node : Node) {
        var actionNameNode : Node = DomSearchHelper.getNode(GenericProfileActionData.NAME, node.getChildNodes());
        if (actionNameNode != null) {
            this.name = DomNodeHelper.getTextNodeValue(actionNameNode);
        } else {
            throw new haxe.Exception("Profile Action Name Node Null");
        }
        this.setGenericProfileActionScript(new GenericProfileActionScript(this.genericProfileActionJPanel, node));
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(name : String) {
        this.name = name;
        this.setGenericProfileActionScript(new GenericProfileActionScript(this.genericProfileActionJPanel));
    }

    public function getName() : String {
        return this.name;
    }

    public function setName(name : String) : Void {
        this.name = name;
    }

    public function toHashMap() : HashMap {
        var hashMap : HashMap = StdUtil.getInstance().createHashMap();
        hashMap.put(GenericProfileActionData.NAME, this.name);
        this.logUtil.putF("HashMap: " + hashMap.toString(), this, "toHashMap()");
        return hashMap;
    }

    // throws Exception
    public function toXmlNode(document : Document) : Node {
        var node : Node = ModDomHelper.createNodeWithValueNodes(document, GenericProfileActionData.NAME, this.toHashMap());
        node.appendChild(getGenericProfileActionScript().toXmlNode(document));
        return node;
    }

    public function getGenericProfileActionScript() : GenericProfileActionScript {
        return this.genericProfileActionScript;
    }

    public function setGenericProfileActionScript(genericProfileActionScript : GenericProfileActionScript) : Void {
        this.genericProfileActionScript = genericProfileActionScript;
    }

}

