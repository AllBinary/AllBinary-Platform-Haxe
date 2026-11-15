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

//import java.util.HashMap;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.string.StringMaker;

class BufferedImageInfoFactory {
    private static var hashMap : HashMap = StdUtil.getInstance().createHashMap();
    public function new() {
    }

    public static function getInstance(width : Int, height : Int, type : Int) : BufferedImageInfo {
        var stringbuffer : StringMaker = new StringMaker();
        stringbuffer.appendint(width);
        stringbuffer.appendint(height);
        stringbuffer.appendint(type);
        var key : String = stringbuffer.toString();
        var bufferedImageInfo : BufferedImageInfo = (cast BufferedImageInfoFactory.hashMap.get(key) : BufferedImageInfo);
        if (bufferedImageInfo == null) {
            bufferedImageInfo = new BufferedImageInfo(width, height, type);
            BufferedImageInfoFactory.hashMap.put(key, bufferedImageInfo);
        }
        return bufferedImageInfo;
    }

}

