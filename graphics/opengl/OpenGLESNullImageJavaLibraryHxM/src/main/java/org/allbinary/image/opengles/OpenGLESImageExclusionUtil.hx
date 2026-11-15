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
package org.allbinary.image.opengles;

//import javax.microedition.lcdui.Image;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class OpenGLESImageExclusionUtil {
    private static final instance : OpenGLESImageExclusionUtil = new OpenGLESImageExclusionUtil();
    public static function getInstance() : OpenGLESImageExclusionUtil {
        return OpenGLESImageExclusionUtil.instance;
    }

    public final list : BasicArrayList = new BasicArrayListD();
    public function isCustomScaling(image : Image) : Bool {
        return false;
    }

    public function new() {
    }
}

