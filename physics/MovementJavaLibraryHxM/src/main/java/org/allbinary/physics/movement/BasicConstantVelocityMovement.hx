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
package org.allbinary.physics.movement;

import org.allbinary.game.layer.AllBinaryGameLayer;
import org.allbinary.game.physics.velocity.BasicVelocityProperties;
import org.allbinary.game.physics.velocity.VelocityInterfaceCompositeInterface;
import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.logic.math.BasicDecimal;
import org.allbinary.logic.math.vector.AxisMathVectorUtil;
import org.allbinary.math.AngleFactory;

class BasicConstantVelocityMovement extends Movement implements VelocityInterfaceCompositeInterface {
    private var velocityProperties : BasicVelocityProperties;
    private var speedBasicDecimal : BasicDecimal = BasicDecimal.ZERO_BIGDECIMAL;
    private final axisMathVectorUtil : AxisMathVectorUtil = AxisMathVectorUtil.getInstance();
    public function new(basicDecimal : BasicDecimal, velocityProperties : BasicVelocityProperties) {
        super();
        this.setSpeedBasicDecimal(basicDecimal);
        this.velocityProperties = velocityProperties;
    }

    public override function init(speedBasicDecimal : BasicDecimal, angle : Int, otherAngle : Int) : Void {
        this.speedBasicDecimal = speedBasicDecimal;
        var angleFactory : AngleFactory = AngleFactory.getInstance();
        this.velocityProperties.setVelocityWithBigDecimal(speedBasicDecimal, angleFactory.getAt(angle), angleFactory.getAt(otherAngle));
    }

    public function moveOutsideRadius(layer : AllBinaryLayer, radius : haxe.Int64, angle : Int, otherAngle : Int) : Void {
        var scaleFactorValue : Int = this.speedBasicDecimal.getScaledFactorValue();
        var xVector : Int = jre.lang.JavaNumber.toInt((jre.lang.JavaNumber.divide(this.axisMathVectorUtil.calculateX(radius, angle), scaleFactorValue)));
        var yVector : Int = jre.lang.JavaNumber.toInt((jre.lang.JavaNumber.divide(this.axisMathVectorUtil.calculateY(radius, angle), scaleFactorValue)));
        var zVector : Int = jre.lang.JavaNumber.toInt((jre.lang.JavaNumber.divide(this.axisMathVectorUtil.calculateZ(radius, otherAngle), scaleFactorValue)));
        layer.moveDXYZ(xVector, yVector, zVector);
    }

    // throws Exception
    public override function process(layer : AllBinaryGameLayer) : Void {
        layer.moveDXYZ(this.velocityProperties.getVelocityXBasicDecimalP().getScaled(), this.velocityProperties.getVelocityYBasicDecimalP().getScaled(), this.velocityProperties.getVelocityZBasicDecimalP().getScaled());
    }

    public function toString() : String {
        return Std.string(this.velocityProperties);
    }

    public override function stop() : Void {
        this.velocityProperties.zero();
    }

    public function getVelocityProperties() : BasicVelocityProperties {
        return this.velocityProperties;
    }

    public function setVelocityProperties(velocityProperties : BasicVelocityProperties) : Void {
        this.velocityProperties = velocityProperties;
    }

    public function setSpeedBasicDecimal(speedBasicDecimal : BasicDecimal) : Void {
        this.speedBasicDecimal = speedBasicDecimal;
    }

    public function getSpeedBasicDecimal() : BasicDecimal {
        return this.speedBasicDecimal;
    }

}

