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
import org.allbinary.animation.Animation;
import org.allbinary.animation.AnimationBehaviorFactory;
import org.allbinary.game.configuration.GameConfigurationCentral;
import org.allbinary.game.configuration.feature.Features;
import org.allbinary.graphics.opengles.OpenGLFeatureFactory;
import org.allbinary.logic.math.PrimitiveIntUtil;
import org.allbinary.media.image.ImageCopyUtil;
import org.allbinary.math.AngleFactory;
import org.allbinary.math.AngleInfo;

class AllBinaryAndroidImageRotationAnimationFactory extends BaseImageAnimationFactory {
    // throws Exception
    public static function createFactory(image : Image, width : Int, height : Int, animationBehaviorFactory : AnimationBehaviorFactory) : AllBinaryAndroidImageRotationAnimationFactory {
        return new AllBinaryAndroidImageRotationAnimationFactory(image, width, height, Std.int((AngleFactory.getInstance().TOTAL_ANGLE / GameConfigurationCentral.getInstance().getGameControlFidelity())), animationBehaviorFactory, false);
    }

    // throws Exception
    public static function createFactoryA(image : Image, width : Int, height : Int, angleIncrement : Int, animationBehaviorFactory : AnimationBehaviorFactory) : AllBinaryAndroidImageRotationAnimationFactory {
        return new AllBinaryAndroidImageRotationAnimationFactory(image, width, height, angleIncrement, animationBehaviorFactory, false);
    }

    // throws Exception
    public static function createFactoryU(image : Image, animationBehaviorFactory : AnimationBehaviorFactory) : AllBinaryAndroidImageRotationAnimationFactory {
        final androidImageRotationAnimationFactory : AllBinaryAndroidImageRotationAnimationFactory = new AllBinaryAndroidImageRotationAnimationFactory(image, image.getWidth(), image.getHeight(), Std.int((AngleFactory.getInstance().TOTAL_ANGLE / GameConfigurationCentral.getInstance().getGameControlFidelity())), animationBehaviorFactory, false);
        androidImageRotationAnimationFactory.init(-(image.getWidth() >> 2), -(image.getHeight() >> 2));
        return androidImageRotationAnimationFactory;
    }

    // throws Exception
    public static function createFactoryDXYU(image : Image, dx : Int, dy : Int, animationBehaviorFactory : AnimationBehaviorFactory) : AllBinaryAndroidImageRotationAnimationFactory {
        final androidImageRotationAnimationFactory : AllBinaryAndroidImageRotationAnimationFactory = new AllBinaryAndroidImageRotationAnimationFactory(image, image.getWidth(), image.getHeight(), Std.int((AngleFactory.getInstance().TOTAL_ANGLE / GameConfigurationCentral.getInstance().getGameControlFidelity())), animationBehaviorFactory, false);
        androidImageRotationAnimationFactory.init(dx, dy);
        return androidImageRotationAnimationFactory;
    }

    // throws Exception
    public static function createFactoryADXY(image : Image, width : Int, height : Int, dx : Int, dy : Int, angleIncrement : Int, animationBehaviorFactory : AnimationBehaviorFactory, resizeCanvasForRotation : Bool) : AllBinaryAndroidImageRotationAnimationFactory {
        final androidImageRotationAnimationFactory : AllBinaryAndroidImageRotationAnimationFactory = new AllBinaryAndroidImageRotationAnimationFactory(image, width, height, angleIncrement, animationBehaviorFactory, resizeCanvasForRotation);
        androidImageRotationAnimationFactory.init(dx, dy);
        return androidImageRotationAnimationFactory;
    }

    public function init(dx : Int, dy : Int) : Void {
        this.animationFactoryInitializationVisitor.dx = dx;
        this.animationFactoryInitializationVisitor.dy = dy;
        this.animationFactoryInitializationVisitor.originalDx = dx;
        this.animationFactoryInitializationVisitor.originalDy = dy;
    }

    private final angleIncrement : Int;
    private final resizeCanvasForRotation : Bool;
    public function new(image : Image, width : Int, height : Int, angleIncrement : Int, animationBehaviorFactory : AnimationBehaviorFactory, resizeCanvasForRotation : Bool) {
        super(image, PrimitiveIntUtil.getArrayInstance(), width, height, 0, 0, animationBehaviorFactory);
        this.angleIncrement = angleIncrement;
        this.resizeCanvasForRotation = resizeCanvasForRotation;
    }

    // throws Exception
    private function getCanvasImage() : Image {
        final features : Features = Features.getInstance();
        if (this.resizeCanvasForRotation && !features.isDefault(OpenGLFeatureFactory.getInstance().OPENGL)) {
            return ImageCopyUtil.getInstance().createImageScale(this.getImage(), 1.44, false);
        } else {
            return this.getImage();
        }
    }

    // throws Exception
    public override function getInstance(instanceId : Int) : Animation {
        final canvasImage : Image = this.getCanvasImage();
        final scaledImage : Image = this.animationFactoryImageScaleUtil.createImage(canvasImage, this.animationFactoryInitializationVisitor.width, this.animationFactoryInitializationVisitor.height, this.scaleProperties.scaleWidth, this.scaleProperties.scaleHeight);
        final copyOfScaledImage : Image = ImageCopyUtil.getInstance().createImage(scaledImage);
        if (this.animationFactoryInitializationVisitor.dx != 0 || this.animationFactoryInitializationVisitor.dy != 0) {
            this.animationFactoryImageScaleUtil.processAdjust(this);
            return new AllBinaryAdjustedAndroidImageRotationAnimation(scaledImage, copyOfScaledImage, AngleInfo.getInstance(this.angleIncrement), AngleFactory.getInstance().TOTAL_ANGLE, this.animationFactoryInitializationVisitor.dx, this.animationFactoryInitializationVisitor.dy, animationBehaviorFactory.getOrCreateInstance());
        } else {
            return new AllBinaryFlickerAndroidImageRotationAnimation(scaledImage, copyOfScaledImage, AngleInfo.getInstance(this.angleIncrement), AngleFactory.getInstance().TOTAL_ANGLE, this.animationBehaviorFactory.getOrCreateInstance());
        }
    }

}

