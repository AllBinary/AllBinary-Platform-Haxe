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
import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.logic.math.BasicDecimal;
import org.allbinary.logic.math.vector.AxisMathVectorUtil;
import org.allbinary.math.AngleFactory;

class ConstantVelocityNotifyViewChangeMovement extends Movement {
    public var basicVelocityProperties : BasicVelocityProperties;
    private var speedBasicDecimal : BasicDecimal;
    private final axisMathVectorUtil : AxisMathVectorUtil = AxisMathVectorUtil.getInstance();
    public function new() {
        super();
        this.speedBasicDecimal = BasicDecimal.ZERO_BIGDECIMAL;
        this.basicVelocityProperties = new BasicVelocityProperties();
    }

    public override function init(speedBasicDecimal : BasicDecimal, angle : Int, otherAngle : Int) : Void {
        this.speedBasicDecimal = speedBasicDecimal;
        var angleFactory : AngleFactory = AngleFactory.getInstance();
        this.basicVelocityProperties.setVelocityWithBigDecimal(speedBasicDecimal, angleFactory.getAt(angle), angleFactory.getAt(otherAngle));
    }

    public function moveOutsideRadius(layer : AllBinaryLayer, radius : haxe.Int64, angle : Int, otherAngle : Int) : Void {
        var scaleFactorValue : Int = this.speedBasicDecimal.getScaledFactorValue();
        var xVector : Int = Std.int((this.axisMathVectorUtil.calculateX(radius, angle) / scaleFactorValue));
        var yVector : Int = Std.int((this.axisMathVectorUtil.calculateY(radius, angle) / scaleFactorValue));
        var zVector : Int = Std.int((this.axisMathVectorUtil.calculateZ(radius, otherAngle) / scaleFactorValue));
        layer.moveDXYZ(xVector, yVector, zVector);
    }

    // throws Exception
    public override function process(layer : AllBinaryGameLayer) : Void {
        var x : Int = this.basicVelocityProperties.getVelocityXBasicDecimalP().getScaled();
        var y : Int = this.basicVelocityProperties.getVelocityYBasicDecimalP().getScaled();
        var z : Int = this.basicVelocityProperties.getVelocityZBasicDecimalP().getScaled();
        layer.moveDXYZ(x, y, z);
        if (x != 0 || y != 0 || z != 0) {
            layer.onViewPositionChangeEvent();
        }
    }

    public override function stop() : Void {
        this.basicVelocityProperties.zero();
    }

}

