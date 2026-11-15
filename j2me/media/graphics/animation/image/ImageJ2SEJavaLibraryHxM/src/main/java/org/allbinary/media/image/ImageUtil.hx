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

//import java.awt.Graphics2D;
//import java.awt.GraphicsConfiguration;
//import java.awt.GraphicsDevice;
//import java.awt.GraphicsEnvironment;
//import java.awt.Transparency;
//import java.awt.geom.AffineTransform;
//import java.awt.image.BufferedImage;
import javax.microedition.lcdui.Image;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.string.CommonLabels;
import org.allbinary.string.CommonSeps;
import org.allbinary.string.CommonStrings;
import org.microemu.device.j2se.J2SEImmutableImage;
import org.microemu.device.j2se.J2SEMutableImage;

class ImageUtil {
    private static final instance : ImageUtil = new ImageUtil();
    public static function getInstance() : ImageUtil {
        return ImageUtil.instance;
    }

    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    private final commonSeps : CommonSeps = CommonSeps.getInstance();
    private var IIOIMAGE_POOL_NAME : String = "IIOIMAGE_POOL_NAME";
    private final CREATE_BUFFERED_IMAGE : String = "createBufferedImage";
    public function new() {
    }

    private function getDefaultConfiguration() : GraphicsConfiguration {
        final ge : GraphicsEnvironment = GraphicsEnvironment.getLocalGraphicsEnvironment();
        final gd : GraphicsDevice = ge.getDefaultScreenDevice();
        return gd.getDefaultConfiguration();
    }

    public function create(width : Int, height : Int) : BufferedImage {
        final graphicsConfiguration : GraphicsConfiguration = this.getDefaultConfiguration();
        return graphicsConfiguration.createCompatibleImage(width, height, Transparency.TRANSLUCENT);
    }

    // throws Exception
    public function createBufferedImageForResize(bufferedImageArray : haxe.ds.Vector<BufferedImage>, percent : Int, scale : Bool) : haxe.ds.Vector<BufferedImage> {
        final size : Int = bufferedImageArray.length;
        final scaledBufferedImageArray : haxe.ds.Vector<BufferedImage> = haxe.ds.Vector.fromArrayCopy([for (index in 0...size) null]);
        var bufferedImage : BufferedImage = null;
        for (index in 0...size) {
            bufferedImage = bufferedImageArray[index];
            final newWidth : Int = Std.int((bufferedImage.getWidth() * percent / 100));
            final newHeight : Int = Std.int((bufferedImage.getHeight() * percent / 100));
            scaledBufferedImageArray[index] = this.createBufferedImage(bufferedImage, newWidth, newHeight, scale);
        }
        return scaledBufferedImageArray;
    }

    // throws Exception
    public function createBufferedImage2(bufferedImageArray : haxe.ds.Vector<BufferedImage>, percent : Float, scale : Bool) : haxe.ds.Vector<BufferedImage> {
        final size : Int = bufferedImageArray.length;
        final scaledBufferedImageArray : haxe.ds.Vector<BufferedImage> = haxe.ds.Vector.fromArrayCopy([for (index in 0...size) null]);
        var bufferedImage : BufferedImage = null;
        for (index in 0...size) {
            bufferedImage = bufferedImageArray[index];
            final newWidth : Int = Std.int((bufferedImage.getWidth() * percent));
            final newHeight : Int = Std.int((bufferedImage.getHeight() * percent));
            scaledBufferedImageArray[index] = this.createBufferedImage(bufferedImage, newWidth, newHeight, scale);
        }
        return scaledBufferedImageArray;
    }

    // throws Exception
    public function createBufferedImage3(bufferedImageArray : haxe.ds.Vector<BufferedImage>, width : Int, height : Int, scale : Bool) : haxe.ds.Vector<BufferedImage> {
        final size : Int = bufferedImageArray.length;
        final scaledBufferedImageArray : haxe.ds.Vector<BufferedImage> = haxe.ds.Vector.fromArrayCopy([for (index in 0...size) null]);
        for (index in 0...size) {
            scaledBufferedImageArray[index] = this.createBufferedImage(bufferedImageArray[index], width, height, scale);
        }
        return scaledBufferedImageArray;
    }

    // throws Exception
    public function createBufferedImageForSave(bufferedImage : BufferedImage, newWidth : Int, newHeight : Int) : BufferedImage {
        return this.createBufferedImage(bufferedImage, newWidth, newHeight, true);
    }

