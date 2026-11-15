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
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.logic.util.cache.PoolInterface;
import org.allbinary.media.image.cache.BufferedImageCacheable;
import org.allbinary.media.image.cache.BufferedImageInfo;
import org.allbinary.media.image.cache.BufferedImageInfoFactory;
import org.allbinary.media.image.cache.BufferedImagePoolSingleton;
import org.allbinary.media.image.comparison.pixel.PixelDelta;

class ChangedPixelsUtil {
    private static final START_X : Int = 0;
    private static final START_Y : Int = 0;
    private static final OFFSET : Int = 0;
    private static final SCAN_SIZE : Int = 0;
    private static final CLEAR_INT_ARRAY : haxe.ds.Vector<Int> = haxe.ds.Vector.fromArrayCopy([for (index in 0...1800 * 1600) 0]);
    public function new() {
    }

    // throws Exception
    public static function generateBufferedImageChacheables(imageComparisonInfo : ImageComparisonResult) : haxe.ds.Vector<BufferedImageCacheable> {
        var bufferedImageCacheables : haxe.ds.Vector<BufferedImageCacheable> = null;
        var originalBufferedImage : BufferedImage = imageComparisonInfo.getBufferedImages()[0];
        bufferedImageCacheables = haxe.ds.Vector.fromArrayCopy([for (index in 0...2) null]);
        var bufferedImageInfo : BufferedImageInfo = BufferedImageInfoFactory.getInstance(imageComparisonInfo.imageWidth, imageComparisonInfo.imageHeight, originalBufferedImage.getType());
        var poolInterface : PoolInterface = BufferedImagePoolSingleton.getInstance();
        for (index in 0...bufferedImageCacheables.length) {
            var bufferedImageCacheable : BufferedImageCacheable = (cast poolInterface.remove(bufferedImageInfo) : BufferedImageCacheable);
            bufferedImageCacheables[index] = bufferedImageCacheable;
            bufferedImageCacheables[index].getBufferedImage().setRGB(ChangedPixelsUtil.START_X, ChangedPixelsUtil.START_Y, bufferedImageInfo.getWidth(), bufferedImageInfo.getHeight(), ChangedPixelsUtil.CLEAR_INT_ARRAY, ChangedPixelsUtil.OFFSET, ChangedPixelsUtil.SCAN_SIZE);
        }
        final vector : BasicArrayList = imageComparisonInfo.getNonMatchingPixelVector();
        final size : Int = vector.size();
        for (index in 0...size) {
            var pixelDelta : PixelDelta = (cast vector.get(index) : PixelDelta);
            if (pixelDelta.getColorDelta() == null) {
                trace("ColorDelta");
                System.exit(0);
            }
            bufferedImageCacheables[0].getBufferedImage().setRGB(pixelDelta.getPoint().getX(), pixelDelta.getPoint().getY(), pixelDelta.getColorDelta().getRgb1());
            bufferedImageCacheables[1].getBufferedImage().setRGB(pixelDelta.getPoint().getX(), pixelDelta.getPoint().getY(), pixelDelta.getColorDelta().getRgb2());
        }
        return bufferedImageCacheables;
    }

}

