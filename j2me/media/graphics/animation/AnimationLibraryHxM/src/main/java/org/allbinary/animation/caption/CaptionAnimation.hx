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
package org.allbinary.animation.caption;

import javax.microedition.lcdui.Graphics;
import org.allbinary.animation.Animation;

class CaptionAnimation extends Animation {
    private final animationInterface : Animation;
    private final overlayAnimationInterface : Animation;
    private final captionDx : Int;
    private final captionDy : Int;
    private final dx : Int;
    private final dy : Int;
    public function new(animationInterface : Animation, overlayAnimationInterface : Animation, captionDx : Int, captionDy : Int, dx : Int, dy : Int) {
        super();
        this.animationInterface = animationInterface;
        this.overlayAnimationInterface = overlayAnimationInterface;
        this.captionDx = captionDx;
        this.captionDy = captionDy;
        this.dx = dx;
        this.dy = dy;
    }

    // throws Exception
    public override function nextFrame() : Void {
    }

    public override function paintXY(graphics : Graphics, x : Int, y : Int) : Void {
        this.animationInterface.paintXY(graphics, x + this.captionDx, y + this.captionDy);
        this.overlayAnimationInterface.paintXY(graphics, x + this.captionDx + this.dx, y + this.captionDy + this.dy);
    }

    public override function paintThreedXYZ(graphics : Graphics, x : Int, y : Int, z : Int) : Void {
        this.animationInterface.paintThreedXYZ(graphics, x + this.captionDx, y + this.captionDy, z);
        this.overlayAnimationInterface.paintThreedXYZ(graphics, x + this.captionDx + this.dx, y + this.captionDy + this.dy, z);
    }

}

