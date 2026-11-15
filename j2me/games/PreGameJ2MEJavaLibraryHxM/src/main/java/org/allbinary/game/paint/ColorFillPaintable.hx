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

//import javax.microedition.lcdui.Graphics;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.displayable.DisplayInfoSingleton;

class ColorFillPaintable extends ColorFillBasePaintable {
    public final displayInfoSingleton : DisplayInfoSingleton = DisplayInfoSingleton.getInstance();
    public function new(basicColor : BasicColor) {
        super(basicColor);
    }

    public override function paint(graphics : Graphics) : Void {
        graphics.setColor(this.colorP);
        graphics.fillRect(0, 0, this.displayInfoSingleton.getLastWidth(), this.displayInfoSingleton.getLastHeight());
    }

}

