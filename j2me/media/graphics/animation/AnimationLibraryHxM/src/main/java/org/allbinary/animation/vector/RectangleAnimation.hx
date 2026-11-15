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
package org.allbinary.animation.vector;

//import javax.microedition.lcdui.Graphics;
import org.allbinary.animation.Animation;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.color.ColorCompositeInterface;

class RectangleAnimation extends Animation implements ColorCompositeInterface {
    private var width : Int;
    private var height : Int;
    public function new(width : Int, height : Int, basicColor : BasicColor) {
        super();
        this.width = width;
        this.height = height;
        this.setBasicColorP(basicColor);
    }

    public override function nextFrame() : Void {
    }

    public override function paintXY(graphics : Graphics, x : Int, y : Int) : Void {
        this.basicSetColorUtil.setBasicColorP3(graphics, this.getBasicColorP(), this.getColor());
        graphics.drawRect(x, y, this.width, this.height);
    }

    public function setWidth(width : Int) : Void {
        this.width = width;
    }

    public function setHeight(height : Int) : Void {
        this.height = height;
    }

}

