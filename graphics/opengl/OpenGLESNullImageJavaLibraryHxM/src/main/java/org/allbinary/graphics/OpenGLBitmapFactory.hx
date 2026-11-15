// Generated Code Do Not Modify
package org.allbinary.graphics;

import jre.io.IOException;
import jre.io.InputStream;
import javax.microedition.lcdui.Image;
import org.allbinary.logic.NullUtil;
import org.allbinary.platform.graphics.PlatformBitmapBase;
import org.allbinary.platform.graphics.PlatformBitmapBaseFactory;

class OpenGLBitmapFactory extends PlatformBitmapBaseFactory {
    private static final instance : OpenGLBitmapFactory = new OpenGLBitmapFactory();
    public static function getInstance() : OpenGLBitmapFactory {
        return OpenGLBitmapFactory.instance;
    }

    public final ARGB_8888 : OpenGLBitmapConfig = new OpenGLBitmapConfig(NullUtil.getInstance().NULL_OBJECT);
    public override function createBitmap(...args : Dynamic) : Dynamic {
        if (args.length == 3) {
            return this.createBitmap_int_int_OpenGLBitmapConfig(args[0], args[1], args[2]);
        }
        if (args.length == 1) {
            return this.createBitmap_Image(args[0]);
        }
        throw new jre.lang.IllegalArgumentException("No matching overload: createBitmap");
    }

    public function createBitmap_int_int_OpenGLBitmapConfig(width : Int, height : Int, config : OpenGLBitmapConfig) : OpenGLBitmap {
        return new OpenGLBitmap(NullUtil.getInstance().NULL_OBJECT);
    }

    // throws IOException
    public function decodeStream(inputStream : InputStream) : OpenGLBitmap {
        return new OpenGLBitmap(NullUtil.getInstance().NULL_OBJECT);
    }

    public override function createBitmap_Image(image : Image) : PlatformBitmapBase {
        return new OpenGLBitmap(NullUtil.getInstance().NULL_OBJECT);
    }

    public function new() {
        super();
    }
}

