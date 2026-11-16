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
import javax.microedition.lcdui.NullImage;
import org.allbinary.animation.Animation;
import org.allbinary.animation.AnimationBehaviorFactory;
import org.allbinary.animation.VectorAnimation;
import org.allbinary.game.configuration.GameConfigurationCentral;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.image.AnimationFrameToImageUtil;
import org.allbinary.logic.math.PrimitiveIntUtil;
import org.allbinary.math.AngleFactory;
import org.allbinary.math.AngleInfo;
import org.allbinary.media.ScaleProperties;
import org.allbinary.media.image.ImageToRotationImageArrayUtil;
import org.allbinary.vector.VectorInfo;

class VectorToImageArrayRotationAnimationFactory extends BaseImageAnimationFactory {
    private var imageArray : haxe.ds.Vector<Image> = NullImage.NULL_IMAGE_ARRAY;
    private var angleIncrement : Int = 0;
    public function new(vectorInfo : VectorInfo, basicColor : BasicColor, animationBehaviorFactory : AnimationBehaviorFactory) {
        super(AnimationFrameToImageUtil.getInstance().getInstanceTranslate(vectorInfo.getWidth(), vectorInfo.getHeight(), VectorAnimation.createVectorAnimation(vectorInfo.getPoints(), basicColor, animationBehaviorFactory.getOrCreateInstance())), PrimitiveIntUtil.getArrayInstance(), 0, 0, 0, 0, animationBehaviorFactory);
        this.init();
    }

    // throws Exception
    public function init() : Void {
        final angleFactory : AngleFactory = AngleFactory.getInstance();
        this.angleIncrement = jre.lang.JavaNumber.divide(angleFactory.TOTAL_ANGLE, GameConfigurationCentral.getInstance().getGameControlFidelity());
        this.imageArray = ImageToRotationImageArrayUtil.getInstance().generate(this.getImage(), this.getAngleIncrement(), jre.lang.JavaNumber.toInt(angleFactory.TOTAL_ANGLE));
    }

    // throws Exception
    public override function getInstanceFor(instanceId : Int) : Animation {
        if (this.animationFactoryInitializationVisitor.dx != 0 || this.animationFactoryInitializationVisitor.dy != 0) {
            return new AdjustedImageArrayRotationAnimation(this.imageArray, AngleInfo.getInstance(this.getAngleIncrement()), jre.lang.JavaNumber.toInt(AngleFactory.getInstance().TOTAL_ANGLE), this.animationFactoryInitializationVisitor.dx, this.animationFactoryInitializationVisitor.dy, this.animationBehaviorFactory.getOrCreateInstance());
        } else {
            return AdjustedImageArrayRotationAnimation.createAnimation(this.imageArray, AngleInfo.getInstance(this.angleIncrement), jre.lang.JavaNumber.toInt(AngleFactory.getInstance().TOTAL_ANGLE), this.animationBehaviorFactory.getOrCreateInstance());
        }
    }

    public function getAngleIncrement() : Int {
        return this.angleIncrement;
    }

    public override function setInitialScale(scaleProperties : ScaleProperties) : Void {
    }

}

