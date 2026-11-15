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

//import java.awt.*;
//import java.awt.image.BufferedImage;
import org.allbinary.graphics.GPoint;
import org.allbinary.graphics.PointFactory;
import org.allbinary.graphics.color.ColorCacheFactory;
import org.allbinary.graphics.color.ColorCacheable;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.util.cache.AutomaticCacheInterface;
import org.allbinary.media.image.comparison.pixel.PixelDeltaFactory;

class ImageComparator {
    private final imageComparatorConstraintsInterface : ImageComparatorConstraintsInterface;
    public function new(imageComparatorConstraintsInterface : ImageComparatorConstraintsInterface) {
        this.imageComparatorConstraintsInterface = imageComparatorConstraintsInterface;
    }

    // throws Exception
    private function process(imageComparisonInfo : ImageComparisonResult, point : GPoint) : Void {
        final isCollsionWithAvoidRectangles : Bool = this.imageComparatorConstraintsInterface.isCollisionWithAvoidRectangles(point);
        if (!isCollsionWithAvoidRectangles) {
            final rgb1 : Int = imageComparisonInfo.getBufferedImages()[0].getRGB(point.getX(), point.getY());
            final rgb2 : Int = imageComparisonInfo.getBufferedImages()[1].getRGB(point.getX(), point.getY());
            final automaticCacheInterface : AutomaticCacheInterface = ColorCacheFactory.getInstance();
            final colorInteger : Null<Int> = Std.string(rgb1);
            final colorCacheable : ColorCacheable = (cast automaticCacheInterface.get(colorInteger) : ColorCacheable);
            final color : Color = colorCacheable.getColor();
            final colorInteger2 : Null<Int> = Std.string(rgb2);
            final colorCacheable2 : ColorCacheable = (cast automaticCacheInterface.get(colorInteger) : ColorCacheable);
            final color2 : Color = colorCacheable.getColor();
            if (this.imageComparatorConstraintsInterface.isColorAllowed(0, point, color) || this.imageComparatorConstraintsInterface.isColorAllowed(1, point, color2)) {
                if (Math.abs(rgb1 - rgb2) <= imageComparisonInfo.getTolerance()) {
                    imageComparisonInfo.pixelsThatMatch++;
                } else {
                    imageComparisonInfo.add(PixelDeltaFactory.getInstance(point.getX(), point.getY(), rgb1, rgb2));
                }
            }
        } else {
            imageComparisonInfo.pixelsIgnored++;
        }
    }

    // throws Exception
    public function compare(bufferedImage1 : BufferedImage, bufferedImage2 : BufferedImage, frameOne : Null<haxe.Int64>, frameTwo : Null<haxe.Int64>, tolerance : Int) : ImageComparisonResult {
        return this.compare(bufferedImage1, bufferedImage2, frameOne, frameTwo, tolerance, StringUtil.getInstance().EMPTY_STRING);
    }

    // throws Exception
    public function compare(bufferedImage1 : BufferedImage, bufferedImage2 : BufferedImage, frameOne : Null<haxe.Int64>, frameTwo : Null<haxe.Int64>, tolerance : Int, name : String) : ImageComparisonResult {
        if (bufferedImage1 == null || bufferedImage2 == null) {
            throw new haxe.Exception("Input images must not be null.");
        }
        final imageComparisonInfo : ImageComparisonResult = new ImageComparisonResult(name, bufferedImage1, bufferedImage2, frameOne, frameTwo, tolerance);
        for (indexY in 0...imageComparisonInfo.imageHeight) {
            for (indexX in 0...imageComparisonInfo.imageWidth) {
                this.process(imageComparisonInfo, PointFactory.getInstance().createXY(indexX, indexY));
                if (imageComparisonInfo.getNonMatchingPixelVector().size() > this.imageComparatorConstraintsInterface.getMaxNonMatchingPixelDeltas()) {
                    break;
                }
            }
        }
        return imageComparisonInfo;
    }

}

