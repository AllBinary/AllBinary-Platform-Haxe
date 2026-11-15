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
package org.allbinary.animation.image;

import javax.microedition.lcdui.Graphics;
import javax.microedition.lcdui.Image;
import org.allbinary.DisposalUtil;
import org.allbinary.animation.AnimationBehavior;
import org.allbinary.animation.IndexedAnimation;
import org.allbinary.graphics.Anchor;
import org.allbinary.logic.math.PrimitiveIntUtil;
import org.allbinary.util.CircularIndexUtil;

class TweenedImageAnimation extends IndexedAnimation {
    private final image : Image;
    private final dx : Int;
    private final dy : Int;
    private var totalFrames : Int;
    public var circularIndexUtil : CircularIndexUtil;
    public function new(image : Image, dx : Int, dy : Int, totalFrames : Int, animationBehavior : AnimationBehavior) {
        super(animationBehavior);
        this.image = image;
        this.dx = dx;
        this.dy = dy;
        this.totalFrames = totalFrames;
        this.circularIndexUtil = CircularIndexUtil.createInstance(this.totalFrames);
    }

    // throws Exception
    public override function getAnimationSize() : Int {
        return this.getSize();
    }

    public override function nextFrame() : Void {
        this.circularIndexUtil.next();
    }

    public override function previousFrame() : Void {
        this.circularIndexUtil.previous();
    }

    public override function setFrame(index : Int) : Void {
        this.circularIndexUtil.setIndex(index);
    }

    public override function getFrame() : Int {
        return this.circularIndexUtil.getIndex();
    }

    public override function getSize() : Int {
        return this.totalFrames;
    }

    public override function setSequence(sequence : haxe.ds.Vector<Int>) : Void {
    }

    public override function getSequence() : haxe.ds.Vector<Int> {
        return PrimitiveIntUtil.getArrayInstance();
    }

    private var anchor : Int = Anchor.TOP_LEFT;
    public override function paintXY(graphics : Graphics, x : Int, y : Int) : Void {
        var frame : Int = this.getFrame();
        var currentX : Int = this.dx * frame;
        var currentY : Int = this.dy * frame;
        graphics.drawImage(this.image, x + currentX, y + currentY, this.anchor);
    }

    // throws Exception
    public function close() : Void {
        DisposalUtil.getInstance().disposeImage(this.image);
    }

    // throws Throwable
    public override function finalize() : Void {
        DisposalUtil.getInstance().disposeImage(this.image);
    }

}

