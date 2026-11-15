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

import org.allbinary.graphics.opengles.OpenGLFeatureUtil;
import org.allbinary.animation.FeaturedAnimationInterfaceFactoryInterfaceFactory;
import org.allbinary.layer.AllBinaryLayer;

class HealthBarFactory {
    // throws Exception
    public function getInstance(layerInterface : AllBinaryLayer, healthInterface : Health, location : Int, direction : Int) : HealthBar {
        if (OpenGLFeatureUtil.getInstance().isAnyThreed()) {
            var featuredAnimationInterfaceFactoryInterfaceFactory : FeaturedAnimationInterfaceFactoryInterfaceFactory = FeaturedAnimationInterfaceFactoryInterfaceFactory.getInstance();
            var healthBarAnimationInterfaceFactory : HealthBarAnimationInterfaceFactory = (cast featuredAnimationInterfaceFactoryInterfaceFactory.get(Health.NAME) : HealthBarAnimationInterfaceFactory);
            return new HealthBar(layerInterface, healthInterface, healthBarAnimationInterfaceFactory.getInstanceByLocation(layerInterface, location), direction);
        } else {
            return new HealthBar(layerInterface, healthInterface, new HealthBarTwodAnimation(layerInterface, location), direction);
        }
    }

    public function new() {
    }
}

