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

import org.allbinary.animation.special.SpecialAnimation;
import org.allbinary.media.ScaleProperties;

class NullSpecialAnimationFactory implements AnimationInterfaceFactoryInterface implements ProceduralAnimationInterfaceFactoryInterface {
    private static var NULL_SPECIAL_ANIMATION_FACTORY : NullSpecialAnimationFactory = new NullSpecialAnimationFactory();
    public function new() {
    }

    public static function getFactoryInstance() : NullSpecialAnimationFactory {
        return NullSpecialAnimationFactory.NULL_SPECIAL_ANIMATION_FACTORY;
    }

    // throws Exception
    public function getInstanceFor(instanceId : Int) : Animation {
        return SpecialAnimation.getInstance();
    }

    // throws Exception
    public function getInstanceAnimation(animationInterface : Animation) : Animation {
        return SpecialAnimation.getInstance();
    }

    public function setInitialScale(scaleProperties : ScaleProperties) : Void {
    }

}

