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

//import javax.microedition.lcdui.Image;
import org.allbinary.game.configuration.feature.Features;
import org.allbinary.game.configuration.feature.GameFeatureFactory;
import org.allbinary.graphics.displayable.DisplayInfoSingleton;
import org.allbinary.graphics.opengles.OpenGLFeatureFactory;
import org.allbinary.graphics.opengles.OpenGLUtil;
import org.allbinary.image.opengles.OpenGLESDeviceImageTranslate;
import org.allbinary.image.opengles.OpenGLESImage;
import org.allbinary.image.opengles.OpenGLESImageExclusionUtil;
import org.allbinary.image.opengles.OpenGLESImageProperties;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;
import org.eclipse.swt.graphics.ImageData;
import org.microemu.app.ui.swt.SwtDeviceComponent;
import org.microemu.device.swt.PostLoadSwtImmutableImageProcessor;
import org.microemu.device.swt.PostLoadSwtMutableImageProcessor;
import org.microemu.device.swt.SwtImmutableImage;
import org.microemu.device.swt.SwtMutableImage;

class ImageCopyUtil {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : ImageCopyUtil = new ImageCopyUtil();
    public static function getInstance() : ImageCopyUtil {
        return ImageCopyUtil.instance;
    }

    public function new() {
    }

    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    private final gameFeatureFactory : GameFeatureFactory = GameFeatureFactory.getInstance();
    private final features : Features = Features.getInstance();
    private final openGLFeatureFactory : OpenGLFeatureFactory = OpenGLFeatureFactory.getInstance();
    private final openGLUtil : OpenGLUtil = OpenGLUtil.getInstance();
    private final openGLESImageExclusionUtil : OpenGLESImageExclusionUtil = OpenGLESImageExclusionUtil.getInstance();
    private final NO_COPY : String = "SWT should not copy images after initial loading as the alpha is not honored";
    private final UNABLE : String = "Unable to scale image without dimensions";
    // throws Exception
    public function createImageForRotation(originalImage : Image) : Image {
        if (this.features.isFeature(this.openGLFeatureFactory.OPENGL)) {
            var image : Image = originalImage;
            image = this.openGLUtil.addImage(image);
            return image;
        } else {
            return this.createImage(originalImage);
        }
    }

    // throws Exception
    public function createImage(originalImage : Image) : Image {
        if (!this.features.isFeature(this.gameFeatureFactory.POST_IMAGE_LOADING_MODIFICATION)) {
            this.logUtil.putF(this.NO_COPY, this, this.commonStrings.CONSTRUCTOR);
            return originalImage;
        }
        var originalImage2 : Image = originalImage;
        if (this.features.isFeature(this.openGLFeatureFactory.OPENGL)) {
            if (originalImage.getType() >= OpenGLESImage.TYPE) {
                final openGLESImage : OpenGLESImage = ((cast originalImage : OpenGLESImage));
                originalImage2 = openGLESImage.openGLBitmap.getImage();
            }
        }
        var image : Image = null;
        if (originalImage2.isMutable()) {
            final originalMutableImage : SwtMutableImage = (cast originalImage2 : SwtMutableImage);
            image = new SwtMutableImage(SwtDeviceComponent.createImage(originalMutableImage.image.getImageData()));
        } else {
            final originalImmutableImage : SwtImmutableImage = (cast originalImage2 : SwtImmutableImage);
            image = new SwtMutableImage(SwtDeviceComponent.createImage(originalImmutableImage.image.getImageData()));
        }
        image = this.openGLUtil.addImage(image);
        return image;
    }

    // throws Exception
    public function createImageWH(originalImage : Image, width : Int, height : Int, mutable : Bool) : Image {
        var originalImage2 : Image = originalImage;
        if (!this.features.isFeature(this.gameFeatureFactory.POST_IMAGE_LOADING_MODIFICATION)) {
            this.logUtil.putF(this.NO_COPY, this, this.commonStrings.CONSTRUCTOR);
            return originalImage;
        }
        if (this.features.isFeature(this.openGLFeatureFactory.OPENGL)) {
            if (this.openGLESImageExclusionUtil.isCustomScaling(originalImage)) {
                return this.createImage2(originalImage, width, height, mutable);
            }
            if (originalImage.getType() >= OpenGLESImage.TYPE) {
                final openGLESImage : OpenGLESImage = ((cast originalImage : OpenGLESImage));
                originalImage2 = openGLESImage.openGLBitmap.getImage();
            }
        }
        var image : Image = null;
        if (originalImage2.isMutable() && mutable) {
            final originalMutableImage : SwtMutableImage = (cast originalImage2 : SwtMutableImage);
            if (originalMutableImage.getImage() != null) {
                final imageData2 : ImageData = originalMutableImage.image.getImageData();
                final imageData : ImageData = imageData2.scaledTo(width, height);
                image = new SwtMutableImage(SwtDeviceComponent.createImage(imageData));
            } else {
                image = new SwtMutableImage(originalMutableImage.getName(), new PostLoadSwtMutableImageProcessor(originalMutableImage));
            }
        } else {
            final originalImmutableImage : SwtImmutableImage = (cast originalImage2 : SwtImmutableImage);
            if (originalImmutableImage.getImage() != null) {
                final imageData2 : ImageData = originalImmutableImage.image.getImageData();
                if (width > 0 && height > 0) {
                    final imageData : ImageData = imageData2.scaledTo(width, height);
                    image = new SwtImmutableImage(originalImage.getName(), SwtDeviceComponent.createImage(imageData));
                } else {
                    this.logUtil.putF(UNABLE, this, this.commonStrings.CONSTRUCTOR);
                    image = new SwtImmutableImage(originalImmutableImage.getName(), new PostLoadSwtImmutableImageProcessor(originalImmutableImage));
                }
            } else {
                image = new SwtImmutableImage(originalImmutableImage.getName(), new PostLoadSwtImmutableImageProcessor(originalImmutableImage));
            }
        }
        image = this.openGLUtil.addImage(image);
        return image;
    }

