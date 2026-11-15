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
import org.allbinary.game.configuration.GameConfigurationCentral;
import org.allbinary.logic.math.PrimitiveIntUtil;
import org.allbinary.math.AngleFactory;
import org.allbinary.math.AngleInfo;

class ImageRotationAnimationFactory extends BaseImageAnimationFactory {
    public final angleIncrement : Int;
    public function new(image : Image, width : Int, height : Int, dx : Int, dy : Int, angleIncrement : Int, animationBehaviorFactory : AnimationBehaviorFactory) {
        super(image, PrimitiveIntUtil.getArrayInstance(), width, height, 0, 0, animationBehaviorFactory);
        this.angleIncrement = angleIncrement;
        this.animationFactoryInitializationVisitor.dx = dx;
        this.animationFactoryInitializationVisitor.dy = dy;
    }

    // throws Exception
    public override function getInstance(instanceId : Int) : Animation {
        if (this.animationFactoryInitializationVisitor.dx != 0 || this.animationFactoryInitializationVisitor.dy != 0) {
            this.animationFactoryImageScaleUtil.processAdjust(this);
            return new AdjustedImageBaseRotationAnimation(this.getImage(), AngleInfo.getInstance(this.angleIncrement), AngleFactory.getInstance().TOTAL_ANGLE, this.animationFactoryInitializationVisitor.dx, this.animationFactoryInitializationVisitor.dy, this.animationBehaviorFactory.getOrCreateInstance());
        } else {
            return new ImageBaseRotationAnimation(this.getImage(), AngleInfo.getInstance(this.angleIncrement), AngleFactory.getInstance().TOTAL_ANGLE, this.animationBehaviorFactory.getOrCreateInstance());
        }
    }

    public function getAngleIncrementP() : Int {
        return this.angleIncrement;
    }

}

