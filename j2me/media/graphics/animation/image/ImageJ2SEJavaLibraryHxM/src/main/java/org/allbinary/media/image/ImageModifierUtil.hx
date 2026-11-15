/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2022 AllBinary 
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

//import java.awt.image.BufferedImage;
//import java.awt.image.ColorModel;
//import java.awt.image.WritableRaster;
//import javax.microedition.lcdui.Image;
import org.allbinary.graphics.Anchor;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.logic.communication.log.PreLogUtil;
import org.allbinary.string.CommonStrings;

class ImageModifierUtil {
    private static final instance : ImageModifierUtil = new ImageModifierUtil();
    public static function getInstanceOrCreate() : ImageModifierUtil {
        return ImageModifierUtil.instance;
    }

    private final imageUtil : ImageUtil = ImageUtil.getInstance();
    public function setBasicColorP(basicColor : BasicColor) : Void {
    }

    private final colorArray : haxe.ds.Vector<Int> = haxe.ds.Vector.fromArrayCopy([for (index in 0...1) 0]);
    public function setColor(unusedOriginalImage : Image, image : Image, imageIndex : Int, basicColor : BasicColor) : Void {
        final newBufferedImage : BufferedImage = this.imageUtil.getBufferedImage(image);
        final r : Int = basicColor.red;
        final g : Int = basicColor.green;
        final b : Int = basicColor.blue;
        final width : Int = image.getWidth();
        final height : Int = image.getHeight();
        var colorModel : ColorModel = null;
        var dataElements : Any = null;
        var ax : Int = 0;
        var rx : Int = 0;
        var gx : Int = 0;
        var bx : Int = 0;
        for (index in 0...width) {
            for (index2 in 0...height) {
                colorModel = newBufferedImage.getColorModel();
                dataElements = newBufferedImage.getRaster().getDataElements(index, index2, null);
                ax = colorModel.getAlpha(dataElements);
                rx = colorModel.getRed(dataElements);
                gx = colorModel.getGreen(dataElements);
                bx = colorModel.getBlue(dataElements);
                if (rx != 0 || gx != 0 || bx != 0) {
                    newBufferedImage.setRGB(index, index2, (ax << 24) | (r << 16) | (g << 8) | (b));
                }
            }
        }
    }

    public function changeColor(unusedOriginalImage : Image, image : Image, imageIndex : Int, basicColor : BasicColor) : Void {
        final newBufferedImage : BufferedImage = this.imageUtil.getBufferedImage(image);
        final MAX : Float = 255.0;
        final r : Float = (basicColor.red) / MAX;
        final g : Float = (basicColor.green) / MAX;
        final b : Float = (basicColor.blue) / MAX;
        final width : Int = image.getWidth();
        final height : Int = image.getHeight();
        var colorModel : ColorModel = null;
        var dataElements : Any = null;
        var ax : Int = 0;
        var rx : Int = 0;
        var gx : Int = 0;
        var bx : Int = 0;
        for (index in 0...width) {
            for (index2 in 0...height) {
                colorModel = newBufferedImage.getColorModel();
                dataElements = newBufferedImage.getRaster().getDataElements(index, index2, null);
                ax = colorModel.getAlpha(dataElements);
                rx = colorModel.getRed(dataElements);
                gx = colorModel.getGreen(dataElements);
                bx = colorModel.getBlue(dataElements);
                rx = Std.int(rx * r);
                gx = Std.int(gx * g);
                bx = Std.int(bx * b);
                newBufferedImage.setRGB(index, index2, (ax << 24) | (rx << 16) | (gx << 8) | (bx));
            }
        }
    }

    public function setAlpha(unusedOriginalImage : Image, image : Image, imageIndex : Int, alphaInt : Int) : Void {
        var alpha : Int = alphaInt;
        final newBufferedImage : BufferedImage = this.imageUtil.getBufferedImage(image);
        final width : Int = image.getWidth();
        final height : Int = image.getHeight();
        final raster : WritableRaster = newBufferedImage.getAlphaRaster();
        for (index in 0...width) {
            for (index2 in 0...height) {
                raster.getPixel(index, index2, this.colorArray);
                this.colorArray[0] = alpha & this.colorArray[0];
                raster.setPixel(index, index2, this.colorArray);
            }
        }
    }

    public function getImageArray(originalImageArray : haxe.ds.Vector<Image>) : haxe.ds.Vector<Image> {
        try {
            final newImageArray : haxe.ds.Vector<Image> = haxe.ds.Vector.fromArrayCopy([for (index in 0...originalImageArray.length) null]);
            final size : Int = newImageArray.length;
            var originalImage : Image = null;
            for (index in 0...size) {
                originalImage = originalImageArray[index];
                final image : Image = ImageCreationUtil.getInstance().createImageWH(originalImage.getWidth(), originalImage.getHeight());
                image.getGraphics().drawImage(originalImage, 0, 0, Anchor.TOP_LEFT);
                newImageArray[index] = image;
            }
            return newImageArray;
        } catch (e : haxe.Exception) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            PreLogUtil.putOE(commonStrings.EXCEPTION, this, "getImageArray", e);
            return originalImageArray;
        }
    }

    public function handleImage(imageArray : haxe.ds.Vector<Image>, index : Int, image : Image) : Void {
    }

    public function reset() : Void {
    }

    public function new() {
    }
}

