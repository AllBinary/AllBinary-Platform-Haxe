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
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.media.image.ImageUtil;
import org.allbinary.media.image.comparison.pixel.PixelDelta;
import org.allbinary.string.CommonStrings;

class ImageComparisonResult {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    private final bufferedImages : haxe.ds.Vector<BufferedImage> = haxe.ds.Vector.fromArrayCopy([for (index in 0...2) null]);
    public final name : String;
    public final isSameHeight : Bool = false;
    public final isSameWidth : Bool = false;
    public final imageHeight : Int;
    public final imageWidth : Int;
    private final nonMatchingPixelVector : BasicArrayList;
    private final frameOne : Null<haxe.Int64>;
    private final frameTwo : Null<haxe.Int64>;
    public var pixelsThatMatch : Int = 0;
    public var pixelsIgnored : Int = 0;
    private var tolerance : Int = 0;
    private var matchingPercent : Float = -1;
    public function new(name : String, bufferedImage : BufferedImage, bufferedImage2 : BufferedImage, frameOne : Null<haxe.Int64>, frameTwo : Null<haxe.Int64>, tolerance : Int) {
        this.name = name;
        this.nonMatchingPixelVector = new BasicArrayListD();
        this.bufferedImages[0] = bufferedImage;
        this.bufferedImages[1] = bufferedImage2;
        this.frameOne = frameOne;
        this.frameTwo = frameTwo;
        this.setTolerance(0);
        var imageHeight : Int = bufferedImage.getHeight();
        var imageWidth : Int = bufferedImage.getWidth();
        if (bufferedImage.getHeight() != bufferedImage2.getHeight()) {
            this.isSameHeight = false;
            if (imageHeight > bufferedImage2.getHeight()) {
                imageHeight = bufferedImage2.getHeight();
            }
        } else {
            this.isSameHeight = true;
        }
        if (bufferedImage.getWidth() != bufferedImage2.getWidth()) {
            this.isSameWidth = false;
            if (imageWidth > bufferedImage2.getWidth()) {
                imageWidth = bufferedImage2.getWidth();
            }
        } else {
            this.isSameWidth = true;
        }
        this.imageWidth = imageWidth;
        this.imageHeight = imageHeight;
        if (!this.isSameWidth || !this.isSameHeight) {
            final imageUtil : ImageUtil = ImageUtil.getInstance();
            this.logUtil.putF("Images were not the same size? Most likely a resolution change.", this, this.commonStrings.CONSTRUCTOR);
            this.logUtil.putF("1: " + imageUtil.toString(bufferedImage), this, this.commonStrings.CONSTRUCTOR);
            this.logUtil.putF("2: " + imageUtil.toString(bufferedImage2), this, this.commonStrings.CONSTRUCTOR);
        }
    }

    public function getMatchingPercent() : Float {
        if (this.matchingPercent == -1) {
            this.matchingPercent = this.pixelsThatMatch / (this.imageWidth * this.imageHeight);
        }
        return this.matchingPercent;
    }

    public function add(pixel : PixelDelta) : Void {
        this.nonMatchingPixelVector.add(pixel);
    }

    public function getNonMatchingPixelVector() : BasicArrayList {
        return this.nonMatchingPixelVector;
    }

    public function toString() : String {
        return new StringMaker().append("ImageComparisonInfo: ").append(this.name).append(" Number Of Matching Pixels: ").appendint(this.pixelsThatMatch).append("\nNumber Of Non-Matching Pixels: ").appendint(this.getNonMatchingPixelVector().size()).append("\nNumber Of Pixels Ignored: ").appendint(this.pixelsIgnored).append("\nMatching Percentage: ").appendfloat(this.getMatchingPercent()).toString();
    }

    public function getBufferedImages() : haxe.ds.Vector<BufferedImage> {
        return this.bufferedImages;
    }

    public function getTolerance() : Int {
        return this.tolerance;
    }

    private function setTolerance(tolerance : Int) : Void {
        this.tolerance = tolerance;
    }

    public function getFrameOne() : Null<haxe.Int64> {
        return this.frameOne;
    }

    public function getFrameTwo() : Null<haxe.Int64> {
        return this.frameTwo;
    }

}

