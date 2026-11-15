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
package org.allbinary.animation.image;

//import javax.microedition.lcdui.Image;

class ScaleBaseProcessor {
    private static final instance : ScaleBaseProcessor = new ScaleBaseProcessor();
    public static function getInstance() : ScaleBaseProcessor {
        return ScaleBaseProcessor.instance;
    }

    public function update(originalImage : Image, originalImageArray : haxe.ds.Vector<Image>, imageToShowArray : haxe.ds.Vector<Image>, index : Int, scaleX : Float, scaleY : Float, maxScaleX : Float, maxScaleY : Float) : Void {
    }

    public function new() {
    }
}

