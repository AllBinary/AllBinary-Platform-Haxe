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
import org.allbinary.animation.AnimationInterfaceFactoryInterface;
import org.allbinary.logic.communication.log.ForcedLogUtil;
import org.allbinary.media.image.ImageCopyUtil;
import org.allbinary.math.AngleFactory;
import org.allbinary.math.AngleInfo;
import org.allbinary.media.ScaleProperties;

class AllBinaryFlickerAndroidImageRotationAnimationFactory implements AnimationInterfaceFactoryInterface {
    private var image : Image = NullImage.NULL_IMAGE;
    private final angleIncrement : Int;
    public final animationBehaviorFactory : AnimationBehaviorFactory;
    public function new(image : Image, width : Int, height : Int, angleIncrement : Int, animationBehaviorFactory : AnimationBehaviorFactory) {
        this.setImage(image);
        this.angleIncrement = angleIncrement;
        this.animationBehaviorFactory = animationBehaviorFactory;
    }

    // throws Exception
    public function getInstance(instanceId : Int) : Animation {
        final image : Image = ImageCopyUtil.getInstance().createImage(this.getImage());
        return new AllBinaryFlickerAndroidImageRotationAnimation(this.getImage(), image, AngleInfo.getInstance(this.angleIncrement), AngleFactory.getInstance().TOTAL_ANGLE, this.animationBehaviorFactory.getOrCreateInstance());
    }

    public function getAngleIncrement() : Int {
        return this.angleIncrement;
    }

    public function setImage(image : Image) : Void {
        this.image = image;
    }

    public function getImage() : Image {
        return this.image;
    }

    public function setInitialScale(scaleProperties : ScaleProperties) : Void {
    }

}

