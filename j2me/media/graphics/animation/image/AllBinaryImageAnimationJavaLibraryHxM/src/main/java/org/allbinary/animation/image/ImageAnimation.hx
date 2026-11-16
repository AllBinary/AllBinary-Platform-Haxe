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

class ImageAnimation extends IndexedAnimation {
    private final image : Image;
    public function new(image : Image, animationBehavior : AnimationBehavior) {
        super(animationBehavior);
        this.image = image;
    }

    // throws Exception
    public override function getAnimationSize() : Int {
        return this.getSize();
    }

    public override function nextFrame() : Void {
    }

    public override function previousFrame() : Void {
    }

    public override function setFrame(index : Int) : Void {
    }

    public override function getFrame() : Int {
        return 0;
    }

    public override function getSize() : Int {
        return 1;
    }

    public override function setSequence(sequence : haxe.ds.Vector<Int>) : Void {
    }

    public override function getSequence() : haxe.ds.Vector<Int> {
        return PrimitiveIntUtil.getArrayInstance();
    }

    private var anchor : Int = Anchor.TOP_LEFT;
    public override function paintXY(graphics : Graphics, x : Int, y : Int) : Void {
        graphics.drawImage(this.image, x, y, this.anchor);
    }

    public function getImage() : Image {
        return this.image;
    }

    // throws Exception
    public function close() : Void {
        DisposalUtil.getInstance().disposeImage(this.image);
    }

    // throws Throwable
    public function finalize() : Void {
        DisposalUtil.getInstance().disposeImage(this.image);
    }

}

