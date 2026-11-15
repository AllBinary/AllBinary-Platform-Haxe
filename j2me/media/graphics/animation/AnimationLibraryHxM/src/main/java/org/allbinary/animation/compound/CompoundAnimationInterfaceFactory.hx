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
import org.allbinary.animation.NullAnimationFactory;
import org.allbinary.logic.communication.log.ForcedLogUtil;
import org.allbinary.media.ScaleProperties;

class CompoundAnimationInterfaceFactory implements AnimationInterfaceFactoryInterface {
    public final basicAnimationInterfaceFactoryInterfaceArrayP : haxe.ds.Vector<AnimationInterfaceFactoryInterface>;
    public final animationBehaviorFactory : AnimationBehaviorFactory;
    public function new(basicAnimationInterfaceFactoryInterfaceArray : haxe.ds.Vector<AnimationInterfaceFactoryInterface>, animationBehaviorFactory : AnimationBehaviorFactory) {
        this.basicAnimationInterfaceFactoryInterfaceArrayP = basicAnimationInterfaceFactoryInterfaceArray;
        this.animationBehaviorFactory = animationBehaviorFactory;
    }

    // throws Exception
    public function getInstance(instanceId : Int) : Animation {
        final size : Int = this.basicAnimationInterfaceFactoryInterfaceArrayP.length;
        final animationInterfaceArray : haxe.ds.Vector<Animation> = this.createArray(size);
        for (index in 0...size) {
            animationInterfaceArray[index] = this.basicAnimationInterfaceFactoryInterfaceArrayP[index].getInstance(instanceId);
        }
        return this.createAnimation(animationInterfaceArray);
    }

    public function createArray(size : Int) : haxe.ds.Vector<Animation> {
        return NullAnimationFactory.getFactoryInstance().EMPTY_ARRAY;
    }

    public function createAnimation(animationInterfaceArray : haxe.ds.Vector<Animation>) : Animation {
        return NullAnimationFactory.getFactoryInstance().getInstance(0);
    }

    public function getBasicAnimationInterfaceFactoryInterfaceArray() : haxe.ds.Vector<AnimationInterfaceFactoryInterface> {
        return this.basicAnimationInterfaceFactoryInterfaceArrayP;
    }

    public function setInitialScale(scaleProperties : ScaleProperties) : Void {
        final size : Int = this.basicAnimationInterfaceFactoryInterfaceArrayP.length;
        for (index in 0...size) {
            this.basicAnimationInterfaceFactoryInterfaceArrayP[index].setInitialScale(scaleProperties);
        }
    }

}

