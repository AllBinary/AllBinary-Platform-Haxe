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

import org.allbinary.game.configuration.feature.Features;
import org.allbinary.game.configuration.feature.GameFeatureFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;
import org.eclipse.swt.SWT;
import org.eclipse.swt.graphics.GC;
import org.eclipse.swt.graphics.ImageData;

class ImageSwtRotationUtil {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : ImageSwtRotationUtil = new ImageSwtRotationUtil();
    public static function getInstance() : ImageSwtRotationUtil {
        return ImageSwtRotationUtil.instance;
    }

    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    private final imageUtil : ImageUtil = ImageUtil.getInstance();
    private final gameFeatureFactory : GameFeatureFactory = GameFeatureFactory.getInstance();
    private final features : Features = Features.getInstance();
    private final NO_COPY : String = "SWT should not copy images after initial loading as the alpha is not honored";
    public function new() {
    }

    public function getRotatedImage(bufferedImage : org.eclipse.swt.graphics.Image, totalAngle : Int) : org.eclipse.swt.graphics.Image {
        if (!this.features.isFeature(this.gameFeatureFactory.POST_IMAGE_LOADING_MODIFICATION)) {
            this.logUtil.putF(this.NO_COPY, this, this.commonStrings.CONSTRUCTOR);
            return bufferedImage;
        }
        return bufferedImage;
    }

    private function getRotatedImage2(bufferedImage : org.eclipse.swt.graphics.Image, newBufferedImage : org.eclipse.swt.graphics.Image, gc : GC, angle : Float) : org.eclipse.swt.graphics.Image {
        if (!this.features.isFeature(this.gameFeatureFactory.POST_IMAGE_LOADING_MODIFICATION)) {
            this.logUtil.putF(this.NO_COPY, this, this.commonStrings.CONSTRUCTOR);
            return bufferedImage;
        }
        return bufferedImage;
    }

    public function rotateImage(originalSwtImage : org.eclipse.swt.graphics.Image, newSwtImage : org.eclipse.swt.graphics.Image, gc : GC, totalAngle : Int) : org.eclipse.swt.graphics.Image {
        return this.getRotatedImage2(originalSwtImage, newSwtImage, gc, totalAngle);
    }

    public function getRotatedImageSWT(bufferedImage : org.eclipse.swt.graphics.Image, newSwtImage : org.eclipse.swt.graphics.Image, gc : GC, totalAngle : Int) : org.eclipse.swt.graphics.Image {
        return this.getRotatedImage2(bufferedImage, newSwtImage, gc, totalAngle);
    }

    public function getRotatedImages(bufferedImage : org.eclipse.swt.graphics.Image, numberOfFrames : Int, totalAngle : Int) : haxe.ds.Vector<org.eclipse.swt.graphics.Image> {
        final bufferedImageArray : haxe.ds.Vector<org.eclipse.swt.graphics.Image> = haxe.ds.Vector.fromArrayCopy([for (index in 0...numberOfFrames) null]);
        var angle : Int = 0;
        final size : Int = bufferedImageArray.length;
        for (index in 0...size) {
            angle = (Std.int(totalAngle / size)) * index;
            bufferedImageArray[index] = this.getRotatedImage(bufferedImage, angle);
        }
        return bufferedImageArray;
    }

    public function createSpriteImage(bufferedImageArray : haxe.ds.Vector<org.eclipse.swt.graphics.Image>) : org.eclipse.swt.graphics.Image {
        var columns : Int = 9;
        var rows : Int = 0;
        final size : Int = bufferedImageArray.length;
        if (size < columns) {
            columns = size;
        }
        rows = (Std.int(size / columns));
        if (size % columns != 0) {
            rows++;
        }
        final firstBufferedImage : org.eclipse.swt.graphics.Image = bufferedImageArray[0];
        var imageData : ImageData = firstBufferedImage.getImageData();
        final bufferedImage : org.eclipse.swt.graphics.Image = this.imageUtil.create(imageData.width * columns, imageData.height * rows);
        final gc : GC = new GC(bufferedImage);
        gc.setAntialias(SWT.ON);
        gc.setInterpolation(SWT.HIGH);
        var columnIndex : Int = 0;
        var rowIndex : Int = 0;
        var nextBufferedImage : org.eclipse.swt.graphics.Image = null;
        for (index in 0...size) {
            if (Std.int(index / 9) != 0 && index % 9 == 0) {
                rowIndex++;
                columnIndex = 0;
            }
            nextBufferedImage = bufferedImageArray[index];
            imageData = nextBufferedImage.getImageData();
            gc.drawImage(bufferedImage, 0, 0, bufferedImage.getBounds().width, bufferedImage.getBounds().height, imageData.width * columnIndex, imageData.height * rowIndex, imageData.width, imageData.height);
            columnIndex++;
        }
        gc.dispose();
        return bufferedImage;
    }

}

