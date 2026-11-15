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
package org.allbinary.graphics.canvas.transition.progress;

//import javax.microedition.lcdui.Graphics;
//import javax.microedition.lcdui.Image;
//import javax.microedition.lcdui.NullImage;
import android.app.Activity;
import org.allbinary.AndroidUtil;
import org.allbinary.image.GameFeatureImageCacheFactory;
import org.allbinary.image.PreResourceImageUtil;
import org.allbinary.logic.communication.log.ForcedLogUtil;
import org.allbinary.logic.java.exception.ExceptionUtil;
import org.allbinary.animation.Animation;
import org.allbinary.animation.NullAnimationFactory;
import org.allbinary.game.configuration.feature.Features;
import org.allbinary.game.configuration.feature.MainFeatureFactory;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.displayable.DisplayInfoSingleton;
import org.allbinary.graphics.displayable.event.DisplayChangeEvent;
import org.allbinary.graphics.displayable.event.DisplayChangeEventHandler;
import org.allbinary.graphics.displayable.event.DisplayChangeEventListener;
import org.allbinary.image.ImageCacheFactory;
import org.allbinary.media.image.ImageScaleUtil;
import org.allbinary.logic.util.event.AllBinaryEventObject;
import org.allbinary.animation.AnimationBehavior;
import org.allbinary.animation.image.ImageAnimation;
import org.allbinary.data.resource.ResourceUtil;
import org.allbinary.logic.util.event.EventStrings;
import org.allbinary.thread.ARunnable;
import org.allbinary.thread.NullRunnable;

class AndroidBasicTitleProgressBar extends ProgressCanvas implements DisplayChangeEventListener {
    public static final RESOURCE : String = "ProgressImage";
    private var showTitleProgressBarRunnable : ARunnable = NullRunnable.getInstance();
    private var dismissTitleProgressBarRunnable : ARunnable = NullRunnable.getInstance();
    private var titleProgressDialogPortionSetProgressRunnable : ARunnable = NullRunnable.getInstance();
    private var titleProgressDialogSetProgressRunnable : ARunnable = NullRunnable.getInstance();
    private var midletActivity : Activity = AndroidUtil.NULL_ACTIVITY;
    private var portion : Int = 0;
    private final IMAGE : haxe.ds.Vector<Image> = haxe.ds.Vector.fromArrayCopy([for (index in 0...4) null]);
    private var image : Image = NullImage.NULL_IMAGE;
    private var animation : Animation = NullAnimationFactory.getFactoryInstance().getInstance(0);
    private static var background : Int = 0;
    public function new(title : String, backgroundBasicColor : BasicColor, foregroundBasicColor : BasicColor) {
        super(title, backgroundBasicColor, foregroundBasicColor);
        this.init();
        DisplayChangeEventHandler.getInstance().addListenerInterface(this);
        final size : Int = this.IMAGE.length;
        for (index in 0...size) {
            this.IMAGE[index] = NullImage.NULL_IMAGE;
        }
    }

