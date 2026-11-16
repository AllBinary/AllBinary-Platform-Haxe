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
import javax.microedition.lcdui.NullImage;
import org.allbinary.DisposalUtil;
import org.allbinary.animation.AnimationBehavior;
import org.allbinary.animation.RotationAnimation;
import org.allbinary.graphics.Anchor;
import org.allbinary.logic.math.PrimitiveIntUtil;
import org.allbinary.math.AngleInfo;
import org.allbinary.media.image.ImageModifierUtil;
import org.allbinary.util.CircularIndexUtil;

class ImageArrayBaseRotationAnimation extends RotationAnimation {
    private final imageModifierUtil : ImageModifierUtil = ImageModifierUtil.getInstanceOrCreate();
    private final originalImageArray : haxe.ds.Vector<Image>;
    private var imageArray : haxe.ds.Vector<Image> = NullImage.NULL_IMAGE_ARRAY;
    private var currentImage : Image;
    private var totalFrames : Int = 0;
    public function new(originalImageArray : haxe.ds.Vector<Image>, angleInfo : AngleInfo, animationBehavior : AnimationBehavior) {
        super(angleInfo, CircularIndexUtil.createInstance(jre.lang.JavaNumber.divide(360, angleInfo.getAngleIncrementInfo().getAngleIncrement())), animationBehavior);
        this.originalImageArray = originalImageArray;
        this.setImageArray(this.imageModifierUtil.getImageArray(originalImageArray));
        this.currentImage = this.imageArray[this.circularIndexUtil.getIndex()];
    }

    // throws Exception
    public override function getAnimationSize() : Int {
        return this.getSize();
    }

    public override function setAlpha(alpha : Int) : Void {
        if (this.alphaP != alpha) {
            super.setAlpha(alpha);
            this.imageModifierUtil.reset();
            final index : Int = this.circularIndexUtil.getIndex();
            this.imageModifierUtil.setAlpha(this.originalImageArray[index], this.imageArray[index], index, this.alphaP);
        }
    }

    public override function nextRotation() : Void {
        super.nextRotation();
        final index : Int = this.circularIndexUtil.getIndex();
        this.imageModifierUtil.setAlpha(this.originalImageArray[index], this.imageArray[index], index, this.alphaP);
        this.currentImage = this.imageArray[index];
    }

    public override function previousRotation() : Void {
        super.previousRotation();
        final index : Int = this.circularIndexUtil.getIndex();
        this.imageModifierUtil.setAlpha(this.originalImageArray[index], this.imageArray[index], index, this.alphaP);
        this.currentImage = this.imageArray[index];
    }

    public override function setFrame(index2 : Int) : Void {
        super.setFrame(index2);
        final index : Int = this.circularIndexUtil.getIndex();
        this.imageModifierUtil.setAlpha(this.originalImageArray[index], this.imageArray[index], index, this.alphaP);
        this.currentImage = this.imageArray[index];
    }

    public override function setSequence(sequence : haxe.ds.Vector<Int>) : Void {
    }

    public override function getSequence() : haxe.ds.Vector<Int> {
        return PrimitiveIntUtil.getArrayInstance();
    }

    public function setImageArray(imageArray : haxe.ds.Vector<Image>) : Void {
        this.imageArray = imageArray;
        this.totalFrames = imageArray.length;
        this.circularIndexUtil = CircularIndexUtil.createInstance(this.totalFrames);
    }

    private var anchor : Int = Anchor.TOP_LEFT;
    public override function paintXY(graphics : Graphics, x : Int, y : Int) : Void {
        graphics.drawImage(this.currentImage, x, y, this.anchor);
    }

    // throws Exception
    public function close() : Void {
        final disposalUtil : DisposalUtil = DisposalUtil.getInstance();
        final size2 : Int = this.imageArray.length;
        for (index in 0...size2) {
            disposalUtil.disposeImage(this.imageArray[index]);
        }
        final size : Int = this.originalImageArray.length;
        for (index in 0...size) {
            disposalUtil.disposeImage(this.originalImageArray[index]);
        }
        disposalUtil.disposeImage(this.currentImage);
    }

    // throws Throwable
    public function finalize() : Void {
        final disposalUtil : DisposalUtil = DisposalUtil.getInstance();
        final size2 : Int = this.imageArray.length;
        for (index in 0...size2) {
            disposalUtil.disposeImage(this.imageArray[index]);
        }
        final size : Int = this.originalImageArray.length;
        for (index in 0...size) {
            disposalUtil.disposeImage(this.originalImageArray[index]);
        }
        disposalUtil.disposeImage(this.currentImage);
    }

}

