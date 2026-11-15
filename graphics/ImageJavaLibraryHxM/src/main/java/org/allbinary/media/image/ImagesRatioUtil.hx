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
package org.allbinary.media.image;

//import java.awt.*;
//import java.awt.image.BufferedImage;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonLabels;

class ImagesRatioUtil {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : ImagesRatioUtil = new ImagesRatioUtil();
    public static function getInstance() : ImagesRatioUtil {
        return ImagesRatioUtil.instance;
    }

    public function new() {
    }

    private final imageUtil : ImageUtil = ImageUtil.getInstance();
    public function isEqual(bufferedImageArray : haxe.ds.Vector<BufferedImage>, totalImages : Int) : Bool {
        var end : Int = totalImages;
        if (bufferedImageArray.length < totalImages) {
            end = bufferedImageArray.length;
        }
        final ratio : Float = (bufferedImageArray[0].getWidth() / bufferedImageArray[0].getHeight());
        for (index in 1...end) {
            if (ratio != (bufferedImageArray[index].getWidth() / bufferedImageArray[index].getHeight())) {
                return false;
            }
        }
        return true;
    }

    public function getAverage(bufferedImageArray : haxe.ds.Vector<BufferedImage>, totalImages : Int) : Float {
        var ratio : Float = 0.0;
        var end : Int = totalImages;
        if (bufferedImageArray.length < totalImages) {
            end = bufferedImageArray.length;
        }
        for (index in 0...end) {
            ratio += (bufferedImageArray[index].getWidth() / bufferedImageArray[index].getHeight());
        }
        return (ratio / end);
    }

    // throws Exception
    public function fudge(bufferedImage : BufferedImage, ratio : Float) : BufferedImage {
        var imageRatio : Float = (bufferedImage.getWidth() / bufferedImage.getHeight());
        var point : Point = new Point();
        var newHeight : Int = bufferedImage.getHeight();
        var newWidth : Int = bufferedImage.getWidth();
        if (ratio > imageRatio) {
            newWidth = Std.int((bufferedImage.getHeight() * ratio));
            point.x = (newWidth - bufferedImage.getWidth()) / 2;
        } else {
            newHeight = Std.int((bufferedImage.getWidth() / ratio));
            point.y = (newHeight - bufferedImage.getHeight()) / 2;
        }
        final commonLabels : CommonLabels = CommonLabels.getInstance();
        this.logUtil.putF(commonLabels.WIDTH_LABEL + bufferedImage.getWidth() + " newWidth: " + newWidth + commonLabels.HEIGHT_LABEL + bufferedImage.getHeight() + " newHeight: " + newHeight + " needed ratio: " + (newWidth / newHeight), this, "fudge");
        var newBufferedImage : BufferedImage = this.imageUtil.create(newWidth, newHeight);
        var g : Graphics2D = newBufferedImage.createGraphics();
        if (point.x > 0) {
            var firstColumnBufferedImage : BufferedImage = bufferedImage.getSubimage(0, 0, 1, bufferedImage.getHeight());
            var lastColumnBufferedImage : BufferedImage = bufferedImage.getSubimage(bufferedImage.getWidth() - 1, 0, 1, bufferedImage.getHeight());
            this.logUtil.putF("Draw some columns to fill in gap", this, "fudge");
            for (index in 0...point.x) {
                g.drawImage(firstColumnBufferedImage, index, 0, null);
                g.drawImage(lastColumnBufferedImage, newWidth - index, 0, null);
            }
        }
        if (point.y > 0) {
            var firstRowBufferedImage : BufferedImage = bufferedImage.getSubimage(0, 0, bufferedImage.getWidth(), 1);
            var lastRowBufferedImage : BufferedImage = bufferedImage.getSubimage(0, bufferedImage.getHeight() - 1, bufferedImage.getWidth(), 1);
            this.logUtil.putF("Draw some rows to fill in gap", this, "fudge");
            for (index in 0...point.y) {
                g.drawImage(firstRowBufferedImage, 0, index, null);
                g.drawImage(lastRowBufferedImage, 0, newHeight - index, null);
            }
        }
        g.drawImage(bufferedImage, point.x, point.y, bufferedImage.getWidth(), bufferedImage.getHeight(), null);
        return newBufferedImage;
    }

    // throws Exception
    public function fudge(bufferedImageArray : haxe.ds.Vector<BufferedImage>, totalImages : Int, ratio : Float) : haxe.ds.Vector<BufferedImage> {
        var end : Int = totalImages;
        if (bufferedImageArray.length < totalImages) {
            end = bufferedImageArray.length;
        }
        final fudgedBufferedImageArray : haxe.ds.Vector<BufferedImage> = haxe.ds.Vector.fromArrayCopy([for (index in 0...end) null]);
        for (index in 0...end) {
            fudgedBufferedImageArray[index] = fudge(bufferedImageArray[index], ratio);
        }
        return fudgedBufferedImageArray;
    }

}

