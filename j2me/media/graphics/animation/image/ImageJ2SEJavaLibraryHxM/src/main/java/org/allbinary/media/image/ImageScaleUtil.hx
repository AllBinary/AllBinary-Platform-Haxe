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

//import java.awt.Graphics2D;
//import java.awt.geom.AffineTransform;
//import java.awt.image.BufferedImage;
//import javax.microedition.lcdui.Image;
import org.allbinary.image.ImageCache;

class ImageScaleUtil {
    private static final instance : ImageScaleUtil = new ImageScaleUtil();
    public static function getInstance() : ImageScaleUtil {
        return ImageScaleUtil.instance;
    }

    private final imageUtil : ImageUtil = ImageUtil.getInstance();
    private final imageJ2SEUtil : ImageJ2SEUtil = ImageJ2SEUtil.getInstance();
    private final imageCreationUtil : ImageCreationUtil = ImageCreationUtil.getInstance();
    public function new() {
    }

    // throws Exception
    public function createImage2(imageCache : ImageCache, originalImage : Image, scaleNominatorX : Float, scaleDenominatorX : Float, scaleNominatorY : Float, scaleDenominatorY : Float, cached : Bool) : Image {
        return this.createImage3(imageCache, originalImage, scaleNominatorX, scaleDenominatorX, scaleNominatorY, scaleDenominatorY, cached, true);
    }

    // throws Exception
    public function createImage3(imageCache : ImageCache, originalImage : Image, scaleNominatorX : Float, scaleDenominatorX : Float, scaleNominatorY : Float, scaleDenominatorY : Float, cached : Bool, mutable : Bool) : Image {
        final width : Int = originalImage.getWidth();
        final height : Int = originalImage.getHeight();
        final scaleX : Float = scaleNominatorX / scaleDenominatorX;
        final scaleY : Float = scaleNominatorY / scaleDenominatorY;
        var image : Image = null;
        if (cached) {
            image = imageCache.get(Type.getClassName(Type.getClass(this)), Std.int((width * scaleX)), Std.int((height * scaleY)));
        } else {
            image = imageCache.get("createImage", Std.int((width * scaleX)), Std.int((height * scaleY)));
        }
        this.scale(originalImage, image, scaleX, scaleY, true);
        return image;
    }

    // throws Exception
    public function scale2(originalImage : Image, originalImageArray : haxe.ds.Vector<Image>, ximageToShowArray : haxe.ds.Vector<Image>, unused : Int, scaleX : Float, scaleY : Float, maxScaleX : Float, maxScaleY : Float) : Void {
        if (maxScaleX * originalImage.getWidth() > originalImageArray[0].getWidth() || maxScaleY * originalImage.getHeight() > originalImageArray[0].getHeight()) {
            originalImageArray[0] = this.imageCreationUtil.createImage(originalImage.getWidth(), originalImage.getHeight(), maxScaleX, maxScaleY);
        }
        this.scale(originalImage, originalImageArray[0], scaleX, scaleY, false);
    }

    public function scale(originalImage : Image, newMaxSizeImage : Image, scaleX : Float, scaleY : Float, clear : Bool) : Void {
        final bufferedImage : BufferedImage = this.imageUtil.getBufferedImage(originalImage);
        final newBufferedImage : BufferedImage = this.imageUtil.getBufferedImage(newMaxSizeImage);
        final at : AffineTransform = AffineTransform.getScaleInstance(scaleX, scaleY);
        final g : Graphics2D = newBufferedImage.createGraphics();
        if (clear) {
            g.setBackground(this.imageJ2SEUtil.TRANSPARENT_COLOR);
            g.clearRect(0, 0, newBufferedImage.getWidth(), newBufferedImage.getHeight());
        }
        g.drawRenderedImage(bufferedImage, at);
        g.dispose();
    }

}

