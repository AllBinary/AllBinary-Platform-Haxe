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
package org.allbinary.media.image.comparison;

//import java.awt.image.BufferedImage;
import org.allbinary.input.automation.ImageOutputData;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.java.number.LongUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.util.cache.AutomaticCacheInterface;
import org.allbinary.logic.visual.media.MediaDataFactory;
import org.allbinary.media.image.ImagePersistanceUtil;
import org.allbinary.media.image.cache.BufferedImageCacheable;
import org.allbinary.media.image.io.ImageIOInterface;
import org.allbinary.string.CommonStrings;

class ComparisonImageInputOutput implements ImageIOInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final ROOT_NAME : String = "_Changed_";
    public function new() {
    }

    // throws Exception
    public function save(frame : Null<haxe.Int64>) : Void {
        final commonStrings : CommonStrings = CommonStrings.getInstance();
        if (frame > 0) {
            final imageComparisonResultFrameCacheable : ImageComparisonResultFrameCacheable = (cast ((cast ImageComparisonResultCacheSingleton.getInstance() : AutomaticCacheInterface)).get(frame) : ImageComparisonResultFrameCacheable);
            if (imageComparisonResultFrameCacheable != null) {
                final imageComparisonResult : ImageComparisonResult = imageComparisonResultFrameCacheable.getImageComparisonResult();
                this.save(imageComparisonResult, imageComparisonResultFrameCacheable.getFrame());
            } else {
                this.logUtil.putF("Comparison Results Not Available for Output: " + frame, this, commonStrings.SAVE);
            }
        } else {
            this.logUtil.putF("No Comparison Results: for first frame: " + frame, this, commonStrings.SAVE);
        }
    }

    // throws Exception
    public function save(imageComparisonResult : ImageComparisonResult, frame : Null<haxe.Int64>) : Void {
        final commonStrings : CommonStrings = CommonStrings.getInstance();
        final filePathStringBuffer : StringMaker = new StringMaker();
        filePathStringBuffer.append(ImageOutputData.SAVE_PATH);
        filePathStringBuffer.append(LongUtil.fillIn(frame.toString()));
        filePathStringBuffer.append(ComparisonImageInputOutput.ROOT_NAME);
        final filePathStringBuffer1 : StringMaker = new StringMaker();
        filePathStringBuffer1.append(filePathStringBuffer.toString());
        filePathStringBuffer1.append("_1");
        filePathStringBuffer1.append(MediaDataFactory.getInstance().JPG.getExtension());
        var filePath1 : String = filePathStringBuffer1.toString();
        final filePathStringBuffer2 : StringMaker = new StringMaker();
        filePathStringBuffer2.append(filePathStringBuffer.toString());
        filePathStringBuffer2.append("_2");
        filePathStringBuffer2.append(MediaDataFactory.getInstance().JPG.getExtension());
        var filePath2 : String = filePathStringBuffer2.toString();
        final bufferedImageCacheables : haxe.ds.Vector<BufferedImageCacheable> = ChangedPixelsUtil.generateBufferedImageChacheables(imageComparisonResult);
        this.logUtil.putF("Comparison Image File Path 1: " + filePath1, this, commonStrings.SAVE);
        this.logUtil.putF("Comparison Image File Path 2: " + filePath2, this, commonStrings.SAVE);
        final bufferedImageArray : haxe.ds.Vector<BufferedImage> = haxe.ds.Vector.fromArrayCopy([for (index in 0...2) null]);
        bufferedImageArray[0] = bufferedImageCacheables[0].getBufferedImage();
        bufferedImageArray[1] = bufferedImageCacheables[1].getBufferedImage();
        final imagePersistanceUtil : ImagePersistanceUtil = ImagePersistanceUtil.getInstance();
        imagePersistanceUtil.saveWithImageIO(filePath1, bufferedImageArray[0]);
        imagePersistanceUtil.saveWithImageIO(filePath2, bufferedImageArray[1]);
    }

}

