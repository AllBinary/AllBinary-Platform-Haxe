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
import org.allbinary.image.ImageCache;
import org.microemu.device.playn.PlaynImmutableImage;
import org.microemu.device.playn.PlaynMutableImage;
import playn.core.Canvas;
import playn.core.CoreImage;
import playn.core.ImageImpl;
import playn.html.HTMLPlaynUtil;

class ImageScaleUtil {
    private static final instance : ImageScaleUtil = new ImageScaleUtil();
    public static function getInstance() : ImageScaleUtil {
        return ImageScaleUtil.instance;
    }

    private final playnUtil : HTMLPlaynUtil = HTMLPlaynUtil.getInstance();
    public function new() {
    }

    // throws Exception
    public function createImage2(imageCache : ImageCache, originalImage : Image, scaleNominatorX : Float, scaleDenominatorX : Float, scaleNominatorY : Float, scaleDenominatorY : Float, cached : Bool) : Image {
        return this.createImage3(imageCache, originalImage, scaleNominatorX, scaleDenominatorX, scaleNominatorY, scaleDenominatorY, cached, true);
    }

    // throws Exception
    public function createImage3(imageCache : ImageCache, originalImage : Image, scaleNominatorX : Float, scaleDenominatorX : Float, scaleNominatorY : Float, scaleDenominatorY : Float, cached : Bool, mutable : Bool) : Image {
        final scaleX : Float = scaleNominatorX / scaleDenominatorX;
        final scaleY : Float = scaleNominatorY / scaleDenominatorY;
        return this.createImage(imageCache, originalImage, scaleX, scaleY, cached);
    }

    // throws Exception
    public function createImage(imageCache : ImageCache, originalImage : Image, scaleX : Float, scaleY : Float, cached : Bool) : Image {
        return this.createImageInternal(originalImage, scaleX, scaleY);
    }

    // throws Exception
    public function createImageInternal(originalImage : Image, scaleX : Float, scaleY : Float) : Image {
        final image : Image = ImageCreationUtil.getInstance().createImageWH(Std.int((originalImage.getWidth() * scaleX)), Std.int((originalImage.getHeight() * scaleY)));
        if (image.isMutable()) {
            var originalPlayNImage : CoreImage = null;
            if (originalImage.isMutable()) {
                final originalHTMLImage : PlaynMutableImage = (cast originalImage : PlaynMutableImage);
                originalPlayNImage = (cast originalHTMLImage.getImage() : CoreImage);
            } else {
                final originalHTMLImage : PlaynImmutableImage = (cast originalImage : PlaynImmutableImage);
                originalPlayNImage = (cast originalHTMLImage.getImage() : CoreImage);
            }
            final htmlImage : PlaynMutableImage = (cast image : PlaynMutableImage);
            final canvasImage : ImageImpl = (cast htmlImage.getImage() : ImageImpl);
            final canvas : Canvas = this.playnUtil.getCanvas(canvasImage);
            canvas.drawScale(originalPlayNImage, 0, 0, image.getWidth(), image.getHeight(), 0, 0, originalImage.getWidth(), originalImage.getHeight());
            return image;
        } else {
            throw new haxe.Exception("Not Mutable");
        }
    }

}

