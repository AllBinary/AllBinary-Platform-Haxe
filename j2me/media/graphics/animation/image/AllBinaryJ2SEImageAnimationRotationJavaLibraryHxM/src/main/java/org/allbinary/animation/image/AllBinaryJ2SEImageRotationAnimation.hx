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

//import javax.microedition.lcdui.Graphics;
//import javax.microedition.lcdui.Image;
//import javax.microedition.lcdui.NullImage;
import org.allbinary.DisposalUtil;
import org.allbinary.animation.AnimationBehavior;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.math.AngleInfo;
import org.allbinary.media.image.ImageCopyUtil;
import org.allbinary.media.image.ImageModifierUtil;
import org.allbinary.media.image.ImageRotationUtil;

class AllBinaryJ2SEImageRotationAnimation extends ImageBaseRotationAnimation {
    private final imageRotationUtil : ImageRotationUtil = ImageRotationUtil.getInstance();
    private final imageModifierUtil : ImageModifierUtil = ImageModifierUtil.getInstanceOrCreate();
    private final realOriginalImage : Image;
    private final originalImageArray : haxe.ds.Vector<Image> = haxe.ds.Vector.fromArrayCopy([for (index in 0...1) null]);
    private final twoImages : haxe.ds.Vector<Image> = haxe.ds.Vector.fromArrayCopy([for (index in 0...2) null]);
    private var imageToShow : Image;
    private var bufferedImageIndex : Int = 0;
    private var lastScaleX : Float = 1.0;
    private var lastScaleY : Float = 1.0;
    private var scaleX : Float = 1.0;
    private var scaleY : Float = 1.0;
    private var maxScaleX : Float = 0.0;
    private var maxScaleY : Float = 0.0;
    private var alphaProcessor : ModifierBaseProcessor = ModifierBaseProcessor.getInstance();
    private var setColorProcessor : ModifierBaseProcessor = ModifierBaseProcessor.getInstance();
    private var changeColorProcessor : ModifierBaseProcessor = ModifierBaseProcessor.getInstance();
    private var scaleProcessor : ScaleBaseProcessor = ScaleProcessor.getInstance();
    public function new(originalImage : Image, image : Image, angleInfo : AngleInfo, totalAngle : Int, animationBehavior : AnimationBehavior) {
        super(image, angleInfo, totalAngle, animationBehavior);
        this.realOriginalImage = originalImage;
        this.originalImageArray[0] = originalImage;
        this.imageToShow = image;
        this.twoImages[0] = image;
        this.twoImages[1] = ImageCopyUtil.getInstance().createImageForRotation(image);
    }

    public override function setBasicColorP(basicColor : BasicColor) : Void {
        var changed : Bool = false;
        if (this.getBasicColorP() == null || Std.int(this.getBasicColorP()) != Std.int(basicColor)) {
            changed = true;
        }
        super.setBasicColorP(basicColor);
        if (changed) {
            this.setColorProcessor = SetColorProcessor.getInstance();
            this.updateImage();
        }
    }

    public override function changeBasicColor(basicColor : BasicColor) : Void {
        var changed : Bool = false;
        if (this.getChangeBasicColor() == null || Std.int(this.getChangeBasicColor()) != Std.int(basicColor)) {
            changed = true;
        }
        super.changeBasicColor(basicColor);
        if (changed) {
            this.changeColorProcessor = ChangeColorProcessor.getInstance();
            this.updateImage();
        }
    }

    public override function setAlpha(alpha : Int) : Void {
        var changed : Bool = false;
        if (this.alphaP != alpha) {
            changed = true;
        }
        super.setAlpha(alpha);
        if (changed) {
            this.alphaProcessor = AlphaProcessor.getInstance();
            this.updateImage();
        }
    }

    public override function setScale(scaleX : Float, scaleY : Float) : Void {
        this.scaleX = scaleX;
        this.scaleY = scaleY;
        if (this.scaleX != this.lastScaleX || this.scaleY != this.lastScaleY) {
            this.scaleProcessor.update(this.realOriginalImage, this.originalImageArray, this.twoImages, this.bufferedImageIndex, this.scaleX, this.scaleY, this.maxScaleX, this.maxScaleY);
            this.updateImage();
        }
        this.lastScaleX = this.scaleX;
        this.lastScaleY = this.scaleY;
    }

    public override function setMaxScale(maxScaleX : Float, maxScaleY : Float) : Void {
        this.maxScaleX = maxScaleX;
        this.maxScaleY = maxScaleY;
        this.scaleProcessor.update(this.realOriginalImage, this.originalImageArray, this.twoImages, this.bufferedImageIndex, this.scaleX, this.scaleY, this.maxScaleX, this.maxScaleY);
        this.updateImage();
    }

    public override function nextRotation() : Void {
        super.nextRotation();
        this.updateImage();
    }

    public override function previousRotation() : Void {
        super.previousRotation();
        this.updateImage();
    }

    private function updateImage() : Void {
        this.imageRotationUtil.rotateImage(this.originalImageArray[0], this.twoImages[this.bufferedImageIndex], this.angleInfo.getAngle() + 90);
        this.alphaProcessor.updateAlpha(this.imageModifierUtil, NullImage.NULL_IMAGE, this.twoImages[this.bufferedImageIndex], 0, this.alphaP);
        this.setColorProcessor.updateColor(this.imageModifierUtil, NullImage.NULL_IMAGE, this.twoImages[this.bufferedImageIndex], 0, this.basicColor);
        this.changeColorProcessor.updateColor(this.imageModifierUtil, NullImage.NULL_IMAGE, this.twoImages[this.bufferedImageIndex], 0, this.changeBasicColorP);
        this.swap();
    }

    public override function setFrame(index : Int) : Void {
        super.setFrame(index);
        this.updateImage();
    }

    public function swap() : Void {
        this.imageToShow = this.twoImages[this.bufferedImageIndex];
        if (this.bufferedImageIndex == 0) {
            this.bufferedImageIndex = 1;
        } else {
            this.bufferedImageIndex = 0;
        }
    }

    public override function paintXY(graphics : Graphics, x : Int, y : Int) : Void {
        graphics.drawImage(this.imageToShow, x, y, this.anchor);
    }

    // throws Exception
    public override function close() : Void {
        super.close();
        final disposalUtil : DisposalUtil = DisposalUtil.getInstance();
        final size2 : Int = this.twoImages.length;
        for (index in 0...size2) {
            disposalUtil.disposeImage(this.twoImages[index]);
        }
        final size : Int = this.originalImageArray.length;
        for (index in 0...size) {
            disposalUtil.disposeImage(this.originalImageArray[index]);
        }
        disposalUtil.disposeImage(this.realOriginalImage);
        disposalUtil.disposeImage(this.imageToShow);
    }

    // throws Throwable
    public override function finalize() : Void {
        super.finalize();
        final disposalUtil : DisposalUtil = DisposalUtil.getInstance();
        final size2 : Int = this.twoImages.length;
        for (index in 0...size2) {
            disposalUtil.disposeImage(this.twoImages[index]);
        }
        final size : Int = this.originalImageArray.length;
        for (index in 0...size) {
            disposalUtil.disposeImage(this.originalImageArray[index]);
        }
        disposalUtil.disposeImage(this.realOriginalImage);
        disposalUtil.disposeImage(this.imageToShow);
    }

}

