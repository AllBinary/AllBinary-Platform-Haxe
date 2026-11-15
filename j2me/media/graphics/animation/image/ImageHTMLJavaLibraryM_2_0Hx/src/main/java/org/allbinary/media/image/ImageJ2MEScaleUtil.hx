/*
 *
 * AllBinary Open License Version 1
 * Copyright (c) 2023 AllBinary
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
import org.allbinary.logic.communication.log.LogUtil;
import org.microemu.device.playn.PlaynImmutableImage;
import org.microemu.device.playn.PlaynMutableImage;
import playn.core.Canvas;
import playn.core.CoreImage;
import playn.core.ImageImpl;
import playn.core.PlayN;
import playn.html.HtmlGraphics;
import playn.html.HtmlImage;

class ImageJ2MEScaleUtil {
    private static final instance : ImageJ2MEScaleUtil = new ImageJ2MEScaleUtil();
    public static function getInstance() : ImageJ2MEScaleUtil {
        return ImageJ2MEScaleUtil.instance;
    }

    public final logUtil : LogUtil = LogUtil.getInstance();
    public function new() {
    }

    // throws Exception
    public function scaleArray(images : haxe.ds.Vector<Image>, width : Int, height : Int) : haxe.ds.Vector<Image> {
        var scaledImages : haxe.ds.Vector<Image> = haxe.ds.Vector.fromArrayCopy([for (index in 0...images.length) null]);
        {
            var index : Int = images.length;
            while (--index >= 0) {
            scaledImages[index] = this.scale(images[index], width, height);
            }
        }
        return scaledImages;
    }

    // throws Exception
    public function scale(image : Image, width : Int, height : Int) : Image {
        var originalPlayNImage : CoreImage = null;
        if (image.isMutable()) {
            final originalHTMLImage : PlaynMutableImage = (cast image : PlaynMutableImage);
            originalPlayNImage = (cast originalHTMLImage.getImage() : CoreImage);
        } else {
            final originalHTMLImage : PlaynImmutableImage = (cast image : PlaynImmutableImage);
            originalPlayNImage = (cast originalHTMLImage.getImage() : CoreImage);
        }
        final scaledImage : Image = Image.createImageWH(width, height);
        final htmlImage : PlaynMutableImage = (cast scaledImage : PlaynMutableImage);
        final scaledPlayNImage : ImageImpl = (cast htmlImage.getImage() : ImageImpl);
        final canvas : Canvas = ((cast PlayN.getInstance().graphics() : HtmlGraphics)).get((cast scaledPlayNImage : HtmlImage));
        ((cast originalPlayNImage : ImageImpl)).draw(canvas.gc(), 0, 0, scaledImage.getWidth(), scaledImage.getHeight(), 0, 0, image.getWidth(), image.getHeight());
        return scaledImage;
    }

}

