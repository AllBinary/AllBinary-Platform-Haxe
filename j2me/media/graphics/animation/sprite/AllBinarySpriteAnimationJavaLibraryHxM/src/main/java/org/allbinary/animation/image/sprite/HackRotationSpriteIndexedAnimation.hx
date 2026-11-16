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
package org.allbinary.animation.image.sprite;

import javax.microedition.lcdui.Graphics;
import javax.microedition.lcdui.Image;
import javax.microedition.lcdui.game.Sprite;
import org.allbinary.animation.AnimationBehavior;
import org.allbinary.animation.RotationAnimation;
import org.allbinary.logic.math.PrimitiveIntUtil;
import org.allbinary.math.AngleInfo;
import org.allbinary.util.CircularIndexUtil;

class HackRotationSpriteIndexedAnimation extends RotationAnimation {
    public final sprite : Sprite;
    private final image : Image;
    public function new(sprite : Sprite, image : Image, angleInfo : AngleInfo, animationBehavior : AnimationBehavior) {
        super(angleInfo, CircularIndexUtil.createInstance(jre.lang.JavaNumber.divide(360, angleInfo.getAngleIncrementInfo().getAngleIncrement())), animationBehavior);
        this.sprite = sprite;
        this.image = image;
    }

    // throws Exception
    public override function getAnimationSize() : Int {
        return this.getSize();
    }

    public function paintFrame(g : Graphics, frame : Int, x : Int, y : Int) : Void {
        this.setFrame(frame);
        this.paintXY(g, x, y);
    }

    public override function paintXY(g : Graphics, x : Int, y : Int) : Void {
        this.sprite.setPosition(x, y);
        this.paint(g);
    }

    public function paint(g : Graphics) : Void {
        this.sprite.paint(g);
    }

    public override function nextRotation() : Void {
        this.sprite.nextFrame();
    }

    public override function previousRotation() : Void {
        this.sprite.prevFrame();
    }

    public override function getSize() : Int {
        return this.sprite.getRawFrameCount();
    }

    public override function setFrame(frame : Int) : Void {
        this.sprite.setFrame(frame);
    }

    public override function getFrame() : Int {
        return this.sprite.getFrame();
    }

    public override function setSequence(sequence : haxe.ds.Vector<Int>) : Void {
    }

    public override function getSequence() : haxe.ds.Vector<Int> {
        return PrimitiveIntUtil.getArrayInstance();
    }

}

