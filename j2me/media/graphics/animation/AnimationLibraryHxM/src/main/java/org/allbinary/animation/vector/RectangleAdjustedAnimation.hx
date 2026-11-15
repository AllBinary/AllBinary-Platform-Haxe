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

class RectangleAdjustedAnimation extends Animation implements ColorCompositeInterface {
    private var width : Int;
    private var height : Int;
    private var offsetX : Int;
    private var offsetY : Int;
    public function new(width : Int, height : Int, offsetX : Int, offsetY : Int, basicColor : BasicColor) {
        super();
        this.width = width;
        this.height = height;
        this.offsetX = offsetX;
        this.offsetY = offsetY;
        this.setBasicColorP(basicColor);
    }

    public override function nextFrame() : Void {
    }

    public override function paintXY(graphics : Graphics, x : Int, y : Int) : Void {
        this.basicSetColorUtil.setBasicColorP3(graphics, this.getBasicColorP(), this.getColor());
        graphics.drawRect(x + this.offsetX, y + this.offsetY, this.width, this.height);
    }

    public function setWidth(width : Int) : Void {
        this.width = width;
    }

    public function setHeight(height : Int) : Void {
        this.height = height;
    }

    public function setOffsetX(offsetX : Int) : Void {
        this.offsetX = offsetX;
    }

    public function setOffsetY(offsetY : Int) : Void {
        this.offsetY = offsetY;
    }

}

