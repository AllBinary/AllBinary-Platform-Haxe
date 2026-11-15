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
package org.allbinary.animation;

import org.allbinary.graphics.GPoint;
import org.allbinary.util.BasicArrayList;

class VectorAnimationUtil {
    private static final instance : VectorAnimationUtil = new VectorAnimationUtil();
    public static function getInstance() : VectorAnimationUtil {
        return VectorAnimationUtil.instance;
    }

    public function new() {
    }

    public function toAnimationArrayFromListOfPointListWithPointsPerFrame(vector : BasicArrayList, pointsPerFrame : Int) : haxe.ds.Vector<haxe.ds.Vector<haxe.ds.Vector<Int>>> {
        final size : Int = vector.size();
        final points : haxe.ds.Vector<haxe.ds.Vector<haxe.ds.Vector<Int>>> = haxe.ds.Vector.fromArrayCopy([for (index in 0...size) haxe.ds.Vector.fromArrayCopy([for (index2 in 0...pointsPerFrame) haxe.ds.Vector.fromArrayCopy([for (index3 in 0...2) 0])])]);
        var nextBasicArrayList : BasicArrayList = null;
        var framePoints : haxe.ds.Vector<haxe.ds.Vector<Int>> = null;
        for (index in 0...size) {
            nextBasicArrayList = (cast vector.objectArray[index] : BasicArrayList);
            framePoints = this.toFrameArrayFromPointBasicArrayList(nextBasicArrayList);
            for (pointIndex in 0...framePoints.length) {
                points[index][pointIndex][0] = framePoints[pointIndex][0];
                points[index][pointIndex][1] = framePoints[pointIndex][1];
            }
        }
        return points;
    }

    public function toAnimationArrayFromListOfPointList(vector : BasicArrayList) : haxe.ds.Vector<haxe.ds.Vector<haxe.ds.Vector<Int>>> {
        final size : Int = vector.size();
        final points : haxe.ds.Vector<haxe.ds.Vector<haxe.ds.Vector<Int>>> = haxe.ds.Vector.fromArrayCopy([for (index in 0...size) haxe.ds.Vector.fromArrayCopy([for (index2 in 0...0) haxe.ds.Vector.fromArrayCopy([for (index3 in 0...0) 0])])]);
        var nextBasicArrayList : BasicArrayList = null;
        var framePoints : haxe.ds.Vector<haxe.ds.Vector<Int>> = null;
        for (index in 0...size) {
            nextBasicArrayList = (cast vector.objectArray[index] : BasicArrayList);
            framePoints = this.toFrameArrayFromPointBasicArrayList(nextBasicArrayList);
            points[index] = haxe.ds.Vector.fromArrayCopy([for (index in 0...framePoints.length) haxe.ds.Vector.fromArrayCopy([for (index2 in 0...2) 0])]);
            for (pointIndex in 0...framePoints.length) {
                points[index][pointIndex][0] = framePoints[pointIndex][0];
                points[index][pointIndex][1] = framePoints[pointIndex][1];
            }
        }
        return points;
    }

    public function toFrameArrayFromPointBasicArrayList(list : BasicArrayList) : haxe.ds.Vector<haxe.ds.Vector<Int>> {
        var points : haxe.ds.Vector<haxe.ds.Vector<Int>> = haxe.ds.Vector.fromArrayCopy([for (index in 0...list.size()) haxe.ds.Vector.fromArrayCopy([for (index2 in 0...2) 0])]);
        var size : Int = list.size();
        for (index in 0...size) {
            var nextPoint : GPoint = (cast list.objectArray[index] : GPoint);
            points[index][0] = nextPoint.getX();
            points[index][1] = nextPoint.getY();
        }
        return points;
    }

}

