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
package org.allbinary.logic.visual.media;

import jre.util.HashMap;
import org.allbinary.logic.StdUtil;

class MediaData {
    private static var hashMap : HashMap<Dynamic, Dynamic> = StdUtil.getInstance().createHashMap();
    private var name : String;
    private var type : String;
    private var extension : String;
    public function new(a_Name : String) {
        this.name = a_Name;
        this.extension = "." + this.name;
        this.type = MediaTypeData.getInstance().NOT_RESIZABLE_MEDIA;
        MediaData.hashMap.put(a_Name, this);
    }

    public function getName() : String {
        return this.name;
    }

    public function getType() : String {
        return this.type;
    }

    public function getExtension() : String {
        return this.extension;
    }

    public function isConvertableTo(mediaData : MediaData) : Bool {
        if (this == MediaDataFactory.getInstance().GIF && mediaData == MediaDataFactory.getInstance().JPG) {
            return true;
        }
        return false;
    }

    public function toString() : String {
        return this.getName();
    }

    // throws Exception
    public static function get(a_Name : String) : MediaData {
        var mediaData : MediaData = (cast MediaData.hashMap.get(a_Name) : MediaData);
        if (mediaData != null) {
            return mediaData;
        } else {
            throw new jre.lang.JavaException("No Such MediaData");
        }
    }

    public static function getDefault() : MediaData {
        return MediaDataFactory.getInstance().JPG;
    }

    public static function toHashMap() : HashMap<Dynamic, Dynamic> {
        return MediaData.hashMap;
    }

}

