// Generated Code Do Not Modify
package org.allbinary.graphics.opengles.shader;

import javax.microedition.khronos.opengles.GL10;
import org.allbinary.string.CommonStrings;

class OpenGLObject3dProcessor {
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    public function process(...args : Dynamic) : Dynamic {
        if (args.length == 2) {
            this.process_GL10_Any(args[0], args[1]);
            return null;
        }
        if (args.length == 3) {
            this.process_GL10_Any_int(args[0], args[1], args[2]);
            return null;
        }
        throw new jre.lang.IllegalArgumentException("No matching overload: process");
    }

    public function process_GL10_Any(gl : GL10, object3d : Any) : Void {
    }

    public function process_GL10_Any_int(gl : GL10, object3d : Any, index : Int) : Void {
    }

    public function new() {
    }
}

