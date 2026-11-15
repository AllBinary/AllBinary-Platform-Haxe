// Generated Code Do Not Modify
package org.allbinary.animation;

import org.allbinary.math.AngleFactory;
import org.allbinary.math.AngleInfo;
import org.allbinary.util.CircularIndexUtil;

class NullRotationAnimation extends RotationAnimation {
    public static function createTotalAngle(angleInfo : AngleInfo, totalAngle : Int, animationBehavior : AnimationBehavior) : NullRotationAnimation {
        return new NullRotationAnimation(angleInfo, CircularIndexUtil.createInstance(totalAngle / angleInfo.getAngleIncrementInfo().getAngleIncrement()), animationBehavior);
    }

    public static function createQuarter(animationBehavior : AnimationBehavior) : NullRotationAnimation {
        return new NullRotationAnimation(AngleInfo.getInstance(AngleFactory.getInstance().QUARTER_TOTAL_ANGLE), CircularIndexUtil.createInstance(4), animationBehavior);
    }

    public function new(angleInfo : AngleInfo, circularIndexUtil : CircularIndexUtil, animationBehavior : AnimationBehavior) {
        super(angleInfo, circularIndexUtil, animationBehavior);
    }

    // throws Exception
    public override function getAnimationSize() : Int {
        return 0;
    }

}

