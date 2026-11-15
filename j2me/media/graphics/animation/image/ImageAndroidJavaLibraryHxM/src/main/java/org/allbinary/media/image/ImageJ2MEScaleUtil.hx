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
import org.allbinary.image.GameFeatureImageCacheFactory;

class ImageJ2MEScaleUtil {
    private static final instance : ImageJ2MEScaleUtil = new ImageJ2MEScaleUtil();
    public static function getInstance() : ImageJ2MEScaleUtil {
        return ImageJ2MEScaleUtil.instance;
    }

    public function new() {
    }

    // throws Exception
    public function scaleArray(images : haxe.ds.Vector<Image>, width : Int, height : Int) : haxe.ds.Vector<Image> {
        for (index in 0...images.length) {
            var image : Image = images[index];
            images[index] = ImageScaleUtil.getInstance().createImage2(GameFeatureImageCacheFactory.getInstance(), image, width / 2.0, image.getWidth(), height, image.getHeight(), false);
        }
        return images;
    }

    // throws Exception
    public function scale(image : Image, width : Int, height : Int) : Image {
        return ImageScaleUtil.getInstance().createImage2(GameFeatureImageCacheFactory.getInstance(), image, width, image.getWidth(), height, image.getHeight(), false);
    }

}

