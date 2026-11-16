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
//import java.awt.Image;
//import java.awt.image.BufferedImage;

class ImageJ2SERotationUtil {
    private static final instance : ImageJ2SERotationUtil = new ImageJ2SERotationUtil();
    public static function getInstance() : ImageJ2SERotationUtil {
        return ImageJ2SERotationUtil.instance;
    }

    private final imageUtil : ImageUtil = ImageUtil.getInstance();
    private final imageJ2SEUtil : ImageJ2SEUtil = ImageJ2SEUtil.getInstance();
    public function new() {
    }

    public function getRotatedImage(bufferedImage : Image, totalAngle : Int) : BufferedImage {
        return this.getRotatedImageRadians(bufferedImage, TWO_PIE * totalAngle / 360.0);
    }

    public function getRotatedImageRadians(bufferedImage : Image, radians : Float) : BufferedImage {
        final newBufferedImage : BufferedImage = this.imageUtil.create(bufferedImage.getWidth(null), bufferedImage.getHeight(null));
        return this.drawRotatedImageRadians(bufferedImage, newBufferedImage, newBufferedImage.createGraphics(), radians);
    }

    private function drawRotatedImageRadians(bufferedImage : Image, newBufferedImage : BufferedImage, g : Graphics2D, radians : Float) : BufferedImage {
        g.rotate(radians, jre.lang.JavaNumber.divide(newBufferedImage.getWidth(null), 2), jre.lang.JavaNumber.divide(newBufferedImage.getHeight(null), 2));
        g.drawImage(bufferedImage, 0, 0, bufferedImage.getWidth(null), bufferedImage.getHeight(null), null);
        g.dispose();
        return newBufferedImage;
    }

    private final TWO_PIE : Float = 2 * Math.PI;
    public function rotateImage(bufferedImage : Image, newBufferedImage : BufferedImage, totalAngle : Int) : BufferedImage {
        final g : Graphics2D = newBufferedImage.createGraphics();
        g.setBackground(this.imageJ2SEUtil.TRANSPARENT_COLOR);
        g.clearRect(0, 0, newBufferedImage.getWidth(), newBufferedImage.getHeight());
        return this.drawRotatedImageRadians(bufferedImage, newBufferedImage, g, TWO_PIE * totalAngle / 360.0);
    }

    public function createRotatedImage(bufferedImage : Image, newBufferedImage : BufferedImage, totalAngle : Int) : BufferedImage {
        final g : Graphics2D = newBufferedImage.createGraphics();
        return this.drawRotatedImageRadians(bufferedImage, newBufferedImage, g, TWO_PIE * totalAngle / 360.0);
    }

    public function getRotatedImages(bufferedImage : Image, numberOfFrames : Int, totalAngle : Int) : haxe.ds.Vector<BufferedImage> {
        final bufferedImageArray : haxe.ds.Vector<BufferedImage> = haxe.ds.Vector.fromArrayCopy([for (index in 0...numberOfFrames) null]);
        final arc : Float = (this.TWO_PIE) * totalAngle / 360.0;
        final size : Int = bufferedImageArray.length;
        for (index in 0...size) {
            final radians : Float = (arc / size) * index;
            bufferedImageArray[index] = this.getRotatedImageRadians(bufferedImage, radians);
        }
        return bufferedImageArray;
    }

    public function createSpriteImage(bufferedImageArray : haxe.ds.Vector<BufferedImage>) : BufferedImage {
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
        final firstBufferedImage : BufferedImage = bufferedImageArray[0];
        final bufferedImage : BufferedImage = this.imageUtil.create(firstBufferedImage.getWidth(null) * columns, firstBufferedImage.getHeight(null) * rows);
        final g : Graphics2D = bufferedImage.createGraphics();
        var columnIndex : Int = 0;
        var rowIndex : Int = 0;
        var nextBufferedImage : BufferedImage = null;
        for (index in 0...size) {
            if (Std.int(index / 9) != 0 && index % 9 == 0) {
                rowIndex++;
                columnIndex = 0;
            }
            nextBufferedImage = bufferedImageArray[index];
            g.drawImage(nextBufferedImage, nextBufferedImage.getWidth(null) * columnIndex, nextBufferedImage.getHeight(null) * rowIndex, nextBufferedImage.getWidth(null), nextBufferedImage.getHeight(null), null);
            columnIndex++;
        }
        g.dispose();
        return bufferedImage;
    }

}

