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
import org.allbinary.animation.AnimationInterfaceFactoryInterface;
import org.allbinary.game.configuration.GameConfigurationCentral;
import org.allbinary.logic.NullUtil;
import org.allbinary.math.AngleFactory;
import org.allbinary.media.ScaleProperties;
import org.allbinary.media.image.ImageToRotationImageArrayUtil;

//TWB - Adjustments should be done in the resource creation and not at the animation level
class PooledImageArrayRotationAnimationFactory implements AnimationInterfaceFactoryInterface {
    // throws Exception
    public static function createFactory(image : Image, animationBehaviorFactory : AnimationBehaviorFactory) : PooledImageArrayRotationAnimationFactory {
        final totalAngle : Int = Std.int(AngleFactory.getInstance().TOTAL_ANGLE);
        final angleIncrement : Int = (totalAngle / GameConfigurationCentral.getInstance().getGameControlFidelity());
        return new PooledImageArrayRotationAnimationFactory(image, image.getWidth(), image.getHeight(), -(image.getWidth() >> 2), -(image.getHeight() >> 2), angleIncrement, animationBehaviorFactory);
    }

    // throws Exception
    public static function createDXY(image : Image, dx : Int, dy : Int, animationBehaviorFactory : AnimationBehaviorFactory) : PooledImageArrayRotationAnimationFactory {
        final totalAngle : Int = Std.int(AngleFactory.getInstance().TOTAL_ANGLE);
        final angleIncrement : Int = (totalAngle / GameConfigurationCentral.getInstance().getGameControlFidelity());
        return new PooledImageArrayRotationAnimationFactory(image, image.getWidth(), image.getHeight(), dx, dy, angleIncrement, animationBehaviorFactory);
    }

    private var allBinaryImageRotationAnimationInfo : Any = NullUtil.getInstance().NULL_OBJECT;
    private final animationBehaviorFactory : AnimationBehaviorFactory;
    public function new(image : Image, width : Int, height : Int, dx : Int, dy : Int, angleIncrement : Int, animationBehaviorFactory : AnimationBehaviorFactory) {
        this.animationBehaviorFactory = animationBehaviorFactory;
        final totalAngle : Int = Std.int(AngleFactory.getInstance().TOTAL_ANGLE);
        final imageArray : haxe.ds.Vector<Image> = ImageToRotationImageArrayUtil.getInstance().generate(image, angleIncrement, totalAngle);
        this.allBinaryImageRotationAnimationInfo = new ImageArrayRotationAnimationInfo(imageArray, angleIncrement, totalAngle, dx, dy);
    }

    // throws Exception
    public function getInstance(instanceId : Int) : Animation {
        return AdjustedImageArrayRotationAnimation.createAdjustedImageArrayRotationAnimationInfo(this.allBinaryImageRotationAnimationInfo, this.animationBehaviorFactory.getOrCreateInstance());
    }

    public function setInitialScale(scaleProperties : ScaleProperties) : Void {
    }

}

