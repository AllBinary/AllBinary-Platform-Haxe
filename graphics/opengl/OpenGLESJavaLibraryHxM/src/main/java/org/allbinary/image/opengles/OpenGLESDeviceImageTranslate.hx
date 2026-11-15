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

//import javax.microedition.khronos.opengles.GL10;

class OpenGLESDeviceImageTranslate extends OpenGLESImageTranslate {
    public var translateX : Float = 0.0;
    public var translateY : Float = 0.0;
    public var translateX2 : Float = 0.0;
    public var translateY2 : Float = 0.0;
    public override function translate(gl : GL10, openGLESImage : OpenGLESImage, x : Float, y : Float) : Void {
        openGLESImage.imageProcessor.translate(gl, this.translateX + (openGLESImage.openGLESImageProperties.scaleX * x), this.translateY + (openGLESImage.openGLESImageProperties.scaleY * y));
    }

    public override function translate2(gl : GL10, openGLESImage : OpenGLESImage) : Void {
        openGLESImage.imageProcessor.translate(gl, this.translateX2, this.translateY2);
    }

    public function new() {
        super();
    }
}

