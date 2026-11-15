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

//import javax.microedition.lcdui.Image;
import org.allbinary.game.configuration.feature.Features;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.opengles.OpenGLFeatureFactory;
import org.allbinary.image.opengles.ModifierOpenGLESImageProcessor;
import org.allbinary.image.opengles.OpenGLESImage;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;
import org.allbinary.logic.communication.log.PreLogUtil;
import org.eclipse.swt.graphics.ImageData;
import org.microemu.device.swt.SwtImmutableImage;
import org.microemu.device.swt.SwtMutableImage;

class ImageModifierUtil {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : ImageModifierUtil = new ImageModifierUtil();
    public static function getInstanceOrCreate() : ImageModifierUtil {
        return ImageModifierUtil.instance;
    }

    private final imageCopyUtil : ImageCopyUtil = ImageCopyUtil.getInstance();
    private final features : Features = Features.getInstance();
    public function setBasicColorP(basicColor : BasicColor) : Void {
    }

    public function setColor(unusedOriginalImage : Image, image : Image, imageIndex : Int, basicColor : BasicColor) : Void {
        var newBufferedImage : org.eclipse.swt.graphics.Image = null;
        if (image.isMutable()) {
            final swtImage : SwtMutableImage = (cast image : SwtMutableImage);
            newBufferedImage = (cast swtImage.getImage() : org.eclipse.swt.graphics.Image);
        } else {
            final swtImage : SwtImmutableImage = (cast image : SwtImmutableImage);
            newBufferedImage = (cast swtImage.getImage() : org.eclipse.swt.graphics.Image);
        }
        final r : Int = basicColor.red;
        final g : Int = basicColor.green;
        final b : Int = basicColor.blue;
        final width : Int = image.getWidth();
        final height : Int = image.getHeight();
        final imageData : ImageData = newBufferedImage.getImageData();
        if (imageData.depth == 24) {
            var rx : Int = 0;
            var gx : Int = 0;
            var bx : Int = 0;
            var index3 : Int = 0;
            for (index in 0...width) {
                for (index2 in 0...height) {
                    index3 = (index2 * imageData.bytesPerLine) + (index * 4);
                    rx = (imageData.data[index3] & 0xFF) << 16;
                    gx = (imageData.data[index3 + 1] & 0xFF) << 8;
                    bx = (imageData.data[index3 + 2] & 0xFF);
                    if (rx != 0 || gx != 0 || bx != 0) {
                        imageData.data[index3] = r;
                        imageData.data[index3 + 1] = g;
                        imageData.data[index3 + 2] = b;
                    }
                }
            }
        }
    }

    public function changeColor(unusedOriginalImage : Image, image : Image, imageIndex : Int, basicColor : BasicColor) : Void {
        if (this.features.isFeature(OpenGLFeatureFactory.getInstance().OPENGL)) {
            if (image.getType() >= OpenGLESImage.TYPE) {
                final openGLESImage : OpenGLESImage = ((cast image : OpenGLESImage));
                openGLESImage.imageProcessor = ModifierOpenGLESImageProcessor.getInstance();
                openGLESImage.openGLESImageProperties.redf = basicColor.getRedComponent();
                openGLESImage.openGLESImageProperties.greenf = basicColor.getGreenComponent();
                openGLESImage.openGLESImageProperties.bluef = basicColor.getBlueComponent();
                return;
            }
        }
        var newBufferedImage : org.eclipse.swt.graphics.Image = null;
        if (image.isMutable()) {
            final swtImage : SwtMutableImage = (cast image : SwtMutableImage);
            newBufferedImage = (cast swtImage.getImage() : org.eclipse.swt.graphics.Image);
        } else {
            final swtImage : SwtImmutableImage = (cast image : SwtImmutableImage);
            newBufferedImage = (cast swtImage.getImage() : org.eclipse.swt.graphics.Image);
        }
        final MAX : Float = 255.0;
        final r : Float = (basicColor.red) / MAX;
        final g : Float = (basicColor.green) / MAX;
        final b : Float = (basicColor.blue) / MAX;
        var rx : Int = 0;
        var gx : Int = 0;
        var bx : Int = 0;
        final imageData : ImageData = newBufferedImage.getImageData();
        if (imageData.depth == 24) {
            final size : Int = imageData.data.length;
            {
                var index : Int = 0;
                while (index < size) {
                rx = (imageData.data[index] & 0xFF) << 16;
                gx = (imageData.data[index + 1] & 0xFF) << 8;
                bx = (imageData.data[index + 2] & 0xFF);
                rx = Std.int(rx * r);
                gx = Std.int(gx * g);
                bx = Std.int(bx * b);
                imageData.data[index] = rx;
                imageData.data[index + 1] = gx;
                imageData.data[index + 2] = bx;
                    index += 4;
                }
            }
        }
    }

    public function setAlpha(unusedOriginalImage : Image, image : Image, imageIndex : Int, alphaInt : Int) : Void {
        if (this.features.isFeature(OpenGLFeatureFactory.getInstance().OPENGL)) {
            if (image.getType() >= OpenGLESImage.TYPE) {
                final openGLESImage : OpenGLESImage = ((cast image : OpenGLESImage));
                openGLESImage.imageProcessor = ModifierOpenGLESImageProcessor.getInstance();
                openGLESImage.openGLESImageProperties.alphaf = (alphaInt) / 255.0;
                return;
            }
        }
        this.setAlphaSWT(image, alphaInt);
    }

    public function setAlphaSWT(image : Image, alphaInt : Int) : Void {
        var alpha : Int = alphaInt;
        var newBufferedImage : org.eclipse.swt.graphics.Image = null;
        if (image.isMutable()) {
            final swtImage : SwtMutableImage = (cast image : SwtMutableImage);
            newBufferedImage = (cast swtImage.getImage() : org.eclipse.swt.graphics.Image);
        } else {
            final swtImage : SwtImmutableImage = (cast image : SwtImmutableImage);
            newBufferedImage = (cast swtImage.getImage() : org.eclipse.swt.graphics.Image);
        }
        newBufferedImage.getImageData().alpha = alpha;
    }

    public function getImageArray(originalImageArray : haxe.ds.Vector<Image>) : haxe.ds.Vector<Image> {
        try {
            final newImageArray : haxe.ds.Vector<Image> = haxe.ds.Vector.fromArrayCopy([for (index in 0...originalImageArray.length) null]);
            final size : Int = newImageArray.length;
            var originalImage : Image = null;
            for (index in 0...size) {
                originalImage = originalImageArray[index];
                final image : Image = this.imageCopyUtil.createImage(originalImage);
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

