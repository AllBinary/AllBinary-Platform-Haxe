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
import org.allbinary.logic.math.PrimitiveIntUtil;
import org.allbinary.media.image.ImageCopyUtil;
import org.allbinary.math.AngleFactory;
import org.allbinary.math.AngleInfo;

class AllBinaryHTMLImageRotationAnimationFactory extends BaseImageAnimationFactory {
    public final angleIncrement : Int;
    // throws Exception
    public static function createFactoryADXY(image : Image, width : Int, height : Int, dx : Int, dy : Int, angleIncrement : Int, animationBehaviorFactory : AnimationBehaviorFactory) : AllBinaryHTMLImageRotationAnimationFactory {
        final htmlImageRotationAnimationFactory : AllBinaryHTMLImageRotationAnimationFactory = new AllBinaryHTMLImageRotationAnimationFactory(image, width, height, angleIncrement, animationBehaviorFactory);
        htmlImageRotationAnimationFactory.init(dx, dy);
        return htmlImageRotationAnimationFactory;
    }

    public function new(image : Image, width : Int, height : Int, angleIncrement : Int, animationBehaviorFactory : AnimationBehaviorFactory) {
        super(image, PrimitiveIntUtil.getArrayInstance(), width, height, 0, 0, animationBehaviorFactory);
        this.angleIncrement = angleIncrement;
    }

    public function init(dx : Int, dy : Int) : Void {
        this.animationFactoryInitializationVisitor.dx = dx;
        this.animationFactoryInitializationVisitor.dy = dy;
        this.animationFactoryInitializationVisitor.originalDx = dx;
        this.animationFactoryInitializationVisitor.originalDy = dy;
    }

    // throws Exception
    public function getInstance(instanceId : Int) : Animation {
        final scaledImage : Image = this.animationFactoryImageScaleUtil.createImage(this.getImage(), this.animationFactoryInitializationVisitor.width, this.animationFactoryInitializationVisitor.height, this.scaleProperties.scaleWidth, this.scaleProperties.scaleHeight);
        final copyOfScaledImage : Image = ImageCopyUtil.getInstance().createImage(scaledImage);
        if (this.animationFactoryInitializationVisitor.dx != 0 || this.animationFactoryInitializationVisitor.dy != 0) {
            this.animationFactoryImageScaleUtil.processAdjust(this);
            return new AllBinaryAdjustedHTMLImageRotationAnimation(scaledImage, copyOfScaledImage, AngleInfo.getInstance(this.getAngleIncrement()), AngleFactory.getInstance().TOTAL_ANGLE, this.animationFactoryInitializationVisitor.dx, this.animationFactoryInitializationVisitor.dy, this.animationBehaviorFactory.getOrCreateInstance());
        } else {
            return new AllBinaryHTMLImageRotationAnimation(scaledImage, copyOfScaledImage, AngleInfo.getInstance(this.angleIncrement), AngleFactory.getInstance().TOTAL_ANGLE, this.animationBehaviorFactory.getOrCreateInstance());
        }
    }

    public function getAngleIncrement() : Int {
        return this.angleIncrement;
    }

}

