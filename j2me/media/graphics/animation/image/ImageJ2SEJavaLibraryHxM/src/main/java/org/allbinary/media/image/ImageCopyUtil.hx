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

//import java.awt.image.BufferedImage;
//import javax.microedition.lcdui.Image;
import org.allbinary.graphics.Anchor;
import org.allbinary.logic.communication.log.LogUtil;
import org.microemu.device.j2se.J2SEImmutableImage;

class ImageCopyUtil {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : ImageCopyUtil = new ImageCopyUtil();
    public static function getInstance() : ImageCopyUtil {
        return ImageCopyUtil.instance;
    }

    private final imageUtil : ImageUtil = ImageUtil.getInstance();
    private final imageCreationUtil : ImageCreationUtil = ImageCreationUtil.getInstance();
    public function new() {
    }

    private var anchor : Int = Anchor.TOP_LEFT;
    // throws Exception
    public function createImageForRotation(originalImage : Image) : Image {
        return this.createImage(originalImage);
    }

    // throws Exception
    public function createImage(originalImage : Image) : Image {
        final image : Image = this.imageCreationUtil.createImageWH(originalImage.getWidth(), originalImage.getHeight());
        if (image.isMutable()) {
            image.getGraphics().drawImage(originalImage, 0, 0, this.anchor);
            return image;
        } else {
            throw new haxe.Exception("Not Mutable");
        }
    }

    // throws Exception
    public function createImageScale(originalImage : Image, canvasScale : Float, resize : Bool) : Image {
        var newWidth : Int = Std.int((originalImage.getWidth() * canvasScale));
        var newHeight : Int = Std.int((originalImage.getHeight() * canvasScale));
        if (resize) {
            if (newWidth < newHeight) {
                newWidth = newHeight;
            }
            if (newHeight < newWidth) {
                newHeight = newWidth;
            }
        }
        final originalBufferedImage : BufferedImage = this.imageUtil.getBufferedImage(originalImage);
        final bufferedImage : BufferedImage = this.imageUtil.createBufferedImageWithLargerCanvas(originalBufferedImage, newWidth, newHeight);
        final image : J2SEImmutableImage = new J2SEImmutableImage(bufferedImage);
        return image;
    }

}