    // throws Exception
    public function createBufferedImage(bufferedImage : BufferedImage, newWidth : Int, newHeight : Int, scale : Bool) : BufferedImage {
        return this.createBufferedImageAllowTranslate(bufferedImage, newWidth, newHeight, scale, false);
    }

    // throws Exception
    public function createBufferedImageAllowTranslate(bufferedImage : BufferedImage, newWidth : Int, newHeight : Int, scale : Bool, allowTranslate : Bool) : BufferedImage {
        final width : Float = bufferedImage.getWidth();
        final height : Float = bufferedImage.getHeight();
        final d_newWidth : Float = newWidth;
        final d_newHeight : Float = newHeight;
        final widthRatio : Float = d_newWidth / width;
        final heightRatio : Float = d_newHeight / height;
        var ratioX : Float = 1.0;
        var ratioY : Float = 1.0;
        if (scale) {
            ratioX = widthRatio;
            ratioY = heightRatio;
        }
        final affineTransform : AffineTransform = AffineTransform.getScaleInstance(ratioX, ratioY);
        if (!scale && allowTranslate) {
            final dx : Float = (newWidth - width) / 2.0;
            final dy : Float = (newHeight - height) / 2.0;
            affineTransform.translate(dx, dy);
        }
        final newBufferedImage : BufferedImage = new BufferedImage(newWidth, newHeight, BufferedImage.TYPE_INT_ARGB_PRE);
        final graphics : Graphics2D = newBufferedImage.createGraphics();
        graphics.drawRenderedImage(bufferedImage, affineTransform);
        return newBufferedImage;
    }

    // throws Exception
    public function createBufferedImageWithLargerCanvas(bufferedImage : BufferedImage, newWidth : Int, newHeight : Int) : BufferedImage {
        final width : Float = bufferedImage.getWidth();
        final height : Float = bufferedImage.getHeight();
        final d_newWidth : Float = newWidth;
        final d_newHeight : Float = newHeight;
        final widthRatio : Float = d_newWidth / width;
        final heightRatio : Float = d_newHeight / height;
        final dx2 : Int = Std.int((newWidth - width));
        final dy2 : Int = Std.int((newHeight - height));
        final dx : Int = Std.int(dx2 / 2);
        final dy : Int = Std.int(dy2 / 2);
        final dx4 : Int = Std.int(dx2 / 4);
        final dy4 : Int = Std.int(dy2 / 4);
        final newBufferedImage : BufferedImage = new BufferedImage(newWidth, newHeight, BufferedImage.TYPE_INT_ARGB_PRE);
        final graphics : Graphics2D = newBufferedImage.createGraphics();
        graphics.drawImage(bufferedImage, dx4, dy4, null);
        return newBufferedImage;
    }

    public function convertToBufferedImage(toolkitImage : jre.awt.Image) : BufferedImage {
        if (toolkitImage == null) {
            return null;
        }
        final bufferedImage : BufferedImage = new BufferedImage(toolkitImage.getWidth(null), toolkitImage.getHeight(null), BufferedImage.TYPE_INT_ARGB);
        final g2d : Graphics2D = bufferedImage.createGraphics();
        g2d.drawImage(toolkitImage, 0, 0, null);
        g2d.dispose();
        return bufferedImage;
    }

    public function getBufferedImage(image : Image) : BufferedImage {
        var bufferedImage : BufferedImage = null;
        if (image.isMutable()) {
            final j2seImage : J2SEMutableImage = (cast image : J2SEMutableImage);
            bufferedImage = (cast j2seImage.getImage() : BufferedImage);
        } else {
            final j2seImage : J2SEImmutableImage = (cast image : J2SEImmutableImage);
            bufferedImage = (cast j2seImage.getImage() : BufferedImage);
        }
        return bufferedImage;
    }

    public function toString(bufferedImage : BufferedImage) : String {
        final commonLabels : CommonLabels = CommonLabels.getInstance();
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(" BufferedImage -");
        stringBuffer.append(commonLabels.WIDTH_LABEL);
        stringBuffer.appendint(Std.int(bufferedImage.getWidth()));
        stringBuffer.append(commonLabels.HEIGHT_LABEL);
        stringBuffer.appendint(Std.int(bufferedImage.getHeight()));
        stringBuffer.append(" Type: ");
        stringBuffer.appendint(Std.int(bufferedImage.getType()));
        return Std.string(stringBuffer);
    }

}

