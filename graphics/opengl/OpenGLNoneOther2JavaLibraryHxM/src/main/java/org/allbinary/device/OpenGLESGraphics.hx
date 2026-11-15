// Generated Code Do Not Modify
package org.allbinary.device;

//import javax.microedition.khronos.opengles.GL;
//import javax.microedition.khronos.opengles.GL10;
//import javax.microedition.lcdui.Font;
//import javax.microedition.lcdui.Graphics;
import org.allbinary.graphics.font.FontDebugBase;
import org.allbinary.image.opengles.OpenGLSurfaceChangedInterface;
import org.allbinary.string.CommonStrings;

class OpenGLESGraphics extends Graphics implements OpenGLSurfaceChangedInterface implements GraphicsInterface {
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    public var gl : GL10 = NullGL10.NULL_GL10;
    public function new() {
        super();
    }

    public function updateGL(gl : GL) : Void {
    }

    public override function set(gl : GL) : Void {
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

    public function getGl10() : GL10 {
        return this.gl;
    }

    public override function setFontDebug(font : Font, fontDebug : FontDebugBase) : Void {
        throw new haxe.Exception();
    }

}

