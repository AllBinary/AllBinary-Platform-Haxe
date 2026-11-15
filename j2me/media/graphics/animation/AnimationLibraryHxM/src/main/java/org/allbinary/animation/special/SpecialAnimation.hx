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
package org.allbinary.animation.special;

import org.allbinary.animation.AnimationBehavior;
import org.allbinary.animation.IndexedAnimation;
import org.allbinary.animation.IndexedAnimationBehavior;

class SpecialAnimation extends IndexedAnimation implements SpecialAnimationInterface {
    private static final NULL_SPECIAL_ANIMATION : SpecialAnimation = new SpecialAnimation(new IndexedAnimationBehavior(1, 250));
    public static function getInstance() : SpecialAnimation {
        return SpecialAnimation.NULL_SPECIAL_ANIMATION;
    }

    public function new(animationBehavior : AnimationBehavior) {
        super(animationBehavior);
    }

    public override function nextFrame() : Void {
        final indexedAnimationBehavior : IndexedAnimationBehavior = ((cast this.animationBehaviorP : IndexedAnimationBehavior));
        indexedAnimationBehavior.loopIndex++;
    }

    public override function setLastFrame() : Void {
    }

    public override function isComplete() : Bool {
        return false;
    }

    public function open() : Void {
    }

    public function close() : Void {
    }

    public function process() : Void {
    }

}

