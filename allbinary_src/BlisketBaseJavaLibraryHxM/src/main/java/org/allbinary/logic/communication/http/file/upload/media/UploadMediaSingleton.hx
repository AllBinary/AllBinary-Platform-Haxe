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
package org.allbinary.logic.communication.http.file.upload.media;

//import java.util.HashMap;
//import java.util.Set;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.visual.media.MediaData;
import org.allbinary.logic.visual.media.MediaIOUtil;
import org.allbinary.logic.visual.media.MediaTypeData;
import org.allbinary.string.CommonStrings;

class UploadMediaSingleton {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    private var readerFileTypesHashMap : HashMap;
    private var writerFileTypesHashMap : HashMap;
    private static var uploadMedia : UploadMediaSingleton = null;
    public function new() {
        this.readerFileTypesHashMap = StdUtil.getInstance().createHashMap();
        this.writerFileTypesHashMap = StdUtil.getInstance().createHashMap();
        final hashMap : HashMap = MediaData.toHashMap();
        final set : Set = hashMap.keySet();
        final mediaDataNameArray : haxe.ds.Vector<Any> = set.toArray();
        final size : Int = mediaDataNameArray.length;
        for (index in 0...size) {
            var mediaDataName : String = (cast mediaDataNameArray[index] : String);
            var mediaData : MediaData = (cast hashMap.get(mediaDataName) : MediaData);
            this.readerFileTypesHashMap.put(mediaData.getName(), mediaData.getType());
        }
        var mediaIOUtil : MediaIOUtil = MediaIOUtil.getInstance();
        final RESIZABLE_MEDIA : String = MediaTypeData.getInstance().RESIZABLE_MEDIA;
        var readerFileTypes : haxe.ds.Vector<String> = mediaIOUtil.getReaderFormatNames();
        for (index in 0...readerFileTypes.length) {
            this.readerFileTypesHashMap.put(readerFileTypes[index], RESIZABLE_MEDIA);
        }
        var writerFileTypes : haxe.ds.Vector<String> = mediaIOUtil.getWriterFormatNames();
        for (index in 0...writerFileTypes.length) {
            this.writerFileTypesHashMap.put(writerFileTypes[index], RESIZABLE_MEDIA);
        }
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().HTTPREQUEST)) {
            var stringBuffer : StringMaker = new StringMaker();
            stringBuffer.append("Supported Media Readers: ");
            stringBuffer.append(this.readerFileTypesHashMap.toString());
            stringBuffer.append(" Writers: ");
            stringBuffer.append(this.writerFileTypesHashMap.toString());
            this.logUtil.putF(stringBuffer.toString(), this, this.commonStrings.CONSTRUCTOR);
        }
    }

    // synchronized
    public static function getInstance() : UploadMediaSingleton {
        if (UploadMediaSingleton.uploadMedia == null) {
            UploadMediaSingleton.uploadMedia = new UploadMediaSingleton();
        }
        return UploadMediaSingleton.uploadMedia;
    }

    public function isReaderSupported(mediaFileType : String) : Bool {
        return this.readerFileTypesHashMap.containsKey(mediaFileType);
    }

    public function isWriterSupported(mediaFileType : String) : Bool {
        return this.readerFileTypesHashMap.containsKey(mediaFileType);
    }

    public function isSupported(mediaFileType : String) : Bool {
        return this.isReaderSupported(mediaFileType) && this.isWriterSupported(mediaFileType);
    }

    public function isMedia(mediaFileType : String, aMediaType : String) : Bool {
        return this.isReaderMedia(mediaFileType, aMediaType) && this.isWriterMedia(mediaFileType, aMediaType);
    }

    public function isReaderMedia(mediaFileType : String, aMediaType : String) : Bool {
        return this.isMedia(mediaFileType, aMediaType, this.readerFileTypesHashMap);
    }

    public function isWriterMedia(mediaFileType : String, aMediaType : String) : Bool {
        return this.isMedia(mediaFileType, aMediaType, this.writerFileTypesHashMap);
    }

    private function isMedia(mediaFileType : String, aMediaType : String, hashMap : HashMap) : Bool {
        if (hashMap.containsKey(mediaFileType)) {
            var mediaType : String = (cast hashMap.get(mediaFileType) : String);
            if (Reflect.compare(mediaType, aMediaType) == 0) {
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }
    }

}

