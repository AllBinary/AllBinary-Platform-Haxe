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

import org.allbinary.game.configuration.GameConfigurationCentral;
import org.allbinary.math.AngleFactory;
import org.allbinary.math.AngleInfo;
import org.allbinary.media.ScaleProperties;

class RotationAnimationFactory implements AnimationInterfaceFactoryInterface implements ProceduralAnimationInterfaceFactoryInterface {
    public static function createFactory() : RotationAnimationFactory {
        final totalAngle : Int = AngleFactory.getInstance().TOTAL_ANGLE;
        return new RotationAnimationFactory(totalAngle, jre.lang.JavaNumber.toInt((jre.lang.JavaNumber.divide(totalAngle, GameConfigurationCentral.getInstance().getGameControlFidelity()))));
    }

    private var totalAngle : Int;
    private var angleIncrement : Int;
    public function new(totalAngle : Int, angleIncrement : Int) {
        this.totalAngle = totalAngle;
        this.angleIncrement = angleIncrement;
    }

    // throws Exception
    public function getInstanceFor(instanceId : Int) : Animation {
        return NullRotationAnimation.createTotalAngle(AngleInfo.getInstance(this.angleIncrement), this.totalAngle, AnimationBehavior.getInstance());
    }

    // throws Exception
    public function getInstanceAnimation(animationInterface : Animation) : Animation {
        return NullRotationAnimation.createTotalAngle(AngleInfo.getInstance(this.angleIncrement), this.totalAngle, AnimationBehavior.getInstance());
    }

    public function setInitialScale(scaleProperties : ScaleProperties) : Void {
    }

}

