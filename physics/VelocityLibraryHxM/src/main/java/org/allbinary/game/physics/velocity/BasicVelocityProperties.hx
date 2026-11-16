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
package org.allbinary.game.physics.velocity;

import org.allbinary.direction.Direction;
import org.allbinary.direction.DirectionUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.math.BasicDecimal;
import org.allbinary.logic.math.vector.AxisMathVectorUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.math.Angle;
import org.allbinary.math.PositionStrings;
import org.allbinary.string.CommonSeps;

class BasicVelocityProperties implements BasicVelocityInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final velocityXBasicDecimal : BasicDecimal;
    public final velocityYBasicDecimal : BasicDecimal;
    public final velocityZBasicDecimal : BasicDecimal;
    private final axisMathVectorUtil : AxisMathVectorUtil = AxisMathVectorUtil.getInstance();
    public function new() {
        this.velocityXBasicDecimal = new BasicDecimal(0);
        this.velocityYBasicDecimal = new BasicDecimal(0);
        this.velocityZBasicDecimal = new BasicDecimal(0);
    }

    public function zero() : Void {
        this.velocityXBasicDecimal.setint(0);
        this.velocityYBasicDecimal.setint(0);
        this.velocityZBasicDecimal.setint(0);
    }

    public function getVelocityXBasicDecimalP() : BasicDecimal {
        return this.velocityXBasicDecimal;
    }

    public function getVelocityYBasicDecimalP() : BasicDecimal {
        return this.velocityYBasicDecimal;
    }

    public function getVelocityZBasicDecimalP() : BasicDecimal {
        return this.velocityZBasicDecimal;
    }

    public final directionUtil : DirectionUtil = DirectionUtil.getInstance();
    public function setVelocityWithBigDecimalAndDirection(magnitudeBasicDecimal : BasicDecimal, direction : Direction, otherDirection : Direction) : Void {
        final angle : Angle = this.directionUtil.getAngle(direction);
        final otherAngle : Angle = this.directionUtil.getAngle(otherDirection);
        this.setVelocityWithBigDecimal(magnitudeBasicDecimal, angle, otherAngle);
    }

    public function setVelocityWithDirection(magnitude : haxe.Int64, direction : Direction, otherDirection : Direction) : Void {
        final angle : Angle = this.directionUtil.getAngle(direction);
        final otherAngle : Angle = this.directionUtil.getAngle(otherDirection);
        this.setVelocity(magnitude, angle, otherAngle);
    }

    public function addVelocityWithBigDecimalAndDirection(magnitudeBasicDecimal : BasicDecimal, direction : Direction, otherDirection : Direction) : Void {
        final angle : Angle = this.directionUtil.getAngle(direction);
        final otherAngle : Angle = this.directionUtil.getAngle(otherDirection);
        this.addVelocityWithBigDecimal(magnitudeBasicDecimal, angle, otherAngle);
    }

    public function addVelocityWithDirection(magnitude : haxe.Int64, direction : Direction, otherDirection : Direction) : Void {
        final angle : Angle = this.directionUtil.getAngle(direction);
        final otherAngle : Angle = this.directionUtil.getAngle(otherDirection);
        this.addVelocity(magnitude, angle, otherAngle);
    }

    public function setVelocityWithBigDecimal(magnitudeBasicDecimal : BasicDecimal, angle : Angle, otherAngle : Angle) : Void {
        final magnitude : haxe.Int64 = magnitudeBasicDecimal.getUnscaled();
        this.setVelocity(magnitude, angle, otherAngle);
    }

    public function addVelocityWithBigDecimal(magnitudeBasicDecimal : BasicDecimal, angle : Angle, otherAngle : Angle) : Void {
        final magnitude : haxe.Int64 = magnitudeBasicDecimal.getUnscaled();
        this.addVelocity(magnitude, angle, otherAngle);
    }

    public function setVelocity(magnitude : haxe.Int64, angle : Angle, otherAngle : Angle) : Void {
        this.setVelocityi(magnitude, jre.lang.JavaNumber.toInt(angle.getValue()), jre.lang.JavaNumber.toInt(otherAngle.getValue()));
    }

    public function addVelocity(magnitude : haxe.Int64, angle : Angle, otherAngle : Angle) : Void {
        this.addVelocityi(magnitude, jre.lang.JavaNumber.toInt(angle.getValue()), jre.lang.JavaNumber.toInt(otherAngle.getValue()));
    }

    public function setVelocityi(magnitude : haxe.Int64, angle : Int, otherAngle : Int) : Void {
        final xVector : haxe.Int64 = (jre.lang.JavaNumber.divide(this.axisMathVectorUtil.calculateX(magnitude, angle), this.velocityXBasicDecimal.getScaledFactorValue()));
        final yVector : haxe.Int64 = (jre.lang.JavaNumber.divide(this.axisMathVectorUtil.calculateY(magnitude, angle), this.velocityYBasicDecimal.getScaledFactorValue()));
        final zVector : haxe.Int64 = (jre.lang.JavaNumber.divide(this.axisMathVectorUtil.calculateZ(magnitude, otherAngle), this.velocityZBasicDecimal.getScaledFactorValue()));
        this.velocityXBasicDecimal.setlong(xVector);
        this.velocityYBasicDecimal.setlong(yVector);
        this.velocityZBasicDecimal.setlong(zVector);
    }

    public function addVelocityi(magnitude : haxe.Int64, angle : Int, otherAngle : Int) : Void {
        final xVector : haxe.Int64 = (jre.lang.JavaNumber.divide(this.axisMathVectorUtil.calculateX(magnitude, angle), this.velocityXBasicDecimal.getScaledFactorValue()));
        final yVector : haxe.Int64 = (jre.lang.JavaNumber.divide(this.axisMathVectorUtil.calculateY(magnitude, angle), this.velocityYBasicDecimal.getScaledFactorValue()));
        final zVector : haxe.Int64 = (jre.lang.JavaNumber.divide(this.axisMathVectorUtil.calculateZ(magnitude, otherAngle), this.velocityZBasicDecimal.getScaledFactorValue()));
        this.velocityXBasicDecimal.addlong(xVector);
        this.velocityYBasicDecimal.addlong(yVector);
        this.velocityZBasicDecimal.addlong(zVector);
    }

    public function toString() : String {
        final commonSeps : CommonSeps = CommonSeps.getInstance();
        final positionStrings : PositionStrings = PositionStrings.getInstance();
        final stringBuffer : StringMaker = new StringMaker();
        final stringUtil : StringUtil = StringUtil.getInstance();
        stringBuffer.append("Velocity ");
        stringBuffer.append(positionStrings.X_LABEL);
        stringBuffer.append(stringUtil.toString(this.velocityXBasicDecimal));
        stringBuffer.append(commonSeps.SPACE);
        stringBuffer.append(positionStrings.Y_LABEL);
        stringBuffer.append(stringUtil.toString(this.velocityYBasicDecimal));
        stringBuffer.append(commonSeps.SPACE);
        stringBuffer.append(positionStrings.Z_LABEL);
        stringBuffer.append(stringUtil.toString(this.velocityZBasicDecimal));
        return Std.string(stringBuffer);
    }

}

