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
import org.allbinary.math.Angle;
import org.allbinary.math.AngleFactory;
import org.allbinary.string.CommonStrings;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListS;
import org.allbinary.vector.VectorInfo;

class VectorRotationGenerator {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : VectorRotationGenerator = new VectorRotationGenerator();
    public static function getInstance() : VectorRotationGenerator {
        return VectorRotationGenerator.instance;
    }

    private final vectorAnimationUtil : VectorAnimationUtil = VectorAnimationUtil.getInstance();
    public function new() {
    }

    public function getInstanceFor(vectorRotationInfo : VectorInfo) : haxe.ds.Vector<haxe.ds.Vector<haxe.ds.Vector<Int>>> {
        return this.getInstanceFrames(vectorRotationInfo.getWidth(), vectorRotationInfo.getHeight(), vectorRotationInfo.getPoints(), vectorRotationInfo.getTotalFrames());
    }

    private final angleFactory : AngleFactory = AngleFactory.getInstance();
    public function getInstanceFrames(width : Int, height : Int, points : haxe.ds.Vector<haxe.ds.Vector<Int>>, frames : Int) : haxe.ds.Vector<haxe.ds.Vector<haxe.ds.Vector<Int>>> {
        try {
            var totalAngle : Int = this.angleFactory.TOTAL_ANGLE;
            var angleIncrement : Int = Std.int(totalAngle / frames);
            var pointsBasicArrayList : BasicArrayList = new BasicArrayListS(Std.int(totalAngle / angleIncrement));
            var pointBasicArrayList : BasicArrayList = new BasicArrayListS(points.length);
            var pointFactory : PointFactory = PointFactory.getInstance();
            var size : Int = points.length;
            for (index in 0...size) {
                pointBasicArrayList.add(pointFactory.createXY(points[index][0], points[index][1]));
            }
            var index : Int = 0;
            while (index < totalAngle) {
                pointsBasicArrayList.add(this.getListAtAngle(width, height, pointBasicArrayList, this.angleFactory.getAt(index)));
                index += angleIncrement;
            }
            var newPoints : haxe.ds.Vector<haxe.ds.Vector<haxe.ds.Vector<Int>>> = this.vectorAnimationUtil.toAnimationArrayFromListOfPointListWithPointsPerFrame(pointsBasicArrayList, pointBasicArrayList.size());
            return newPoints;
        } catch (e : haxe.Exception) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            this.logUtil.put(commonStrings.EXCEPTION, this, commonStrings.GET_INSTANCE, e);
            return NullUtil.getInstance().NULL_INT_ARRAY_ARRAY_ARRAY;
        }
    }

    // throws Exception
    public function getListAtAngle(width : Int, height : Int, pointBasicArrayList : BasicArrayList, angle : Angle) : BasicArrayList {
        var graphicsPipe : BasicGraphicsPipeline = new BasicGraphicsPipeline(pointBasicArrayList);
        graphicsPipe.createMatrix();
        graphicsPipe.translate(-(width >> 1), -(height >> 1));
        graphicsPipe.rotateToAngle(angle);
        graphicsPipe.translate((width >> 1), (height >> 1));
        return graphicsPipe.getMatrix();
    }

}

