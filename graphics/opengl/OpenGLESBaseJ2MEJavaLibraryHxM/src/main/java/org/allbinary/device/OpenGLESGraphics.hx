// Generated Code Do Not Modify
package org.allbinary.device;

//import javax.microedition.khronos.opengles.GL;
//import javax.microedition.khronos.opengles.GL10;
//import javax.microedition.lcdui.Font;
import org.allbinary.graphics.font.FontDebugBase;
import org.allbinary.image.opengles.OpenGLSurfaceChangedInterface;
import org.allbinary.string.CommonStrings;

class OpenGLESGraphics implements OpenGLSurfaceChangedInterface implements GraphicsInterface {
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    public var gl : GL10 = NullGL10.NULL_GL10;
    public function new() {
    }

    public function updateGL(gl : GL) : Void {
    }

    public function set(gl : GL) : Void {
    }

    // throws Exception
    public function init() : Void {
    }

    // throws Exception
    public function update() : Void {
    }

    public function setOrthoginalMode() : Void {
    }

    public function setCameraMode() : Void {
    }

    public function getGlP() : GL10 {
        return this.gl;
    }

    public function setFontDebug(font : Font, fontDebug : FontDebugBase) : Void {
        throw new haxe.Exception();
    }

}

