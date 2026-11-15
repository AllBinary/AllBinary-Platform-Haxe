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
package org.allbinary.media.image.search;

//import java.awt.image.BufferedImage;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.media.image.ImageUtil;
import org.allbinary.media.image.comparison.pixel.PixelDelta;
import org.allbinary.string.CommonStrings;

class ImageComparisonSearch {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    public var isSameHeight : Bool = false;
    public var isSameWidth : Bool = false;
    public var pixelsThatMatch : Int = 0;
    public var pixelsIgnored : Int = 0;
    public var imageHeight : Int;
    public var imageWidth : Int;
    private var tolerance : Int = 0;
    private var nonMatchingPixelVector : BasicArrayList;
    private var bufferedImages : haxe.ds.Vector<BufferedImage> = null;
    private var matchingPercent : Float = -1;
    public function new(bufferedImage : BufferedImage, bufferedImage2 : BufferedImage, tolerance : Int) {
        this.nonMatchingPixelVector = new BasicArrayListD();
        this.setBufferedImages(haxe.ds.Vector.fromArrayCopy([for (index in 0...2) null]));
        this.getBufferedImages()[0] = bufferedImage;
        this.getBufferedImages()[1] = bufferedImage2;
        this.imageHeight = bufferedImage.getHeight();
        this.imageWidth = bufferedImage.getWidth();
        if (bufferedImage.getHeight() != bufferedImage2.getHeight()) {
            this.isSameHeight = false;
            if (this.imageHeight > bufferedImage2.getHeight()) {
                this.imageHeight = bufferedImage2.getHeight();
            }
        } else {
            this.isSameHeight = true;
        }
        if (bufferedImage.getWidth() != bufferedImage2.getWidth()) {
            this.isSameWidth = false;
            if (this.imageWidth > bufferedImage2.getWidth()) {
                this.imageWidth = bufferedImage2.getWidth();
            }
        } else {
            this.isSameWidth = true;
        }
        if (!this.isSameWidth || !this.isSameHeight) {
            final imageUtil : ImageUtil = ImageUtil.getInstance();
            this.logUtil.putF("Images were not the same size? Most likely a resolution change.", this, this.commonStrings.CONSTRUCTOR);
            this.logUtil.putF("1: " + imageUtil.toString(bufferedImage), this, this.commonStrings.CONSTRUCTOR);
            this.logUtil.putF("2: " + imageUtil.toString(bufferedImage2), this, this.commonStrings.CONSTRUCTOR);
        }
    }

    private function getMatchingPercent() : Float {
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
        return "ImageComparisonInfo: " + " Number Of Matching Pixels: " + this.pixelsThatMatch + "\nNumber Of Non-Matching Pixels: " + this.getNonMatchingPixelVector().size() + "\nNumber Of Pixels Ignored: " + this.pixelsIgnored + "\nMatching Percentage: " + this.getMatchingPercent();
    }

    public function getBufferedImages() : haxe.ds.Vector<BufferedImage> {
        return this.bufferedImages;
    }

    private function setBufferedImages(bufferedImages : haxe.ds.Vector<BufferedImage>) : Void {
        this.bufferedImages = bufferedImages;
    }

    public function getTolerance() : Int {
        return this.tolerance;
    }

    public function setTolerance(tolerance : Int) : Void {
        this.tolerance = tolerance;
    }

}

