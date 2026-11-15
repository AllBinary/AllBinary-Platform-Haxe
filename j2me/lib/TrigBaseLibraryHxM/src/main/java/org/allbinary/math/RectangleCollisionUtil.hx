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

import jsinterop.annotations.JsType;
import jsinterop.annotations.JsMethod;
import jsinterop.annotations.JsConstructor;

class RectangleCollisionUtil {
    private static final instance : RectangleCollisionUtil = new RectangleCollisionUtil();
    public static function getInstance() : RectangleCollisionUtil {
        return RectangleCollisionUtil.instance;
    }

    public function new() {
    }

    public function isCollision(rectX1 : Int, rectY1 : Int, rectX2 : Int, rectY2 : Int, rect2X1 : Int, rect2Y1 : Int, rect2X2 : Int, rect2Y2 : Int) : Bool {
        if (rect2X1 >= rectX2 || rect2Y1 >= rectY2 || rect2X2 <= rectX1 || rect2Y2 <= rectY1) {
            return false;
        } else {
            return true;
        }
    }

    public function isInside(rectX1 : Int, rectY1 : Int, rectX2 : Int, rectY2 : Int, x : Int, y : Int) : Bool {
        if (x >= rectX2 || y >= rectY2 || x <= rectX1 || y <= rectY1) {
            return false;
        } else {
            return true;
        }
    }

}

