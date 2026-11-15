/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2003 AllBinary 
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
package org.allbinary.game.layer.item;

//import javax.microedition.lcdui.Font;
//import javax.microedition.lcdui.Graphics;
//import javax.microedition.lcdui.Image;
import org.allbinary.animation.Animation;
import org.allbinary.graphics.font.MyFontProcessor;
import org.allbinary.graphics.font.UpdateMyFontInterface;
import org.allbinary.graphics.font.UpdateMyFontProcessor;

class RTSLayerTextAnimation extends Animation implements UpdateMyFontInterface {
    private final image : Image;
    private final text : String;
    private var myFontProcessor : MyFontProcessor = new UpdateMyFontProcessor(this);
    private var fontHeight : Int = 0;
    public function new(text : String, image : Image) {
        super();
        this.text = text;
        this.image = image;
    }

    public override function updateMeasurement(graphics : Graphics) : Void {
        final font : Font = graphics.getFont();
        this.fontHeight = font.getHeight();
        this.myFontProcessor = MyFontProcessor.getInstance();
    }

    public override function paintXY(graphics : Graphics, x : Int, y : Int) : Void {
        this.myFontProcessor.process(graphics);
        super.paintXY(graphics, x, y);
        final adjustedCostY : Int = this.image.getHeight() - this.fontHeight;
        graphics.drawString(this.text, x, y + adjustedCostY, 0);
    }

}

