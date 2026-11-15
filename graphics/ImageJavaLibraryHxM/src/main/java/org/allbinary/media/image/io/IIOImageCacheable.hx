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
package org.allbinary.media.image.io;

//import java.awt.image.BufferedImage;
//import javax.imageio.IIOImage;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.util.cache.CacheableInterface;

class IIOImageCacheable implements CacheableInterface {
    private var key : String;
    private var iioImage : IIOImage = null;
    public function new(key : String) {
        this.key = key;
    }

    public function getKey() : Any {
        return this.key;
    }

    public function setBufferedImage(bufferedImage : BufferedImage) : Void {
        this.setIioImage(new IIOImage(bufferedImage, null, null));
    }

    public function getIioImage() : IIOImage {
        return this.iioImage;
    }

    private function setIioImage(iioImage : IIOImage) : Void {
        this.iioImage = iioImage;
    }

    public function toString() : String {
        var stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(Type.getClassName(Type.getClass(this)));
        stringBuffer.append(" Reusable IIOImage");
        return stringBuffer.toString();
    }

}