    private final INFORMATION : String = "about_";
    private final LEADERBOARD : String = "leaderboard";
    // throws Exception
    public function createImage2(originalImage : Image, width : Int, height : Int, mutable : Bool) : Image {
        var originalImage2 : Image = originalImage;
        if (!this.features.isFeature(this.gameFeatureFactory.POST_IMAGE_LOADING_MODIFICATION)) {
            this.logUtil.putF(this.NO_COPY, this, this.commonStrings.CONSTRUCTOR);
            return originalImage;
        }
        var image : Image = null;
        if (this.features.isFeature(this.openGLFeatureFactory.OPENGL)) {
            final displayInfoSingleton : DisplayInfoSingleton = DisplayInfoSingleton.getInstance();
            if (originalImage.getType() >= OpenGLESImage.TYPE) {
                final openGLESImage : OpenGLESImage = ((cast originalImage : OpenGLESImage));
                final openGLESImageProperties : OpenGLESImageProperties = openGLESImage.openGLESImageProperties;
                final openGLWidth : Int = openGLESImage.openGLBitmap.getWidth();
                final openGLHeight : Int = openGLESImage.openGLBitmap.getHeight();
                openGLESImageProperties.scaleX2 = ((width) / openGLWidth);
                openGLESImageProperties.scaleX = openGLESImageProperties.scaleX2;
                openGLESImageProperties.scaleY2 = ((height) / openGLHeight);
                openGLESImageProperties.scaleY = openGLESImageProperties.scaleY2;
                openGLESImageProperties.scaleX = openGLESImageProperties.scaleX * 0.75;
                openGLESImageProperties.scaleY = openGLESImageProperties.scaleY * 0.75;
                if (originalImage.getHeight() % 2 != 0) {
                    openGLESImageProperties.scaleX2 += 1.0 / openGLWidth;
                    openGLESImageProperties.scaleY2 += 1.0 / openGLHeight;
                }
                image = openGLESImage;
            } else {
                image = originalImage;
                final openGLESImage : OpenGLESImage = (cast this.openGLUtil.addImage(image) : OpenGLESImage);
                final openGLESImageProperties : OpenGLESImageProperties = openGLESImage.openGLESImageProperties;
                openGLESImageProperties.scaleX2 = ((width) / openGLESImage.getWidth());
                openGLESImageProperties.scaleX = openGLESImageProperties.scaleX2;
                openGLESImageProperties.scaleY2 = ((height) / openGLESImage.getHeight());
                openGLESImageProperties.scaleY = openGLESImageProperties.scaleY2;
                if (image.getName().startsWith(this.INFORMATION)) {
                    openGLESImage.openGLESImageTranslate = new OpenGLESDeviceImageTranslate();
                    final openGLESDeviceImageTranslate : OpenGLESDeviceImageTranslate = (cast openGLESImage.openGLESImageTranslate : OpenGLESDeviceImageTranslate);
                    openGLESDeviceImageTranslate.translateX = displayInfoSingleton.getLastWidth() / 1.4 / openGLESImageProperties.scaleX;
                    openGLESDeviceImageTranslate.translateY = displayInfoSingleton.getLastHeight() / 4 / openGLESImageProperties.scaleY;
                    openGLESImageProperties.scaleX = openGLESImageProperties.scaleX * 0.25;
                    openGLESImageProperties.scaleY = openGLESImageProperties.scaleY * 0.25;
                } else {
                    openGLESImageProperties.scaleX = openGLESImageProperties.scaleX * 0.75;
                    openGLESImageProperties.scaleY = openGLESImageProperties.scaleY * 0.75;
                    if (image.getName().startsWith(this.LEADERBOARD)) {
                        openGLESImage.openGLESImageTranslate = new OpenGLESDeviceImageTranslate();
                        final openGLESDeviceImageTranslate : OpenGLESDeviceImageTranslate = (cast openGLESImage.openGLESImageTranslate : OpenGLESDeviceImageTranslate);
                        openGLESDeviceImageTranslate.translateX = -displayInfoSingleton.getLastWidth() / 40 / openGLESImageProperties.scaleX;
                    }
                    if (image.getName().startsWith(this.LEADERBOARD)) {
                    } else {
                        openGLESImageProperties.scaleX = 1.0;
                        openGLESImageProperties.scaleY = 1.0;
                    }
                }
                image = openGLESImage;
            }
        } else {
            if (originalImage2.isMutable() && mutable) {
                final originalMutableImage : SwtMutableImage = (cast originalImage2 : SwtMutableImage);
                if (originalMutableImage.getImage() != null) {
                    final imageData2 : ImageData = originalMutableImage.image.getImageData();
                    final imageData : ImageData = imageData2.scaledTo(width, height);
                    image = new SwtMutableImage(SwtDeviceComponent.createImage(imageData));
                } else {
                    image = new SwtMutableImage(originalMutableImage.getName(), new PostLoadSwtMutableImageProcessor(originalMutableImage));
                }
            } else {
                final originalImmutableImage : SwtImmutableImage = (cast originalImage2 : SwtImmutableImage);
                if (originalImmutableImage.getImage() != null) {
                    final imageData2 : ImageData = originalImmutableImage.image.getImageData();
                    final imageData : ImageData = imageData2.scaledTo(width, height);
                    image = new SwtImmutableImage(originalImage.getName(), SwtDeviceComponent.createImage(imageData));
                } else {
                    image = new SwtImmutableImage(originalImmutableImage.getName(), new PostLoadSwtImmutableImageProcessor(originalImmutableImage));
                }
            }
            image = this.openGLUtil.addImage(image);
        }
        return image;
    }

