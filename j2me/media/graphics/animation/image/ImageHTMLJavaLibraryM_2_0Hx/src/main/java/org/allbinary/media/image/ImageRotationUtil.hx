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
import playn.core.Canvas;
import playn.core.CoreImage;
import playn.core.ImageImpl;
import playn.html.HTMLPlaynUtil;

class ImageRotationUtil {
    private static final instance : ImageRotationUtil = new ImageRotationUtil();
    public static function getInstance() : ImageRotationUtil {
        return ImageRotationUtil.instance;
    }

    private final playnUtil : HTMLPlaynUtil = HTMLPlaynUtil.getInstance();
    public function new() {
    }

    public function rotateImage(originalImage : Image, image : Image, totalAngle : Int) : Image {
        if (image.isMutable()) {
            final htmlImage : PlaynMutableImage = (cast image : PlaynMutableImage);
            final canvasImage : ImageImpl = (cast htmlImage.getImage() : ImageImpl);
            final canvas : Canvas = this.playnUtil.getCanvas(canvasImage);
            canvas.save();
            canvas.clear();
            canvas.translate(originalImage.getWidth() / 2, originalImage.getHeight() / 2);
            final image2 : Image = this.rotateImageCanvasSurface(originalImage, image, canvas, totalAngle);
            this.drawImage(originalImage, image, canvas);
            canvas.restore();
            return image2;
        } else {
            return null;
        }
    }

    public function rotateImageCanvasSurfaceClear(originalImage : Image, image : Image, canvasSurface : Canvas, totalAngle : Int) : Image {
        if (image.isMutable()) {
            canvasSurface.translate(-originalImage.getWidth() / 2, -originalImage.getHeight() / 2);
            canvasSurface.clear();
            canvasSurface.translate(originalImage.getWidth() / 2, originalImage.getHeight() / 2);
            return this.rotateImageCanvasSurface(originalImage, image, canvasSurface, totalAngle);
        } else {
            return null;
        }
    }

    public function rotateImageCanvasSurface(originalImage : Image, image : Image, canvasSurface : Canvas, totalAngle : Int) : Image {
        if (image.isMutable()) {
            canvasSurface.rotate(((totalAngle) * Math.PI / 180));
            return image;
        } else {
            return null;
        }
    }

    public function drawImage(originalImage : Image, image : Image, canvasSurface : Canvas) : Void {
        var originalPlayNImage : CoreImage = null;
        if (originalImage.isMutable()) {
            final originalHTMLImage : PlaynMutableImage = (cast originalImage : PlaynMutableImage);
            originalPlayNImage = (cast originalHTMLImage.getImage() : CoreImage);
        } else {
            final originalHTMLImage : PlaynImmutableImage = (cast originalImage : PlaynImmutableImage);
            originalPlayNImage = (cast originalHTMLImage.getImage() : CoreImage);
        }
        canvasSurface.draw(originalPlayNImage, -originalImage.getWidth() / 2, -originalImage.getHeight() / 2);
    }

    // throws Exception
    public function createRotatedImage(originalImage : Image, rotationInDegrees : Int) : Image {
        final image : Image = ImageCreationUtil.getInstance().createImageWH(originalImage.getWidth(), originalImage.getHeight());
        final rotatedImage : Image = this.rotateImage(originalImage, image, rotationInDegrees);
        if (rotatedImage == null) {
            throw new haxe.Exception("Not Mutable");
        }
        return rotatedImage;
    }

}

