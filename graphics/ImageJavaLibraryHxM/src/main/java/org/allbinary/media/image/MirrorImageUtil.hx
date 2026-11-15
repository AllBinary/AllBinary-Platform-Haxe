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
//import java.awt.geom.AffineTransform;
//import java.awt.image.AffineTransformOp;
//import java.awt.image.BufferedImage;
import org.allbinary.logic.communication.log.LogUtil;

class MirrorImageUtil {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : MirrorImageUtil = new MirrorImageUtil();
    public static function getInstance() : MirrorImageUtil {
        return MirrorImageUtil.instance;
    }

    private final imageUtil : ImageUtil = ImageUtil.getInstance();
    public function new() {
    }

    public function getImage(bufferedImage : BufferedImage, verticle : Bool, horizontal : Bool) : BufferedImage {
        this.logUtil.putF("Starting", this, "getImage");
        var newBufferedImage : BufferedImage = this.imageUtil.create(bufferedImage.getWidth(null), bufferedImage.getHeight(null));
        var g : Graphics2D = newBufferedImage.createGraphics();
        if (verticle) {
            var tx : AffineTransform = AffineTransform.getScaleInstance(1, -1);
            tx.translate(0, -bufferedImage.getHeight(null));
            var op : AffineTransformOp = new AffineTransformOp(tx, AffineTransformOp.TYPE_NEAREST_NEIGHBOR);
            bufferedImage = op.filter(bufferedImage, null);
        }
        if (horizontal) {
            var tx : AffineTransform = AffineTransform.getScaleInstance(-1, 1);
            tx.translate(-bufferedImage.getWidth(null), 0);
            var op : AffineTransformOp = new AffineTransformOp(tx, AffineTransformOp.TYPE_NEAREST_NEIGHBOR);
            bufferedImage = op.filter(bufferedImage, null);
        }
        g.drawImage(bufferedImage, 0, 0, bufferedImage.getWidth(null), bufferedImage.getHeight(null), null);
        g.dispose();
        return newBufferedImage;
    }

    public function getImages(bufferedImage : BufferedImage, verticle : Bool, horizontal : Bool) : haxe.ds.Vector<BufferedImage> {
        var width : Int = bufferedImage.getWidth();
        var height : Int = bufferedImage.getHeight();
        var cellHeight : Int = height;
        var cellWidth : Int = height;
        var numberOfFramesPerOrientation : Int = Std.int(width / cellWidth);
        var numberOfFrames : Int = numberOfFramesPerOrientation;
        if (verticle) {
            numberOfFrames *= 2;
        }
        if (horizontal) {
            numberOfFrames *= 2;
        }
        this.logUtil.putF("numberOfFramesPerOrientation: " + numberOfFramesPerOrientation + " numberOfFrames: " + numberOfFrames, this, "getImages");
        final bufferedImageArray : haxe.ds.Vector<BufferedImage> = haxe.ds.Vector.fromArrayCopy([for (index in 0...numberOfFrames) null]);
        var y : Int = 0;
        for (index in 0...numberOfFramesPerOrientation) {
            var x : Int = index * cellWidth;
            bufferedImageArray[index] = bufferedImage.getSubimage(x, y, cellWidth, cellHeight);
        }
        for (index in 0...numberOfFramesPerOrientation) {
            bufferedImageArray[index + numberOfFramesPerOrientation] = this.getImage(bufferedImageArray[index], verticle, horizontal);
        }
        return bufferedImageArray;
    }

}

