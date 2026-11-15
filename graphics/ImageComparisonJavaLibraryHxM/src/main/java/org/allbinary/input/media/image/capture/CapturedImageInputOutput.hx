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
package org.allbinary.input.media.image.capture;

//import java.awt.image.BufferedImage;
import org.allbinary.input.automation.ImageOutputData;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.java.number.LongUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.util.cache.AutomaticCacheInterface;
import org.allbinary.logic.visual.media.MediaDataFactory;
import org.allbinary.media.image.ImagePersistanceUtil;
import org.allbinary.media.image.ImageUtil;
import org.allbinary.media.image.cache.BufferedImageFrameCacheable;
import org.allbinary.media.image.io.ImageIOInterface;
import org.allbinary.string.CommonStrings;

class CapturedImageInputOutput implements ImageIOInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    // throws Exception
    public function save(frame : Null<haxe.Int64>) : Void {
        final commonStrings : CommonStrings = CommonStrings.getInstance();
        final capturedBufferedImageCacheable : BufferedImageFrameCacheable = ((cast ((cast CapturedBufferedImagesCacheSingleton.getInstance() : AutomaticCacheInterface)).get(frame) : BufferedImageFrameCacheable));
        this.logUtil.putF(("Saving: " + capturedBufferedImageCacheable.toString()), this, commonStrings.SAVE);
        this.save(capturedBufferedImageCacheable.getBufferedImage(), frame);
    }

    public function save(bufferedImage : BufferedImage, frame : Null<haxe.Int64>) : Void {
        final commonStrings : CommonStrings = CommonStrings.getInstance();
        final imageUtil : ImageUtil = ImageUtil.getInstance();
        final filePathStringBuffer : StringMaker = new StringMaker();
        filePathStringBuffer.append(ImageOutputData.SAVE_PATH);
        filePathStringBuffer.append(LongUtil.fillIn(frame.toString()));
        filePathStringBuffer.append(MediaDataFactory.getInstance().JPG.getExtension());
        var filePath : String = filePathStringBuffer.toString();
        this.logUtil.putF(("Image File Path: " + filePath + imageUtil.toString(bufferedImage)), this, commonStrings.SAVE);
        final imagePersistanceUtil : ImagePersistanceUtil = ImagePersistanceUtil.getInstance();
        imagePersistanceUtil.saveWithImageIO(filePath, bufferedImage);
    }

    public function new() {
    }
}

