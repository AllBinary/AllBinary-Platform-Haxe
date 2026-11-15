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
package org.allbinary.animation.image;

//import javax.microedition.lcdui.Graphics;
//import javax.microedition.lcdui.Image;
import org.allbinary.animation.AnimationBehavior;
import org.allbinary.math.AngleInfo;

class AllBinaryAdjustedHTMLImageRotationAnimation extends AllBinaryHTMLImageRotationAnimation {
    private var dx : Int = 0;
    private var dy : Int = 0;
    public function new(originalImage : Image, image : Image, angleInfo : AngleInfo, totalAngle : Int, dx : Int, dy : Int, animationBehavior : AnimationBehavior) {
        super(originalImage, image, angleInfo, totalAngle, animationBehavior);
        this.init(dx, dy);
    }

    // throws Exception
    public function init(dx : Int, dy : Int) : Void {
        this.dx = dx;
        this.dy = dy;
    }

    public function setDx(dx : Int) : Void {
        this.dx = dx;
    }

    public function getDx() : Int {
        return this.dx;
    }

    public function setDy(dy : Int) : Void {
        this.dy = dy;
    }

    public function getDy() : Int {
        return this.dy;
    }

    public function paintXY(graphics : Graphics, x : Int, y : Int) : Void {
        super.paintXY(graphics, x + this.dx, y + this.dy);
    }

}

