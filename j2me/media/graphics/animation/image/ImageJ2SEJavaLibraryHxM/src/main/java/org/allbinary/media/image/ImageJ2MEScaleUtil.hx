/*
 *
 * AllBinary Open License Version 1
 * Copyright (c) 2023 AllBinary
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
        final sourceWidth : Int = image.getWidth();
        final sourceHeight : Int = image.getHeight();
        final originalData : haxe.ds.Vector<Int> = haxe.ds.Vector.fromArrayCopy([for (index in 0...image.getWidth() * image.getHeight()) 0]);
        image.getRGB(originalData, 0, image.getWidth(), 0, 0, image.getWidth(), image.getHeight());
        final scaledData : haxe.ds.Vector<Int> = haxe.ds.Vector.fromArrayCopy([for (index in 0...width * height) 0]);
        final heightRatioFactor : Int = Std.int((8 * sourceHeight) / height);
        final widthRatioFactor : Int = Std.int((8 * sourceWidth) / width);
        var scaledIndex : Int = scaledData.length - 1;
        var dx : Int = 0;
        var dy : Int = 0;
        {
            var index : Int = height;
            while (--index >= 0) {
            dy = (index * heightRatioFactor) >> 3;
            {
                var index2 : Int = width;
                while (--index2 >= 0) {
                dx = (index2 * widthRatioFactor) >> 3;
                scaledData[scaledIndex--] = originalData[(sourceWidth * dy) + dx];
                }
            }
            }
        }
        final scaledImage : Image = Image.createRGBImage(scaledData, width, height, true);
        return scaledImage;
    }

}

