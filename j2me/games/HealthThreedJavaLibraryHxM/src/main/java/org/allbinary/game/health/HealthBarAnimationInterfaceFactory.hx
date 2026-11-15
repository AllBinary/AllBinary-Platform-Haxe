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
package org.allbinary.game.health;

import org.allbinary.animation.Animation;
import org.allbinary.animation.AnimationInterfaceFactoryInterface;
import org.allbinary.animation.ProceduralAnimationInterfaceFactoryInterface;
import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.media.ScaleProperties;

class HealthBarAnimationInterfaceFactory implements AnimationInterfaceFactoryInterface implements ProceduralAnimationInterfaceFactoryInterface {
    public function new() {
    }

    // throws Exception
    public function getInstanceByLocation(layerInterface : AllBinaryLayer, location : Int) : HealthBarAnimation {
        return new HealthBarThreedAnimation(layerInterface, location);
    }

    // throws Exception
    public function getInstance(instanceId : Int) : Animation {
        return null;
    }

    // throws Exception
    public function getInstanceAnimation(animationInterface : Animation) : Animation {
        return null;
    }

    public function setInitialScale(scaleProperties : ScaleProperties) : Void {
    }

}

