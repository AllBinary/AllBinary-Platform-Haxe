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

class NullIndexedAnimationFactory implements AnimationInterfaceFactoryInterface implements ProceduralAnimationInterfaceFactoryInterface {
    public static final NULL_INDEXED_ANIMATION_ARRAY : haxe.ds.Vector<IndexedAnimation> = haxe.ds.Vector.fromArrayCopy([for (index in 0...0) null]);
    private static var NULL_INDEXED_ANIMATION_FACTORY : NullIndexedAnimationFactory = new NullIndexedAnimationFactory();
    private final NULL_ANIMATION : Animation = new NullIndexedAnimationInner();
    public function new() {
    }

    public static function getFactoryInstance() : NullIndexedAnimationFactory {
        return NullIndexedAnimationFactory.NULL_INDEXED_ANIMATION_FACTORY;
    }

    // throws Exception
    public function getInstance(instanceId : Int) : Animation {
        return this.NULL_ANIMATION;
    }

    // throws Exception
    public function getInstanceAnimation(animationInterface : Animation) : Animation {
        return this.NULL_ANIMATION;
    }

    public function setInitialScale(scaleProperties : ScaleProperties) : Void {
    }

}

