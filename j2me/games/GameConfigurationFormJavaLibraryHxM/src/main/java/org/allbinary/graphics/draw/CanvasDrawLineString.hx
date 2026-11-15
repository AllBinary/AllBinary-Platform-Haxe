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
package org.allbinary.graphics.draw;

import javax.microedition.lcdui.Font;
import javax.microedition.lcdui.Graphics;
import org.allbinary.graphics.font.MyFontProcessor;
import org.allbinary.graphics.font.UpdateMyFontInterface;
import org.allbinary.graphics.font.UpdateMyFontProcessor;

class CanvasDrawLineString implements UpdateMyFontInterface {
    public static final NULL_CANVAS_DRAW_LINE_STRING : CanvasDrawLineString = new CanvasDrawLineString(0, 0);
    private final drawStringUtil : DrawStringUtil = DrawStringUtil.getInstance();
    private var myFontProcessor : MyFontProcessor;
    private var x : Int;
    private var y : Int;
    private var fontHeight : Int = 0;
    public function new(x : Int, y : Int) {
        this.myFontProcessor = new UpdateMyFontProcessor(this);
        this.x = x;
        this.y = y;
    }

    public function updateMeasurement(graphics : Graphics) : Void {
        final font : Font = graphics.getFont();
        this.fontHeight = font.getHeight();
        this.myFontProcessor = MyFontProcessor.getInstance();
    }

    public function paint(graphics : Graphics, string : String, line : Int) : Void {
        this.myFontProcessor.process(graphics);
        this.drawStringUtil.drawCenterString(graphics, string, 0, string.length, this.x, this.y + (line * this.fontHeight));
    }

}

