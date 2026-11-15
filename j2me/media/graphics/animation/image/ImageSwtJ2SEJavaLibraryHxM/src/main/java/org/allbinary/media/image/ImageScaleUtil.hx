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
package org.allbinary.media.image;

//import javax.microedition.lcdui.Image;
import org.allbinary.game.configuration.feature.Features;
import org.allbinary.game.configuration.feature.GameFeatureFactory;
import org.allbinary.image.ImageCache;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;

class ImageScaleUtil {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : ImageScaleUtil = new ImageScaleUtil();
    public static function getInstance() : ImageScaleUtil {
        return ImageScaleUtil.instance;
    }

    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    private final imageCopyUtil : ImageCopyUtil = ImageCopyUtil.getInstance();
    private final gameFeatureFactory : GameFeatureFactory = GameFeatureFactory.getInstance();
    private final features : Features = Features.getInstance();
    private final NO_COPY : String = "SWT should not copy images after initial loading as the alpha is not honored";
    public function new() {
    }

    // throws Exception
    public function createImage2(imageCache : ImageCache, originalImage : Image, scaleNominatorX : Float, scaleDenominatorX : Float, scaleNominatorY : Float, scaleDenominatorY : Float, cached : Bool) : Image {
        return this.createImage3(imageCache, originalImage, scaleNominatorX, scaleDenominatorX, scaleNominatorY, scaleDenominatorY, cached, true);
    }

    // throws Exception
    public function createImage3(imageCache : ImageCache, originalImage : Image, scaleNominatorX : Float, scaleDenominatorX : Float, scaleNominatorY : Float, scaleDenominatorY : Float, cached : Bool, mutable : Bool) : Image {
        if (!this.features.isFeature(this.gameFeatureFactory.POST_IMAGE_LOADING_MODIFICATION)) {
            this.logUtil.putF(this.NO_COPY, this, this.commonStrings.CONSTRUCTOR);
            return originalImage;
        }
        final width : Int = originalImage.getWidth();
        final height : Int = originalImage.getHeight();
        final scaleX : Float = scaleNominatorX / scaleDenominatorX;
        final scaleY : Float = scaleNominatorY / scaleDenominatorY;
        final scaledImage : Image = this.imageCopyUtil.createImageWH(originalImage, Std.int((scaleX * width)), Std.int((scaleY * height)), mutable);
        return scaledImage;
    }

    // throws Exception
    public function scale2(originalImage : Image, originalImageArray : haxe.ds.Vector<Image>, ximageToShowArray : haxe.ds.Vector<Image>, unused : Int, scaleX : Float, scaleY : Float, maxScaleX : Float, maxScaleY : Float) : Void {
        this.scale(originalImage, originalImageArray, ximageToShowArray, unused, scaleX, scaleY, maxScaleX, maxScaleY, true);
    }

    // throws Exception
    public function scale(originalImage : Image, originalImageArray : haxe.ds.Vector<Image>, ximageToShowArray : haxe.ds.Vector<Image>, unused : Int, scaleX : Float, scaleY : Float, maxScaleX : Float, maxScaleY : Float, mutable : Bool) : Void {
        final width : Int = originalImage.getWidth();
        final height : Int = originalImage.getHeight();
        final scaledImage : Image = this.imageCopyUtil.createImageWH(originalImage, Std.int((scaleX * width)), Std.int((scaleY * height)), mutable);
        originalImageArray[0] = scaledImage;
    }

}

