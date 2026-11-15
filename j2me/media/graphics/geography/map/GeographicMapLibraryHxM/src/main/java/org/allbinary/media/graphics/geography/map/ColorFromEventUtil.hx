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
package org.allbinary.media.graphics.geography.map;

import org.allbinary.game.displayable.canvas.AllBinaryGameCanvas;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.color.BasicColorFactory;

class ColorFromEventUtil {
    private static final instance : ColorFromEventUtil = new ColorFromEventUtil();
    public static function getInstance() : ColorFromEventUtil {
        return ColorFromEventUtil.instance;
    }

    private final YELLOW : BasicColor = BasicColorFactory.getInstance().YELLOW;
    public final COLOR_INT : Int = Std.int(this.YELLOW);
    public function getForegroundColor(gameCanvasInterface : AllBinaryGameCanvas) : BasicColor {
        var color : BasicColor = this.YELLOW;
        final geographicMapCompositeInterface : GeographicMapCompositeInterface = (cast gameCanvasInterface.getLayerManager() : GeographicMapCompositeInterface);
        final geographicMapInterface : BasicGeographicMap = geographicMapCompositeInterface.getGeographicMapInterface()[0];
        if (geographicMapInterface != null) {
            final foregroundBasicColor : BasicColor = geographicMapInterface.getForegroundBasicColor();
            color = foregroundBasicColor;
        }
        return color;
    }

    public function new() {
    }
}

