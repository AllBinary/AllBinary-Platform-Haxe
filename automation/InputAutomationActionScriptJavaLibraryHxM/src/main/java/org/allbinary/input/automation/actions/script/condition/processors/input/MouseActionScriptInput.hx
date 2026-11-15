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

//import java.awt.*;
//import java.awt.event.InputEvent;
//import java.util.HashMap;
import org.allbinary.data.tree.dom.DomNodeHelper;
import org.allbinary.data.tree.dom.DomSearchHelper;
import org.allbinary.data.tree.dom.ModDomHelper;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.java.bool.BooleanFactory;
import org.allbinary.logic.string.StringMaker;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

class MouseActionScriptInput extends BasicProfileActionScriptInput implements MouseActionScriptInputInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var point : Point;
    private var buttons : Int = 0;
    private static final NAME : String = "Mouse";
    private var mouseActionScriptInputJPanel : MouseActionScriptInputJPanel;
    public function new(node : Node) {
        super(NAME, node);
        this.logUtil.putF(this.commonStrings.START, this, this.commonStrings.CONSTRUCTOR);
        this.point = new Point();
        var actionNode : Node = DomSearchHelper.getNode(MouseActionScriptInputData.NAME, node.getChildNodes());
        if (actionNode != null) {
            var nodeList : NodeList = actionNode.getChildNodes();
            for (index in 0...nodeList.getLength()) {
                var childNode : Node = nodeList.item(index);
                if (childNode.getNodeName().compareTo(MouseActionScriptInputData.BUTTONS) == 0) {
                    var buttons : String = DomNodeHelper.getTextNodeValue(childNode);
                    this.setButtonClicks(Std.int(Std.string(buttons)));
                } else if (childNode.getNodeName().compareTo(MouseActionScriptInputData.MOVE) == 0) {
                    var mouseXNode : Node = DomSearchHelper.getNode(MouseActionScriptInputData.MOVE_X, childNode.getChildNodes());
                    var mouseXString : String = DomNodeHelper.getTextNodeValue(mouseXNode);
                    var mouseXInteger : Null<Int> = Std.string(mouseXString);
                    var mouseYNode : Node = DomSearchHelper.getNode(MouseActionScriptInputData.MOVE_Y, childNode.getChildNodes());
                    var mouseYString : String = DomNodeHelper.getTextNodeValue(mouseYNode);
                    var mouseYInteger : Null<Int> = Std.string(mouseYString);
                    var newPoint : Point = new Point(Std.int(mouseXInteger), Std.int(mouseYInteger));
                    this.setPoint(newPoint);
                } else {
                    throw new haxe.Exception("Action Script Input Unknown Node");
                }
            }
        } else {
            throw new haxe.Exception("Action Script Input Node Null");
        }
        this.setAllowsChildren(false);
        this.mouseActionScriptInputJPanel = new MouseActionScriptInputJPanel(this);
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new() {
        super(NAME);
        this.point = new Point();
        this.setAllowsChildren(false);
        this.mouseActionScriptInputJPanel = new MouseActionScriptInputJPanel(this);
    }

    public function setPoint(point : Point) : Void {
        this.point = point;
    }

    public function getPoint() : Point {
        return this.point;
    }

    public function getButtonClicks() : Int {
        return this.buttons;
    }

    public function setButtonClicks(buttons : Int) : Void {
        this.buttons = buttons;
    }

    public function showDialog() : Void {
        this.mouseActionScriptInputJPanel.getMouseActionJDialog().setVisible(true);
    }

    public function toHashMap() : HashMap {
        var hashMap : HashMap = StdUtil.getInstance().createHashMap();
        hashMap.put(MouseActionScriptInputData.BUTTONS, Std.string(this.getButtonClicks()));
        this.logUtil.putF("HashMap: " + hashMap.toString(), this, "toHashMap()");
        return hashMap;
    }

    // throws Exception
    public function toXmlNode(document : Document) : Node {
        var node : Node = super.toXmlNode(document);
        var mouseNode : Node = ModDomHelper.createNodeWithValueNodes(document, MouseActionScriptInputData.NAME, this.toHashMap());
        node.appendChild(mouseNode);
        var hashMap : HashMap = StdUtil.getInstance().createHashMap();
        hashMap.put(MouseActionScriptInputData.MOVE_X, Std.string(this.getPoint().x));
        hashMap.put(MouseActionScriptInputData.MOVE_Y, Std.string(this.getPoint().y));
        mouseNode.appendChild(ModDomHelper.createNodeWithValueNodes(document, MouseActionScriptInputData.MOVE, hashMap));
        return node;
    }

    // throws Exception
    public function process(frame : Null<haxe.Int64>) : Void {
        MouseInputAutomationProcessor.process(this);
    }

    public function log() : Void {
        var buttonStringBuffer : StringMaker = new StringMaker();
        buttonStringBuffer.append("1: ");
        final booleanFactory : BooleanFactory = BooleanFactory.getInstance();
        if ((this.getButtonClicks() & InputEvent.BUTTON1_MASK) != 0) {
            buttonStringBuffer.append(booleanFactory.TRUE_STRING);
        } else {
            buttonStringBuffer.append(booleanFactory.FALSE_STRING);
        }
        buttonStringBuffer.append(" 2: ");
        if ((this.getButtonClicks() & InputEvent.BUTTON2_MASK) != 0) {
            buttonStringBuffer.append(booleanFactory.TRUE_STRING);
        } else {
            buttonStringBuffer.append(booleanFactory.FALSE_STRING);
        }
        buttonStringBuffer.append(" 3: ");
        if ((this.getButtonClicks() & InputEvent.BUTTON3_MASK) != 0) {
            buttonStringBuffer.append(booleanFactory.TRUE_STRING);
        } else {
            buttonStringBuffer.append(booleanFactory.FALSE_STRING);
        }
        this.logUtil.putF("Input Type: " + this.getInputRobotInterface().getName() + " Point: " + this.getPoint() + " Buttons Clicked: " + buttonStringBuffer.toString(), this, "log");
    }

}

