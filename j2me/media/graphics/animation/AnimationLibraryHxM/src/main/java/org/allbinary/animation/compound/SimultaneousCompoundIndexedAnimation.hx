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

import javax.microedition.lcdui.Graphics;
import org.allbinary.animation.Animation;
import org.allbinary.animation.AnimationBehavior;
import org.allbinary.animation.IndexedAnimation;
import org.allbinary.logic.math.PrimitiveIntUtil;

class SimultaneousCompoundIndexedAnimation extends IndexedAnimation {
    private var animationInterfaceArray : haxe.ds.Vector<Animation>;
    public function new(animationInterfaceArray : haxe.ds.Vector<Animation>, animationBehavior : AnimationBehavior) {
        super(animationBehavior);
        this.animationInterfaceArray = animationInterfaceArray;
    }

    public override function setFrame(frameIndex : Int) : Void {
        var indexedAnimation : IndexedAnimation = null;
        {
            var index : Int = this.animationInterfaceArray.length;
            while (--index >= 0) {
            indexedAnimation = (cast this.animationInterfaceArray[index] : IndexedAnimation);
            indexedAnimation.setFrame(frameIndex);
            }
        }
    }

    public override function getFrame() : Int {
        final indexedAnimation : IndexedAnimation = (cast this.animationInterfaceArray[0] : IndexedAnimation);
        return indexedAnimation.getFrame();
    }

    public override function getSize() : Int {
        final indexedAnimation : IndexedAnimation = (cast this.animationInterfaceArray[0] : IndexedAnimation);
        return indexedAnimation.getSize();
    }

    public override function previousFrame() : Void {
        var indexedAnimation : IndexedAnimation = null;
        {
            var index : Int = this.animationInterfaceArray.length;
            while (--index >= 0) {
            indexedAnimation = (cast this.animationInterfaceArray[index] : IndexedAnimation);
            indexedAnimation.previousFrame();
            }
        }
    }

    public override function setSequence(sequence : haxe.ds.Vector<Int>) : Void {
    }

    public override function getSequence() : haxe.ds.Vector<Int> {
        return PrimitiveIntUtil.getArrayInstance();
    }

    // throws Exception
    public override function nextFrame() : Void {
        {
            var index : Int = this.animationInterfaceArray.length;
            while (--index >= 0) {
            this.animationInterfaceArray[index].nextFrame();
            }
        }
    }

    public override function paintXY(graphics : Graphics, x : Int, y : Int) : Void {
        var size : Int = this.animationInterfaceArray.length;
        for (index in 0...size) {
            this.animationInterfaceArray[index].paintXY(graphics, x, y);
        }
    }

    public override function paintThreedXYZ(graphics : Graphics, x : Int, y : Int, z : Int) : Void {
        var size : Int = this.animationInterfaceArray.length;
        for (index in 0...size) {
            this.animationInterfaceArray[index].paintThreedXYZ(graphics, x, y, z);
        }
    }

    public function getAnimationInterfaceArray() : haxe.ds.Vector<Animation> {
        return this.animationInterfaceArray;
    }

    public function setAnimationInterfaceArray(animationInterfaceArray : haxe.ds.Vector<Animation>) : Void {
        this.animationInterfaceArray = animationInterfaceArray;
    }

}

