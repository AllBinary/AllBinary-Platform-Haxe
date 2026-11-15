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
package org.allbinary.graphics.pipeline;

import org.allbinary.graphics.GPoint;
import org.allbinary.graphics.PointFactory;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class GraphicsPipeline extends BasicGraphicsPipeline {
    public function new(points : BasicArrayList) {
        super(points);
    }

    // throws Exception
    public function rotateTheta(aTheta : Float) : Void {
        var newVector : BasicArrayList = new BasicArrayListD();
        var size : Int = this.pointBasicArrayList.size();
        for (index in 0...size) {
            var secondPoint : GPoint = (cast pointBasicArrayList.get(index) : GPoint);
            var secondX : Float = (secondPoint.getX() * Math.cos(aTheta)) - (secondPoint.getY() * Math.sin(aTheta));
            var secondY : Float = (secondPoint.getX() * Math.sin(aTheta)) + (secondPoint.getY() * Math.cos(aTheta));
            var point : GPoint = PointFactory.getInstance().createXY((Std.int(secondX)), (Std.int(secondY)));
            newVector.add(point);
        }
        this.pointBasicArrayList = newVector;
    }

}

