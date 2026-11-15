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

//import java.awt.Color;
//import java.awt.Point;
//import java.awt.image.BufferedImage;
//import java.util.HashMap;
import org.allbinary.data.tree.dom.DomNodeHelper;
import org.allbinary.data.tree.dom.DomSearchHelper;
import org.allbinary.data.tree.dom.ModDomHelper;
import org.allbinary.graphics.color.ColorCacheFactory;
import org.allbinary.graphics.color.ColorCacheable;
import org.allbinary.input.media.image.capture.CapturedBufferedImagesCacheSingleton;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.util.cache.AutomaticCacheInterface;
import org.allbinary.media.image.analysis.ColorRange;
import org.allbinary.media.image.analysis.ColorRangeInterface;
import org.allbinary.media.image.cache.BufferedImageFrameCacheable;
import org.allbinary.string.CommonSeps;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

class ColorAtActionScriptCondition extends BasicProfileActionScriptCondition implements ColorAtActionScriptConditionInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var colorAtActionScriptConditionJPanel : ColorAtActionScriptConditionJPanel = null;
    private var point : Point;
    private var colorRangeInterface : ColorRangeInterface = (cast new ColorRange() : ColorRangeInterface);
    private static final NAME : String = "If Color At";
    public function new(node : Node) {
        super(ColorAtActionScriptCondition.NAME, node);
        this.point = new Point(0, 0);
        var actionNode : Node = DomSearchHelper.getNode(ColorAtActionScriptConditionData.NAME, node.getChildNodes());
        if (actionNode != null) {
            var nodeList : NodeList = actionNode.getChildNodes();
            for (index in 0...nodeList.getLength()) {
                var childNode : Node = nodeList.item(index);
                if (childNode.getNodeName().compareTo(ColorAtActionScriptConditionData.LOCATION_X) == 0) {
                    var locationX : String = DomNodeHelper.getTextNodeValue(childNode);
                    this.point.x = Std.string(locationX);
                } else if (childNode.getNodeName().compareTo(ColorAtActionScriptConditionData.LOCATION_Y) == 0) {
                    var locationY : String = DomNodeHelper.getTextNodeValue(childNode);
                    this.point.y = Std.string(locationY);
                } else if (childNode.getNodeName().compareTo(ColorAtActionScriptConditionData.MIN_RED) == 0) {
                    var string : String = DomNodeHelper.getTextNodeValue(childNode);
                    this.getColorRangeInterface().setMinRed(Std.string(string));
                } else if (childNode.getNodeName().compareTo(ColorAtActionScriptConditionData.MAX_RED) == 0) {
                    var string : String = DomNodeHelper.getTextNodeValue(childNode);
                    this.getColorRangeInterface().setMaxRed(Std.string(string));
                } else if (childNode.getNodeName().compareTo(ColorAtActionScriptConditionData.MIN_GREEN) == 0) {
                    var string : String = DomNodeHelper.getTextNodeValue(childNode);
                    this.getColorRangeInterface().setMinGreen(Std.string(string));
                } else if (childNode.getNodeName().compareTo(ColorAtActionScriptConditionData.MAX_GREEN) == 0) {
                    var string : String = DomNodeHelper.getTextNodeValue(childNode);
                    this.getColorRangeInterface().setMaxGreen(Std.string(string));
                } else if (childNode.getNodeName().compareTo(ColorAtActionScriptConditionData.MIN_BLUE) == 0) {
                    var string : String = DomNodeHelper.getTextNodeValue(childNode);
                    this.getColorRangeInterface().setMinBlue(Std.string(string));
                } else if (childNode.getNodeName().compareTo(ColorAtActionScriptConditionData.MAX_BLUE) == 0) {
                    var string : String = DomNodeHelper.getTextNodeValue(childNode);
                    this.getColorRangeInterface().setMaxBlue(Std.string(string));
                }
            }
        } else {
            throw new haxe.Exception("Color At Action Script Condition Node Null");
        }
        this.init();
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new() {
        super(ColorAtActionScriptCondition.NAME);
        this.point = new Point(0, 0);
        this.init();
    }

    private function init() : Void {
        this.colorAtActionScriptConditionJPanel = new ColorAtActionScriptConditionJPanel(this);
    }

    public function getPoint() : Point {
        return this.point;
    }

    public function setPoint(point : Point) : Void {
        this.point = point;
    }

    public function showDialog() : Void {
        this.colorAtActionScriptConditionJPanel.getColorAtActionJDialog().setVisible(true);
    }

    public function toHashMap() : HashMap {
        var hashMap : HashMap = StdUtil.getInstance().createHashMap();
        hashMap.put(ColorAtActionScriptConditionData.LOCATION_X, Std.string(this.getPoint().x));
        hashMap.put(ColorAtActionScriptConditionData.LOCATION_Y, Std.string(this.getPoint().y));
        hashMap.put(ColorAtActionScriptConditionData.MIN_RED, Std.string(this.getColorRangeInterface().getMinRed()));
        hashMap.put(ColorAtActionScriptConditionData.MAX_RED, Std.string(this.getColorRangeInterface().getMaxRed()));
        hashMap.put(ColorAtActionScriptConditionData.MIN_GREEN, Std.string(this.getColorRangeInterface().getMinGreen()));
        hashMap.put(ColorAtActionScriptConditionData.MAX_GREEN, Std.string(this.getColorRangeInterface().getMaxGreen()));
        hashMap.put(ColorAtActionScriptConditionData.MIN_BLUE, Std.string(this.getColorRangeInterface().getMinBlue()));
        hashMap.put(ColorAtActionScriptConditionData.MAX_BLUE, Std.string(this.getColorRangeInterface().getMaxBlue()));
        this.logUtil.putF("HashMap: " + hashMap.toString(), this, "toHashMap()");
        return hashMap;
    }

    // throws Exception
    public function toXmlNode(document : Document) : Node {
        var node : Node = super.toXmlNode(document);
        node.appendChild(ModDomHelper.createNodeWithValueNodes(document, ColorAtActionScriptConditionData.NAME, this.toHashMap()));
        return node;
    }

    // throws Exception
    public function shouldProcess(frame : haxe.Int64) : Bool {
        var capturedBufferedImageCacheable : BufferedImageFrameCacheable = (cast ((cast CapturedBufferedImagesCacheSingleton.getInstance() : AutomaticCacheInterface)).get(Std.string(frame)) : BufferedImageFrameCacheable);
        var bufferedImage : BufferedImage = capturedBufferedImageCacheable.getBufferedImage();
        var automaticCacheInterface : AutomaticCacheInterface = ColorCacheFactory.getInstance();
        var colorInteger : Null<Int> = Std.string(bufferedImage.getRGB(this.getPoint().x, this.getPoint().y));
        var colorCacheable : ColorCacheable = (cast automaticCacheInterface.get(colorInteger) : ColorCacheable);
        var color : Color = colorCacheable.getColor();
        if (this.colorRangeInterface.isInRange(color)) {
            return super.shouldProcess(frame);
        }
        return false;
    }

    public function log() : Void {
        final message : String = new StringMaker().append("getPoint(): ").append(this.getPoint().toString()).append(CommonSeps.getInstance().NEW_LINE).append(this.getColorRangeInterface().toString()).toString();
        this.logUtil.putF(message, this, "log");
    }

    public function getColorRangeInterface() : ColorRangeInterface {
        return this.colorRangeInterface;
    }

    public function setColorRangeInterface(colorRangeInterface : ColorRangeInterface) : Void {
        this.colorRangeInterface = colorRangeInterface;
    }

}

