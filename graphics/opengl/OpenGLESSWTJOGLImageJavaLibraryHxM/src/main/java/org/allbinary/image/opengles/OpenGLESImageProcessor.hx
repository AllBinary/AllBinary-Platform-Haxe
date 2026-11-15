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

class OpenGLESImageProcessor {
    private static final instance : OpenGLESImageProcessor = new OpenGLESImageProcessor();
    public static function getInstance() : OpenGLESImageProcessor {
        return OpenGLESImageProcessor.instance;
    }

    public function translate(gl : GL10, translateX : Float, translateY : Float) : Void {
        gl.glTranslatef(translateX, translateY, 0);
    }

    public function rotate(gl : GL10, angle : Float) : Void {
        gl.glRotatef(-angle, 0, 0, 1);
    }

    public function scale(gl : GL10, scaleX : Float, scaleY : Float) : Void {
        gl.glScalef(scaleX, scaleY, 1);
    }

    public function colorMask(gl : GL10, red : Float, green : Float, blue : Float, alpha : Float) : Void {
    }

    public function new() {
    }
}

