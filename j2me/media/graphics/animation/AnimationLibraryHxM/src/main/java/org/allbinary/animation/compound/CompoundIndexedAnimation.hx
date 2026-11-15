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

import javax.microedition.khronos.opengles.GL;
import javax.microedition.lcdui.Graphics;
import org.allbinary.animation.Animation;
import org.allbinary.animation.AnimationBehavior;
import org.allbinary.animation.IndexedAnimation;
import org.allbinary.logic.math.PrimitiveIntUtil;
import org.allbinary.util.CircularIndexUtil;

class CompoundIndexedAnimation extends IndexedAnimation implements CompoundAnimationInterface {
    private var circularIndexUtil : CircularIndexUtil;
    private var animationInterfaceArray : haxe.ds.Vector<Animation>;
    public function new(animationInterfaceArray : haxe.ds.Vector<Animation>, animationBehavior : AnimationBehavior) {
        super(animationBehavior);
        this.animationInterfaceArray = animationInterfaceArray;
        this.circularIndexUtil = CircularIndexUtil.createInstance(this.animationInterfaceArray.length);
    }

    public override function setFrame(index : Int) : Void {
        final indexedAnimation : IndexedAnimation = (cast this.animationInterfaceArray[this.circularIndexUtil.getIndex()] : IndexedAnimation);
        indexedAnimation.setFrame(index);
    }

    public override function getFrame() : Int {
        final indexedAnimation : IndexedAnimation = (cast this.animationInterfaceArray[this.circularIndexUtil.getIndex()] : IndexedAnimation);
        return indexedAnimation.getFrame();
    }

    public override function getSize() : Int {
        final indexedAnimation : IndexedAnimation = (cast this.animationInterfaceArray[this.circularIndexUtil.getIndex()] : IndexedAnimation);
        return indexedAnimation.getSize();
    }

    public override function previousFrame() : Void {
        final indexedAnimation : IndexedAnimation = (cast this.animationInterfaceArray[this.circularIndexUtil.getIndex()] : IndexedAnimation);
        indexedAnimation.previousFrame();
    }

    public override function setSequence(sequence : haxe.ds.Vector<Int>) : Void {
    }

    public override function getSequence() : haxe.ds.Vector<Int> {
        return PrimitiveIntUtil.getArrayInstance();
    }

    // throws Exception
    public override function nextFrame() : Void {
        this.animationInterfaceArray[this.circularIndexUtil.getIndex()].nextFrame();
    }

    public override function paintXY(graphics : Graphics, x : Int, y : Int) : Void {
        this.animationInterfaceArray[this.circularIndexUtil.getIndex()].paintXY(graphics, x, y);
    }

    public override function paintThreedXYZ(graphics : Graphics, x : Int, y : Int, z : Int) : Void {
        this.animationInterfaceArray[this.circularIndexUtil.getIndex()].paintThreedXYZ(graphics, x, y, z);
    }

    public override function getCurrentAnimation() : IndexedAnimation {
        return (cast this.animationInterfaceArray[this.circularIndexUtil.getIndex()] : IndexedAnimation);
    }

    public override function nextAnimation() : Void {
        var frame : Int = this.getFrame();
        this.circularIndexUtil.next();
        this.setFrame(frame);
    }

    public override function previousAnimation() : Void {
        var frame : Int = this.getFrame();
        this.circularIndexUtil.previous();
        this.setFrame(frame);
    }

    public override function setAnimation(index : Int) : Void {
        var frame : Int = this.getFrame();
        this.circularIndexUtil.setIndex(index);
        this.setFrame(frame);
    }

    public function getAnimationInterfaceArray() : haxe.ds.Vector<Animation> {
        return this.animationInterfaceArray;
    }

    public function setAnimationInterfaceArray(animationInterfaceArray : haxe.ds.Vector<Animation>) : Void {
        this.animationInterfaceArray = animationInterfaceArray;
    }

    // throws Exception
    public override function set(gl : GL) : Void {
        {
            var index : Int = this.animationInterfaceArray.length;
            while (--index >= 0) {
            this.animationInterfaceArray[index].set(gl);
            }
        }
    }

}

