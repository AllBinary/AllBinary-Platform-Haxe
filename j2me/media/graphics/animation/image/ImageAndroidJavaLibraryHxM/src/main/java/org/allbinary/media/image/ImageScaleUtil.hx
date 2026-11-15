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

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Matrix;
//import javax.microedition.lcdui.Image;
//import javax.microedition.lcdui.NullImage;
import org.allbinary.graphics.Anchor;
import org.allbinary.image.ImageCache;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.microemu.android.device.AndroidImageInterface;

class ImageScaleUtil {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : ImageScaleUtil = new ImageScaleUtil();
    public static function getInstance() : ImageScaleUtil {
        return ImageScaleUtil.instance;
    }

    public function new() {
    }

    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    private var anchor : Int = Anchor.TOP_LEFT;
    private final imageBasicArrayList : BasicArrayList = new BasicArrayListD();
    private final scaledImageBasicArrayList : BasicArrayList = new BasicArrayListD();
    private final scaleXBasicArrayList : BasicArrayList = new BasicArrayListD();
    private final scaleYBasicArrayList : BasicArrayList = new BasicArrayListD();
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
        final originalAndroidImage : AndroidImageInterface = (cast originalImage : AndroidImageInterface);
        final originalBitmap : Bitmap = originalAndroidImage.getBitmap();
        final width : Int = Std.int((originalBitmap.getWidth() * scaleX));
        final height : Int = Std.int((originalBitmap.getHeight() * scaleY));
        final index : Int = this.imageBasicArrayList.indexOf(originalImage);
        var alreadyAvailable : Bool = false;
        if (index >= 0) {
            final scaleX2Float : Null<Float> = (cast this.scaleXBasicArrayList.get(index) : Null<Float>);
            final scaleX2 : Float = scaleX2Float;
            final scaleY2Float : Null<Float> = (cast this.scaleYBasicArrayList.get(index) : Null<Float>);
            final scaleY2 : Float = scaleY2Float;
            if (scaleX2 == scaleX && scaleY2 == scaleY) {
                alreadyAvailable = true;
            }
        }
        if (alreadyAvailable) {
            return (cast this.scaledImageBasicArrayList.get(index) : Image);
        } else {
            final scaledImage : Image = this.getScaledImage(imageCache, originalImage, scaleX, scaleY, width, height, cached);
            this.imageBasicArrayList.add(originalImage);
            this.scaledImageBasicArrayList.add(scaledImage);
            this.scaleXBasicArrayList.add(scaleX);
            this.scaleYBasicArrayList.add(scaleY);
            return scaledImage;
        }
    }

    // throws Exception
    private function getScaledImage(imageCache : ImageCache, originalImage : Image, scaleX : Float, scaleY : Float, width : Int, height : Int, cached : Bool) : Image {
        var image : Image = NullImage.NULL_IMAGE;
        if (cached) {
            image = imageCache.get(Type.getClassName(Type.getClass(this)), width, height);
        } else {
            image = imageCache.get(this.commonStrings.CREATE_IMAGE, width, height);
        }
        if (image.isMutable()) {
            final matrix : Matrix = new Matrix();
            this.scale(image, matrix, scaleX, scaleY);
            image.getGraphics().drawImage(originalImage, 0, 0, this.anchor);
            return image;
        } else {
            throw new haxe.Exception("Not Mutable");
        }
    }

    private function scale(image : Image, matrix : Matrix, scaleX : Float, scaleY : Float) : Void {
        matrix.setScale(scaleX, scaleY);
        final canvas : Canvas = ((cast image : AndroidImageInterface)).getCanvas();
        canvas.concat(matrix);
    }

}

