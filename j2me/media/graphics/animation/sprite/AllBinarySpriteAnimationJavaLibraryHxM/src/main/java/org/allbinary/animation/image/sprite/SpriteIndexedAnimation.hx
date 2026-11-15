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
import org.allbinary.animation.IndexedAnimation;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.color.BasicColorFactory;
import org.allbinary.graphics.color.ColorCompositeInterface;
import org.allbinary.logic.math.PrimitiveIntUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.string.CommonLabels;

class SpriteIndexedAnimation extends IndexedAnimation implements ColorCompositeInterface {
    public final sprite : Sprite;
    public final image : Image;
    private final basicColorArray : haxe.ds.Vector<BasicColor>;
    public function new(sprite : Sprite, image : Image, basicColorArray : haxe.ds.Vector<BasicColor>, animationBehavior : AnimationBehavior) {
        super(animationBehavior);
        this.sprite = sprite;
        this.image = image;
        this.basicColorArray = basicColorArray;
        if (this.basicColorArray.length != 0 && this.getSize() != this.basicColorArray.length) {
            throw new jre.lang.JavaException(Std.string(new StringMaker().append(CommonLabels.getInstance().TOTAL_LABEL).appendint(this.getSize()).append("!=").appendint(this.basicColorArray.length)));
        }
    }

    // throws Exception
    public override function getAnimationSize() : Int {
        return this.getSize();
    }

    public override function setBasicColorP(basicColor : BasicColor) : Void {
        for (index in 0...this.basicColorArray.length) {
            if (basicColor == this.basicColorArray[index]) {
                this.setFrame(index);
                break;
            }
        }
    }

    public override function getBasicColorP() : BasicColor {
        if (this.basicColorArray.length < this.getFrame()) {
            return this.basicColorArray[this.getFrame()];
        } else {
            return BasicColorFactory.getInstance().WHITE;
        }
    }

    public function paintFrame(graphics : Graphics, frame : Int, x : Int, y : Int) : Void {
        this.setFrame(frame);
        this.sprite.setPosition(x, y);
        this.sprite.paint(graphics);
    }

    public override function paintXY(graphics : Graphics, x : Int, y : Int) : Void {
        this.sprite.setPosition(x, y);
        this.sprite.paint(graphics);
    }

    public function paint(graphics : Graphics) : Void {
        this.sprite.paint(graphics);
    }

    public override function nextFrame() : Void {
        this.sprite.nextFrame();
    }

    public override function previousFrame() : Void {
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

    public override function isLastFrame() : Bool {
        if (this.sprite.getFrame() == this.getSize() - 1) {
            return true;
        } else {
            return false;
        }
    }

    public function getLastFrame() : Int {
        return this.getSize();
    }

    public override function setSequence(sequence : haxe.ds.Vector<Int>) : Void {
    }

    public override function getSequence() : haxe.ds.Vector<Int> {
        return PrimitiveIntUtil.getArrayInstance();
    }

    // throws Exception
    public function close() : Void {
    }

    // throws Throwable
    public override function finalize() : Void {
    }

}

