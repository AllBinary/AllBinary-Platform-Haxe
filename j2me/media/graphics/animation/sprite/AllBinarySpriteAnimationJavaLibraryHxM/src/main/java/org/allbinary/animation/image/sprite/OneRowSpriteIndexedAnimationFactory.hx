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
import org.allbinary.animation.image.BaseImageAnimationFactory;
import org.allbinary.graphics.color.BasicColorUtil;
import org.allbinary.image.sprite.AnimationFactorySpriteScaleUtil;
import org.allbinary.logic.math.PrimitiveIntUtil;

class OneRowSpriteIndexedAnimationFactory extends BaseImageAnimationFactory {
    // throws Exception
    public static function createFactoryDX(image : Image, dx : Int, animationBehaviorFactory : AnimationBehaviorFactory) : OneRowSpriteIndexedAnimationFactory {
        final oneRowSpriteIndexedAnimationFactory : OneRowSpriteIndexedAnimationFactory = new OneRowSpriteIndexedAnimationFactory(image, PrimitiveIntUtil.getArrayInstance(), image.getHeight(), image.getHeight(), 0, 0, animationBehaviorFactory);
        oneRowSpriteIndexedAnimationFactory.initW(dx);
        return oneRowSpriteIndexedAnimationFactory;
    }

    // throws Exception
    public static function createFactoryDXY(image : Image, dx : Int, dy : Int, animationBehaviorFactory : AnimationBehaviorFactory) : OneRowSpriteIndexedAnimationFactory {
        final oneRowSpriteIndexedAnimationFactory : OneRowSpriteIndexedAnimationFactory = new OneRowSpriteIndexedAnimationFactory(image, PrimitiveIntUtil.getArrayInstance(), image.getHeight(), image.getHeight(), 0, 0, animationBehaviorFactory);
        oneRowSpriteIndexedAnimationFactory.init(dx, dy);
        return oneRowSpriteIndexedAnimationFactory;
    }

    // throws Exception
    public static function createFactoryWH(image : Image, width : Int, height : Int, animationBehaviorFactory : AnimationBehaviorFactory) : OneRowSpriteIndexedAnimationFactory {
        return new OneRowSpriteIndexedAnimationFactory(image, PrimitiveIntUtil.getArrayInstance(), width, height, 0, 0, animationBehaviorFactory);
    }

    // throws Exception
    public static function createFactory(image : Image, animationBehaviorFactory : AnimationBehaviorFactory) : OneRowSpriteIndexedAnimationFactory {
        return new OneRowSpriteIndexedAnimationFactory(image, PrimitiveIntUtil.getArrayInstance(), image.getHeight(), image.getHeight(), 0, 0, animationBehaviorFactory);
    }

    private final animationFactorySpriteScaleUtil : AnimationFactorySpriteScaleUtil = AnimationFactorySpriteScaleUtil.getInstance();
    public function new(image : Image, sequenceArray : haxe.ds.Vector<Int>, width : Int, height : Int, dx : Int, dy : Int, animationBehaviorFactory : AnimationBehaviorFactory) {
        super(image, sequenceArray, width, height, dx, dy, animationBehaviorFactory);
    }

    public function init(dx : Int, dy : Int) : Void {
        this.animationFactoryInitializationVisitor.dx = dx;
        this.animationFactoryInitializationVisitor.dy = dy;
    }

    public function initW(dx : Int) : Void {
        this.init(dx, 0);
        this.animationFactoryInitializationVisitor.dx += -(this.animationFactoryInitializationVisitor.width >> 2);
    }

    // throws Exception
    public override function getInstance(instanceId : Int) : Animation {
        final sprite : Sprite = this.animationFactorySpriteScaleUtil.createImage(this.getImage(), this.animationFactoryInitializationVisitor.width, this.animationFactoryInitializationVisitor.height, this.scaleProperties.scaleWidth, this.scaleProperties.scaleHeight);
        if (this.animationFactoryInitializationVisitor.dx != 0 || this.animationFactoryInitializationVisitor.dy != 0) {
            return new AdjustedSpriteIndexedAnimation(sprite, this.getImage(), BasicColorUtil.getInstance().ZERO_ARRAY, this.animationFactoryInitializationVisitor.dx, this.animationFactoryInitializationVisitor.dy, this.animationBehaviorFactory.getOrCreateInstance());
        } else {
            return new SpriteIndexedAnimation(sprite, this.getImage(), BasicColorUtil.getInstance().ZERO_ARRAY, this.animationBehaviorFactory.getOrCreateInstance());
        }
    }

}

