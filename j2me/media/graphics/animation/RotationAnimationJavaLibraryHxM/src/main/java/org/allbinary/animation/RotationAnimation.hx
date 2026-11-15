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
import org.allbinary.direction.DirectionUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.math.Angle;
import org.allbinary.math.AngleInfo;
import org.allbinary.math.FrameUtil;
import org.allbinary.util.CircularIndexUtil;

class RotationAnimation extends IndexedAnimation implements RotationAnimationInterface {
    public final frameUtil : FrameUtil = FrameUtil.getInstance();
    public final directionUtil : DirectionUtil = DirectionUtil.getInstance();
    public final angleInfo : AngleInfo;
    public var circularIndexUtil : CircularIndexUtil;
    public function new(angleInfo : AngleInfo, circularIndexUtil : CircularIndexUtil, animationBehavior : AnimationBehavior) {
        super(animationBehavior);
        this.angleInfo = angleInfo;
        this.circularIndexUtil = circularIndexUtil;
    }

    public function nextRotationX() : Void {
    }

    public function previousRotationX() : Void {
    }

    public override function nextRotation() : Void {
        this.angleInfo.adjustAngle(this.circularIndexUtil.next());
    }

    public override function previousRotation() : Void {
        this.angleInfo.adjustAngle(this.circularIndexUtil.previous());
    }

    public function nextRotationZ() : Void {
    }

    public function previousRotationZ() : Void {
    }

    public override function setFrame(index : Int) : Void {
        this.circularIndexUtil.setIndex(index);
        final newFrame : Int = this.circularIndexUtil.getIndex();
        this.angleInfo.adjustAngle(newFrame);
    }

    public override function setFrameByDirection(direction : Direction) : Void {
        final angle : Angle = this.directionUtil.getFrameAngle(direction);
        this.adjustFrameToAngle(angle);
    }

    public override function setFrameToAngle(angle : Angle) : Void {
        this.adjustFrameToAngle(angle);
    }

    public override function adjustFrameToAngle(angle : Angle) : Void {
        this.adjustFrame(angle.getValue());
    }

    public override function adjustFrame(angle : Int) : Void {
        this.setFrame(this.frameUtil.getFrameForAngle(angle, Std.int(this.angleInfo.getAngleIncrementInfo().getAngleIncrement())));
    }

    public override function getFrame() : Int {
        return this.circularIndexUtil.getIndex();
    }

    public override function getSize() : Int {
        return this.circularIndexUtil.getSize();
    }

    public override function getAngleInfoP() : AngleInfo {
        return this.angleInfo;
    }

    public function toString() : String {
        return Std.string(new StringMaker().append(super.toString()).append("circularIndexUtil: ").append(Std.string(this.circularIndexUtil)).append("angleInfo: ").append(Std.string(this.angleInfo)));
    }

}

