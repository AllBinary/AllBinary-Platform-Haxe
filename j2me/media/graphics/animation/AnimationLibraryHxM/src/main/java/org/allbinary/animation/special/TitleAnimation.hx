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

import javax.microedition.lcdui.Graphics;
import org.allbinary.animation.AnimationBehavior;
import org.allbinary.animation.IndexedAnimation;
import org.allbinary.animation.IndexedAnimationBehavior;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.color.BasicColorFactory;
import org.allbinary.graphics.displayable.DisplayInfoSingleton;
import org.allbinary.logic.ABSystemWrapper;
import org.allbinary.logic.math.PrimitiveIntUtil;

class TitleAnimation extends SpecialAnimation {
    public final systemWrapper : ABSystemWrapper = ABSystemWrapper.getInstance();
    public var deltaX : Float = 0.0;
    public var deltaY : Float = 0.0;
    public var deltaZ : Float = 0.0;
    public final basicColorArray : haxe.ds.Vector<BasicColor>;
    public final dxArray : haxe.ds.Vector<Int>;
    public final dyArray : haxe.ds.Vector<Int>;
    public final widthP : Int;
    public final animationInterfaceArray : haxe.ds.Vector<IndexedAnimation>;
    public final sizeP : Int;
    public final y : Int;
    private var lastFrameStartTime : haxe.Int64;
    private final displayInfoSingleton : DisplayInfoSingleton = DisplayInfoSingleton.getInstance();
    public static function createAnimation(animationInterfaceArray : haxe.ds.Vector<IndexedAnimation>, basicColorArray : haxe.ds.Vector<BasicColor>, dxArray : haxe.ds.Vector<Int>, dyArray : haxe.ds.Vector<Int>, y : Int, width : Int) : TitleAnimation {
        return new TitleAnimation(animationInterfaceArray, basicColorArray, dxArray, dyArray, y, width, new IndexedAnimationBehavior(1, 250));
    }

    public function new(animationInterfaceArray : haxe.ds.Vector<IndexedAnimation>, basicColorArray : haxe.ds.Vector<BasicColor>, dxArray : haxe.ds.Vector<Int>, dyArray : haxe.ds.Vector<Int>, y : Int, width : Int, animationBehavior : AnimationBehavior) {
        super(animationBehavior);
        this.lastFrameStartTime = this.systemWrapper.currentTimeMillis();
        this.animationInterfaceArray = animationInterfaceArray;
        this.sizeP = this.animationInterfaceArray.length;
        this.basicColorArray = basicColorArray;
        this.dxArray = dxArray;
        this.dyArray = dyArray;
        this.y = y;
        this.widthP = width;
        this.reset();
    }

    public override function nextFrame() : Void {
        final currentTime : haxe.Int64 = this.systemWrapper.currentTimeMillis();
        final totalTimeElapsed : haxe.Int64 = currentTime - this.lastFrameStartTime;
        final indexedAnimationBehavior : IndexedAnimationBehavior = (cast this.getAnimationBehavior() : IndexedAnimationBehavior);
        if (totalTimeElapsed > indexedAnimationBehavior.frameDelayTime) {
            this.previousFrame();
            this.lastFrameStartTime = currentTime;
        }
        if (this.animationInterfaceArray[0].getFrame() == 0) {
            indexedAnimationBehavior.loopIndex++;
        }
    }

    public override function isComplete() : Bool {
        final indexedAnimationBehavior : IndexedAnimationBehavior = (cast this.getAnimationBehavior() : IndexedAnimationBehavior);
        if (indexedAnimationBehavior.loopTotal == -1 || indexedAnimationBehavior.loopIndex < indexedAnimationBehavior.loopTotal || this.getFrame() != 0) {
            return false;
        } else {
            return true;
        }
    }

    public override function setSequence(sequence : haxe.ds.Vector<Int>) : Void {
    }

    public override function getSequence() : haxe.ds.Vector<Int> {
        return PrimitiveIntUtil.getArrayInstance();
    }

    public override function getSize() : Int {
        return this.animationInterfaceArray[0].getSize();
    }

    public override function getFrame() : Int {
        return this.animationInterfaceArray[0].getFrame();
    }

    public override function setFrame(frame : Int) : Void {
        for (index in 0...this.sizeP) {
            this.animationInterfaceArray[index].setFrame(frame);
        }
    }

    public override function setLastFrame() : Void {
        this.setFrame(this.getSize() - 1);
    }

    public override function reset() : Void {
        this.setLastFrame();
        final indexedAnimationBehavior : IndexedAnimationBehavior = ((cast this.getAnimationBehavior() : IndexedAnimationBehavior));
        indexedAnimationBehavior.reset();
    }

    public override function previousFrame() : Void {
        for (index in 0...this.sizeP) {
            this.animationInterfaceArray[index].previousFrame();
        }
    }

    public function paintFrameXY(graphics : Graphics, frame : Int, x : Int, y : Int) : Void {
        this.setFrame(frame);
        this.paintXY(graphics, x, y);
    }

    public final CLEAR_COLOR : BasicColor = BasicColorFactory.getInstance().CLEAR_COLOR;
    public override function paintXY(graphics : Graphics, ax : Int, ay : Int) : Void {
        var x : Int = 0;
        if (this.widthP != Integer.MIN_VALUE) {
            x = ((this.displayInfoSingleton.getLastWidth() - this.widthP) / 2);
        }
        var deltaX : Int = 0;
        var deltaY : Int = 0;
        for (index in 0...this.sizeP) {
            deltaX = this.dxArray[index] + x;
            deltaY = this.dyArray[index] + this.y;
            if (this.basicColorArray[index] != this.CLEAR_COLOR) {
                this.basicSetColorUtil.setBasicColorP(graphics, this.basicColorArray[index]);
            }
            this.animationInterfaceArray[index].paintXY(graphics, deltaX, deltaY);
        }
    }

}

