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

import javax.microedition.lcdui.Image;
import org.allbinary.image.GameFeatureImageCacheFactory;

class ImageCreationUtil {
    private static final instance : ImageCreationUtil = new ImageCreationUtil();
    public static function getInstance() : ImageCreationUtil {
        return ImageCreationUtil.instance;
    }

    public function new() {
    }

    // throws Exception
    public function createImageWH(width : Int, height : Int) : Image {
        final image : Image = GameFeatureImageCacheFactory.getInstance().get(Type.getClassName(Type.getClass(this)), width, height);
        return image;
    }

    // throws Exception
    public function createImage(width : Int, height : Int, maxScaleX : Float, maxScaleY : Float) : Image {
        final image : Image = GameFeatureImageCacheFactory.getInstance().get(Type.getClassName(Type.getClass(this)), Std.int((width * maxScaleX)) + 1, Std.int((height * maxScaleY)) + 1);
        return image;
    }

}

