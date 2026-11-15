/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2022 AllBinary 
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
package org.allbinary.animation.image;

import org.allbinary.animation.Animation;
import org.allbinary.animation.AnimationBehaviorFactory;
import org.allbinary.animation.AnimationInterfaceFactoryInterface;
import org.allbinary.image.ImageCacheFactory;
import org.allbinary.logic.communication.log.ForcedLogUtil;
import org.allbinary.media.ScaleProperties;

class LazyImageRotationAnimationFactory implements AnimationInterfaceFactoryInterface {
    private final layoutIndex : Int;
    private final animationInterfaceFactoryInterface : BaseImageAnimationFactory;
    public var scaleProperties : ScaleProperties = ScaleProperties.instance;
    public function new(layoutIndex : Int, associatedLazyAnimationId : Int, animationInterfaceFactoryInterface : BaseImageAnimationFactory) {
        this.layoutIndex = layoutIndex;
        this.animationInterfaceFactoryInterface = animationInterfaceFactoryInterface;
        ImageCacheFactory.getInstance().hasAnyLazyAnimationFactories = true;
        if (this.animationInterfaceFactoryInterface.animationBehaviorFactory == AnimationBehaviorFactory.getInstance()) {
            ForcedLogUtil.log("Using default AnimationBehaviorFactory with IndexedAnimationFactory", this);
        }
    }

    // throws Exception
    public function getInstance(instanceId : Int) : Animation {
        if (this.animationInterfaceFactoryInterface.getImage().isReady()) {
            this.animationInterfaceFactoryInterface.setInitialScale(this.scaleProperties);
            return this.animationInterfaceFactoryInterface.getInstance(instanceId);
        } else {
            return new LazyImageRotationAnimation(this.layoutIndex, instanceId, this.scaleProperties, this.animationInterfaceFactoryInterface, this.animationInterfaceFactoryInterface.animationBehaviorFactory.getOrCreateInstance());
        }
    }

    public function setInitialScale(scaleProperties : ScaleProperties) : Void {
        this.scaleProperties = scaleProperties;
    }

}

