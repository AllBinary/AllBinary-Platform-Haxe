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
package org.allbinary.game.graphics.hud;

import javax.microedition.lcdui.Graphics;
import org.allbinary.graphics.Anchor;
import org.allbinary.graphics.GPoint;
import org.allbinary.graphics.PointFactory;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.color.BasicColorFactory;
import org.allbinary.graphics.color.BasicColorSetUtil;
import org.allbinary.graphics.displayable.CanvasStrings;
import org.allbinary.graphics.displayable.DisplayInfoSingleton;
import org.allbinary.graphics.displayable.event.DisplayChangeEvent;
import org.allbinary.graphics.font.MyFontProcessor;
import org.allbinary.graphics.font.UpdateMyFontInterface;
import org.allbinary.graphics.font.UpdateMyFontProcessor;
import org.allbinary.logic.communication.log.ForcedLogUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.util.event.AllBinaryEventObject;
import org.allbinary.logic.util.event.EventStrings;
import org.allbinary.string.CommonStrings;

class BasicHud_1 implements UpdateMyFontInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    public final canvasStrings : CanvasStrings = CanvasStrings.getInstance();
    public final basicSetColorUtil : BasicColorSetUtil = BasicColorSetUtil.getInstance();
    private final displayInfo : DisplayInfoSingleton = DisplayInfoSingleton.getInstance();
    private final updateMyFontProcessor : MyFontProcessor;
    private var myFontProcessor : MyFontProcessor;
    private var location : Int = 0;
    private var direction : Int = 0;
    private var bufferZone : Int = 0;
    private var hudGraphicsPosition : HudGraphicsPosition = HudGraphicsPosition.NULL_HUD_GRAPHICS_POSITION;
    private var x : Int = 0;
    private var y : Int = 0;
    private var basicColor : BasicColor = BasicColorFactory.getInstance().BLACK;
    private var color : Int;
    public var updateMaxWidth : Int = 0;
    public var updateMaxHeight : Int = 0;
    public function new(location : Int, direction : Int, bufferZone : Int, basicColor : BasicColor) {
        this.updateMyFontProcessor = new UpdateMyFontProcessor(this);
        this.myFontProcessor = this.updateMyFontProcessor;
        this.setLocation(location);
        this.setDirection(direction);
        this.setBufferZone(bufferZone);
        this.onDisplayChangeEvent(DisplayInfoSingleton.getInstance().displayChangeEvent);
        this.setBasicColorP(basicColor);
        this.color = basicColor.intValue();
    }

    public function updateMeasurement(graphics : Graphics) : Void {
        try {
            this.hudGraphicsPosition = this.getHudGraphicsPositionWH(this.displayInfo.getLastWidth(), this.displayInfo.getLastHeight(), this.updateMaxWidth, this.updateMaxHeight);
            this.x = this.hudGraphicsPosition.getPoint().getX();
            this.setY(this.hudGraphicsPosition.getPoint().getY());
        } catch (e : haxe.Exception) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            this.logUtil.put(commonStrings.EXCEPTION, this, this.canvasStrings.ON_DISPLAY_CHANGE_EVENT, e);
        }
        this.myFontProcessor = MyFontProcessor.getInstance();
    }

    public function getLocation() : Int {
        return this.location;
    }

    public function getDirection() : Int {
        return this.direction;
    }

    // throws Exception
    public function getHudGraphicsPositionWH(width : Int, height : Int, maxWidth : Int, maxHeight : Int) : HudGraphicsPosition {
        var x : Int = 0;
        var y : Int = 0;
        var anchor : Int = 0;
        final basicHudFactory : BasicHudFactory = BasicHudFactory.getInstance();
        if (basicHudFactory.BOTTOMLEFT == this.getLocation()) {
            x = this.bufferZone + 2;
            y = height - maxHeight - this.bufferZone;
            anchor = Graphics.BOTTOM & Graphics.LEFT;
        } else if (basicHudFactory.BOTTOMRIGHT == this.getLocation()) {
            x = width - maxWidth;
            y = height - maxHeight - this.bufferZone;
            anchor = Graphics.BOTTOM & Graphics.RIGHT;
        } else if (basicHudFactory.TOPLEFT == this.getLocation()) {
            x = this.bufferZone + 2;
            y = this.bufferZone + 5;
            anchor = Anchor.TOP_LEFT;
        } else if (basicHudFactory.TOPRIGHT == this.getLocation()) {
            x = width - maxWidth;
            y = this.bufferZone + 5;
            anchor = Graphics.TOP & Graphics.RIGHT;
        } else if (basicHudFactory.TOPCENTER == this.getLocation()) {
            x = (Std.int((width - maxWidth) / 2));
            y = this.bufferZone + 5;
            anchor = Graphics.TOP & Graphics.HCENTER;
        } else if (basicHudFactory.BOTTOMCENTER == this.getLocation()) {
            x = (Std.int((width - maxWidth) / 2));
            y = height - maxHeight - this.bufferZone;
            anchor = Graphics.BOTTOM & Graphics.HCENTER;
        } else if (basicHudFactory.ABSOLUTE == this.getLocation()) {
            x = maxHeight;
            y = maxWidth;
            anchor = 0;
        }
        return new HudGraphicsPosition(this.getPoint(x, y), anchor);
    }

    public function onEvent(eventObject : AllBinaryEventObject) : Void {
        ForcedLogUtil.log(EventStrings.getInstance().PERFORMANCE_MESSAGE, this);
    }

    public function onDisplayChangeEvent(displayChangeEvent : DisplayChangeEvent) : Void {
        this.myFontProcessor = this.updateMyFontProcessor;
    }

    public function getPoint(x : Int, y : Int) : GPoint {
        return PointFactory.getInstance().createXY(x, y);
    }

    public function getBufferZone() : Int {
        return this.bufferZone;
    }

    public function setBufferZone(bufferZone : Int) : Void {
        this.bufferZone = bufferZone;
    }

    public function setLocation(location : Int) : Void {
        this.location = location;
    }

    public function setDirection(direction : Int) : Void {
        this.direction = direction;
    }

    public function getHudGraphicsPosition() : HudGraphicsPosition {
        return this.hudGraphicsPosition;
    }

    public function getColor() : Int {
        return this.color;
    }

    public function getX() : Int {
        return this.x;
    }

    public function setX(x : Int) : Void {
        this.x = x;
    }

    public function setBasicColorP(basicColor : BasicColor) : Void {
        this.basicColor = basicColor;
    }

    public function getBasicColorP() : BasicColor {
        return this.basicColor;
    }

    public function setY(y : Int) : Void {
        this.y = y;
    }

    public function getY() : Int {
        return this.y;
    }

    public function paintSSO(graphics : Graphics, string : String, string2 : String, offset : Int) : Void {
        this.myFontProcessor.process(graphics);
        this.basicSetColorUtil.setBasicColorP(graphics, this.getBasicColorP());
        graphics.drawString(string, this.x, this.getY(), this.hudGraphicsPosition.getAnchor());
        graphics.drawString(string2, this.x + offset, this.getY(), this.hudGraphicsPosition.getAnchor());
    }

    public function paintSSOO(graphics : Graphics, string : String, string2 : String, offset : Int, offset2 : Int) : Void {
        this.myFontProcessor.process(graphics);
        graphics.setColor(this.getColor());
        graphics.drawString(string, this.x + offset, this.getY(), this.hudGraphicsPosition.getAnchor());
        graphics.drawString(string2, this.x + offset2, this.getY(), this.hudGraphicsPosition.getAnchor());
    }

    public function paintDXY(graphics : Graphics, charArray : haxe.ds.Vector<Int>, offset : Int, len : Int, charArray2 : haxe.ds.Vector<Int>, offset2 : Int, len2 : Int, xOffset : Int, xOffset2 : Int) : Void {
        this.myFontProcessor.process(graphics);
        this.basicSetColorUtil.setBasicColorP(graphics, this.getBasicColorP());
        final y : Int = this.getY();
        graphics.drawChars(charArray, offset, len, this.x + xOffset, y, this.hudGraphicsPosition.getAnchor());
        graphics.drawChars(charArray2, offset2, len2, this.x + xOffset2, y, this.hudGraphicsPosition.getAnchor());
    }

    public function paintDX(graphics : Graphics, charArray : haxe.ds.Vector<Int>, offset : Int, len : Int, charArray2 : haxe.ds.Vector<Int>, offset2 : Int, len2 : Int, xOffset : Int) : Void {
        this.myFontProcessor.process(graphics);
        this.basicSetColorUtil.setBasicColorP(graphics, this.getBasicColorP());
        final y : Int = this.getY();
        graphics.drawChars(charArray, offset, len, this.x, y, this.hudGraphicsPosition.getAnchor());
        graphics.drawChars(charArray2, offset2, len2, this.x + xOffset, y, this.hudGraphicsPosition.getAnchor());
    }

    public function paintOffsetAndLength(graphics : Graphics, charArray : haxe.ds.Vector<Int>, offset : Int, len : Int) : Void {
        this.myFontProcessor.process(graphics);
        this.basicSetColorUtil.setBasicColorP(graphics, this.getBasicColorP());
        final y : Int = this.getY();
        graphics.drawChars(charArray, offset, len, this.x, y, this.hudGraphicsPosition.getAnchor());
    }

    public var offsetY : Int = 0;
    public function paintString(graphics : Graphics, string : String) : Void {
        this.myFontProcessor.process(graphics);
        this.basicSetColorUtil.setBasicColorP(graphics, this.getBasicColorP());
        final y : Int = this.getY() + this.offsetY;
        graphics.drawString(string, this.x, y, this.hudGraphicsPosition.getAnchor());
    }

}

