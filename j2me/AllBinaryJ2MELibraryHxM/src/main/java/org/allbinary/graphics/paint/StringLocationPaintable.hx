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

import javax.microedition.lcdui.Graphics;

class StringLocationPaintable extends LocationPaintable {
    private final value : String;
    public function new(value : String) {
        super();
        this.value = value;
    }

    public override function paintXY(graphics : Graphics, x : Int, y : Int) : Void {
        graphics.drawString(this.value, x, y, 0);
    }

}

