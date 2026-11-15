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
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Matrix;
import org.microemu.android.device.AndroidImageInterface;

class ImageRotationUtil {
    private static final instance : ImageRotationUtil = new ImageRotationUtil();
    public static function getInstance() : ImageRotationUtil {
        return ImageRotationUtil.instance;
    }

    private final matrix : Matrix = new Matrix();
    public function new() {
    }

    private var anchor : Int = Anchor.TOP_LEFT;
    // throws Exception
    public function createRotatedImage(originalImage : Image, rotationInDegrees : Int) : Image {
        final image : Image = ImageCreationUtil.getInstance().createImageWH(originalImage.getWidth(), originalImage.getHeight());
        if (image.isMutable()) {
            final bitmap : Bitmap = ((cast image : AndroidImageInterface)).getBitmap();
            final width : Int = bitmap.getWidth();
            final height : Int = bitmap.getHeight();
            this.matrix.setRotate(rotationInDegrees, (width >> 1), (height >> 1));
            final canvas : Canvas = ((cast image : AndroidImageInterface)).getCanvas();
            canvas.concat(this.matrix);
            image.getGraphics().drawImage(originalImage, 0, 0, this.anchor);
            return image;
        } else {
            throw new haxe.Exception("Not Mutable");
        }
    }

}

