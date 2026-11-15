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
import org.allbinary.logic.communication.log.ForcedLogUtil;

class SimultaneousCompoundIndexedAnimationInterfaceFactory extends CompoundAnimationInterfaceFactory {
    public function new(basicAnimationInterfaceFactoryInterfaceArray : haxe.ds.Vector<AnimationInterfaceFactoryInterface>, animationBehaviorFactory : AnimationBehaviorFactory) {
        super(basicAnimationInterfaceFactoryInterfaceArray, animationBehaviorFactory);
    }

    public override function createArray(size : Int) : haxe.ds.Vector<Animation> {
        return haxe.ds.Vector.fromArrayCopy([for (index in 0...size) null]);
    }

    public override function createAnimation(animationArray : haxe.ds.Vector<Animation>) : Animation {
        return new SimultaneousCompoundIndexedAnimation(animationArray, this.animationBehaviorFactory.getOrCreateInstance());
    }

}

