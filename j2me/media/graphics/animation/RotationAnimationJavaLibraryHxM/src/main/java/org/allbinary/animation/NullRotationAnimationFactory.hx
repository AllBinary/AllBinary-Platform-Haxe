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

import org.allbinary.media.ScaleProperties;

class NullRotationAnimationFactory implements AnimationInterfaceFactoryInterface implements ProceduralAnimationInterfaceFactoryInterface {
    private static var NULL_ROTATION_ANIMATION_FACTORY : NullRotationAnimationFactory = new NullRotationAnimationFactory();
    public final NULL_ROTATION_ANIMATION_ARRAY : haxe.ds.Vector<RotationAnimation> = haxe.ds.Vector.fromArrayCopy([for (index in 0...0) null]);
    private final NULL_ANIMATION : Animation = new NullRotationAnimation2();
    public function new() {
    }

    public static function getFactoryInstance() : NullRotationAnimationFactory {
        return NullRotationAnimationFactory.NULL_ROTATION_ANIMATION_FACTORY;
    }

    public function getInstanceFor(instanceId : Int) : Animation {
        return this.NULL_ANIMATION;
    }

    // throws Exception
    public function getInstanceAnimation(animationInterface : Animation) : Animation {
        return this.NULL_ANIMATION;
    }

    public function setInitialScale(scaleProperties : ScaleProperties) : Void {
    }

}

