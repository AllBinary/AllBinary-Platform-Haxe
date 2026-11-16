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

class SingletonAnimationInterfaceFactory implements AnimationInterfaceFactoryInterface implements ProceduralAnimationInterfaceFactoryInterface {
    private final animationInterface : Animation;
    public function new(animationInterface : Animation) {
        this.animationInterface = animationInterface;
    }

    // throws Exception
    public function getInstanceFor(instanceId : Int) : Animation {
        return this.animationInterface;
    }

    // throws Exception
    public function getInstanceAnimation(animationInterface : Animation) : Animation {
        return this.animationInterface;
    }

    public function setInitialScale(scaleProperties : ScaleProperties) : Void {
    }

}

