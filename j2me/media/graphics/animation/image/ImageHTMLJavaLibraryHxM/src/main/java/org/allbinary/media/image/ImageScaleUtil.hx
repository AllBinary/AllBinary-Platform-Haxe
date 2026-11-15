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
import org.allbinary.graphics.Anchor;
import org.allbinary.image.ImageCache;
import org.allbinary.logic.communication.log.PreLogUtil;
import org.microemu.device.playn.PlaynImmutableImage;
import org.microemu.device.playn.PlaynMutableImage;
import playn.core.CanvasImage;
import playn.core.CanvasSurface;

class ImageScaleUtil {
    private static final instance : ImageScaleUtil = new ImageScaleUtil();
    public static function getInstance() : ImageScaleUtil {
        return ImageScaleUtil.instance;
    }

    public function new() {
    }

    // throws Exception
    public function createImage2(imageCache : ImageCache, originalImage : Image, scaleNominatorX : Float, scaleDenominatorX : Float, scaleNominatorY : Float, scaleDenominatorY : Float, cached : Bool) : Image {
        return this.createImage3(imageCache, originalImage, scaleNominatorX, scaleDenominatorX, scaleNominatorY, scaleDenominatorY, cached, true);
    }

    // throws Exception
    public function createImage3(imageCache : ImageCache, originalImage : Image, scaleNominatorX : Float, scaleDenominatorX : Float, scaleNominatorY : Float, scaleDenominatorY : Float, cached : Bool, mutable : Bool) : Image {
        var scaleX : Float = scaleNominatorX / scaleDenominatorX;
        var scaleY : Float = scaleNominatorY / scaleDenominatorY;
        return this.createImage(imageCache, originalImage, scaleX, scaleY, cached);
    }

    // throws Exception
    public function createImage(imageCache : ImageCache, originalImage : Image, scaleX : Float, scaleY : Float, cached : Bool) : Image {
        return this.createImageInternal(originalImage, scaleX, scaleY);
    }

    // throws Exception
    public function createImageInternal(originalImage : Image, scaleX : Float, scaleY : Float) : Image {
        final image : Image = ImageCreationUtil.getInstance().getInstance(Std.int((originalImage.getWidth() * scaleX)), Std.int((originalImage.getHeight() * scaleY)));
        if (image.isMutable()) {
            var originalPlayNImage : playn.core.Image = null;
            if (originalImage.isMutable()) {
                final originalHTMLImage : PlaynMutableImage = (cast originalImage : PlaynMutableImage);
                originalPlayNImage = (cast originalHTMLImage.getImage() : playn.core.Image);
            } else {
                final originalHTMLImage : PlaynImmutableImage = (cast originalImage : PlaynImmutableImage);
                originalPlayNImage = (cast originalHTMLImage.getImage() : playn.core.Image);
            }
            final htmlImage : PlaynMutableImage = (cast image : PlaynMutableImage);
            final canvasImage : CanvasImage = (cast htmlImage.getImage() : CanvasImage);
            final canvasSurface : CanvasSurface = htmlImage.getCanvasSurface(canvasImage);
            canvasSurface.drawImage(originalPlayNImage, 0, 0, image.getWidth(), image.getHeight(), 0, 0, originalPlayNImage.width(), originalPlayNImage.height());
            return image;
        } else {
            throw new haxe.Exception("Not Mutable");
        }
    }

}

