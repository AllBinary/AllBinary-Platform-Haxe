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
package org.allbinary.media.image;

//import javax.microedition.lcdui.Image;

class ImageToRotationImageArrayUtil {
    private static final instance : ImageToRotationImageArrayUtil = new ImageToRotationImageArrayUtil();
    public static function getInstance() : ImageToRotationImageArrayUtil {
        return ImageToRotationImageArrayUtil.instance;
    }

    public function new() {
    }

    // throws Exception
    public function generate(image : Image, angleIncrement : Int, totalAngle : Int) : haxe.ds.Vector<Image> {
        final imageRotationUtil : ImageRotationUtil = ImageRotationUtil.getInstance();
        final totalFrames : Int = Std.int(totalAngle / angleIncrement);
        final imageArray : haxe.ds.Vector<Image> = haxe.ds.Vector.fromArrayCopy([for (index in 0...totalFrames) null]);
        imageArray[0] = image;
        for (index in 1...totalFrames) {
            imageArray[index] = imageRotationUtil.createRotatedImage(image, index * angleIncrement);
        }
        return imageArray;
    }

}

