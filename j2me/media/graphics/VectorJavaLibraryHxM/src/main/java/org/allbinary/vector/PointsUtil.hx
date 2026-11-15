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
package org.allbinary.vector;


class PointsUtil {
    private static final instance : PointsUtil = new PointsUtil();
    public static function getInstance() : PointsUtil {
        return PointsUtil.instance;
    }

    public function adjustXY(points : haxe.ds.Vector<haxe.ds.Vector<haxe.ds.Vector<Int>>>, x : Int, y : Int) : haxe.ds.Vector<haxe.ds.Vector<haxe.ds.Vector<Int>>> {
        final size : Int = points.length;
        final newPoints : haxe.ds.Vector<haxe.ds.Vector<haxe.ds.Vector<Int>>> = haxe.ds.Vector.fromArrayCopy([for (index in 0...size) haxe.ds.Vector.fromArrayCopy([for (index2 in 0...0) haxe.ds.Vector.fromArrayCopy([for (index3 in 0...0) 0])])]);
        for (index in 0...size) {
            final size2 : Int = points[index].length;
            newPoints[index] = haxe.ds.Vector.fromArrayCopy([for (index in 0...size2) haxe.ds.Vector.fromArrayCopy([for (index2 in 0...2) 0])]);
            for (index2 in 0...size2) {
                if (points[index][index2][0] != 1000) {
                    newPoints[index][index2][0] = points[index][index2][0] + x;
                    newPoints[index][index2][1] = points[index][index2][1] + y;
                } else {
                    newPoints[index][index2][0] = 1000;
                    newPoints[index][index2][1] = 1000;
                }
            }
        }
        return newPoints;
    }

    public function adjust(points : haxe.ds.Vector<haxe.ds.Vector<Int>>, both : Int) : haxe.ds.Vector<haxe.ds.Vector<Int>> {
        return this.adjust(points, both, both);
    }

    public function adjust(points : haxe.ds.Vector<haxe.ds.Vector<Int>>, x : Int, y : Int) : haxe.ds.Vector<haxe.ds.Vector<Int>> {
        var newPoints : haxe.ds.Vector<haxe.ds.Vector<Int>> = haxe.ds.Vector.fromArrayCopy([for (index in 0...points.length) haxe.ds.Vector.fromArrayCopy([for (index2 in 0...2) 0])]);
        for (index2 in 0...points.length) {
            if (points[index2][0] != 1000) {
                newPoints[index2][0] = points[index2][0] + x;
                newPoints[index2][1] = points[index2][1] + y;
            } else {
                newPoints[index2][0] = 1000;
                newPoints[index2][1] = 1000;
            }
        }
        return newPoints;
    }

    public function new() {
    }
}

