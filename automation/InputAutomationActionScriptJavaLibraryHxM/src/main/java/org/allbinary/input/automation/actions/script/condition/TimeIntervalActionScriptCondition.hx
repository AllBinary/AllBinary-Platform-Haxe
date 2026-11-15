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
import org.allbinary.time.TimeDelayHelper;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

class TimeIntervalActionScriptCondition extends BasicProfileActionScriptCondition implements TimeIntervalActionScriptConditionInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var timeIntervalActionScriptConditionJPanel : TimeIntervalActionScriptConditionJPanel = null;
    private var timeHelper : TimeDelayHelper = null;
    private static final NAME : String = "Time Interval";
    public function new(node : Node) {
        super(TimeIntervalActionScriptCondition.NAME, node);
        var actionNode : Node = DomSearchHelper.getNode(TimeIntervalActionScriptConditionData.NAME, node.getChildNodes());
        if (actionNode != null) {
            var nodeList : NodeList = actionNode.getChildNodes();
            for (index in 0...nodeList.getLength()) {
                var childNode : Node = nodeList.item(index);
                if (childNode.getNodeName().compareTo(TimeIntervalActionScriptConditionData.TIME) == 0) {
                    var interval : String = DomNodeHelper.getTextNodeValue(childNode);
                    this.setTimeDelayHelper(new TimeDelayHelper(Std.string(interval)));
                } else {
                    throw new haxe.Exception("Time Interval Action Script Condition Unknown Node");
                }
            }
        } else {
            throw new haxe.Exception("Time Interval Action Script Condition Node Null");
        }
        this.init();
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new() {
        super(TimeIntervalActionScriptCondition.NAME);
        this.setTimeDelayHelper(new TimeDelayHelper(0));
        this.init();
    }

    private function init() : Void {
        this.timeIntervalActionScriptConditionJPanel = new TimeIntervalActionScriptConditionJPanel(this);
    }

    public function showDialog() : Void {
        this.timeIntervalActionScriptConditionJPanel.getTimeIntervalActionJDialog().setVisible(true);
    }

    public function toHashMap() : HashMap {
        var hashMap : HashMap = StdUtil.getInstance().createHashMap();
        hashMap.put(TimeIntervalActionScriptConditionData.TIME, Std.string(this.timeHelper.delay));
        this.logUtil.putF("HashMap: " + hashMap.toString(), this, "toHashMap()");
        return hashMap;
    }

    // throws Exception
    public function toXmlNode(document : Document) : Node {
        var node : Node = super.toXmlNode(document);
        node.appendChild(ModDomHelper.createNodeWithValueNodes(document, TimeIntervalActionScriptConditionData.NAME, this.toHashMap()));
        return node;
    }

    public function log() : Void {
        this.logUtil.putF("Time Interval: " + this.timeHelper.delay, this, "log");
    }

    public function getTimeDelayHelper() : TimeDelayHelper {
        return this.timeHelper;
    }

    public function setTimeDelayHelper(timeHelper : TimeDelayHelper) : Void {
        this.timeHelper = timeHelper;
    }

    // throws Exception
    public function shouldProcess(frame : Null<haxe.Int64>) : Bool {
        final timeHelper : TimeDelayHelper = this.getTimeDelayHelper();
        if (timeHelper.isTimeTNT()) {
            timeHelper.setStartTimeTNT();
            return super.shouldProcess(frame);
        }
        return false;
    }

}

