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
package org.allbinary.animation.image.sprite;

import javax.microedition.lcdui.Image;
import javax.microedition.lcdui.game.Sprite;
import org.allbinary.animation.AnimationBehavior;
import org.allbinary.direction.Direction;
import org.allbinary.math.Angle;
import org.allbinary.math.AngleFactory;
import org.allbinary.math.AngleInfo;

class AllBinarySpriteRotationAnimation extends HackRotationSpriteIndexedAnimation {
    public function new(sprite : Sprite, image : Image, animationBehavior : AnimationBehavior) {
        super(sprite, image, AngleInfo.getInstance(jre.lang.JavaNumber.toInt((jre.lang.JavaNumber.divide(AngleFactory.getInstance().TOTAL_ANGLE, sprite.getRawFrameCount())))), animationBehavior);
        this.angleInfo.adjustAngle(this.sprite.getFrame());
    }

    public override function nextRotation() : Void {
        this.sprite.nextFrame();
        this.angleInfo.adjustAngle(this.sprite.getFrame());
    }

    public override function previousRotation() : Void {
        this.sprite.prevFrame();
        this.angleInfo.adjustAngle(this.sprite.getFrame());
    }

    public override function setFrameByDirection(direction : Direction) : Void {
        var angle : Angle = this.directionUtil.getFrameAngle(direction);
        this.adjustFrameToAngle(angle);
    }

    public override function setFrameToAngle(angle : Angle) : Void {
        this.adjustFrameToAngle(angle);
    }

    public override function setFrame(index : Int) : Void {
        this.sprite.setFrame(index);
        this.angleInfo.adjustAngle(this.getFrame());
    }

    public override function adjustFrameToAngle(angle : Angle) : Void {
        this.adjustFrame(angle.getValue());
    }

    public override function adjustFrame(angle : Int) : Void {
        this.setFrame(this.frameUtil.getFrameForAngle(angle, jre.lang.JavaNumber.toInt(this.angleInfo.getAngleIncrementInfo().getAngleIncrement())));
    }

}

