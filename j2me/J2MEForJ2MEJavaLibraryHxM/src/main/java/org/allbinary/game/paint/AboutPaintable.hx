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
import org.allbinary.graphics.displayable.CanvasStrings;
import org.allbinary.graphics.displayable.DisplayInfoSingleton;
import org.allbinary.graphics.font.MyFontProcessor;
import org.allbinary.graphics.font.UpdateMyFontInterface;
import org.allbinary.graphics.font.UpdateMyFontProcessor;
import org.allbinary.graphics.paint.Paintable;

//J2MEForJ2ME
class AboutPaintable extends Paintable implements UpdateMyFontInterface {
    public static function getInstance(info : haxe.ds.Vector<String>, developers : haxe.ds.Vector<String>) : AboutPaintable {
        return new AboutPaintable(info, developers);
    }

    private final displayInfoSingleton : DisplayInfoSingleton = DisplayInfoSingleton.getInstance();
    private final ABOUT : String = CanvasStrings.getInstance().ABOUT;
    private final info : haxe.ds.Vector<String>;
    private final developers : haxe.ds.Vector<String>;
    private final paintableArray : haxe.ds.Vector<Paintable>;
    private var myFontProcessor : MyFontProcessor;
    private var charHeight : Int = 0;
    private var aboutBeginWidth : Int = 0;
    private var infoBeginWidth : haxe.ds.Vector<Int>;
    private var developersBeginWidth : haxe.ds.Vector<Int>;
    private var anchor : Int = Anchor.TOP_LEFT;
    public function new(info : haxe.ds.Vector<String>, developers : haxe.ds.Vector<String>) {
        super();
        this.paintableArray = haxe.ds.Vector.fromArrayCopy([this]);
        this.myFontProcessor = new UpdateMyFontProcessor(this);
        this.info = info;
        this.infoBeginWidth = haxe.ds.Vector.fromArrayCopy([for (index in 0...this.info.length) 0]);
        this.developers = developers;
        this.developersBeginWidth = haxe.ds.Vector.fromArrayCopy([for (index in 0...this.developers.length) 0]);
    }

    public override function updateMeasurement(graphics : Graphics) : Void {
        final font : Font = graphics.getFont();
        this.charHeight = font.getHeight();
        this.aboutBeginWidth = (font.stringWidth(this.ABOUT) >> 1);
        final infoSize : Int = this.info.length;
        for (index in 0...infoSize) {
            this.infoBeginWidth[index] = (font.stringWidth(this.info[index]) >> 1);
        }
        final size : Int = this.developers.length;
        for (index in 0...size) {
            this.developersBeginWidth[index] = (font.stringWidth(this.developers[index]) >> 1);
        }
        this.myFontProcessor = MyFontProcessor.getInstance();
    }

    public function getPaintableArrayInstance() : haxe.ds.Vector<Paintable> {
        return this.paintableArray;
    }

    public override function paint(graphics : Graphics) : Void {
        this.myFontProcessor.process(graphics);
        final halfWidth : Int = this.displayInfoSingleton.getLastHalfWidth();
        graphics.drawString(this.ABOUT, halfWidth - this.aboutBeginWidth, 2 * this.charHeight, this.anchor);
        final infoSize : Int = this.info.length;
        for (index in 0...infoSize) {
            graphics.drawString(this.info[index], halfWidth - this.infoBeginWidth[index], (4 + index) * this.charHeight, this.anchor);
        }
        final size : Int = this.developers.length;
        for (index in 0...size) {
            graphics.drawString(this.developers[index], halfWidth - this.developersBeginWidth[index], (5 + infoSize + index) * this.charHeight, this.anchor);
        }
    }

}

