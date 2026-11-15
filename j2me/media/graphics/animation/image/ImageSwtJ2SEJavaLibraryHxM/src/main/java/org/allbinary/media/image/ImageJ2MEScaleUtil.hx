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

class ImageJ2MEScaleUtil {
    private static final instance : ImageJ2MEScaleUtil = new ImageJ2MEScaleUtil();
    public static function getInstance() : ImageJ2MEScaleUtil {
        return ImageJ2MEScaleUtil.instance;
    }

    public function new() {
    }

    // throws Exception
    public function scaleArray(images : haxe.ds.Vector<Image>, width : Int, height : Int) : haxe.ds.Vector<Image> {
        final scaledImages : haxe.ds.Vector<Image> = haxe.ds.Vector.fromArrayCopy([for (index in 0...images.length) null]);
        {
            var index : Int = images.length;
            while (--index >= 0) {
            scaledImages[index] = this.scale(images[index], width, height);
            }
        }
        return scaledImages;
    }

    // throws Exception
    public function scale(image : Image, width : Int, height : Int) : Image {
        final scaledImage : Image = ImageCopyUtil.getInstance().createImageWH(image, width, height, true);
        return scaledImage;
    }

}

