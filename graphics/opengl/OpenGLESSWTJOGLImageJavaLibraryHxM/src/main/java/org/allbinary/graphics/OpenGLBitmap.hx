// Generated Code Do Not Modify
package org.allbinary.graphics;

//import javax.microedition.lcdui.Image;
import org.allbinary.DisposalUtil;
import org.allbinary.platform.graphics.PlatformBitmapBase;
import org.microemu.device.swt.SwtImmutableImage;
import org.microemu.device.swt.SwtMutableImage;

class OpenGLBitmap extends PlatformBitmapBase {
    public final image : Image;
    public function new(bitmap : Any) {
        super();
        this.image = (cast bitmap : Image);
    }

    public function getImage() : Image {
        return this.image;
    }

    public function getDepth() : Int {
        if (this.image.isMutable()) {
            final mutableImage : SwtMutableImage = (cast this.image : SwtMutableImage);
            return mutableImage.getDepth();
        } else {
            final immutableImage : SwtImmutableImage = (cast this.image : SwtImmutableImage);
            return immutableImage.getDepth();
        }
    }

    public function getPixels(pixels : haxe.ds.Vector<Int>, offset : Int, stride : Int, x : Int, y : Int, width : Int, height : Int) : Void {
        if (this.image.isMutable()) {
            final mutableImage : SwtMutableImage = (cast this.image : SwtMutableImage);
            mutableImage.getRGB(pixels, offset, stride, x, y, width, height);
        } else {
            final immutableImage : SwtImmutableImage = (cast this.image : SwtImmutableImage);
            immutableImage.getRGB(pixels, offset, stride, x, y, width, height);
        }
    }

    public function setPixels(pixels : haxe.ds.Vector<Int>, offset : Int, stride : Int, x : Int, y : Int, width : Int, height : Int) : Void {
        this.image.setRGB2(pixels, offset, height, x, y, width, height);
    }

    public override function getWidth() : Int {
        return this.image.getWidth();
    }

    public override function getHeight() : Int {
        return this.image.getHeight();
    }

    public function recycle() : Void {
        DisposalUtil.getInstance().disposeImage(this.image);
    }

}

