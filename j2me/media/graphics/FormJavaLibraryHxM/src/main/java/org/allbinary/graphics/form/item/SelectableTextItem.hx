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
package org.allbinary.graphics.form.item;

import javax.microedition.lcdui.Graphics;
import org.allbinary.graphics.color.BasicColor;

class SelectableTextItem extends ABTextItem {
    public function new(label : String, layout : Int, altText : String, backgroundBasicColor : BasicColor, foregroundBasicColor : BasicColor) {
        super(label, layout, altText, backgroundBasicColor, foregroundBasicColor);
    }

    public override function isFocusable() : Bool {
        return true;
    }

    public override function paintXY(graphics : Graphics, x : Int, y : Int) : Void {
        this.myFontProcessor.process(graphics);
        var stringComponent : ABStringComponent = this.getLabelStringComponent();
        if (stringComponent != null) {
            graphics.setColor(Std.int(stringComponent.getForegroundBasicColor()));
        }
        graphics.drawString(this.getLabel(), x + 2, y, 0);
    }

}

