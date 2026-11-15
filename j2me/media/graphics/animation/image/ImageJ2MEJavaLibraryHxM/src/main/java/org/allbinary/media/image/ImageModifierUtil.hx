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
package org.allbinary.media.image;

//import javax.microedition.lcdui.Image;
import org.allbinary.graphics.color.BasicColor;

class ImageModifierUtil {
    private static final instance : ImageModifierUtil = new ImageModifierUtil();
    public static function getInstanceOrCreate() : ImageModifierUtil {
        return ImageModifierUtil.instance;
    }

    public function setColor(unusedOriginalImage : Image, image : Image, imageIndex : Int, basicColor : BasicColor) : Void {
    }

    public function changeColor(unusedOriginalImage : Image, image : Image, imageIndex : Int, basicColor : BasicColor) : Void {
    }

    public function setAlpha(originalImage : Image, image : Image, imageIndex : Int, alphaInt : Int) : Void {
    }

    public function getImageArray(originalImageArray : haxe.ds.Vector<Image>) : haxe.ds.Vector<Image> {
        return originalImageArray;
    }

    public function handleImage(imageArray : haxe.ds.Vector<Image>, index : Int, image : Image) : Void {
    }

    public function reset() : Void {
    }

    public function new() {
    }
}

