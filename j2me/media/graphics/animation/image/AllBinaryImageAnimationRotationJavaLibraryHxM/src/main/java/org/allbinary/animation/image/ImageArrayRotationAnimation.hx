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

import javax.microedition.lcdui.Image;
import org.allbinary.animation.AnimationBehavior;
import org.allbinary.math.AngleInfo;

class ImageArrayRotationAnimation extends ImageArrayBaseRotationAnimation {
    // throws Exception
    public static function createAnimation(anyType : Any, animationBehavior : AnimationBehavior) : ImageArrayRotationAnimation {
        final imageRotationAnimationInfo : ImageArrayRotationAnimationInfo = (cast anyType : ImageArrayRotationAnimationInfo);
        return new ImageArrayRotationAnimation(imageRotationAnimationInfo.getImageArray(), imageRotationAnimationInfo.getAngleInfoP(), imageRotationAnimationInfo.getTotalAngle(), animationBehavior);
    }

    private var expectedTotalFrames : Int = 0;
    public function new(imageArray : haxe.ds.Vector<Image>, angleInfo : AngleInfo, totalAngle : Int, animationBehavior : AnimationBehavior) {
        super(imageArray, angleInfo, animationBehavior);
        this.initImageArray(imageArray, angleInfo, totalAngle);
    }

    // throws Exception
    private function initImageArray(imageArray : haxe.ds.Vector<Image>, angleInfo : AngleInfo, totalAngle : Int) : Void {
        this.expectedTotalFrames = jre.lang.JavaNumber.divide(totalAngle, this.angleInfo.getAngleIncrementInfo().getAngleIncrement());
        this.angleInfo.adjustAngle(0);
        if (this.expectedTotalFrames != this.getSize()) {
            throw new jre.lang.JavaException("Wrong Number of Frames");
        }
    }

    public override function setImageArray(imageArray : haxe.ds.Vector<Image>) : Void {
        super.setImageArray(imageArray);
        this.angleInfo.adjustAngle(0);
    }

}

