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
package org.allbinary.input.motion.button;

import javax.microedition.lcdui.Image;
import org.allbinary.animation.AnimationBehaviorFactory;
import org.allbinary.animation.NullAnimationFactory;
import org.allbinary.animation.image.sprite.OneRowSpriteIndexedAnimationFactory;
import org.allbinary.animation.resource.BaseResourceAnimationInterfaceFactoryInterfaceFactory;
import org.allbinary.game.configuration.feature.Features;
import org.allbinary.game.resource.ResourceLoadingLevelFactory;
import org.allbinary.graphics.canvas.transition.progress.ProgressCanvas;
import org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory;
import org.allbinary.graphics.opengles.OpenGLFeatureFactory;
import org.allbinary.image.ImageCache;
import org.allbinary.image.ImageCacheFactory;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.system.os.OperatingSystemFactory;
import org.allbinary.media.image.ImageCompleteUtil;

class TouchButtonResourceAnimationInterfaceFactoryInterfaceFactory extends BaseResourceAnimationInterfaceFactoryInterfaceFactory {
    public static function createFactory() : TouchButtonResourceAnimationInterfaceFactoryInterfaceFactory {
        return new TouchButtonResourceAnimationInterfaceFactoryInterfaceFactory("TouchButton Animations");
    }

    public function new(name : String) {
        super(name, StdUtil.getInstance().createHashtable(), StdUtil.getInstance().createHashtable(), StdUtil.getInstance().createHashtable());
    }

    // throws Exception
    public override function init(level : Int) : Void {
        this.initImageCache(ImageCacheFactory.getInstance(), level);
    }

