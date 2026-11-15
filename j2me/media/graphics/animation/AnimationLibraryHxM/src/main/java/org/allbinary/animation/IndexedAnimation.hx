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

import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.math.PrimitiveIntUtil;
import org.allbinary.string.CommonStrings;

class IndexedAnimation extends Animation implements IndexedAnimationInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    public final animationBehaviorP : AnimationBehavior;
    public function new(animationBehavior : AnimationBehavior) {
        super();
        this.animationBehaviorP = animationBehavior;
    }

    public function getAnimationBehavior() : AnimationBehavior {
        return this.animationBehaviorP;
    }

    public override function reset() : Void {
        this.animationBehaviorP.reset();
        this.setFrame(0);
    }

    public override function setFrame(index : Int) : Void {
    }

    public override function getFrame() : Int {
        return 0;
    }

    // throws Exception
    public function getAnimationSize() : Int {
        throw new haxe.Exception(this.commonStrings.NOT_IMPLEMENTED);
    }

    public override function getSize() : Int {
        return 0;
    }

    public override function previousFrame() : Void {
    }

    public function isLastFrame() : Bool {
        if (this.getFrame() == this.getSize() - 1) {
            return true;
        } else {
            return false;
        }
    }

    public override function setSequence(sequence : haxe.ds.Vector<Int>) : Void {
    }

    public override function getSequence() : haxe.ds.Vector<Int> {
        return PrimitiveIntUtil.getArrayInstance();
    }

    public function setState(indexedAnimation : IndexedAnimation) : Void {
        this.setFrame(indexedAnimation.getFrame());
        this.setDx(indexedAnimation.getDx());
        this.setDy(indexedAnimation.getDy());
    }

    public function getWidth() : Int {
        return 0;
    }

    public function getHeight() : Int {
        return 0;
    }

}

