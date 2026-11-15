// Generated Code Do Not Modify
package org.allbinary.graphics;

//import java.io.InputStream;
//import javax.microedition.lcdui.Image;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
//import java.io.IOException;
import org.allbinary.platform.graphics.PlatformBitmapBaseFactory;
import org.allbinary.platform.graphics.PlatformBitmapBase;
import org.microemu.android.device.AndroidImageInterface;

class OpenGLBitmapFactory extends PlatformBitmapBaseFactory {
    private static final instance : OpenGLBitmapFactory = new OpenGLBitmapFactory();
    public static function getInstance() : OpenGLBitmapFactory {
        return OpenGLBitmapFactory.instance;
    }

    // Java inner class: Haxe does not nest classes so move this to its own module
    class Config {
        public final bitmapConfig : Bitmap.Config;
        public function new(bitmapConfig : Bitmap.Config) {
            this.bitmapConfig = bitmapConfig;
        }

    }
    public final ARGB_8888 : Config = new Config(Bitmap.Config.ARGB_8888);
    public function createBitmap(width : Int, height : Int, config : OpenGLBitmapFactory.Config) : OpenGLBitmap {
        return new OpenGLBitmap(Bitmap.createBitmap(width, height, config.bitmapConfig));
    }

    // throws IOException
    public function decodeStream(inputStream : InputStream) : OpenGLBitmap {
        return new OpenGLBitmap(BitmapFactory.decodeStream(inputStream));
    }

    public override function createBitmap(image : Image) : PlatformBitmapBase {
        return new OpenGLBitmap(((cast image : AndroidImageInterface)).getBitmap());
    }

    public function new() {
        super();
    }
}

