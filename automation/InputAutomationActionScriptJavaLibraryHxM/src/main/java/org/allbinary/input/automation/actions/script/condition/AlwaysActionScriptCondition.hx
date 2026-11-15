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
package org.allbinary.input.automation.actions.script.condition;

//import java.util.HashMap;
import org.allbinary.data.tree.dom.DomNodeHelper;
import org.allbinary.data.tree.dom.DomSearchHelper;
import org.allbinary.data.tree.dom.ModDomHelper;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

class AlwaysActionScriptCondition extends BasicProfileActionScriptCondition implements AlwaysActionScriptConditionInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var alwaysActionScriptConditionJPanel : AlwaysActionScriptConditionJPanel = null;
    private var isOn : Bool = false;
    private static final NAME : String = "Always On/Off";
    public function new(node : Node) {
        super(AlwaysActionScriptCondition.NAME, node);
        var actionNode : Node = DomSearchHelper.getNode(AlwaysActionScriptConditionData.NAME, node.getChildNodes());
        if (actionNode != null) {
            var nodeList : NodeList = actionNode.getChildNodes();
            for (index in 0...nodeList.getLength()) {
                var childNode : Node = nodeList.item(index);
                if (childNode.getNodeName().compareTo(AlwaysActionScriptConditionData.IS_ON) == 0) {
                    var booleanString : String = DomNodeHelper.getTextNodeValue(childNode);
                    this.setIsOn(booleanString);
                } else {
                    throw new haxe.Exception("Action Script Condition Unknown Node");
                }
            }
        } else {
            throw new haxe.Exception("Action Script Condition Node Null");
        }
        this.init();
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new() {
        super(AlwaysActionScriptCondition.NAME);
        this.init();
    }

    private function init() : Void {
        this.alwaysActionScriptConditionJPanel = new AlwaysActionScriptConditionJPanel(this);
    }

    public function isIsOn() : Bool {
        return this.isOn;
    }

    public function setIsOn(isOn : Bool) : Void {
        this.isOn = isOn;
    }

    public function showDialog() : Void {
        this.alwaysActionScriptConditionJPanel.getAlwaysActionJDialog().setVisible(true);
    }

    public function toHashMap() : HashMap {
        var hashMap : HashMap = StdUtil.getInstance().createHashMap();
        hashMap.put(AlwaysActionScriptConditionData.IS_ON, Std.string(this.isIsOn()));
        this.logUtil.putF("HashMap: " + hashMap.toString(), this, "toHashMap()");
        return hashMap;
    }

    // throws Exception
    public function toXmlNode(document : Document) : Node {
        var node : Node = super.toXmlNode(document);
        node.appendChild(ModDomHelper.createNodeWithValueNodes(document, AlwaysActionScriptConditionData.NAME, this.toHashMap()));
        return node;
    }

    // throws Exception
    public function shouldProcess(frame : Null<haxe.Int64>) : Bool {
        if (this.isIsOn()) {
            return super.shouldProcess(frame);
        }
        return false;
    }

    public function log() : Void {
        this.logUtil.putF("Is On: " + this.isIsOn(), this, "log");
    }

}

