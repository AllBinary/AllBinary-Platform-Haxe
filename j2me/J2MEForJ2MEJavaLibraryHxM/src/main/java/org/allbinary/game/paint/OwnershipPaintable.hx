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
package org.allbinary.game.paint;

import javax.microedition.lcdui.Font;
import javax.microedition.lcdui.Graphics;
import org.allbinary.graphics.Anchor;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.color.BasicColorFactory;
import org.allbinary.graphics.displayable.DisplayInfoSingleton;
import org.allbinary.graphics.font.MyFontProcessor;
import org.allbinary.graphics.font.UpdateMyFontInterface;
import org.allbinary.graphics.font.UpdateMyFontProcessor;
import org.allbinary.graphics.paint.Paintable;
import org.allbinary.logic.communication.log.LogUtil;

//J2MEForJ2ME
class OwnershipPaintable extends Paintable implements UpdateMyFontInterface {
    public static function getInstance() : OwnershipPaintable {
        return new OwnershipPaintable();
    }

    public final logUtil : LogUtil = LogUtil.getInstance();
    private final displayInfo : DisplayInfoSingleton = DisplayInfoSingleton.getInstance();
    private var myFontProcessor : MyFontProcessor;
    private final COPYRIGHT : String = "AllBinary Copyright (c) 2011";
    private var basicColor : BasicColor = BasicColorFactory.getInstance().WHITE;
    private var color : Int;
    private var anchor : Int = Anchor.TOP_LEFT;
    private var COPYRIGHT_Y : Int = 0;
    private var beginWidth : Int = 0;
    public function new() {
        super();
        this.myFontProcessor = new UpdateMyFontProcessor(this);
        this.color = this.basicColor.intValue();
    }

    public function updateMeasurement(graphics : Graphics) : Void {
        final font : Font = graphics.getFont();
        this.COPYRIGHT_Y = 2 * font.getHeight();
        this.beginWidth = (font.stringWidth(this.COPYRIGHT) >> 1);
        this.myFontProcessor = MyFontProcessor.getInstance();
    }

    public override function setBasicColorP(basicColor : BasicColor) : Void {
        this.basicColor = basicColor;
        this.color = basicColor.intValue();
    }

    public function getBasicColorP() : BasicColor {
        return this.basicColor;
    }

    public override function paint(graphics : Graphics) : Void {
        this.myFontProcessor.process(graphics);
        graphics.setColor(this.color);
        final halfWidth : Int = this.displayInfo.getLastHalfWidth();
        final height : Int = this.displayInfo.getLastHeight();
        graphics.drawString(this.COPYRIGHT, halfWidth - this.beginWidth, height - this.COPYRIGHT_Y, this.anchor);
    }

}

