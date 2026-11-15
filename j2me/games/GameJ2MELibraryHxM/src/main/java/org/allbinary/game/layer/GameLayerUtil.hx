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
package org.allbinary.game.layer;

import org.allbinary.graphics.displayable.DisplayInfoSingleton;
import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.view.ViewPositionBase;

class GameLayerUtil {
    public function new() {
    }

    public static function isOnScreen(layer : AllBinaryLayer) : Bool {
        var displayInfo : DisplayInfoSingleton = DisplayInfoSingleton.getInstance();
        var viewPosition : ViewPositionBase = layer.getViewPosition();
        return GameLayerUtil.isInside(viewPosition.getX(), viewPosition.getY(), viewPosition.getX2(), viewPosition.getY2(), 0, 0, displayInfo.getLastWidth(), displayInfo.getLastHeight());
    }

    public static function isInside(rectX1 : Int, rectY1 : Int, rectX2 : Int, rectY2 : Int, rect2X1 : Int, rect2Y1 : Int, rect2X2 : Int, rect2Y2 : Int) : Bool {
        if (rectX1 > rect2X1 && rectX2 < rect2X2 && rectY1 > rect2Y1 && rectY2 < rect2Y2) {
            return true;
        } else {
            return false;
        }
    }

}

