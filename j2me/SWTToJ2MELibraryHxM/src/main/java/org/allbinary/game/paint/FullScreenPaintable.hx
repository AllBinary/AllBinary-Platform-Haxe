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

//import javax.microedition.lcdui.Font;
//import javax.microedition.lcdui.Graphics;
import org.allbinary.graphics.Anchor;
import org.allbinary.graphics.displayable.DisplayInfoSingleton;
import org.allbinary.graphics.font.MyFontProcessor;
import org.allbinary.graphics.font.UpdateMyFontInterface;
import org.allbinary.graphics.font.UpdateMyFontProcessor;
import org.allbinary.graphics.paint.Paintable;

//SwtToJ2ME
class FullScreenPaintable extends Paintable implements UpdateMyFontInterface {
    public static function getInstance() : FullScreenPaintable {
        return new FullScreenPaintable();
    }

    private final displayInfo : DisplayInfoSingleton = DisplayInfoSingleton.getInstance();
    private var myFontProcessor : MyFontProcessor = new UpdateMyFontProcessor(this);
    private final FULLSCREEN_TEXT : String = "F11 - Toggle Fullscreen";
    private var anchor : Int = Anchor.TOP_LEFT;
    private var Y : Int = 0;
    private var beginWidth : Int = 0;
    public function new() {
        super();
    }

    public override function updateMeasurement(graphics : Graphics) : Void {
        final font : Font = graphics.getFont();
        this.Y = 4 * font.getHeight();
        this.beginWidth = (font.stringWidth(this.FULLSCREEN_TEXT) >> 1);
        this.myFontProcessor = MyFontProcessor.getInstance();
    }

    public override function paint(graphics : Graphics) : Void {
        this.myFontProcessor.process(graphics);
        final halfWidth : Int = this.displayInfo.getLastHalfWidth();
        final height : Int = this.displayInfo.getLastHeight();
        graphics.drawString(this.FULLSCREEN_TEXT, halfWidth - this.beginWidth, height - this.Y, this.anchor);
    }

}

