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
package org.allbinary.animation.compound;

import org.allbinary.animation.Animation;
import org.allbinary.animation.AnimationBehaviorFactory;
import org.allbinary.animation.AnimationInterfaceFactoryInterface;
import org.allbinary.animation.IndexedAnimation;
import org.allbinary.logic.communication.log.ForcedLogUtil;
import org.allbinary.media.ScaleProperties;

class SimultaneousCompoundIndexAnimationInterfaceFactory implements AnimationInterfaceFactoryInterface {
    private final basicAnimationInterfaceFactoryInterfaceArray : haxe.ds.Vector<AnimationInterfaceFactoryInterface>;
    private final animationBehaviorFactory : AnimationBehaviorFactory;
    public function new(basicAnimationInterfaceFactoryInterfaceArray : haxe.ds.Vector<AnimationInterfaceFactoryInterface>, animationBehaviorFactory : AnimationBehaviorFactory) {
        this.basicAnimationInterfaceFactoryInterfaceArray = basicAnimationInterfaceFactoryInterfaceArray;
        this.animationBehaviorFactory = animationBehaviorFactory;
    }

    // throws Exception
    public function getInstanceFor(instanceId : Int) : Animation {
        final size : Int = this.basicAnimationInterfaceFactoryInterfaceArray.length;
        final animationInterfaceArray : haxe.ds.Vector<IndexedAnimation> = haxe.ds.Vector.fromArrayCopy([for (index in 0...size) null]);
        for (index in 0...size) {
            animationInterfaceArray[index] = (cast this.basicAnimationInterfaceFactoryInterfaceArray[index].getInstanceFor(instanceId) : IndexedAnimation);
        }
        return this.getOrCreate(animationInterfaceArray);
    }

    public function getOrCreate(animationInterfaceArray : haxe.ds.Vector<IndexedAnimation>) : Animation {
        return new SimultaneousCompoundIndexAnimation(animationInterfaceArray, this.animationBehaviorFactory.getOrCreateInstance());
    }

    public function getBasicAnimationInterfaceFactoryInterfaceArray() : haxe.ds.Vector<AnimationInterfaceFactoryInterface> {
        return this.basicAnimationInterfaceFactoryInterfaceArray;
    }

    public function setInitialScale(scaleProperties : ScaleProperties) : Void {
    }

}

