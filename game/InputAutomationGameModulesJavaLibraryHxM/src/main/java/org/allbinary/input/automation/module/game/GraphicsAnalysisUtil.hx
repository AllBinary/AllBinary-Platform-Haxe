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
package org.allbinary.input.automation.module.game;

//import java.awt.*;
//import java.awt.image.BufferedImage;
import org.allbinary.graphics.color.ColorCacheFactory;
import org.allbinary.graphics.color.ColorCacheable;
import org.allbinary.logic.util.cache.AutomaticCacheInterface;

class GraphicsAnalysisUtil {
    private static final MAX : Int = 122;
    public function new() {
    }

    // throws Exception
    public static function getNominator(bufferedImage : BufferedImage, min_x : Null<Int>, max_x : Null<Int>, y : Null<Int>) : Float {
        {
            var index : Int = Std.int(max_x);
            while (index > Std.int(min_x)) {
            var colorInteger : Null<Int> = Std.string(bufferedImage.getRGB(index, Std.int(y)));
            var automaticCacheInterface : AutomaticCacheInterface = ColorCacheFactory.getInstance();
            var colorCacheable : ColorCacheable = (cast automaticCacheInterface.get(colorInteger) : ColorCacheable);
            var color : Color = colorCacheable.getColor();
            if (color.getRed() < GraphicsAnalysisUtil.MAX && color.getGreen() < GraphicsAnalysisUtil.MAX && color.getBlue() < GraphicsAnalysisUtil.MAX) {
            } else {
                return index - Std.int(min_x);
            }
                index -= 1;
            }
        }
        return 0.0;
    }

}

