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

//import javax.microedition.lcdui.Image;
//import javax.microedition.lcdui.NullImage;
import org.allbinary.animation.Animation;
import org.allbinary.animation.AnimationBehaviorFactory;
import org.allbinary.game.configuration.GameConfigurationCentral;
import org.allbinary.logic.math.PrimitiveIntUtil;
import org.allbinary.math.AngleFactory;
import org.allbinary.math.AngleInfo;
import org.allbinary.media.image.ImageToRotationImageArrayUtil;

class AllBinaryArrayImageRotationAnimationFactory extends BaseImageAnimationFactory {
    private var imageArray : haxe.ds.Vector<Image> = NullImage.NULL_IMAGE_ARRAY;
    private var angleIncrement : Int;
    // throws Exception
    public static function createFactory(image : Image, dx : Int, dy : Int) : AllBinaryArrayImageRotationAnimationFactory {
        final arrayImageRotationAnimationFactory : AllBinaryArrayImageRotationAnimationFactory = new AllBinaryArrayImageRotationAnimationFactory(image, image.getWidth(), image.getHeight(), AngleFactory.getInstance().TOTAL_ANGLE / GameConfigurationCentral.getInstance().getGameControlFidelity(), AnimationBehaviorFactory.getInstance());
        arrayImageRotationAnimationFactory.initDXY(dx, dy);
        return arrayImageRotationAnimationFactory;
    }

    // throws Exception
    public static function createFactoryA(image : Image, dx : Int, dy : Int, angleIncrement : Int) : AllBinaryArrayImageRotationAnimationFactory {
        final arrayImageRotationAnimationFactory : AllBinaryArrayImageRotationAnimationFactory = new AllBinaryArrayImageRotationAnimationFactory(image, image.getWidth(), image.getHeight(), angleIncrement, AnimationBehaviorFactory.getInstance());
        arrayImageRotationAnimationFactory.initDXY(dx, dy);
        return arrayImageRotationAnimationFactory;
    }

    public function new(image : Image, width : Int, height : Int, angleIncrement : Int, animationBehaviorFactory : AnimationBehaviorFactory) {
        super(image, PrimitiveIntUtil.getArrayInstance(), width, height, 0, 0, animationBehaviorFactory);
        this.angleIncrement = angleIncrement;
        this.init();
    }

    // throws Exception
    private function init() : Void {
        this.setImageArray(ImageToRotationImageArrayUtil.getInstance().generate(this.getImage(), this.getAngleIncrement(), Std.int(AngleFactory.getInstance().TOTAL_ANGLE)));
    }

    private function initDXY(dx : Int, dy : Int) : Void {
        this.animationFactoryInitializationVisitor.dx = dx;
        this.animationFactoryInitializationVisitor.dy = dy;
        this.animationFactoryInitializationVisitor.originalDx = dx;
        this.animationFactoryInitializationVisitor.originalDy = dy;
    }

    // throws Exception
    public override function getInstance(instanceId : Int) : Animation {
        final scaledImageArray : haxe.ds.Vector<Image> = haxe.ds.Vector.fromArrayCopy([for (index in 0...this.imageArray.length) null]);
        final size : Int = scaledImageArray.length;
        final image : Image = this.getImage();
        for (index in 0...size) {
            scaledImageArray[index] = this.animationFactoryImageScaleUtil.createImage(image, image.getWidth(), image.getHeight(), this.scaleProperties.scaleWidth, this.scaleProperties.scaleHeight);
        }
        if (this.animationFactoryInitializationVisitor.dx != 0 || this.animationFactoryInitializationVisitor.dy != 0) {
            this.animationFactoryImageScaleUtil.processAdjust(this);
            return new AdjustedImageArrayRotationAnimation(scaledImageArray, AngleInfo.getInstance(this.getAngleIncrement()), Std.int(AngleFactory.getInstance().TOTAL_ANGLE), this.animationFactoryInitializationVisitor.dx, this.animationFactoryInitializationVisitor.dy, this.animationBehaviorFactory.getOrCreateInstance());
        } else {
            return new ImageArrayRotationAnimation(scaledImageArray, AngleInfo.getInstance(this.getAngleIncrement()), Std.int(AngleFactory.getInstance().TOTAL_ANGLE), this.animationBehaviorFactory.getOrCreateInstance());
        }
    }

    public function setImageArray(imageArray : haxe.ds.Vector<Image>) : Void {
        this.imageArray = imageArray;
    }

    public function getAngleIncrement() : Int {
        return this.angleIncrement;
    }

}

