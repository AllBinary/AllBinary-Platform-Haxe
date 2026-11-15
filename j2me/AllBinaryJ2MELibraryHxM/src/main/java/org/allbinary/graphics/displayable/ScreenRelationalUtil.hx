// Generated Code Do Not Modify
package org.allbinary.graphics.displayable;

//import javax.microedition.lcdui.Image;

class ScreenRelationalUtil {
    private static final instance : ScreenRelationalUtil = new ScreenRelationalUtil();
    public static function getInstance() : ScreenRelationalUtil {
        return ScreenRelationalUtil.instance;
    }

    public function getScaleImage(image : Image) : Float {
        return this.getScaleWH(image.getWidth(), image.getHeight());
    }

    public function getScaleWH(aWidth : Int, aHeight : Int) : Float {
        return this.getScaleWHA(aWidth, aHeight, 20);
    }

    public function getScaleWHA(aWidth : Int, aHeight : Int, add : Int) : Float {
        final displayInfoSingleton : DisplayInfoSingleton = DisplayInfoSingleton.getInstance();
        final last : haxe.ds.Vector<Int> = displayInfoSingleton.getLast();
        final width : Float = last[displayInfoSingleton.WIDTH];
        final height : Float = last[displayInfoSingleton.HEIGHT];
        var largestSize : Float = width;
        if (largestSize < height) {
            largestSize = height;
        }
        var scale : Float = (largestSize) / aWidth;
        return scale;
    }

    public function getScaledHeight(aWidth : Int, aHeight : Int) : Int {
        return Std.int((this.getScaleWH(aWidth, aHeight) * aHeight));
    }

    public function getScaledHeightAdd(aWidth : Int, aHeight : Int, add : Int) : Int {
        return Std.int((this.getScaleWHA(aWidth, aHeight, add) * aHeight));
    }

    public function new() {
    }
}

