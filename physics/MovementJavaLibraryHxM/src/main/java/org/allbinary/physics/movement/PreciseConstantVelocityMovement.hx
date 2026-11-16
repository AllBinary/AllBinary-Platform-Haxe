// Generated Code Do Not Modify
package org.allbinary.physics.movement;

import org.allbinary.game.layer.AllBinaryGameLayer;
import org.allbinary.game.physics.velocity.BasicVelocityProperties;
import org.allbinary.logic.math.BasicDecimal;
import org.allbinary.logic.math.MathUtil;
import org.allbinary.logic.math.ScaleFactorFactory;

class PreciseConstantVelocityMovement extends BasicConstantVelocityMovement {
    private var accumulatedX : Int = 0;
    private var accumulatedY : Int = 0;
    private var accumulatedZ : Int = 0;
    public function new(basicDecimal : BasicDecimal, velocityProperties : BasicVelocityProperties) {
        super(basicDecimal, velocityProperties);
    }

    public override function init(speedBasicDecimal : BasicDecimal, angle : Int, otherAngle : Int) : Void {
    }

    private final factorValue : Int = ScaleFactorFactory.getInstance().DEFAULT_SCALE_VALUE;
    // throws Exception
    public override function process(layer : AllBinaryGameLayer) : Void {
        final mathUtil : MathUtil = MathUtil.getInstance();
        final velocityProperties : BasicVelocityProperties = this.getVelocityProperties();
        this.accumulatedX = jre.lang.JavaNumber.toInt((this.accumulatedX + velocityProperties.getVelocityXBasicDecimalP().getUnscaled()));
        this.accumulatedY = jre.lang.JavaNumber.toInt((this.accumulatedY + velocityProperties.getVelocityYBasicDecimalP().getUnscaled()));
        this.accumulatedZ = jre.lang.JavaNumber.toInt((this.accumulatedZ + velocityProperties.getVelocityZBasicDecimalP().getUnscaled()));
        layer.moveDXYZ(Std.int(this.accumulatedX / this.factorValue), Std.int(this.accumulatedY / this.factorValue), Std.int(this.accumulatedZ / this.factorValue));
        if (mathUtil.abs(this.accumulatedX) > this.factorValue) {
            this.accumulatedX = 0;
        }
        if (mathUtil.abs(this.accumulatedY) > this.factorValue) {
            this.accumulatedY = 0;
        }
        if (mathUtil.abs(this.accumulatedZ) > this.factorValue) {
            this.accumulatedZ = 0;
        }
    }

}

