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
import org.allbinary.animation.RotationAnimation;
import org.allbinary.graphics.Anchor;
import org.allbinary.logic.math.PrimitiveIntUtil;
import org.allbinary.math.AngleInfo;
import org.allbinary.util.CircularIndexUtil;

class ImageBaseRotationAnimation extends RotationAnimation {
    private final image : Image;
    public function new(image : Image, angleInfo : AngleInfo, totalAngle : Int, animationBehavior : AnimationBehavior) {
        super(angleInfo, CircularIndexUtil.createInstance(jre.lang.JavaNumber.divide(totalAngle, angleInfo.getAngleIncrementInfo().getAngleIncrement())), animationBehavior);
        this.image = image;
    }

    // throws Exception
    public override function getAnimationSize() : Int {
        return this.getSize();
    }

    public override function setSequence(sequence : haxe.ds.Vector<Int>) : Void {
    }

    public override function getSequence() : haxe.ds.Vector<Int> {
        return PrimitiveIntUtil.getArrayInstance();
    }

    public var anchor : Int = Anchor.TOP_LEFT;
    public override function paintXY(graphics : Graphics, x : Int, y : Int) : Void {
        graphics.drawImage(this.image, x, y, this.anchor);
    }

    public function getImage() : Image {
        return this.image;
    }

    public override function getWidth() : Int {
        return this.image.getWidth();
    }

    public override function getHeight() : Int {
        return this.image.getHeight();
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

