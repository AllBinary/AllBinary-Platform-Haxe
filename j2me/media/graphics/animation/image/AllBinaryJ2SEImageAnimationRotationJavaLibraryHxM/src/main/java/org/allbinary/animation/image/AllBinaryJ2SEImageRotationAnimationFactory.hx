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

import javax.microedition.lcdui.Image;
import org.allbinary.animation.Animation;
import org.allbinary.animation.AnimationBehaviorFactory;
import org.allbinary.game.configuration.feature.Features;
import org.allbinary.graphics.opengles.OpenGLFeatureFactory;
import org.allbinary.graphics.opengles.OpenGLUtil;
import org.allbinary.logic.math.PrimitiveIntUtil;
import org.allbinary.math.AngleFactory;
import org.allbinary.math.AngleInfo;
import org.allbinary.media.image.ImageCopyUtil;

class AllBinaryJ2SEImageRotationAnimationFactory extends BaseImageAnimationFactory {
    public final angleIncrementP : Int;
    private final resizeCanvasForRotation : Bool;
    // throws Exception
    public static function createDXY(image : Image, width : Int, height : Int, dx : Int, dy : Int, angleIncrement : Int, animationBehaviorFactory : AnimationBehaviorFactory, resizeCanvasForRotation : Bool) : AllBinaryJ2SEImageRotationAnimationFactory {
        final imageRotationAnimationFactory : AllBinaryJ2SEImageRotationAnimationFactory = new AllBinaryJ2SEImageRotationAnimationFactory(image, width, height, angleIncrement, animationBehaviorFactory, resizeCanvasForRotation);
        imageRotationAnimationFactory.animationFactoryInitializationVisitor.dx = dx;
        imageRotationAnimationFactory.animationFactoryInitializationVisitor.dy = dy;
        imageRotationAnimationFactory.animationFactoryInitializationVisitor.originalDx = dx;
        imageRotationAnimationFactory.animationFactoryInitializationVisitor.originalDy = dy;
        return imageRotationAnimationFactory;
    }

    public function new(image : Image, width : Int, height : Int, angleIncrement : Int, animationBehaviorFactory : AnimationBehaviorFactory, resizeCanvasForRotation : Bool) {
        super(image, PrimitiveIntUtil.getArrayInstance(), width, height, 0, 0, animationBehaviorFactory);
        this.angleIncrementP = angleIncrement;
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
        final imageCopyUtil : ImageCopyUtil = ImageCopyUtil.getInstance();
        final canvasImage : Image = this.getCanvasImage();
        var scaledImage : Image = this.animationFactoryImageScaleUtil.createImage(canvasImage, this.animationFactoryInitializationVisitor.width, this.animationFactoryInitializationVisitor.height, this.scaleProperties.scaleWidth, this.scaleProperties.scaleHeight);
        final openGLUtil : OpenGLUtil = OpenGLUtil.getInstance();
        scaledImage = openGLUtil.addImage(scaledImage);
        final copyOfScaledImage : Image = imageCopyUtil.createImageForRotation(scaledImage);
        if (this.animationFactoryInitializationVisitor.dx != 0 || this.animationFactoryInitializationVisitor.dy != 0) {
            this.animationFactoryImageScaleUtil.processAdjust(this);
            return new AllBinaryAdjustedJ2SEImageRotationAnimation(scaledImage, copyOfScaledImage, AngleInfo.getInstance(this.angleIncrementP), AngleFactory.getInstance().TOTAL_ANGLE, this.animationFactoryInitializationVisitor.dx, this.animationFactoryInitializationVisitor.dy, this.animationBehaviorFactory.getOrCreateInstance());
        } else {
            return new AllBinaryJ2SEImageRotationAnimation(scaledImage, copyOfScaledImage, AngleInfo.getInstance(this.angleIncrementP), AngleFactory.getInstance().TOTAL_ANGLE, this.animationBehaviorFactory.getOrCreateInstance());
        }
    }

    public function getAngleIncrement() : Int {
        return this.angleIncrementP;
    }

}

