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
package org.allbinary.input.automation.module.actions.script.condition.processors.output;

//import java.util.HashMap;
import org.allbinary.data.tree.dom.DomNodeHelper;
import org.allbinary.data.tree.dom.DomSearchHelper;
import org.allbinary.data.tree.dom.ModDomHelper;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

class ImageActionScriptOutput extends BasicProfileActionScriptOutput implements ImageActionScriptOutputInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final NAME : String = "Captures";
    private var saved : Bool = false;
    private var display : Bool = false;
    private var imageTypes : ImageTypes = null;
    private var actionScriptOutputJPanel : ImageActionScriptOutputJPanel;
    public function new(node : Node) {
        super(NAME, node);
        this.logUtil.putF(this.commonStrings.START, this, this.commonStrings.CONSTRUCTOR);
        var actionNode : Node = DomSearchHelper.getNode(ImageActionScriptOutputData.NAME, node.getChildNodes());
        if (actionNode != null) {
            var nodeList : NodeList = actionNode.getChildNodes();
            for (index in 0...nodeList.getLength()) {
                var childNode : Node = nodeList.item(index);
                if (childNode.getNodeName().compareTo(ImageActionScriptOutputData.SAVE) == 0) {
                    var booleanString : String = DomNodeHelper.getTextNodeValue(childNode);
                    this.setSaved(booleanString);
                } else if (childNode.getNodeName().compareTo(ImageActionScriptOutputData.DISPLAY) == 0) {
                    var booleanString : String = DomNodeHelper.getTextNodeValue(childNode);
                    this.setSaved(booleanString);
                } else if (childNode.getNodeName().compareTo(ImageActionScriptOutputData.TYPES) == 0) {
                    this.setImageTypes(new ImageTypes(childNode));
                } else {
                    throw new haxe.Exception("Action Script Output Unknown Node");
                }
            }
        } else {
            throw new haxe.Exception("Action Script Output Node Null");
        }
        this.setAllowsChildren(false);
        this.actionScriptOutputJPanel = new ImageActionScriptOutputJPanel(this);
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new() {
        super(NAME);
        this.setImageTypes(new ImageTypes());
        this.setAllowsChildren(false);
        this.actionScriptOutputJPanel = new ImageActionScriptOutputJPanel(this);
    }

    public function getActionScriptOutputJPanel() : ImageActionScriptOutputJPanel {
        return this.actionScriptOutputJPanel;
    }

    public function toHashMap() : HashMap {
        var hashMap : HashMap = StdUtil.getInstance().createHashMap();
        hashMap.put(ImageActionScriptOutputData.DISPLAY, Std.string(this.isDisplay()));
        hashMap.put(ImageActionScriptOutputData.SAVE, Std.string(this.isSaved()));
        this.logUtil.putF("HashMap: " + hashMap.toString(), this, "toHashMap()");
        return hashMap;
    }

    // throws Exception
    public function toXmlNode(document : Document) : Node {
        var node : Node = super.toXmlNode(document);
        var newNode : Node = ModDomHelper.createNodeWithValueNodes(document, ImageActionScriptOutputData.NAME, this.toHashMap());
        newNode.appendChild(this.getImageTypes().toXmlNode(document));
        node.appendChild(newNode);
        return node;
    }

    // throws Exception
    public function process(frame : Null<haxe.Int64>) : Void {
        ImageActionScriptOutputProcessor.process(this, frame);
    }

    public function showDialog() : Void {
        this.actionScriptOutputJPanel.getCapturedImageActionJDialog().setVisible(true);
    }

    public function isSaved() : Bool {
        return this.saved;
    }

    public function setSaved(saved : Bool) : Void {
        this.saved = saved;
    }

    public function isDisplay() : Bool {
        return this.display;
    }

    public function setDisplay(display : Bool) : Void {
        this.display = display;
    }

    public function future_toString() : String {
        var stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(" Is Save: ");
        stringBuffer.appendboolean(this.isSaved());
        stringBuffer.append(" Is Display: ");
        stringBuffer.appendboolean(this.isDisplay());
        stringBuffer.append(" ");
        stringBuffer.append(this.getImageTypes().toString());
        return stringBuffer.toString();
    }

    public function log() : Void {
        this.logUtil.putF(this.future_toString(), this, "log");
    }

    public function getImageTypes() : ImageTypes {
        return this.imageTypes;
    }

    public function setImageTypes(imageTypes : ImageTypes) : Void {
        this.imageTypes = imageTypes;
    }

}

