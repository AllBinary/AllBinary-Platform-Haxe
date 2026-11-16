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

import org.allbinary.logic.math.MathUtil;

class DistanceUtil {
    private static final instance : DistanceUtil = new DistanceUtil();
    public static function getInstance() : DistanceUtil {
        return DistanceUtil.instance;
    }

    private final mathUtil : MathUtil = MathUtil.getInstance();
    public function getDistance(x1 : Int, y1 : Int, x2 : Int, y2 : Int) : Int {
        final dx : Int = x1 - x2;
        final dy : Int = y1 - y2;
        return jre.lang.JavaNumber.toInt(this.mathUtil.sqrt((dx * dx) + (dy * dy)));
    }

    public function new() {
    }
}

