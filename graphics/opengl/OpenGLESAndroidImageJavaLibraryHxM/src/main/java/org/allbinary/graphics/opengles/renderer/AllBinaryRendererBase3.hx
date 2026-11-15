/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2022 AllBinary 
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
package org.allbinary.graphics.opengles.renderer;

//import javax.microedition.khronos.opengles.GL10;
//import javax.microedition.lcdui.Image;
import org.allbinary.image.opengles.OpenGLESImage;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class AllBinaryRendererBase3 {
    public final list : BasicArrayList = new BasicArrayListD();
    // throws Exception
    public function update(gl : GL10) : Void {
        while (this.list.size() > 0) {
            final openGLESImage : OpenGLESImage = (cast this.list.removeAt(0) : OpenGLESImage);
            if (openGLESImage != null) {
                openGLESImage.set(gl);
            }
        }
    }

    public function add(image : Image) : Void {
        this.list.add(image);
    }

    public function new() {
    }
}

