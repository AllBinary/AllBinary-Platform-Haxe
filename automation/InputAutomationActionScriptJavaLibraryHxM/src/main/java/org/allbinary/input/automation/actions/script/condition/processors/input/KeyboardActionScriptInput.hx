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

//import java.awt.event.KeyEvent;
//import java.util.HashMap;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.data.tree.dom.DomNodeHelper;
import org.allbinary.data.tree.dom.DomSearchHelper;
import org.allbinary.data.tree.dom.ModDomHelper;
import org.allbinary.input.KeySingletonFactory;
import org.allbinary.input.KeyUtil;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.string.CommonLabels;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

class KeyboardActionScriptInput extends BasicProfileActionScriptInput implements KeyboardActionScriptInputInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var keyArray : haxe.ds.Vector<Null<Int>> = haxe.ds.Vector.fromArrayCopy([KeySingletonFactory.getInstance(KeyEvent.VK_0)]);
    private static final NAME : String = "Keyboard";
    private var keyboardActionScriptInputJPanel : KeyboardActionScriptInputJPanel;
    private var press : Bool = false;
    private var release : Bool = false;
    private var delayBetweenKeys : Int = 0;
    public function new(node : Node) {
        super(NAME, node);
        this.logUtil.putF(this.commonStrings.START, this, this.commonStrings.CONSTRUCTOR);
        var actionNode : Node = DomSearchHelper.getNode(KeyboardActionScriptInputData.NAME, node.getChildNodes());
        if (actionNode != null) {
            var nodeList : NodeList = actionNode.getChildNodes();
            var vector : BasicArrayList = new BasicArrayListD();
            for (index in 0...nodeList.getLength()) {
                var childNode : Node = nodeList.item(index);
                if (childNode.getNodeName().startsWith(KeyboardActionScriptInputData.KEY)) {
                    var keyString : String = DomNodeHelper.getTextNodeValue(childNode);
                    vector.add(Std.string(keyString));
                } else if (childNode.getNodeName().compareTo(KeyboardActionScriptInputData.DELAY_BETWEEN_KEYS) == 0) {
                    var time : String = DomNodeHelper.getTextNodeValue(childNode);
                    this.setDelayBetweenKeys(Std.int(Std.string(time)));
                } else if (childNode.getNodeName().compareTo(KeyboardActionScriptInputData.PRESS) == 0) {
                    var value : String = DomNodeHelper.getTextNodeValue(childNode);
                    this.setPress(Std.string(value));
                } else if (childNode.getNodeName().compareTo(KeyboardActionScriptInputData.RELEASE) == 0) {
                    var value : String = DomNodeHelper.getTextNodeValue(childNode);
                    this.setRelease(Std.string(value));
                } else {
                    throw new haxe.Exception("Action Script Input Unknown Node");
                }
            }
            this.setKeyArray((cast vector.toArrayType(haxe.ds.Vector.fromArrayCopy([for (index in 0...vector.size()) null])) : haxe.ds.Vector<Null<Int>>));
        } else {
            throw new haxe.Exception("Action Script Input Node Null");
        }
        this.setAllowsChildren(false);
        if (!this.isPress() && !this.isRelease()) {
            this.setNormal();
        }
        this.keyboardActionScriptInputJPanel = new KeyboardActionScriptInputJPanel(this);
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new() {
        super(NAME);
        if (!this.isPress() && !this.isRelease()) {
            this.setNormal();
        }
        this.setAllowsChildren(false);
        this.setTime(120);
        this.keyboardActionScriptInputJPanel = new KeyboardActionScriptInputJPanel(this);
    }

    public function getDelayBetweenKeys() : Int {
        return this.delayBetweenKeys;
    }

    public function setDelayBetweenKeys(delayBetweenKeys : Int) : Void {
        this.delayBetweenKeys = delayBetweenKeys;
    }

    public function isPress() : Bool {
        return this.press;
    }

    public function setPress(press : Bool) : Void {
        this.press = press;
    }

    public function isRelease() : Bool {
        return this.release;
    }

    public function setRelease(release : Bool) : Void {
        this.release = release;
    }

    public function isNormal() : Bool {
        return this.isRelease() && this.isPress();
    }

    public function setNormal() : Void {
        this.setPress(true);
        this.setRelease(true);
    }

    public function getKeyArray() : haxe.ds.Vector<Null<Int>> {
        return this.keyArray;
    }

    public function setKeyArray(keyArray : haxe.ds.Vector<Null<Int>>) : Void {
        if (keyArray != null) {
            this.logUtil.putF(CommonLabels.getInstance().START + keyArray.length, this, "setKeyArray");
        }
        this.keyArray = keyArray;
    }

    public function showDialog() : Void {
        this.keyboardActionScriptInputJPanel.getKeyActionJDialog().setVisible(true);
    }

    public function getText() : String {
        return this.getText(this.getKeyArray());
    }

    public function setText(text : String) : Void {
        this.logUtil.putF(CommonLabels.getInstance().START + text, this, "setText");
        var integerArray : haxe.ds.Vector<Null<Int>> = this.integerArrayValue(text);
        this.setKeyArray(integerArray);
    }

    private static function getText(integerArray : haxe.ds.Vector<Null<Int>>) : String {
        var index : Int = 0;
        var stringBuffer : StringMaker = new StringMaker();
        while (index < integerArray.length) {
            var nextInteger : Null<Int> = integerArray[index];
            if (KeyUtil.isNormallyDisplayed(nextInteger)) {
                stringBuffer.append(KeyEvent.getKeyText(nextInteger));
            } else {
                stringBuffer.append("&#" + nextInteger + ";");
            }
            index++;
        }
        return stringBuffer.toString();
    }

    private function integerArrayValue(text : String) : haxe.ds.Vector<Null<Int>> {
        this.logUtil.putF(CommonLabels.getInstance().START + text, this, "integerArrayValue");
        var vector : BasicArrayList = new BasicArrayListD();
        var index : Int = 0;
        while (index < text.length) {
            var aChar : Int = text.charCodeAt(index);
            if (aChar == "&".code) {
                if (text.charCodeAt(index + 1) == "#".code) {
                    var endIndex : Int = text.indexOf(";".code, index + 1);
                    if (endIndex != -1) {
                        var nextCharString : String = text.substring(index + 2, endIndex);
                        this.logUtil.putF(CommonLabels.getInstance().NEXT + " Char String: " + nextCharString, this, "integerArrayValue");
                        vector.add(Std.string(nextCharString.substring(index, nextCharString.length)));
                        index = index + nextCharString.length + 3;
                        continue;
                    }
                }
            }
            vector.add(KeySingletonFactory.getHashtable().get(Std.string(aChar)));
            index++;
        }
        var integerArray : haxe.ds.Vector<Null<Int>> = (cast vector.toArrayType(haxe.ds.Vector.fromArrayCopy([for (index in 0...vector.size()) null])) : haxe.ds.Vector<Null<Int>>);
        return integerArray;
    }

    public function toHashMap() : HashMap {
        var hashMap : HashMap = StdUtil.getInstance().createHashMap();
        for (index in 0...this.getKeyArray().length) {
            hashMap.put(KeyboardActionScriptInputData.KEY + index, Std.string(this.getKeyArray()[index]));
        }
        hashMap.put(KeyboardActionScriptInputData.DELAY_BETWEEN_KEYS, Std.string(this.getDelayBetweenKeys()));
        hashMap.put(KeyboardActionScriptInputData.PRESS, Std.string(this.isPress()));
        hashMap.put(KeyboardActionScriptInputData.RELEASE, Std.string(this.isRelease()));
        this.logUtil.putF("HashMap: " + hashMap.toString(), this, "toHashMap()");
        return hashMap;
    }

    // throws Exception
    public function toXmlNode(document : Document) : Node {
        var node : Node = super.toXmlNode(document);
        node.appendChild(ModDomHelper.createNodeWithValueNodes(document, KeyboardActionScriptInputData.NAME, this.toHashMap()));
        return node;
    }

    // throws Exception
    public function process(frame : Null<haxe.Int64>) : Void {
        KeyboardInputAutomationProcessor.process(this);
    }

    public function log() : Void {
        this.logUtil.putF(this.toString(), this, "log");
    }

    public function toString() : String {
        var stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(super.toString());
        stringBuffer.append(" Text: ");
        stringBuffer.append(this.getText());
        stringBuffer.append(" isPress: ");
        stringBuffer.appendboolean(this.isPress());
        stringBuffer.append(" isRelease: ");
        stringBuffer.appendboolean(this.isRelease());
        stringBuffer.append(" Between Key Delay: ");
        stringBuffer.appendint(this.getDelayBetweenKeys());
        return stringBuffer.toString();
    }

}

