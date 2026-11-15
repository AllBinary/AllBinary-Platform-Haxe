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
package org.allbinary.input.automation;

//import java.awt.*;

class PointHelper {
    private static final two : Float = 2.0;
    public function new() {
    }

    public static function getCenterPoint(rectangle : Rectangle) : Point {
        var x : Float = rectangle.getX() + rectangle.getWidth() / PointHelper.two;
        var y : Float = rectangle.getY() + rectangle.getHeight() / PointHelper.two;
        return PointFactory.getInstance(Std.int(x), Std.int(y));
    }

}

