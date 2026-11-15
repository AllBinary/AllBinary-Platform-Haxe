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

class ImageUnifierUtil {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : ImageUnifierUtil = new ImageUnifierUtil();
    public static function getInstance() : ImageUnifierUtil {
        return ImageUnifierUtil.instance;
    }

    private final imageUtil : ImageUtil = ImageUtil.getInstance();
    public function new() {
    }

    public function getDefaultConfiguration() : GraphicsConfiguration {
        var ge : GraphicsEnvironment = GraphicsEnvironment.getLocalGraphicsEnvironment();
        var gd : GraphicsDevice = ge.getDefaultScreenDevice();
        return gd.getDefaultConfiguration();
    }

    public function getImage(bufferedImageArray : haxe.ds.Vector<BufferedImage>, imageUnifierProperties : ImageUnifierProperties) : BufferedImage {
        var newBufferedImage : BufferedImage = this.imageUtil.create(imageUnifierProperties.getWidth(), imageUnifierProperties.getHeight());
        final commonLabels : CommonLabels = CommonLabels.getInstance();
        this.logUtil.putF("Setting Image - " + commonLabels.WIDTH_LABEL + newBufferedImage.getWidth() + commonLabels.HEIGHT_LABEL + newBufferedImage.getHeight(), this, "getImage");
        var g : Graphics2D = newBufferedImage.createGraphics();
        var columnIndex : Int = 0;
        var rowIndex : Int = 0;
        for (index in 0...bufferedImageArray.length) {
            var x : Int = Std.int(imageUnifierProperties.getImageUnifierCell().getWidth()) * columnIndex++;
            var y : Int = Std.int(imageUnifierProperties.getImageUnifierCell().getHeight()) * rowIndex;
            this.logUtil.putF("Adding Image: " + index + " x: " + x + " y: " + y, this, "getImage");
            g.drawImage(bufferedImageArray[index], x, y, Std.int(imageUnifierProperties.getImageUnifierCell().getWidth()), Std.int(imageUnifierProperties.getImageUnifierCell().getHeight()), null);
            var totalColumnsMinusOne : Int = (Std.int(imageUnifierProperties.getColumns()) - 1);
            if (columnIndex > totalColumnsMinusOne) {
                rowIndex++;
                columnIndex = 0;
            }
        }
        g.dispose();
        return newBufferedImage;
    }

}

