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

//import javax.microedition.lcdui.Graphics;
//import javax.microedition.lcdui.Image;
import org.allbinary.graphics.Anchor;
import org.allbinary.graphics.color.BasicColorFactory;
import org.allbinary.graphics.color.BasicColorSetUtil;
import org.allbinary.string.CommonStrings;
import org.allbinary.logic.communication.log.LogUtil;

class ImageCopyUtil {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : ImageCopyUtil = new ImageCopyUtil();
    public static function getInstance() : ImageCopyUtil {
        return ImageCopyUtil.instance;
    }

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
        final image : Image = this.imageCreationUtil.getInstance(originalImage.getWidth(), originalImage.getHeight());
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
        final image : Image = this.imageCreationUtil.getInstance(newWidth, newHeight);
        if (image.isMutable()) {
            final halfWidthDelta : Int = (newWidth - originalImage.getWidth()) / 2;
            final halfHeightDelta : Int = (newHeight - originalImage.getHeight()) / 2;
            final graphics : Graphics = image.getGraphics();
            graphics.drawImage(originalImage, halfWidthDelta, halfHeightDelta, this.anchor);
            return image;
        } else {
            throw new haxe.Exception("Not Mutable");
        }
    }

}

