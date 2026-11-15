/*
 *
 * AllBinary Open License Version 1
 * Copyright (c) 2011 AllBinary
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
package org.allbinary.image;

//import javax.microedition.khronos.opengles.GL;
//import javax.microedition.lcdui.Graphics;
//import javax.microedition.lcdui.Image;

class PreResourceImageUtil {
    private static final instance : PreResourceImageUtil = new PreResourceImageUtil();
    public static function getInstance() : PreResourceImageUtil {
        return PreResourceImageUtil.instance;
    }

    public function encapsulate(image : Image) : Image {
        return image;
    }

    public function updateGL(gl : GL, image : Image) : Void {
    }

    public function update(graphics : Graphics, image : Image) : Void {
    }

    public function new() {
    }
}