    // throws Exception
    public function createImageScale(originalImage : Image, canvasScale : Float, resize : Bool) : Image {
        if (!this.features.isFeature(this.gameFeatureFactory.POST_IMAGE_LOADING_MODIFICATION)) {
            this.logUtil.putF(this.NO_COPY, this, this.commonStrings.CONSTRUCTOR);
            return originalImage;
        }
        var newWidth : Int = Std.int((originalImage.getWidth() * canvasScale));
        var newHeight : Int = Std.int((originalImage.getHeight() * canvasScale));
        if (resize) {
            if (newWidth < newHeight) {
                newWidth = newHeight;
            }
            if (newHeight < newWidth) {
                newHeight = newWidth;
            }
        }
        final image : Image = this.createImageWH(originalImage, newWidth, newHeight, true);
        if (image.isMutable()) {
            var originalImageData : ImageData = ((cast originalImage.getImage() : org.eclipse.swt.graphics.Image)).getImageData();
            final mutableImage2 : SwtMutableImage = (cast image : SwtMutableImage);
            final halfWidthDelta : Int = (newWidth - originalImage.getWidth()) / 2;
            final halfHeightDelta : Int = (newHeight - originalImage.getHeight()) / 2;
            final originalPixelArray : haxe.ds.Vector<Int> = haxe.ds.Vector.fromArrayCopy([for (index in 0...originalImage.getWidth() * originalImage.getHeight()) 0]);
            final newPixelArray : haxe.ds.Vector<Int> = haxe.ds.Vector.fromArrayCopy([for (index in 0...image.getWidth() * image.getHeight()) 0]);
            final width : Int = originalImage.getWidth();
            final height : Int = originalImage.getHeight();
            for (i in 0...height) {
                originalImageData.getPixels(0, i, width, originalPixelArray, (i * width));
            }
            for (index in halfWidthDelta...width) {
                for (index2 in halfHeightDelta...height) {
                    newPixelArray[index + (index2 * width)] = originalPixelArray[(index - halfWidthDelta) + ((index2 - halfHeightDelta) * width)];
                }
            }
            ((cast mutableImage2.getImage() : org.eclipse.swt.graphics.Image)).getImageData().setPixels(0, 0, image.getWidth(), newPixelArray, 0);
            return image;
        } else {
            final originalImmutableImage : SwtImmutableImage = (cast image : SwtImmutableImage);
            var originalImageData : ImageData = ((cast originalImage.getImage() : org.eclipse.swt.graphics.Image)).getImageData();
            final halfWidthDelta : Int = (newWidth - originalImage.getWidth()) / 2;
            final halfHeightDelta : Int = (newHeight - originalImage.getHeight()) / 2;
            final originalPixelArray : haxe.ds.Vector<Int> = haxe.ds.Vector.fromArrayCopy([for (index in 0...originalImage.getWidth() * originalImage.getHeight()) 0]);
            final newPixelArray : haxe.ds.Vector<Int> = haxe.ds.Vector.fromArrayCopy([for (index in 0...image.getWidth() * image.getHeight()) 0]);
            final width : Int = originalImage.getWidth();
            final height : Int = originalImage.getHeight();
            for (i in 0...height) {
                originalImageData.getPixels(0, i, width, originalPixelArray, (i * width));
            }
            for (index in halfWidthDelta...width) {
                for (index2 in halfHeightDelta...height) {
                    newPixelArray[index + (index2 * width)] = originalPixelArray[(index - halfWidthDelta) + ((index2 - halfHeightDelta) * width)];
                }
            }
            ((cast originalImmutableImage.getImage() : org.eclipse.swt.graphics.Image)).getImageData().setPixels(0, 0, image.getWidth(), newPixelArray, 0);
            return image;
        }
    }

}

