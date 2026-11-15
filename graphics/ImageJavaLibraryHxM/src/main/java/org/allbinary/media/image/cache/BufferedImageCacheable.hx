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
package org.allbinary.media.image.cache;

//import java.awt.image.BufferedImage;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.util.cache.CacheableInterface;

class BufferedImageCacheable implements CacheableInterface {
    private var key : BufferedImageInfo;
    private var bufferedImage : BufferedImage = null;
    public function new(key : BufferedImageInfo) {
        this.key = key;
        this.setBufferedImage(new BufferedImage(key.getWidth(), key.getHeight(), key.getType()));
    }

    public function getKey() : Any {
        return this.key;
    }

    public function getBufferedImage() : BufferedImage {
        return this.bufferedImage;
    }

    private function setBufferedImage(bufferedImage : BufferedImage) : Void {
        this.bufferedImage = bufferedImage;
    }

    public function toString() : String {
        var stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(Type.getClassName(Type.getClass(this)));
        stringBuffer.append(" ");
        stringBuffer.append(this.getKey().toString());
        return stringBuffer.toString();
    }

}

