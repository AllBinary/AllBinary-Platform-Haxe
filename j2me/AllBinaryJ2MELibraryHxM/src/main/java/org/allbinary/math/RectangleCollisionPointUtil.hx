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
package org.allbinary.math;

import org.allbinary.graphics.GPoint;
import org.allbinary.util.BasicArrayList;

class RectangleCollisionPointUtil {
    public function new() {
    }

    public static function allPointsInside(rectX1 : Int, rectY1 : Int, rectX2 : Int, rectY2 : Int, list : BasicArrayList) : Bool {
        final rectangleCollisionUtil : RectangleCollisionUtil = RectangleCollisionUtil.getInstance();
        var point : GPoint = null;
        {
            var index : Int = list.size();
            while (--index >= 0) {
            point = (cast list.objectArray[index] : GPoint);
            if (!rectangleCollisionUtil.isInside(rectX1, rectY1, rectX2, rectY2, point.getX(), point.getY())) {
                return false;
            }
            }
        }
        return true;
    }

    public static function allPointsInsideCell(rectX1 : Int, rectY1 : Int, rectX2 : Int, rectY2 : Int, list : BasicArrayList, xCellSize : Int, yCellSize : Int) : Bool {
        final rectangleCollisionUtil : RectangleCollisionUtil = RectangleCollisionUtil.getInstance();
        var point : GPoint = null;
        {
            var index : Int = list.size();
            while (--index >= 0) {
            point = (cast list.objectArray[index] : GPoint);
            if (!rectangleCollisionUtil.isInside(rectX1, rectY1, rectX2, rectY2, point.getX() * xCellSize, point.getY() * yCellSize)) {
                return false;
            }
            }
        }
        return true;
    }

}

