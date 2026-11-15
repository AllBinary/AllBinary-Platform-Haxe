/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2006 AllBinary 
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
package org.allbinary.game.layer;

//import javax.microedition.lcdui.Font;
//import javax.microedition.lcdui.Graphics;
//import javax.microedition.lcdui.Image;
//import javax.microedition.lcdui.NullImage;
import org.allbinary.graphics.form.item.ABCustomImageItem;
import org.allbinary.logic.java.character.CharArrayFactory;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.font.MyFontProcessor;
import org.allbinary.graphics.font.UpdateMyFontInterface;
import org.allbinary.graphics.font.UpdateMyFontProcessor;
import org.allbinary.logic.math.PrimitiveLongUtil;

class TechnologyRTSInterfaceImageItem extends ABCustomImageItem implements UpdateMyFontInterface {
    private final rtsInterface : RTSInterface;
    private final primitiveLongUtil : PrimitiveLongUtil = PrimitiveLongUtil.createPowerOfTen(10000);
    private final LEVEL : String = "Level";
    private final COST : String = "Cost";
    private final DOLLAR : String = "$";
    private var myFontProcessor : MyFontProcessor = new UpdateMyFontProcessor(this);
    private var costString : haxe.ds.Vector<Int> = CharArrayFactory.getInstance().getZeroCharArray();
    private var costLength : Int = 0;
    private var levelString : haxe.ds.Vector<Int> = CharArrayFactory.getInstance().getZeroCharArray();
    private var levelLength : Int = 0;
    private var adjustedCostLabelY : Int = 0;
    private var adjustedCostX : Int = 0;
    private var adjustedCostY : Int = 0;
    private var adjustedLevelX : Int = 0;
    private var adjustedLevelY : Int = 0;
    public function new(label : String, img : Image, layout : Int, altText : String, basicColor : BasicColor, rtsInterface : RTSInterface) {
        super(label, img, layout, altText, basicColor, 0);
        this.rtsInterface = rtsInterface;
        this.update();
    }

    public override function updateMeasurement(graphics : Graphics) : Void {
        final font : Font = graphics.getFont();
        final fontHeight : Int = font.getHeight();
        var imageHeight : Int = 0;
        final image : Image = this.getImage();
        if (image != NullImage.NULL_IMAGE) {
            imageHeight = image.getHeight();
        }
        this.adjustedCostLabelY = -this.yOffset + imageHeight - (3 * fontHeight);
        this.adjustedCostY = -this.yOffset + imageHeight - (2 * fontHeight);
        this.adjustedCostX = 2 + (this.DOLLAR.length * (fontHeight - 1));
        this.adjustedLevelY = -this.yOffset + imageHeight - fontHeight;
        this.adjustedLevelX = 2 + (this.LEVEL.length * (fontHeight - 1));
        this.myFontProcessor = MyFontProcessor.getInstance();
    }

    public function getRtsInterface() : RTSInterface {
        return this.rtsInterface;
    }

    public function update() : Void {
        this.costString = this.primitiveLongUtil.getCharArray(this.getRtsInterface().getUpgradeCost());
        this.levelString = this.primitiveLongUtil.getCharArray(this.getRtsInterface().getLevel());
    }

    public override function paintXY(graphics : Graphics, x : Int, y : Int) : Void {
        this.myFontProcessor.process(graphics);
        super.paintXY(graphics, x, y);
        var xa : Int = x + 2;
        graphics.drawString(this.COST, xa, y + this.adjustedCostLabelY, 0);
        graphics.drawString(this.DOLLAR, xa, y + this.adjustedCostY, 0);
        graphics.drawChars(this.costString, 0, this.costLength, x + this.adjustedCostX, y + this.adjustedCostY, 0);
        graphics.drawString(this.LEVEL, xa, y + this.adjustedLevelY, 0);
        graphics.drawChars(this.levelString, 0, this.levelLength, x + this.adjustedLevelX, y + this.adjustedLevelY, 0);
    }

}

