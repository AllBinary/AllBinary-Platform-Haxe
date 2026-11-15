/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2006 AllBinary 
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
package org.allbinary.game.layer.unit;

import org.allbinary.game.layer.resources.BasicGameResources;
import org.allbinary.animation.AnimationInterfaceFactoryInterface;
import org.allbinary.animation.FeaturedAnimationInterfaceFactoryInterfaceFactory;
import org.allbinary.animation.NullRotationAnimationFactory;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.color.BasicColorFactory;

class DecalAnimationInterfaceFactory {
    private static final instance : DecalAnimationInterfaceFactory = new DecalAnimationInterfaceFactory();
    public static function getInstance() : DecalAnimationInterfaceFactory {
        return DecalAnimationInterfaceFactory.instance;
    }

    // throws Exception
    public function getAnimationFactory(basicGameResources : BasicGameResources, basicColor : BasicColor) : AnimationInterfaceFactoryInterface {
        var animationInterfaceFactoryInterface : AnimationInterfaceFactoryInterface = null;
        if (basicColor == BasicColorFactory.getInstance().RED) {
            animationInterfaceFactoryInterface = FeaturedAnimationInterfaceFactoryInterfaceFactory.getInstance().get(basicGameResources.RESOURCE);
        } else {
            animationInterfaceFactoryInterface = NullRotationAnimationFactory.getFactoryInstance();
        }
        return animationInterfaceFactoryInterface;
    }

    public function new() {
    }
}

