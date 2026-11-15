// Generated Code Do Not Modify
package org.allbinary.graphics;

//import java.io.IOException;
//import java.io.InputStream;
//import javax.microedition.lcdui.Image;
import org.allbinary.logic.NullUtil;
import org.allbinary.platform.graphics.PlatformBitmapBase;
import org.allbinary.platform.graphics.PlatformBitmapBaseFactory;

class OpenGLBitmapFactory extends PlatformBitmapBaseFactory {
    private static final instance : OpenGLBitmapFactory = new OpenGLBitmapFactory();
    public static function getInstance() : OpenGLBitmapFactory {
        return OpenGLBitmapFactory.instance;
    }

    // Java inner class: Haxe does not nest classes so move this to its own module
    class Config {
        public final bitmapConfig : Any;
        public function new(bitmapConfig : Any) {
            this.bitmapConfig = bitmapConfig;
        }

    }
    public final ARGB_8888 : Config = new Config(NullUtil.getInstance().NULL_OBJECT);
    public function createBitmap(width : Int, height : Int, config : OpenGLBitmapFactory.Config) : OpenGLBitmap {
        return new OpenGLBitmap(NullUtil.getInstance().NULL_OBJECT);
    }

    // throws IOException
    public function decodeStream(inputStream : InputStream) : OpenGLBitmap {
        return new OpenGLBitmap(NullUtil.getInstance().NULL_OBJECT);
    }

    public override function createBitmap(image : Image) : PlatformBitmapBase {
        return new OpenGLBitmap(NullUtil.getInstance().NULL_OBJECT);
    }

    public function new() {
        super();
    }
}

