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
import org.allbinary.graphics.PointFactory;
import org.allbinary.graphics.pipeline.RandomRotationFactory;
import org.allbinary.graphics.pipeline.RandomTranslation;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.util.BasicArrayListS;

class VectorExplosionGenerator {
    private static final instance : VectorExplosionGenerator = new VectorExplosionGenerator();
    public static function getInstance() : VectorExplosionGenerator {
        return VectorExplosionGenerator.instance;
    }

    public final RANDOM : VectorExplosionType = new VectorExplosionType();
    public final ROTATION : VectorExplosionType = new VectorExplosionType();
    private final vectorAnimationUtil : VectorAnimationUtil = VectorAnimationUtil.getInstance();
    public function new() {
    }

    // throws Exception
    public function createList(list : BasicArrayList, howMuch : Int, type : VectorExplosionType) : BasicArrayList {
        var point : GPoint = null;
        final size : Int = list.size();
        final points : haxe.ds.Vector<haxe.ds.Vector<Int>> = haxe.ds.Vector.fromArrayCopy([for (index in 0...size) haxe.ds.Vector.fromArrayCopy([for (index2 in 0...2) 0])]);
        for (index in 0...size) {
            point = (cast list.objectArray[index] : GPoint);
            points[index][0] = point.getX();
            points[index][1] = point.getY();
        }
        return this.createListFromPoints(list, points, howMuch, type);
    }

    // throws Exception
    public function getInstanceFor(points : haxe.ds.Vector<haxe.ds.Vector<Int>>, howMuch : Int, type : VectorExplosionType) : haxe.ds.Vector<haxe.ds.Vector<haxe.ds.Vector<Int>>> {
        final pointsBasicArrayList : BasicArrayList = this.getInstanceStartFrame(points, howMuch, type, true);
        final tempBasicArrayList : BasicArrayList = (cast pointsBasicArrayList.objectArray[0] : BasicArrayList);
        final newPoints : haxe.ds.Vector<haxe.ds.Vector<haxe.ds.Vector<Int>>> = this.vectorAnimationUtil.toAnimationArrayFromListOfPointListWithPointsPerFrame(pointsBasicArrayList, tempBasicArrayList.size());
        return newPoints;
    }

    // throws Exception
    public function getInstanceStartFrame(points : haxe.ds.Vector<haxe.ds.Vector<Int>>, howMuch : Int, type : VectorExplosionType, startFrame : Bool) : BasicArrayList {
        try {
            final pointsBasicArrayList : BasicArrayList = new BasicArrayListS(howMuch);
            pointsBasicArrayList.add(this.createPointsBasicArrayList(points));
            var frameIndex : Int = 0;
            var tempBasicArrayList : BasicArrayList = null;
            var pointBasicArrayList : BasicArrayList = null;
            while (frameIndex < howMuch) {
                tempBasicArrayList = (cast pointsBasicArrayList.objectArray[frameIndex] : BasicArrayList);
                pointBasicArrayList = this.createListFromPoints(tempBasicArrayList, points, howMuch, type);
                pointsBasicArrayList.add(pointBasicArrayList);
                frameIndex++;
            }
            if (!startFrame) {
                pointsBasicArrayList.removeAt(0);
            }
            return pointsBasicArrayList;
        } catch (e : haxe.Exception) {
            throw e;
        }
    }

    private final randomRotationFactory : RandomRotationFactory = RandomRotationFactory.getInstance();
    // throws Exception
    private function createListFromPoints(tempBasicArrayList : BasicArrayList, points : haxe.ds.Vector<haxe.ds.Vector<Int>>, howMuch : Int, type : VectorExplosionType) : BasicArrayList {
        var index : Int = 0;
        final pointBasicArrayList : BasicArrayList = new BasicArrayListD();
        var sectionBasicArrayList : BasicArrayList = null;
        while (index < points.length) {
            sectionBasicArrayList = new BasicArrayListD();
            while (points[index][0] != 1000) {
                sectionBasicArrayList.add(tempBasicArrayList.objectArray[index]);
                index++;
                if (index >= points.length) {
                    break;
                }
            }
            sectionBasicArrayList = RandomTranslation.getInstance(sectionBasicArrayList, howMuch);
            if (type == this.ROTATION) {
                sectionBasicArrayList = this.randomRotationFactory.getInstanceList(sectionBasicArrayList, howMuch);
            }
            var size : Int = sectionBasicArrayList.size();
            for (index2 in 0...size) {
                pointBasicArrayList.add(sectionBasicArrayList.objectArray[index2]);
            }
            if (index >= points.length) {
                break;
            } else if (points[index][0] == 1000) {
                pointBasicArrayList.add(tempBasicArrayList.objectArray[index]);
                index++;
            }
        }
        return pointBasicArrayList;
    }

    // throws Exception
    private function createPointsBasicArrayList(points : haxe.ds.Vector<haxe.ds.Vector<Int>>) : BasicArrayList {
        if (points.length == 0) {
            throw new jre.lang.JavaException("Not Points Provided");
        }
        final firstPointBasicArrayList : BasicArrayList = new BasicArrayListS(points.length);
        final pointFactory : PointFactory = PointFactory.getInstance();
        for (index in 0...points.length) {
            firstPointBasicArrayList.add(pointFactory.createXY(points[index][0], points[index][1]));
        }
        return firstPointBasicArrayList;
    }

}

