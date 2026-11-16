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
package org.allbinary.animation;

import org.allbinary.direction.Direction;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.math.Angle;
import org.allbinary.math.AngleFactory;
import org.allbinary.math.AngleInfo;

class VectorRotationAnimation extends VectorBaseRotationAnimation {
    public function new(currentPoints : haxe.ds.Vector<haxe.ds.Vector<haxe.ds.Vector<Int>>>, basicColor : BasicColor, animationBehavior : AnimationBehavior) {
        super(AngleInfo.getInstance(jre.lang.JavaNumber.toInt((jre.lang.JavaNumber.divide(AngleFactory.getInstance().TOTAL_ANGLE, currentPoints.length)))), currentPoints, basicColor, animationBehavior);
        this.angleInfo.adjustAngle(this.getFrame());
    }

    public override function setFrameByDirection(direction : Direction) : Void {
        var angle : Angle = this.directionUtil.getFrameAngle(direction);
        this.adjustFrameToAngle(angle);
    }

    public override function setFrameToAngle(angle : Angle) : Void {
        this.adjustFrameToAngle(angle);
    }

    public override function setFrame(index : Int) : Void {
        super.setFrame(index);
        this.angleInfo.adjustAngle(this.getFrame());
    }

    public override function adjustFrame(newAngle : Int) : Void {
        this.setFrame(this.frameUtil.getFrameForAngle(newAngle, jre.lang.JavaNumber.toInt(this.angleInfo.getAngleIncrementInfo().getAngleIncrement())));
    }

    public override function adjustFrameToAngle(newAngle : Angle) : Void {
        this.adjustFrame(newAngle.getValue());
    }

}

