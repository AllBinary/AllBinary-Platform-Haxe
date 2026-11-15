// Generated Code Do Not Modify
package org.allbinary.graphics;

import android.graphics.Bitmap;
import org.allbinary.platform.graphics.PlatformBitmapBase;

class OpenGLBitmap extends PlatformBitmapBase {
    public final bitmap : Bitmap;
    public function new(bitmap : Any) {
        super();
        this.bitmap = (cast bitmap : Bitmap);
    }

    public function getPixels(pixels : haxe.ds.Vector<Int>, offset : Int, stride : Int, x : Int, y : Int, width : Int, height : Int) : Void {
        this.bitmap.getPixels(pixels, offset, stride, x, y, width, height);
    }

    public function setPixels(pixels : haxe.ds.Vector<Int>, offset : Int, stride : Int, x : Int, y : Int, width : Int, height : Int) : Void {
        this.bitmap.setPixels(pixels, offset, stride, x, y, width, height);
    }

    public override function getWidth() : Int {
        return this.bitmap.getWidth();
    }

    public override function getHeight() : Int {
        return this.bitmap.getHeight();
    }

    public function recycle() : Void {
        this.bitmap.recycle();
    }

}

