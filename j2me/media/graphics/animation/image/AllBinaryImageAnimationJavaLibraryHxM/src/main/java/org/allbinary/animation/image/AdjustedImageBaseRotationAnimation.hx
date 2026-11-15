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

import javax.microedition.lcdui.Graphics;
import javax.microedition.lcdui.Image;
import org.allbinary.animation.AnimationBehavior;
import org.allbinary.math.AngleInfo;

class AdjustedImageBaseRotationAnimation extends ImageBaseRotationAnimation {
    private var dx : Int = 0;
    private var dy : Int = 0;
    public function new(image : Image, angleInfo : AngleInfo, totalAngle : Int, dx : Int, dy : Int, animationBehavior : AnimationBehavior) {
        super(image, angleInfo, totalAngle, animationBehavior);
        this.init(dx, dy);
    }

    // throws Exception
    public function init(dx : Int, dy : Int) : Void {
        this.dx = dx;
        this.dy = dy;
    }

    public override function paintXY(graphics : Graphics, x : Int, y : Int) : Void {
        super.paintXY(graphics, x + this.dx, y + this.dy);
    }

}

