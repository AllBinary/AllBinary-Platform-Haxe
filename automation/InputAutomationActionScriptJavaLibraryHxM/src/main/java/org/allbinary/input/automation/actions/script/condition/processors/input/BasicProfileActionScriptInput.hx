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
package org.allbinary.input.automation.actions.script.condition.processors.input;

//import java.util.HashMap;
//import java.util.Iterator;
//import java.util.Set;
import org.allbinary.data.tree.dom.DomNodeHelper;
import org.allbinary.data.tree.dom.DomSearchHelper;
import org.allbinary.data.tree.dom.ModDomHelper;
import org.allbinary.input.automation.actions.script.condition.processors.BasicProfileActionScriptProcessor;
import org.allbinary.input.automation.robot.InputRobotFactory;
import org.allbinary.input.automation.robot.InputRobotInterface;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.util.ABHashtable;
import org.w3c.dom.Document;
import org.w3c.dom.Node;

class BasicProfileActionScriptInput extends BasicProfileActionScriptProcessor implements ProfileActionScriptInputInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var inputRobotInterface : InputRobotInterface = null;
    private var time : Int = 0;
    public function new(label : String, node : Node) {
        super(label, node);
        this.logUtil.putF(this.commonStrings.START + label, this, this.commonStrings.CONSTRUCTOR);
        final actionNode : Node = DomSearchHelper.getNode(GenericProfileActionScriptInputData.TYPE, node.getChildNodes());
        final inputTypeString : String = DomNodeHelper.getTextNodeValue(actionNode);
        final timeNode : Node = DomSearchHelper.getNodeNoThrow(GenericProfileActionScriptInputData.DELAY, node.getChildNodes());
        if (timeNode != null) {
            final delayString : String = DomNodeHelper.getTextNodeValue(timeNode);
            this.setTime(Std.int(Std.string(delayString)));
        } else {
            this.setTime(0);
        }
        this.setInputRobotInterface(InputRobotFactory.getInstance().get(inputTypeString));
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(label : String) {
        super(label);
        this.logUtil.putF(this.commonStrings.START + label, this, this.commonStrings.CONSTRUCTOR);
        final inputRobotFactory : InputRobotFactory = InputRobotFactory.getInstance();
        final hashtable : ABHashtable<Any, Any> = (cast inputRobotFactory.get() : ABHashtable<Any, Any>);
        final set : Set = hashtable.keySet();
        final iterator : Iterator = set.iterator();
        this.setInputRobotInterface(inputRobotFactory.get((cast iterator.next() : String)));
        this.setTime(0);
    }

    public function getTime() : Int {
        return this.time;
    }

    public function setTime(time : Int) : Void {
        this.time = time;
    }

    public function BasicProfileActionScriptInput_toHashMap() : HashMap {
        var hashMap : HashMap = StdUtil.getInstance().createHashMap();
        hashMap.put(GenericProfileActionScriptInputData.TYPE, this.getInputRobotInterface().getName());
        hashMap.put(GenericProfileActionScriptInputData.DELAY, Std.string(this.getTime()));
        this.logUtil.putF("HashMap: " + hashMap.toString(), this, "toHashMap()");
        return hashMap;
    }

    // throws Exception
    public function toXmlNode(document : Document) : Node {
        var node : Node = ModDomHelper.createNodeWithValueNodes(document, GenericProfileActionScriptInputData.NAME, this.BasicProfileActionScriptInput_toHashMap());
        return node;
    }

    public function setInputRobotInterface(inputRobotInterface : InputRobotInterface) : Void {
        this.inputRobotInterface = inputRobotInterface;
    }

    public function getInputRobotInterface() : InputRobotInterface {
        return this.inputRobotInterface;
    }

    public function toString() : String {
        var stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(super.toString());
        stringBuffer.append(" Input Type: ");
        if (this.getInputRobotInterface() != null) {
            stringBuffer.append(this.getInputRobotInterface().getName());
        } else {
            stringBuffer.append(StringUtil.getInstance().NULL_STRING);
        }
        stringBuffer.append(" Time: ");
        stringBuffer.appendlong(haxe.Int64.ofInt(this.getTime()));
        return stringBuffer.toString();
    }

}

