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
package org.allbinary.animation.image.sprite;

//import javax.microedition.lcdui.Image;
//import javax.microedition.lcdui.game.Sprite;
import org.allbinary.animation.Animation;
import org.allbinary.animation.AnimationBehaviorFactory;
import org.allbinary.animation.ProceduralAnimationInterfaceFactoryInterface;
import org.allbinary.animation.image.BaseImageAnimationFactory;
import org.allbinary.image.sprite.AnimationFactorySpriteScaleUtil;
import org.allbinary.logic.communication.log.ForcedLogUtil;
import org.allbinary.logic.math.PrimitiveIntUtil;

class AllBinarySpriteRotationAnimationFactory extends BaseImageAnimationFactory implements ProceduralAnimationInterfaceFactoryInterface {
    // throws Exception
    public static function createWHDY(image : Image, dx : Int, dy : Int, animationBehaviorFactory : AnimationBehaviorFactory) : AllBinarySpriteRotationAnimationFactory {
        final spriteRotationAnimationFactory : AllBinarySpriteRotationAnimationFactory = new AllBinarySpriteRotationAnimationFactory(image, PrimitiveIntUtil.getArrayInstance(), (image.getHeight() >> 2), (image.getHeight() >> 2), 0, 0, animationBehaviorFactory);
        spriteRotationAnimationFactory.initWH(dx, dy);
        return spriteRotationAnimationFactory;
    }

    // throws Exception
    public static function createWH(image : Image, animationBehaviorFactory : AnimationBehaviorFactory) : AllBinarySpriteRotationAnimationFactory {
        return AllBinarySpriteRotationAnimationFactory.createWHDY(image, 0, 0, animationBehaviorFactory);
    }

    // throws Exception
    public static function createDXY(image : Image, dx : Int, dy : Int, animationBehaviorFactory : AnimationBehaviorFactory) : AllBinarySpriteRotationAnimationFactory {
        final spriteRotationAnimationFactory : AllBinarySpriteRotationAnimationFactory = new AllBinarySpriteRotationAnimationFactory(image, PrimitiveIntUtil.getArrayInstance(), image.getHeight(), image.getHeight(), 0, 0, animationBehaviorFactory);
        spriteRotationAnimationFactory.init(dx, dy);
        return spriteRotationAnimationFactory;
    }

    // throws Exception
    public static function createDXYQ(image : Image, dx : Int, dy : Int, animationBehaviorFactory : AnimationBehaviorFactory) : AllBinarySpriteRotationAnimationFactory {
        final spriteRotationAnimationFactory : AllBinarySpriteRotationAnimationFactory = new AllBinarySpriteRotationAnimationFactory(image, PrimitiveIntUtil.getArrayInstance(), (image.getHeight() >> 2), (image.getHeight() >> 2), 0, 0, animationBehaviorFactory);
        spriteRotationAnimationFactory.init(dx, dy);
        return spriteRotationAnimationFactory;
    }

    // throws Exception
    public static function createQ(image : Image, animationBehaviorFactory : AnimationBehaviorFactory) : AllBinarySpriteRotationAnimationFactory {
        return new AllBinarySpriteRotationAnimationFactory(image, PrimitiveIntUtil.getArrayInstance(), (image.getHeight() >> 2), (image.getHeight() >> 2), 0, 0, animationBehaviorFactory);
    }

    // throws Exception
    public static function createWHF(image : Image, animationBehaviorFactory : AnimationBehaviorFactory) : AllBinarySpriteRotationAnimationFactory {
        return new AllBinarySpriteRotationAnimationFactory(image, PrimitiveIntUtil.getArrayInstance(), image.getHeight(), image.getHeight(), 0, 0, animationBehaviorFactory);
    }

    private final animationFactorySpriteScaleUtil : AnimationFactorySpriteScaleUtil = AnimationFactorySpriteScaleUtil.getInstance();
    public function new(image : Image, sequenceArray : haxe.ds.Vector<Int>, width : Int, height : Int, dx : Int, dy : Int, animationBehaviorFactory : AnimationBehaviorFactory) {
        super(image, sequenceArray, width, height, dx, dy, animationBehaviorFactory);
        if (animationBehaviorFactory == AnimationBehaviorFactory.getInstance()) {
            ForcedLogUtil.log("Using default AnimationBehaviorFactory with IndexedAnimationFactory", this);
        }
    }

    public function init(dx : Int, dy : Int) : Void {
        this.animationFactoryInitializationVisitor.dx = dx;
        this.animationFactoryInitializationVisitor.dy = dy;
    }

    private function initWH(dx : Int, dy : Int) : Void {
        this.init(dx, dy);
        this.animationFactoryInitializationVisitor.dx += -this.animationFactoryInitializationVisitor.width / 5;
        this.animationFactoryInitializationVisitor.dy += -this.animationFactoryInitializationVisitor.height / 5;
    }

    // throws Exception
    public override function getInstance(instanceId : Int) : Animation {
        final sprite : Sprite = this.animationFactorySpriteScaleUtil.createImage(this.getImage(), this.animationFactoryInitializationVisitor.width, this.animationFactoryInitializationVisitor.height, this.scaleProperties.scaleWidth, this.scaleProperties.scaleHeight);
        if (this.animationFactoryInitializationVisitor.dx != 0 || this.animationFactoryInitializationVisitor.dy != 0) {
            return new AllBinaryAdjustedSpriteRotationAnimation(sprite, this.getImage(), this.animationFactoryInitializationVisitor.dx, this.animationFactoryInitializationVisitor.dy, this.animationBehaviorFactory.getOrCreateInstance());
        } else {
            return new AllBinarySpriteRotationAnimation(sprite, this.getImage(), this.animationBehaviorFactory.getOrCreateInstance());
        }
    }

    // throws Exception
    public override function getInstanceAnimation(animationInterface : Animation) : Animation {
        return this.getInstance(0);
    }

}

