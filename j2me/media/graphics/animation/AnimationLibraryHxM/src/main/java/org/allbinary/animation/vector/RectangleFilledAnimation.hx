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

import javax.microedition.lcdui.Graphics;
import org.allbinary.animation.Animation;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.color.ColorCompositeInterface;

class RectangleFilledAnimation extends Animation implements ColorCompositeInterface {
    public var widthP : Int;
    public var heightP : Int;
    public function new(width : Int, height : Int, basicColor : BasicColor) {
        super();
        this.widthP = width;
        this.heightP = height;
        this.setBasicColorP(basicColor);
    }

    public override function nextFrame() : Void {
    }

    public override function paintXY(graphics : Graphics, x : Int, y : Int) : Void {
        this.basicSetColorUtil.setBasicColorP3(graphics, this.getBasicColorP(), this.getColor());
        graphics.fillRect(x, y, this.widthP, this.heightP);
    }

    public function setWidth(width : Int) : Void {
        this.widthP = width;
    }

    public function setHeight(height : Int) : Void {
        this.heightP = height;
    }

    public override function getBasicColorP() : BasicColor {
        return super.getBasicColorP();
    }

    public override function setBasicColorP(basicColor : BasicColor) : Void {
        super.setBasicColorP(basicColor);
    }

}

