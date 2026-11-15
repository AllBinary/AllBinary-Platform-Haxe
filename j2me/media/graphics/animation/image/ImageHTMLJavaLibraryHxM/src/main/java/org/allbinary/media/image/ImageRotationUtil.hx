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
import org.microemu.device.playn.PlaynImmutableImage;
import org.microemu.device.playn.PlaynMutableImage;
import playn.core.CanvasImage;
import playn.core.CanvasSurface;

class ImageRotationUtil {
    private static final instance : ImageRotationUtil = new ImageRotationUtil();
    public static function getInstance() : ImageRotationUtil {
        return ImageRotationUtil.instance;
    }

    public function new() {
    }

    // throws Exception
    public function createRotatedImage(originalImage : Image, rotationInDegrees : Int) : Image {
        final image : Image = ImageCreationUtil.getInstance().getInstance(originalImage.getWidth(), originalImage.getHeight());
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
            canvasSurface.translate(originalPlayNImage.width() / 2, originalPlayNImage.height() / 2);
            canvasSurface.rotate(((rotationInDegrees) * Math.PI / 180));
            canvasSurface.drawImage(originalPlayNImage, -originalPlayNImage.width() / 2, -originalPlayNImage.height() / 2);
            return image;
        } else {
            throw new haxe.Exception("Not Mutable");
        }
    }

}

