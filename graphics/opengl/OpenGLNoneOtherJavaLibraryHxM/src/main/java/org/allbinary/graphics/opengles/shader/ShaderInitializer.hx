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
package org.allbinary.graphics.opengles.shader;

import javax.microedition.khronos.opengles.GL10;
import org.allbinary.string.CommonStrings;

class ShaderInitializer {
    private static final instance : ShaderInitializer = new ShaderInitializer();
    public static function getInstance() : ShaderInitializer {
        return ShaderInitializer.instance;
    }

    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    public function init(gl : GL10, shader : haxe.ds.Vector<Shader>, attributeArray : haxe.ds.Vector<String>) : Int {
        return -1;
    }

    public function new() {
    }
}

