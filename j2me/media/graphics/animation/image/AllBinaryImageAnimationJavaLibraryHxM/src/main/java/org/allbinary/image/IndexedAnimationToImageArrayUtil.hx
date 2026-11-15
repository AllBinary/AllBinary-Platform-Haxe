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
package org.allbinary.image;

//import javax.microedition.lcdui.Image;
import org.allbinary.animation.IndexedAnimation;

class IndexedAnimationToImageArrayUtil {
    // throws Exception
    public static function getInstance(width : Int, height : Int, sequentialAnimationInterface : IndexedAnimation) : haxe.ds.Vector<Image> {
        var size : Int = sequentialAnimationInterface.getAnimationSize();
        var imageArray : haxe.ds.Vector<Image> = haxe.ds.Vector.fromArrayCopy([for (index in 0...size) null]);
        for (index in 0...size) {
            sequentialAnimationInterface.setFrame(index);
            imageArray[index] = AnimationFrameToImageUtil.getInstance().getInstanceWH(width, height, sequentialAnimationInterface);
        }
        return imageArray;
    }

    public function new() {
    }
}

