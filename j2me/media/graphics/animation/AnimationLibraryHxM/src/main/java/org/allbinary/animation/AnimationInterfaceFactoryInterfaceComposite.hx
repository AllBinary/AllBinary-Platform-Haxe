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

class AnimationInterfaceFactoryInterfaceComposite implements AnimationInterfaceFactoryInterface {
    private final animationInterfaceFactoryInterfaceArray : haxe.ds.Vector<AnimationInterfaceFactoryInterface>;
    public function new(basicAnimationInterfaceFactoryInterfaceArray : haxe.ds.Vector<AnimationInterfaceFactoryInterface>) {
        this.animationInterfaceFactoryInterfaceArray = basicAnimationInterfaceFactoryInterfaceArray;
    }

    // throws Exception
    public function getInstance(instanceId : Int) : Animation {
        return NullAnimationFactory.getFactoryInstance().getInstance(0);
    }

    public function getAnimationInterfaceFactoryInterfaceArray() : haxe.ds.Vector<AnimationInterfaceFactoryInterface> {
        return this.animationInterfaceFactoryInterfaceArray;
    }

    public function setInitialScale(scaleProperties : ScaleProperties) : Void {
    }

}