    // throws Exception
    public override function initImageCache(imageCache : ImageCache, level : Int) : Void {
        if (this.isInitialized()) {
            return;
        }
        final portion : Int = 140;
        final loadingString : String = Std.string(new StringMaker().append(Std.string(this)).append(" Loading: "));
        var index : Int = 0;
        final progressCanvas : ProgressCanvas = ProgressCanvasFactory.getInstance();
        progressCanvas.addPortion(portion, loadingString, index++);
        final touchButtonBlankResource : TouchButtonResource = TouchButtonBlankResource.getInstance();
        final touchButtonGenericActionResource : TouchButtonResource = TouchButtonGenericActionResource.getInstance();
        final touchButtonStartResource : TouchButtonResource = TouchButtonStartResource.getInstance();
        final touchButtonUpResource : TouchButtonResource = TouchButtonUpResource.getInstance();
        final touchButtonDownResource : TouchButtonResource = TouchButtonDownResource.getInstance();
        final touchButtonTurnLeftResource : TouchButtonResource = TouchButtonTurnLeftResource.getInstance();
        final touchButtonTurnRightResource : TouchButtonResource = TouchButtonTurnRightResource.getInstance();
        final touchButtonStrafeLeftResource : TouchButtonResource = TouchButtonStrafeLeftResource.getInstance();
        final touchButtonStrafeRightResource : TouchButtonResource = TouchButtonStrafeRightResource.getInstance();
        final touchButtonBlankResourceImage : Image = imageCache.getWithKey(touchButtonBlankResource.RESOURCE);
        final touchButtonGenericActionResourceImage : Image = imageCache.getWithKey(touchButtonGenericActionResource.RESOURCE);
        final touchButtonStartResourceImage : Image = imageCache.getWithKey(touchButtonStartResource.RESOURCE);
        final touchButtonUpResourceImage : Image = imageCache.getWithKey(touchButtonUpResource.RESOURCE);
        final touchButtonDownResourceImage : Image = imageCache.getWithKey(touchButtonDownResource.RESOURCE);
        final touchButtonTurnLeftResourceImage : Image = imageCache.getWithKey(touchButtonTurnLeftResource.RESOURCE);
        final touchButtonTurnRightResourceImage : Image = imageCache.getWithKey(touchButtonTurnRightResource.RESOURCE);
        final touchButtonStrafeLeftResourceImage : Image = imageCache.getWithKey(touchButtonStrafeLeftResource.RESOURCE);
        final touchButtonStrafeRightResourceImage : Image = imageCache.getWithKey(touchButtonStrafeRightResource.RESOURCE);
        final nullAnimationFactory : NullAnimationFactory = NullAnimationFactory.getFactoryInstance();
        if (OperatingSystemFactory.getInstance().getOperatingSystemInstance().isOverScan()) {
            imageCache.getWithKey(TouchButtonStartResource.getInstance().HINT);
        }
        progressCanvas.addPortion(portion, loadingString, index++);
        final imageCompleteUtil : ImageCompleteUtil = ImageCompleteUtil.getInstance();
        progressCanvas.addPortion(portion, loadingString, index++);
        imageCompleteUtil.waitForImage(touchButtonBlankResourceImage, touchButtonBlankResource.RESOURCE);
        this.add(touchButtonBlankResource.RESOURCE, OneRowSpriteIndexedAnimationFactory.createFactory(touchButtonBlankResourceImage, AnimationBehaviorFactory.getInstance()));
        this.add(touchButtonBlankResource.HINT, nullAnimationFactory);
        progressCanvas.addPortion(portion, loadingString, index++);
        imageCompleteUtil.waitForImage(touchButtonGenericActionResourceImage, touchButtonGenericActionResource.RESOURCE);
        this.add(touchButtonGenericActionResource.RESOURCE, OneRowSpriteIndexedAnimationFactory.createFactory(touchButtonGenericActionResourceImage, AnimationBehaviorFactory.getInstance()));
        this.add(touchButtonGenericActionResource.HINT, nullAnimationFactory);
        progressCanvas.addPortion(portion, loadingString, index++);
        imageCompleteUtil.waitForImage(touchButtonStartResourceImage, touchButtonStartResource.RESOURCE);
        this.add(touchButtonStartResource.RESOURCE, OneRowSpriteIndexedAnimationFactory.createFactory(touchButtonStartResourceImage, AnimationBehaviorFactory.getInstance()));
        progressCanvas.addPortion(portion, loadingString, index++);
        imageCompleteUtil.waitForImage(touchButtonUpResourceImage, touchButtonUpResource.RESOURCE);
        this.add(touchButtonUpResource.RESOURCE, OneRowSpriteIndexedAnimationFactory.createFactory(touchButtonUpResourceImage, AnimationBehaviorFactory.getInstance()));
        this.add(touchButtonUpResource.HINT, nullAnimationFactory);
        progressCanvas.addPortion(portion, loadingString, index++);
        imageCompleteUtil.waitForImage(touchButtonDownResourceImage, touchButtonDownResource.RESOURCE);
        this.add(touchButtonDownResource.RESOURCE, OneRowSpriteIndexedAnimationFactory.createFactory(touchButtonDownResourceImage, AnimationBehaviorFactory.getInstance()));
        this.add(touchButtonDownResource.HINT, nullAnimationFactory);
        progressCanvas.addPortion(portion, loadingString, index++);
        imageCompleteUtil.waitForImage(touchButtonTurnLeftResourceImage, touchButtonTurnLeftResource.RESOURCE);
        this.add(touchButtonTurnLeftResource.RESOURCE, OneRowSpriteIndexedAnimationFactory.createFactory(touchButtonTurnLeftResourceImage, AnimationBehaviorFactory.getInstance()));
        this.add(touchButtonTurnLeftResource.HINT, nullAnimationFactory);
        progressCanvas.addPortion(portion, loadingString, index++);
        imageCompleteUtil.waitForImage(touchButtonTurnRightResourceImage, touchButtonTurnRightResource.RESOURCE);
        this.add(touchButtonTurnRightResource.RESOURCE, OneRowSpriteIndexedAnimationFactory.createFactory(touchButtonTurnRightResourceImage, AnimationBehaviorFactory.getInstance()));
        this.add(touchButtonTurnRightResource.HINT, nullAnimationFactory);
        progressCanvas.addPortion(portion, loadingString, index++);
        imageCompleteUtil.waitForImage(touchButtonStrafeLeftResourceImage, touchButtonStrafeLeftResource.RESOURCE);
        this.add(touchButtonStrafeLeftResource.RESOURCE, OneRowSpriteIndexedAnimationFactory.createFactory(touchButtonStrafeLeftResourceImage, AnimationBehaviorFactory.getInstance()));
        this.add(touchButtonStrafeLeftResource.HINT, nullAnimationFactory);
        progressCanvas.addPortion(portion, loadingString, index++);
        imageCompleteUtil.waitForImage(touchButtonStrafeRightResourceImage, touchButtonStrafeRightResource.RESOURCE);
        this.add(touchButtonStrafeRightResource.RESOURCE, OneRowSpriteIndexedAnimationFactory.createFactory(touchButtonStrafeRightResourceImage, AnimationBehaviorFactory.getInstance()));
        this.add(touchButtonStrafeRightResource.HINT, nullAnimationFactory);
        if (OperatingSystemFactory.getInstance().getOperatingSystemInstance().isOverScan()) {
            final touchButtonStartHintResource : Image = imageCache.getWithKey(TouchButtonStartResource.getInstance().HINT);
            this.add(touchButtonStartResource.HINT, OneRowSpriteIndexedAnimationFactory.createFactory(touchButtonStartHintResource, AnimationBehaviorFactory.getInstance()));
        } else {
            this.add(touchButtonStartResource.HINT, nullAnimationFactory);
        }
        super.init(level);
    }

    public override function isLoadingLevel(level : Int) : Bool {
        final resourceLoadingLevelFactory : ResourceLoadingLevelFactory = ResourceLoadingLevelFactory.getInstance();
        if (level == resourceLoadingLevelFactory.LOAD_TOUCH.getLevel()) {
            return true;
        } else {
            return super.isLoadingLevel(level);
        }
    }

    public override function isFeature() : Bool {
        if (!Features.getInstance().isDefault(OpenGLFeatureFactory.getInstance().OPENGL)) {
            return true;
        } else {
            return false;
        }
    }

}