    private function init() : Void {
        try {
            if (AndroidBasicTitleProgressBar.background != 0) {
                ResourceUtil.getInstance().addResource(AndroidBasicTitleProgressBar.RESOURCE, AndroidBasicTitleProgressBar.background);
                GameFeatureImageCacheFactory.init();
                this.image = ImageCacheFactory.getInstance().getWithKey(AndroidBasicTitleProgressBar.RESOURCE);
            }
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.INIT, e);
        }
    }

    public function initActivity(activity : Activity) : Void {
        try {
            if (this.midletActivity != activity) {
                this.midletActivity = activity;
                this.showTitleProgressBarRunnable = new ShowTitleProgressBarRunnable(this.midletActivity, this);
                this.dismissTitleProgressBarRunnable = new DismissTitleProgressBarRunnable(this.midletActivity, this);
                this.titleProgressDialogSetProgressRunnable = new TitleProgressBarSetProgressRunnable(this.midletActivity, this);
                this.titleProgressDialogPortionSetProgressRunnable = new TitleProgressBarPortionSetProgressRunnable(this.midletActivity, this);
                this.loadProgressImages();
            }
            this.updateCurrent();
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.INIT, e);
        }
    }

    private function updateCurrent() : Void {
        try {
            if (!this.isBackground()) {
                this.animation = NullAnimationFactory.getFactoryInstance().getInstance(0);
            } else if (AndroidBasicTitleProgressBar.background != 0) {
                var displayInfo : DisplayInfoSingleton = DisplayInfoSingleton.getInstance();
                var currentImage : Image = null;
                if (displayInfo.isPortrait()) {
                    currentImage = this.getImage(0);
                } else {
                    currentImage = this.getImage(2);
                }
                if (currentImage == null) {
                    this.animation = NullAnimationFactory.getFactoryInstance().getInstance(0);
                } else {
                    this.animation = new ImageAnimation(currentImage, AnimationBehavior.getInstance());
                }
            }
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.UPDATE, e);
        }
    }

    public override function onEvent(eventObject : AllBinaryEventObject) : Void {
        ForcedLogUtil.log(EventStrings.getInstance().PERFORMANCE_MESSAGE, this);
    }

    public override function onDisplayChangeEvent(displayChangeEvent : DisplayChangeEvent) : Void {
        try {
            this.loadProgressImages();
            this.updateCurrent();
        } catch (e : haxe.Exception) {
            this.logUtil.putF(this.commonStrings.EXCEPTION_LABEL + ExceptionUtil.getInstance().getStackTrace(e), this, this.canvasStrings.ON_DISPLAY_CHANGE_EVENT);
            this.animation = NullAnimationFactory.getFactoryInstance().getInstance(0);
        }
    }

    private function loadProgressImages() : Void {
        try {
            var displayInfo : DisplayInfoSingleton = DisplayInfoSingleton.getInstance();
            var lastWidth : Int = displayInfo.getLastWidth();
            var lastHeight : Int = displayInfo.getLastHeight();
            if (displayInfo.isPortraitWH(lastWidth, lastHeight)) {
                this.setImages(0, lastWidth, lastHeight);
            } else {
                this.setImages(2, lastWidth, lastHeight);
            }
        } catch (e : IllegalArgumentException) {
            this.logUtil.putF("IllegalArgumentException " + ExceptionUtil.getInstance().getStackTrace(e), this, "loadProgressImages");
            this.animation = NullAnimationFactory.getFactoryInstance().getInstance(0);
        } catch (e : haxe.Exception) {
            this.logUtil.putF(this.commonStrings.EXCEPTION_LABEL + ExceptionUtil.getInstance().getStackTrace(e), this, "loadProgressImages");
            this.animation = NullAnimationFactory.getFactoryInstance().getInstance(0);
        }
    }

    public function isInitialized() : Bool {
        if (this.midletActivity != AndroidUtil.NULL_ACTIVITY) {
            return true;
        } else {
            return false;
        }
    }

    public override function start() : Void {
        try {
            this.logUtil.putF(this.commonStrings.START, this, this.commonStrings.START_METHOD_NAME);
            super.start();
            this.midletActivity.runOnUiThread(this.showTitleProgressBarRunnable);
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.START_METHOD_NAME, e);
        }
    }

    public override function end() : Void {
        try {
            this.logUtil.putF(this.commonStrings.START, this, this.commonStrings.END_METHOD_NAME);
            this.midletActivity.runOnUiThread(this.dismissTitleProgressBarRunnable);
            super.end();
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.END_METHOD_NAME, e);
        }
    }

    public override function addEarlyPortion(value : Int, text : String, index : Int) : Void {
        try {
            this.portion = value;
            super.addEarlyPortion(value, text, index);
            if (this.midletActivity != AndroidUtil.NULL_ACTIVITY) {
                this.midletActivity.runOnUiThread(this.titleProgressDialogPortionSetProgressRunnable);
            }
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.ADD_PORTION, e);
        }
    }

    public override function addPortion(value : Int, text : String, index : Int) : Void {
        try {
            this.portion = value;
            super.addPortion(value, text, index);
            this.midletActivity.runOnUiThread(this.titleProgressDialogPortionSetProgressRunnable);
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.ADD_PORTION, e);
        }
    }

    public override function addNormalPortion(value : Int, text : String) : Void {
        try {
            this.portion = value;
            super.addNormalPortion(value, text);
            this.midletActivity.runOnUiThread(this.titleProgressDialogPortionSetProgressRunnable);
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.ADD_PORTION, e);
        }
    }

    public override function setValue(value : Int) : Void {
        try {
            super.setValue(value);
            this.midletActivity.runOnUiThread(this.titleProgressDialogSetProgressRunnable);
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "setValue", e);
        }
    }

    public function waitUntilDisplayed() : Void {
    }

    // throws Exception
    private function setImages(index : Int, lastWidth : Int, lastHeight : Int) : Void {
        final image : Image = this.image;
        if (image != NullImage.NULL_IMAGE) {
            if (Features.getInstance().isFeature(MainFeatureFactory.getInstance().FULL_SCREEN)) {
                if (this.IMAGE[index] == NullImage.NULL_IMAGE) {
                    this.IMAGE[index] = ImageScaleUtil.getInstance().createImage2(ImageCacheFactory.getInstance(), image, lastWidth, image.getWidth(), lastHeight - 20.0, image.getHeight(), false);
                }
            } else {
                var nextIndex : Int = index + 1;
                if (this.IMAGE[nextIndex] == NullImage.NULL_IMAGE) {
                    this.IMAGE[nextIndex] = ImageScaleUtil.getInstance().createImage2(ImageCacheFactory.getInstance(), image, lastWidth, image.getWidth(), lastHeight - 28.0, image.getHeight(), false);
                }
            }
        }
    }

    // throws Exception
    public function initOpenGL(graphics : Graphics) : Void {
        this.logUtil.putF(this.commonStrings.START, this, this.commonStrings.INIT);
        this.image = GameFeatureImageCacheFactory.getInstance().getWithKey(AndroidBasicTitleProgressBar.RESOURCE);
        var preResourceImageUtil : PreResourceImageUtil = PreResourceImageUtil.getInstance();
        var size : Int = this.IMAGE.length;
        for (index in 0...size) {
            if (this.IMAGE[index] != NullImage.NULL_IMAGE) {
                this.IMAGE[index] = preResourceImageUtil.encapsulate(this.IMAGE[index]);
            }
        }
        this.updateCurrent();
    }

    // throws Exception
    public override function update(graphics : Graphics) : Void {
        this.logUtil.putF(this.commonStrings.START, this, this.commonStrings.UPDATE);
        this.initOpenGL(graphics);
        this.image = GameFeatureImageCacheFactory.getInstance().getWithKey(AndroidBasicTitleProgressBar.RESOURCE);
        var preResourceImageUtil : PreResourceImageUtil = PreResourceImageUtil.getInstance();
        var size : Int = this.IMAGE.length;
        for (index in 0...size) {
            if (this.IMAGE[index] != NullImage.NULL_IMAGE) {
                preResourceImageUtil.update(graphics, this.IMAGE[index]);
            }
        }
    }

    // throws Exception
    private function getImage(index : Int) : Image {
        var image : Image = NullImage.NULL_IMAGE;
        if (Features.getInstance().isFeature(MainFeatureFactory.getInstance().FULL_SCREEN)) {
            image = this.IMAGE[index];
        } else {
            image = this.IMAGE[index + 1];
        }
        return image;
    }

    public override function paint2(graphics : Graphics) : Void {
        try {
            this.animation.paintXY(graphics, 0, 20);
            super.paint2(graphics);
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.canvasStrings.PAINT, e);
        }
    }

    public static function setBackgroundResource(background : Int) : Void {
        AndroidBasicTitleProgressBar.background = background;
    }

    public override function setBackground(background : Bool) : Void {
        super.setBackground(background);
        this.updateCurrent();
    }

    public function setPortion(portion : Int) : Void {
        this.portion = portion;
    }

    public function getPortion() : Int {
        return this.portion;
    }

}

