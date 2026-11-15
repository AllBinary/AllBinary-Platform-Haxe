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

class PointFactory {
    private static var pointArray : haxe.ds.Vector<haxe.ds.Vector<Point>> = haxe.ds.Vector.fromArrayCopy([for (index in 0...3000) haxe.ds.Vector.fromArrayCopy([for (index2 in 0...3000) null])]);
    public function new() {
    }

    public static function getInstance(x : Int, y : Int) : Point {
        var point : Point = PointFactory.pointArray[x][y];
        if (point == null) {
            PointFactory.pointArray[x][y] = new Point(x, y);
            point = PointFactory.pointArray[x][y];
        }
        return point;
    }

}

