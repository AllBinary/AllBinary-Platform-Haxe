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

import javax.microedition.lcdui.Image;
import javax.microedition.lcdui.game.Sprite;
import javax.microedition.media.Player;
import org.allbinary.animation.Animation;
import org.allbinary.animation.AnimationBehaviorFactory;
import org.allbinary.animation.AnimationInterfaceFactoryInterface;
import org.allbinary.animation.IndexedAnimation;
import org.allbinary.animation.caption.CaptionIndexedAnimation;
import org.allbinary.animation.image.ImageAnimation;
import org.allbinary.graphics.color.BasicColorUtil;
import org.allbinary.image.AnimationFactoryImageScaleUtil;
import org.allbinary.image.sprite.AnimationFactorySpriteScaleUtil;
import org.allbinary.logic.communication.log.ForcedLogUtil;
import org.allbinary.media.ScaleProperties;
import org.allbinary.media.audio.Sound;

class ImageCaptionIndexedAnimationFactory implements AnimationInterfaceFactoryInterface {
    public final animationFactoryImageScaleUtil : AnimationFactoryImageScaleUtil = AnimationFactoryImageScaleUtil.getInstance();
    private final animationFactorySpriteScaleUtil : AnimationFactorySpriteScaleUtil = AnimationFactorySpriteScaleUtil.getInstance();
    private var captionImage : Image;
    private var spriteMovieImage : Image;
    private var frameWidth : Int;
    private var frameHeight : Int;
    private var captionDx : Int;
    private var captionDy : Int;
    private var dx : Int;
    private var dy : Int;
    private var time : Int;
    private var soundInterface : Sound;
    public var scaleProperties : ScaleProperties = ScaleProperties.instance;
    private final animationBehaviorFactory : AnimationBehaviorFactory;
    public function new(captionImage : Image, spriteMovieImage : Image, soundInterface : Sound, frameWidth : Int, frameHeight : Int, captionDx : Int, captionDy : Int, dx : Int, dy : Int, time : Int, animationBehaviorFactory : AnimationBehaviorFactory) {
        if (animationBehaviorFactory == AnimationBehaviorFactory.getInstance()) {
            ForcedLogUtil.log("Using default AnimationBehaviorFactory with IndexedAnimationFactory", this);
        }
        this.captionImage = captionImage;
        this.spriteMovieImage = spriteMovieImage;
        this.frameWidth = frameWidth;
        this.frameHeight = frameHeight;
        this.captionDx = captionDx;
        this.captionDy = captionDy;
        this.dx = dx;
        this.dy = dy;
        this.time = time;
        this.soundInterface = soundInterface;
        this.animationBehaviorFactory = animationBehaviorFactory;
    }

    // throws Exception
    public function getInstanceFor(instanceId : Int) : Animation {
        final scaledImage : Image = this.animationFactoryImageScaleUtil.createImage(this.captionImage, this.captionImage.getWidth(), this.captionImage.getHeight(), this.scaleProperties.scaleWidth, this.scaleProperties.scaleHeight);
        final animationInterface : Animation = new ImageAnimation(scaledImage, this.animationBehaviorFactory.getOrCreateInstance());
        final sprite : Sprite = this.animationFactorySpriteScaleUtil.createImage(this.spriteMovieImage, this.frameWidth, this.frameHeight, this.scaleProperties.scaleWidth, this.scaleProperties.scaleHeight);
        final movieIndexedAnimationInterface : IndexedAnimation = new SpriteIndexedAnimation(sprite, this.spriteMovieImage, BasicColorUtil.getInstance().ZERO_ARRAY, this.animationBehaviorFactory.getOrCreateInstance());
        var player : Player = this.soundInterface.getPlayerP();
        if (player == null) {
            throw new jre.lang.JavaException("Sound Was not Initialized");
        }
        return new CaptionIndexedAnimation(animationInterface, movieIndexedAnimationInterface, player, this.captionDx, this.captionDy, this.dx, this.dy, this.time, this.animationBehaviorFactory.getOrCreateInstance());
    }

    public function setInitialScale(scaleProperties : ScaleProperties) : Void {
        this.scaleProperties = scaleProperties;
    }

}

