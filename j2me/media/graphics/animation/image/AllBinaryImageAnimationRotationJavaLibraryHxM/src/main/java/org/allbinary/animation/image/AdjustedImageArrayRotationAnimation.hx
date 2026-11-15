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

//TWB - Adjustments should be done in the resource creation and not at the animation level
class AdjustedImageArrayRotationAnimation extends ImageArrayRotationAnimation {
    // throws Exception
    public static function createAdjustedImageArrayRotationAnimationInfo(anyType : Any, animationBehavior : AnimationBehavior) : AdjustedImageArrayRotationAnimation {
        final imageRotationAnimationInfo : ImageArrayRotationAnimationInfo = (cast anyType : ImageArrayRotationAnimationInfo);
        return new AdjustedImageArrayRotationAnimation(imageRotationAnimationInfo.getImageArray(), imageRotationAnimationInfo.getAngleInfoP(), imageRotationAnimationInfo.getTotalAngle(), imageRotationAnimationInfo.getDx(), imageRotationAnimationInfo.getDy(), animationBehavior);
    }

    // throws Exception
    public static function createAnimation(imageArray : haxe.ds.Vector<Image>, angleInfo : AngleInfo, totalAngle : Int, animationBehavior : AnimationBehavior) : AdjustedImageArrayRotationAnimation {
        return new AdjustedImageArrayRotationAnimation(imageArray, angleInfo, totalAngle, -(imageArray[0].getWidth() >> 2), -(imageArray[0].getHeight() >> 2), animationBehavior);
    }

    private var dx : Int = 0;
    private var dy : Int = 0;
    public function new(imageArray : haxe.ds.Vector<Image>, angleInfo : AngleInfo, totalAngle : Int, dx : Int, dy : Int, animationBehavior : AnimationBehavior) {
        super(imageArray, angleInfo, totalAngle, animationBehavior);
        this.init(dx, dy);
    }

    // throws Exception
    public function init(dx : Int, dy : Int) : Void {
        this.setDx(dx);
        this.setDy(dy);
    }

    public override function paintXY(graphics : Graphics, x : Int, y : Int) : Void {
        super.paintXY(graphics, x + this.dx, y + this.dy);
    }

    public override function setDx(dx : Int) : Void {
        this.dx = dx;
    }

    public override function getDx() : Int {
        return this.dx;
    }

    public override function setDy(dy : Int) : Void {
        this.dy = dy;
    }

    public override function getDy() : Int {
        return this.dy;
    }

}

