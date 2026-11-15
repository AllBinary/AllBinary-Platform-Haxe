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

import javax.microedition.lcdui.Graphics;
import org.allbinary.graphics.font.MyFontProcessor;
import org.allbinary.graphics.font.UpdateMyFontInterface;
import org.allbinary.graphics.font.UpdateMyFontProcessor;
import org.allbinary.logic.string.StringUtil;

class KeyValueDrawString implements UpdateMyFontInterface {
    private var myFontProcessor : MyFontProcessor;
    private final LABEL : String;
    private final labelX : Int;
    private var valueX : Int = 0;
    private var value : String = StringUtil.getInstance().EMPTY_STRING;
    public function new(label : String, x : Int) {
        this.myFontProcessor = new UpdateMyFontProcessor(this);
        this.LABEL = label;
        this.labelX = x;
    }

    public function updateMeasurement(graphics : Graphics) : Void {
        final labelWidth : Int = graphics.getFont().stringWidth(this.LABEL) - this.LABEL.length;
        this.valueX = labelWidth + this.labelX;
        this.myFontProcessor = MyFontProcessor.getInstance();
    }

    public function paint(graphics : Graphics, y : Int) : Void {
        this.myFontProcessor.process(graphics);
        graphics.drawString(this.LABEL, this.labelX, y, 0);
        graphics.drawString(this.value, this.valueX, y, 0);
    }

    public function update(value : String) : Void {
        this.value = value;
    }

}

