// Generated Code Do Not Modify
package org.platform.opengl;

//import java.nio.ByteBuffer;
//import javax.microedition.khronos.opengles.GL10;
import org.allbinary.graphics.OpenGLBitmap;
import org.allbinary.image.opengles.OpenGLESImage;

class OpenGLGLUUtils {
    private static final instance : OpenGLGLUUtils = new OpenGLGLUUtils();
    public static function getInstance() : OpenGLGLUUtils {
        return OpenGLGLUUtils.instance;
    }

    public function makeByteBuffer(bmp : OpenGLBitmap, flip : Bool) : ByteBuffer {
        throw new haxe.Exception();
    }

    public function texImage2D(gl : GL10, glVersion : String, target : Int, level : Int, generateMipMap : Bool, openGLESImage : OpenGLESImage, border : Int, flip : Bool) : Void {
        throw new haxe.Exception();
    }

    public function texImage2D(gl : GL10, glVersion : String, target : Int, level : Int, generateMipMap : Bool, bitmap : OpenGLBitmap, border : Int, flip : Bool) : Void {
        throw new haxe.Exception();
    }

    public function new() {
    }
}

