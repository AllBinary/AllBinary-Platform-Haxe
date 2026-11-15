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

import android.graphics.Matrix;
//import javax.microedition.lcdui.Image;
import org.allbinary.animation.AnimationBehavior;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.math.AngleInfo;
import org.allbinary.media.image.AndroidImageUtil;
import org.allbinary.media.image.ImageModifierUtil;

class AllBinaryFlickerAndroidImageRotationAnimation extends ImageBaseRotationAnimation {
    private final imageModifierUtil : ImageModifierUtil = ImageModifierUtil.getInstanceOrCreate();
    private final androidImageUtil : AndroidImageUtil = AndroidImageUtil.getInstance();
    private final matrix : Matrix = new Matrix();
    private final halfWidth : Int;
    private final halfHeight : Int;
    private final increment : Int;
    private final originalImage : Image;
    public function new(originalImage : Image, image : Image, angleInfo : AngleInfo, totalAngle : Int, animationBehavior : AnimationBehavior) {
        super(image, angleInfo, totalAngle, animationBehavior);
        this.originalImage = originalImage;
        this.halfWidth = (image.getWidth() >> 1);
        this.halfHeight = (image.getHeight() >> 1);
        this.increment = Std.int((this.angleInfo.getAngleIncrementInfo().getAngleIncrement()));
    }

    public override function setBasicColorP(basicColor : BasicColor) : Void {
        var changed : Bool = false;
        if (this.getBasicColorP() == null || Std.int(this.getBasicColorP()) != Std.int(basicColor)) {
            this.imageModifierUtil.setColor(this.originalImage, this.getImage(), 0, basicColor);
            changed = true;
        }
        super.setBasicColorP(basicColor);
        if (changed) {
            this.matrix.setRotate(0.0, this.halfWidth, this.halfHeight);
            this.updateImage();
        }
    }

    public override function changeBasicColor(basicColor : BasicColor) : Void {
        this.setBasicColorP(basicColor);
    }

    public override function setAlpha(alpha : Int) : Void {
        var changed : Bool = false;
        if (this.alphaP != alpha) {
            changed = true;
        }
        super.setAlpha(alpha);
        this.imageModifierUtil.setAlpha(this.originalImage, this.getImage(), 0, this.alphaP);
        if (changed) {
            this.matrix.setRotate(0.0, this.halfWidth, this.halfHeight);
            this.updateImage();
        }
    }

    public override function nextRotation() : Void {
        super.nextRotation();
        this.matrix.setRotate(this.increment, this.halfWidth, this.halfHeight);
        this.updateImage();
    }

    public override function previousRotation() : Void {
        super.previousRotation();
        this.matrix.setRotate(-this.increment, this.halfWidth, this.halfHeight);
        this.updateImage();
    }

    private function updateImage() : Void {
        this.androidImageUtil.rotate(this.getImage(), originalImage, matrix, imageModifierUtil.paint);
    }

    public override function setFrame(index : Int) : Void {
        final currentFrame : Int = this.circularIndexUtil.getIndex();
        this.circularIndexUtil.setIndex(index);
        final newFrame : Int = this.circularIndexUtil.getIndex();
        this.angleInfo.adjustAngle(newFrame);
        this.matrix.setRotate((newFrame - currentFrame) * this.increment, this.halfWidth, this.halfHeight);
        this.updateImage();
    }

}

