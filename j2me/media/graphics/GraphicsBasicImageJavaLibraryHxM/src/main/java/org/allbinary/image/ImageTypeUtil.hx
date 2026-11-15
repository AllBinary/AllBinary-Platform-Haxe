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

import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class ImageTypeUtil {
    private static var SINGLETON : ImageTypeUtil = new ImageTypeUtil();
    public final PNG : String = "png";
    public final JPG : String = "jpg";
    public final GIF : String = "gif";
    private final list : BasicArrayList = new BasicArrayListD();
    public function new() {
        this.list.add(JPG);
        this.list.add(GIF);
        this.list.add(PNG);
    }

    public function isSupported(mediaFileType : String) : Bool {
        mediaFileType = mediaFileType.toLowerCase();
        {
            var index : Int = this.list.size() - 1;
            while (index >= 0) {
            var name : String = (cast this.list.get(index) : String);
            if (Reflect.compare(mediaFileType, name) == 0) {
                return true;
            }
                index--;
            }
        }
        return false;
    }

    public static function getInstance() : ImageTypeUtil {
        return ImageTypeUtil.SINGLETON;
    }

}

