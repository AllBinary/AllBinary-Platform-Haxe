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
package org.allbinary.graphics.paint;

import javax.microedition.lcdui.Font;
import javax.microedition.lcdui.Graphics;
import org.allbinary.graphics.Anchor;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.displayable.DisplayInfoSingleton;
import org.allbinary.graphics.font.MyFontProcessor;
import org.allbinary.graphics.font.UpdateMyFontInterface;
import org.allbinary.graphics.font.UpdateMyFontProcessor;

class SimpleTextPaintable extends Paintable implements UpdateMyFontInterface {
    private final displayInfoSingleton : DisplayInfoSingleton = DisplayInfoSingleton.getInstance();
    private final updateMyFontProcessor : MyFontProcessor;
    private var myFontProcessor : MyFontProcessor;
    private var text : String;
    private var basicColor : BasicColor;
    private var topScoresWidth : Int = 0;
    private var fontHeight : Int = 0;
    private var anchor : Int = Anchor.TOP_LEFT;
    public function new(text : String, basicColor : BasicColor) {
        super();
        this.updateMyFontProcessor = new UpdateMyFontProcessor(this);
        this.myFontProcessor = this.updateMyFontProcessor;
        this.text = text;
        this.basicColor = basicColor;
    }

    public function updateMeasurement(graphics : Graphics) : Void {
        final font : Font = graphics.getFont();
        this.topScoresWidth = (font.stringWidth(this.text) >> 1);
        this.fontHeight = font.getHeight();
        this.myFontProcessor = MyFontProcessor.getInstance();
    }

    public override function paint(graphics : Graphics) : Void {
        this.myFontProcessor.process(graphics);
        final width : Int = this.displayInfoSingleton.getLast()[this.displayInfoSingleton.WIDTH];
        graphics.setColor(jre.lang.JavaObject.intValue(this.getBasicColorP()));
        graphics.drawString(this.text, (width >> 1) - this.topScoresWidth, this.fontHeight, this.anchor);
    }

    public override function setBasicColorP(basicColor : BasicColor) : Void {
        this.basicColor = basicColor;
    }

    private function getBasicColorP() : BasicColor {
        return this.basicColor;
    }

    public function setText(text : String) : Void {
        this.text = text;
        this.myFontProcessor = this.updateMyFontProcessor;
    }

    public function getText() : String {
        return this.text;
    }

}

