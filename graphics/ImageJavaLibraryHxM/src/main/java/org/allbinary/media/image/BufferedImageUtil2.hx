// Generated Code Do Not Modify
package org.allbinary.media.image;

//import java.awt.*;
//import java.awt.image.BufferedImage;

class BufferedImageUtil2 {
    private static final instance : BufferedImageUtil2 = new BufferedImageUtil2();
    public static function getInstance() : BufferedImageUtil2 {
        return BufferedImageUtil2.instance;
    }

    private final imageUtil : ImageUtil = ImageUtil.getInstance();
    public function createSpriteImage(bufferedImageArray : haxe.ds.Vector<BufferedImage>) : BufferedImage {
        var columns : Int = bufferedImageArray.length;
        var max : Int = columns;
        var rows : Int = 0;
        if (bufferedImageArray.length < columns) {
            columns = bufferedImageArray.length;
        }
        rows = (Std.int(bufferedImageArray.length / columns));
        if (bufferedImageArray.length % columns != 0) {
            rows++;
        }
        var bufferedImage : BufferedImage = this.imageUtil.create(bufferedImageArray[0].getWidth(null) * columns, bufferedImageArray[0].getHeight(null) * rows);
        var g : Graphics2D = bufferedImage.createGraphics();
        var columnIndex : Int = 0;
        var rowIndex : Int = 0;
        for (index in 0...bufferedImageArray.length) {
            if (Std.int(index / max) != 0 && index % max == 0) {
                rowIndex++;
                columnIndex = 0;
            }
            g.drawImage(bufferedImageArray[index], bufferedImageArray[index].getWidth(null) * columnIndex, bufferedImageArray[index].getHeight(null) * rowIndex, bufferedImageArray[index].getWidth(null), bufferedImageArray[index].getHeight(null), null);
            columnIndex++;
        }
        g.dispose();
        return bufferedImage;
    }

    public function new() {
    }
}

