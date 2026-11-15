// Generated Code Do Not Modify
package org.platform.opengl;

//import javax.microedition.khronos.opengles.GL10;
//import javax.microedition.lcdui.Image;
import org.allbinary.platform.opengles.PlatformTextureBaseFactory;

class OpenGLTextureFactory extends PlatformTextureBaseFactory {
    private static final instance : OpenGLTextureFactory = new OpenGLTextureFactory();
    public static function getInstance() : OpenGLTextureFactory {
        return OpenGLTextureFactory.instance;
    }

    private final gluUtils : OpenGLGLUUtils = OpenGLGLUUtils.getInstance();
    public function new() {
        super();
    }

    public override function load(gl : GL10, target : Int, level : Int, image : Image, border : Int, flip : Bool) : Void {
        throw new haxe.Exception();
    }

}

