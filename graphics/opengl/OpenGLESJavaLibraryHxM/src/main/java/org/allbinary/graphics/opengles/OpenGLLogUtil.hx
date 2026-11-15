// Generated Code Do Not Modify
package org.allbinary.graphics.opengles;

//import javax.microedition.khronos.opengles.GL10;
//import javax.microedition.lcdui.Image;
import org.allbinary.image.opengles.OpenGLStrings;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.communication.log.ForcedLogUtil;
import org.allbinary.logic.communication.log.PreLogUtil;

class OpenGLLogUtil {
    private static final instance : OpenGLLogUtil = new OpenGLLogUtil();
    public static function getInstance() : OpenGLLogUtil {
        return OpenGLLogUtil.instance;
    }

    private final MAX_TEXTURE : String = " Max Texture Size: ";
    public function logError(gl : GL10) : Void {
        final error : Int = gl.glGetError();
        if (error != GL10.GL_NO_ERROR) {
            final stringBuffer : StringMaker = new StringMaker();
            stringBuffer.append(OpenGLStrings.getInstance().GL_ERROR_LABEL);
            stringBuffer.appendint(error);
            if (error == 1281) {
                stringBuffer.append(this.MAX_TEXTURE);
                final maxTextureSize : haxe.ds.Vector<Int> = haxe.ds.Vector.fromArrayCopy([for (index in 0...1) 0]);
                gl.glGetIntegerv(GL10.GL_MAX_TEXTURE_SIZE, maxTextureSize, 0);
                stringBuffer.appendint(maxTextureSize[0]);
            }
            if (error == 1280) {
                PreLogUtil.put(stringBuffer.toString(), this, OpenGLStrings.getInstance().SET);
            } else {
                ForcedLogUtil.log(stringBuffer.toString(), this);
            }
        }
    }

    private final LOG_ERROR : String = "logError";
    private final IMAGE : String = " Image: ";
    public function logError(gl : GL10, image : Image) : Void {
        final error : Int = gl.glGetError();
        if (error != GL10.GL_NO_ERROR) {
            final stringBuffer : StringMaker = new StringMaker();
            stringBuffer.append(OpenGLStrings.getInstance().GL_ERROR_LABEL);
            stringBuffer.appendint(error);
            if (error == 1281) {
                stringBuffer.append(this.MAX_TEXTURE);
                final maxTextureSize : haxe.ds.Vector<Int> = haxe.ds.Vector.fromArrayCopy([for (index in 0...1) 0]);
                gl.glGetIntegerv(GL10.GL_MAX_TEXTURE_SIZE, maxTextureSize, 0);
                stringBuffer.appendint(maxTextureSize[0]);
            }
            stringBuffer.append(this.IMAGE);
            stringBuffer.append(image.toString());
            PreLogUtil.put(stringBuffer.toString(), this, this.LOG_ERROR);
        }
    }

    public function new() {
    }
}

