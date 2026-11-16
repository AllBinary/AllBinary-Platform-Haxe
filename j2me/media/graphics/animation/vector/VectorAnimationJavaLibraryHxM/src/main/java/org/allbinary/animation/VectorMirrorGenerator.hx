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

import org.allbinary.graphics.PointFactory;
import org.allbinary.graphics.pipeline.BasicGraphicsPipeline;
import org.allbinary.logic.NullUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListS;

class VectorMirrorGenerator {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : VectorMirrorGenerator = new VectorMirrorGenerator();
    public static function getInstance() : VectorMirrorGenerator {
        return VectorMirrorGenerator.instance;
    }

    private final vectorAnimationUtil : VectorAnimationUtil = VectorAnimationUtil.getInstance();
    public function new() {
    }

    public function getInstanceFor(...args : Dynamic) : Dynamic {
        if (args.length == 2 && Std.isOfType(args[0], Int)) {
            return this.getInstanceFor_intArrayArrayArray_int(args[0], args[1]);
        }
        if (args.length == 2) {
            return this.getInstanceFor_BasicArrayList_int(args[0], args[1]);
        }
        throw new jre.lang.IllegalArgumentException("No matching overload: getInstance");
    }

    public function getInstanceFor_intArrayArrayArray_int(points : haxe.ds.Vector<haxe.ds.Vector<haxe.ds.Vector<Int>>>, width : Int) : haxe.ds.Vector<haxe.ds.Vector<haxe.ds.Vector<Int>>> {
        try {
            final pointFactory : PointFactory = PointFactory.getInstance();
            var pointBasicArrayList : BasicArrayList = null;
            var nextPoints : haxe.ds.Vector<haxe.ds.Vector<Int>> = null;
            var size2 : Int = 0;
            final size : Int = points.length;
            final pointsBasicArrayList : BasicArrayList = new BasicArrayListS(size);
            for (frame in 0...size) {
                nextPoints = points[frame];
                size2 = nextPoints.length;
                pointBasicArrayList = new BasicArrayListS(size2);
                for (index in 0...size2) {
                    pointBasicArrayList.add(pointFactory.createXY(nextPoints[index][0], nextPoints[index][1]));
                }
                pointsBasicArrayList.add(pointBasicArrayList);
            }
            for (index in 0...points.length) {
                pointsBasicArrayList.add(this.getInstanceFor((cast pointsBasicArrayList.objectArray[index] : BasicArrayList), width));
            }
            var newPoints : haxe.ds.Vector<haxe.ds.Vector<haxe.ds.Vector<Int>>> = this.vectorAnimationUtil.toAnimationArrayFromListOfPointList(pointsBasicArrayList);
            return newPoints;
        } catch (e : haxe.Exception) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            this.logUtil.put(commonStrings.EXCEPTION, this, commonStrings.GET_INSTANCE, e);
            return NullUtil.getInstance().NULL_INT_ARRAY_ARRAY_ARRAY;
        }
    }

    // throws Exception
    public function getInstanceFor_BasicArrayList_int(pointBasicArrayList : BasicArrayList, width : Int) : BasicArrayList {
        var graphicsPipe : BasicGraphicsPipeline = new BasicGraphicsPipeline(pointBasicArrayList);
        graphicsPipe.createMatrix();
        graphicsPipe.mirror(width);
        return graphicsPipe.getMatrix();
    }

}

