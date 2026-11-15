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
import android.graphics.Color;
import android.graphics.Matrix;
import android.graphics.Paint;
//import javax.microedition.lcdui.Image;
import org.microemu.android.device.AndroidImageInterface;

class AndroidImageUtil {
    private static final instance : AndroidImageUtil = new AndroidImageUtil();
    public static function getInstance() : AndroidImageUtil {
        return AndroidImageUtil.instance;
    }

    public function paintBitmap(bitmap : Bitmap, originalBitmap : Bitmap, paint : Paint) : Void {
        bitmap.eraseColor(Color.TRANSPARENT);
        final canvas : Canvas = new android.graphics.Canvas();
        canvas.setBitmap(bitmap);
        canvas.drawBitmap(originalBitmap, 0.0, 0.0, paint);
    }

    public function paint(image : Image, originalImage : Image, paint : Paint) : Void {
        final androidImage : AndroidImageInterface = (cast image : AndroidImageInterface);
        androidImage.getBitmap().eraseColor(Color.TRANSPARENT);
        final canvas : Canvas = androidImage.getCanvas();
        final originalAndroidImage : AndroidImageInterface = (cast originalImage : AndroidImageInterface);
        canvas.drawBitmap(originalAndroidImage.getBitmap(), 0.0, 0.0, paint);
    }

    public function rotate(image : Image, originalImage : Image, matrix : Matrix, paint : Paint) : Void {
        final androidImage : AndroidImageInterface = (cast image : AndroidImageInterface);
        androidImage.getBitmap().eraseColor(Color.TRANSPARENT);
        final canvas : Canvas = androidImage.getCanvas();
        canvas.concat(matrix);
        final originalAndroidImage : AndroidImageInterface = (cast originalImage : AndroidImageInterface);
        canvas.drawBitmap(originalAndroidImage.getBitmap(), 0.0, 0.0, paint);
    }

    public function new() {
    }
}

