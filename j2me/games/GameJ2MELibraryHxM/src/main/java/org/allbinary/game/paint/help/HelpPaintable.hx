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
package org.allbinary.game.paint.help;

//import javax.microedition.lcdui.Font;
//import javax.microedition.lcdui.Graphics;
import org.allbinary.graphics.Anchor;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.displayable.DisplayInfoSingleton;
import org.allbinary.graphics.font.MyFontProcessor;
import org.allbinary.graphics.font.UpdateMyFontInterface;
import org.allbinary.graphics.font.UpdateMyFontProcessor;
import org.allbinary.graphics.paint.Paintable;
import org.allbinary.logic.NullUtil;
import org.allbinary.logic.string.StringUtil;

class HelpPaintable extends Paintable implements UpdateMyFontInterface {
    public final displayInfo : DisplayInfoSingleton = DisplayInfoSingleton.getInstance();
    public final updateMyFontProcessor : MyFontProcessor = new UpdateMyFontProcessor(this);
    public var myFontProcessor : MyFontProcessor = this.updateMyFontProcessor;
    public var anchor : Int = Anchor.TOP_LEFT;
    public final title : String;
    public var inputInfo : haxe.ds.Vector<String> = StringUtil.getInstance().getArrayInstance();
    public var basicColor : BasicColor;
    public var titleBeginWidth : Int = 0;
    private var beginWidthArray : haxe.ds.Vector<Int> = NullUtil.getInstance().NULL_INT_ARRAY;
    private var charHeight : Int = 0;
    public function new(title : String, backgroundBasicColor : BasicColor, basicColor : BasicColor) {
        super();
        this.title = title;
        this.basicColor = basicColor;
    }

    public override function updateMeasurement(graphics : Graphics) : Void {
        final font : Font = graphics.getFont();
        this.titleBeginWidth = (font.stringWidth(this.title) >> 1);
        this.charHeight = font.getHeight();
        final size : Int = this.inputInfo.length;
        for (index in 0...size) {
            this.beginWidthArray[index] = (font.stringWidth(this.inputInfo[index]) >> 1);
        }
        this.myFontProcessor = MyFontProcessor.getInstance();
    }

    public function setInputInfoP(inputInfo : haxe.ds.Vector<String>) : Void {
        this.inputInfo = inputInfo;
        this.beginWidthArray = haxe.ds.Vector.fromArrayCopy([for (index in 0...this.inputInfo.length) 0]);
        this.myFontProcessor = this.updateMyFontProcessor;
    }

    public override function paint(graphics : Graphics) : Void {
        this.myFontProcessor.process(graphics);
        final halfWidth : Int = this.displayInfo.getLastHalfWidth();
        graphics.setColor(Std.int(this.basicColor));
        graphics.drawString(this.title, halfWidth - this.titleBeginWidth, this.charHeight, this.anchor);
        final size : Int = this.inputInfo.length;
        for (index in 0...size) {
            graphics.drawString(this.inputInfo[index], halfWidth - this.beginWidthArray[index], (index + 3) * this.charHeight, this.anchor);
        }
    }

}

