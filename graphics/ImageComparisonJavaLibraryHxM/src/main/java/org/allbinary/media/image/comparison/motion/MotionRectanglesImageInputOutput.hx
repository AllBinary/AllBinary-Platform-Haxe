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
package org.allbinary.media.image.comparison.motion;

//import java.awt.*;
//import java.awt.image.BufferedImage;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.input.automation.ImageOutputData;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.java.number.LongUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.util.cache.AutomaticCacheInterface;
import org.allbinary.logic.util.cache.PoolInterface;
import org.allbinary.logic.visual.media.MediaDataFactory;
import org.allbinary.media.image.ImagePersistanceUtil;
import org.allbinary.media.image.cache.BufferedImageCacheable;
import org.allbinary.media.image.cache.BufferedImageInfo;
import org.allbinary.media.image.cache.BufferedImageInfoFactory;
import org.allbinary.media.image.cache.BufferedImagePoolSingleton;
import org.allbinary.media.image.comparison.ImageComparisonResult;
import org.allbinary.media.image.io.ImageIOInterface;
import org.allbinary.string.CommonStrings;

class MotionRectanglesImageInputOutput implements ImageIOInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final NUMBER_OF_IMAGES : Int = 1;
    public function new() {
    }

    // throws Exception
    public function save(frame : Null<haxe.Int64>) : Void {
        final commonStrings : CommonStrings = CommonStrings.getInstance();
        var motionRectanglesResultsFrameCacheable : MotionRectanglesResultsFrameCacheable = (cast ((cast AllMotionRectanglesResultsCacheSingleton.getInstance() : AutomaticCacheInterface)).get(frame) : MotionRectanglesResultsFrameCacheable);
        if (motionRectanglesResultsFrameCacheable != null) {
            var motionRectangles : MotionRectangles = motionRectanglesResultsFrameCacheable.getMotionRectangles();
            this.save(motionRectangles, frame);
            motionRectanglesResultsFrameCacheable = (cast ((cast ConsolidatedMotionRectanglesResultsCacheSingleton.getInstance() : AutomaticCacheInterface)).get(frame) : MotionRectanglesResultsFrameCacheable);
            motionRectangles = motionRectanglesResultsFrameCacheable.getMotionRectangles();
            this.save(motionRectangles, frame);
            motionRectanglesResultsFrameCacheable = (cast ((cast ConstrainedMotionRectanglesResultsCacheSingleton.getInstance() : AutomaticCacheInterface)).get(frame) : MotionRectanglesResultsFrameCacheable);
            motionRectangles = motionRectanglesResultsFrameCacheable.getMotionRectangles();
            this.save(motionRectangles, frame);
        } else {
            this.logUtil.putF("No Motion Rectangle Results for Frame: " + frame, this, commonStrings.SAVE);
        }
    }

    // throws Exception
    public function save(motionRectangles : MotionRectangles, frame : Null<haxe.Int64>) : Void {
        final commonStrings : CommonStrings = CommonStrings.getInstance();
        final filePathStringBuffer : StringMaker = new StringMaker();
        filePathStringBuffer.append(ImageOutputData.SAVE_PATH);
        filePathStringBuffer.append(LongUtil.fillIn(frame.toString()));
        filePathStringBuffer.append("_");
        filePathStringBuffer.append(motionRectangles.getName());
        var filePathStringBuffer1 : StringMaker = new StringMaker();
        filePathStringBuffer1.append(filePathStringBuffer.toString());
        filePathStringBuffer1.append("_1");
        filePathStringBuffer1.append(MediaDataFactory.getInstance().JPG.getExtension());
        var filePathStringBuffer2 : StringMaker = new StringMaker();
        filePathStringBuffer2.append(filePathStringBuffer.toString());
        filePathStringBuffer2.append("_2");
        filePathStringBuffer2.append(MediaDataFactory.getInstance().JPG.getExtension());
        var filePathStringBuffer3 : StringMaker = new StringMaker();
        filePathStringBuffer3.append(filePathStringBuffer.toString());
        filePathStringBuffer3.append(MediaDataFactory.getInstance().JPG.getExtension());
        this.logUtil.putF("Motion Image File Path 1: " + filePathStringBuffer1.toString(), this, commonStrings.SAVE);
        this.logUtil.putF("Motion Image File Path 2: " + filePathStringBuffer2.toString(), this, commonStrings.SAVE);
        this.logUtil.putF("Motion Image File Path 2: " + filePathStringBuffer3.toString(), this, commonStrings.SAVE);
        var bufferedImageCacheables : haxe.ds.Vector<BufferedImageCacheable> = haxe.ds.Vector.fromArrayCopy([for (index in 0...this.NUMBER_OF_IMAGES) null]);
        var imageComparisonInfo : ImageComparisonResult = motionRectangles.getImageComparisonResult();
        var originalBufferedImage : BufferedImage = imageComparisonInfo.getBufferedImages()[0];
        var bufferedImageInfo : BufferedImageInfo = BufferedImageInfoFactory.getInstance(imageComparisonInfo.imageWidth, imageComparisonInfo.imageHeight, originalBufferedImage.getType());
        var poolInterface : PoolInterface = BufferedImagePoolSingleton.getInstance();
        for (index in 0...this.NUMBER_OF_IMAGES) {
            bufferedImageCacheables[index] = (cast poolInterface.remove(bufferedImageInfo) : BufferedImageCacheable);
        }
        bufferedImageCacheables[0].getBufferedImage().setData(imageComparisonInfo.getBufferedImages()[1].getData());
        if (this.NUMBER_OF_IMAGES > 1) {
            bufferedImageCacheables[1].getBufferedImage().setData(imageComparisonInfo.getBufferedImages()[1].getData());
        }
        var bufferedImageGraphicsArray : haxe.ds.Vector<Graphics> = null;
        bufferedImageGraphicsArray = haxe.ds.Vector.fromArrayCopy([for (index in 0...this.NUMBER_OF_IMAGES) null]);
        for (index in 0...this.NUMBER_OF_IMAGES) {
            bufferedImageGraphicsArray[index] = bufferedImageCacheables[index].getBufferedImage().getGraphics();
        }
        final rectangelList : BasicArrayList = motionRectangles.getVector();
        final size : Int = rectangelList.size();
        for (index2 in 0...size) {
            var motionRectangle : MotionRectangle = (cast rectangelList.get(index2) : MotionRectangle);
            var rectangle : Rectangle = motionRectangle.getRectangle();
            for (index in 0...this.NUMBER_OF_IMAGES) {
                bufferedImageGraphicsArray[index].setColor(Color.ORANGE);
                bufferedImageGraphicsArray[index].drawRect(rectangle.x, rectangle.y, rectangle.width, rectangle.height);
            }
        }
        final imagePersistanceUtil : ImagePersistanceUtil = ImagePersistanceUtil.getInstance();
        if (this.NUMBER_OF_IMAGES > 1) {
            imagePersistanceUtil.saveWithImageIO(filePathStringBuffer1.toString(), bufferedImageCacheables[1].getBufferedImage());
        }
        imagePersistanceUtil.saveWithImageIO(filePathStringBuffer2.toString(), bufferedImageCacheables[0].getBufferedImage());
        if (this.NUMBER_OF_IMAGES > 2) {
            imagePersistanceUtil.saveWithImageIO(filePathStringBuffer3.toString(), bufferedImageCacheables[2].getBufferedImage());
        }
    }

}

