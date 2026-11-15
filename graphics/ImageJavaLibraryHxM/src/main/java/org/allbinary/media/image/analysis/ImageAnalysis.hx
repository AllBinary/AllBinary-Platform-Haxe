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
package org.allbinary.media.image.analysis;

//import java.awt.*;
//import java.awt.image.BufferedImage;
import org.allbinary.graphics.color.ColorCacheFactory;
import org.allbinary.graphics.color.ColorCacheable;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonLabels;
import org.allbinary.string.CommonStrings;

class ImageAnalysis {
    private static final instance : ImageAnalysis = new ImageAnalysis();
    public static function getInstance() : ImageAnalysis {
        return ImageAnalysis.instance;
    }

    public final logUtil : LogUtil = LogUtil.getInstance();
    public function new() {
    }

    // throws Exception
    public function process(bufferedImageArray : haxe.ds.Vector<BufferedImage>, colorRangeInterface : ColorRangeInterface) : haxe.ds.Vector<ImageAnalysisResults> {
        final commonStrings : CommonStrings = CommonStrings.getInstance();
        this.logUtil.putF(CommonLabels.getInstance().START + colorRangeInterface.toString(), this, commonStrings.PROCESS);
        var imageAnalysisResultsArray : haxe.ds.Vector<ImageAnalysisResults> = haxe.ds.Vector.fromArrayCopy([for (index in 0...bufferedImageArray.length) null]);
        for (index in 0...bufferedImageArray.length) {
            imageAnalysisResultsArray[index] = ImageAnalysis.process(bufferedImageArray[index], colorRangeInterface);
        }
        return imageAnalysisResultsArray;
    }

    // throws Exception
    public static function process(bufferedImage : BufferedImage, colorRangeInterface : ColorRangeInterface) : ImageAnalysisResults {
        var imageAnalysisResults : ImageAnalysisResults = new ImageAnalysisResults();
        var redTotal : haxe.Int64 = 0;
        var greenTotal : haxe.Int64 = 0;
        var blueTotal : haxe.Int64 = 0;
        for (indexY in 0...bufferedImage.getHeight()) {
            for (indexX in 0...bufferedImage.getWidth()) {
                var keyInteger : Null<Int> = Std.string(bufferedImage.getRGB(indexX, indexY));
                var colorCacheable : ColorCacheable = (cast ColorCacheFactory.getInstance().get(keyInteger) : ColorCacheable);
                var color : Color = colorCacheable.getColor();
                ImageAnalysis.processColorRangeResults(imageAnalysisResults, colorRangeInterface, color);
                ImageAnalysis.processImageColorResults(imageAnalysisResults.getImageColorResults(), colorRangeInterface, color);
                redTotal += color.getRed();
                greenTotal += color.getGreen();
                blueTotal += color.getBlue();
            }
        }
        var totalPixels : haxe.Int64 = imageAnalysisResults.getImageColorRangeResults().getTotalPixelsChecked();
        final colorAverage : ColorAverage = imageAnalysisResults.getImageColorResults().getColorAverage();
        colorAverage.setAvgRed(haxe.Int64.toInt(redTotal) / haxe.Int64.toInt(totalPixels));
        colorAverage.setAvgGreen(haxe.Int64.toInt(greenTotal) / haxe.Int64.toInt(totalPixels));
        colorAverage.setAvgBlue(haxe.Int64.toInt(blueTotal) / haxe.Int64.toInt(totalPixels));
        return imageAnalysisResults;
    }

    private static function processColorRangeResults(imageAnalysisResults : ImageAnalysisResults, colorRangeInterface : ColorRangeInterface, color : Color) : Void {
        if (colorRangeInterface.isInRange(color)) {
            imageAnalysisResults.getImageColorRangeResults().addMatchingPixelsChecked();
        } else {
        }
        imageAnalysisResults.getImageColorRangeResults().addTotalPixelsChecked();
    }

    private static function processImageColorResults(imageColorResults : ImageColorResults, colorRangeInterface : ColorRangeInterface, color : Color) : Void {
        if (color.getRed() < imageColorResults.getColorRange().getMinRed()) {
            imageColorResults.getColorRange().setMinRed(color.getRed());
        }
        if (color.getGreen() < imageColorResults.getColorRange().getMinGreen()) {
            imageColorResults.getColorRange().setMinGreen(color.getGreen());
        }
        if (color.getBlue() < imageColorResults.getColorRange().getMinBlue()) {
            imageColorResults.getColorRange().setMinBlue(color.getBlue());
        }
        if (color.getRed() > imageColorResults.getColorRange().getMaxRed()) {
            imageColorResults.getColorRange().setMaxRed(color.getRed());
        }
        if (color.getGreen() > imageColorResults.getColorRange().getMaxGreen()) {
            imageColorResults.getColorRange().setMaxGreen(color.getGreen());
        }
        if (color.getBlue() > imageColorResults.getColorRange().getMaxBlue()) {
            imageColorResults.getColorRange().setMaxBlue(color.getBlue());
        }
    }

}

