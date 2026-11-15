/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2025 AllBinary 
 *  
 * By agreeing to this license you and any business entity you represent are 
 * legally bound to the AllBinary Open License Version 1 legal agreement. 
 *  
 * You may obtain the AllBinary Open License Version 1 legal agreement from 
 * AllBinary or the root directory of AllBinary's AllBinary Platform repository. 
 *  
 * Created By: Travis Berthelot 
 *   
 */
// Generated Code Do Not Modify
package org.allbinary.image.opengles;

import jre.io.IOException;
import jre.io.InputStream;
import org.allbinary.graphics.OpenGLBitmap;
import org.allbinary.graphics.color.BasicColor;

class OpenGLImageUtilBase {
    public function paint(...args : Dynamic) : Dynamic {
        if (args.length == 3) {
            return this.paint_OpenGLBitmap_OpenGLBitmap_int(args[0], args[1], args[2]);
        }
        if (args.length == 4) {
            return this.paint_OpenGLBitmap_OpenGLBitmap_int_BasicColor(args[0], args[1], args[2], args[3]);
        }
        throw new jre.lang.IllegalArgumentException("No matching overload: paint");
    }

    public function paint_OpenGLBitmap_OpenGLBitmap_int(alphaBitmap : OpenGLBitmap, originalBitmap : OpenGLBitmap, index : Int) : OpenGLBitmap {
        throw new jre.lang.JavaException();
    }

    public function paint_OpenGLBitmap_OpenGLBitmap_int_BasicColor(colorBitmap : OpenGLBitmap, originalBitmap : OpenGLBitmap, alpha : Int, basicColor : BasicColor) : OpenGLBitmap {
        throw new jre.lang.JavaException();
    }

    // throws IOException
    public function createImage(name : String) : OpenGLBitmap {
        throw new jre.lang.JavaException();
    }

    // throws IOException
    public function createImageFromInputStream(inputStream : InputStream) : OpenGLBitmap {
        throw new jre.lang.JavaException();
    }

    public function new() {
    }
}

