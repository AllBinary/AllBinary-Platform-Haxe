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

//import javax.microedition.khronos.opengles.GL10;

class ModifierOpenGLESImageProcessor extends OpenGLESImageProcessor {
    private static final instanceC : ModifierOpenGLESImageProcessor = new ModifierOpenGLESImageProcessor();
    public static function getInstance() : ModifierOpenGLESImageProcessor {
        return ModifierOpenGLESImageProcessor.instanceC;
    }

    public override function colorMask(gl : GL10, red : Float, green : Float, blue : Float, alpha : Float) : Void {
        gl.glColor4f(red, green, blue, alpha);
    }

    public function new() {
        super();
    }
}

