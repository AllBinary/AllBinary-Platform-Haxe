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
package org.allbinary.graphics.j2me.workarea.tools;

import org.allbinary.animation.VectorRotationGenerator;
import org.allbinary.graphics.GPoint;
import org.allbinary.math.AngleFactory;
import org.allbinary.util.BasicArrayList;

class PointsUtil {
    private static final instance : PointsUtil = new PointsUtil();
    public static function getInstance() : PointsUtil {
        return PointsUtil.instance;
    }

    // throws Exception
    public function doTransforms(pointVector : BasicArrayList, angle : Null<Float>, fulcrumPoint : GPoint) : BasicArrayList {
        return VectorRotationGenerator.getInstance().getListAtAngle(fulcrumPoint.getX(), fulcrumPoint.getY(), pointVector, AngleFactory.getInstance().getAt(Std.int(angle)));
    }

    public function new() {
    }
}

