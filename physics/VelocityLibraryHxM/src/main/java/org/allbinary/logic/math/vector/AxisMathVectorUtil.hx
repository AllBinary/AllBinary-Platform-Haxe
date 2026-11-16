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
package org.allbinary.logic.math.vector;

import org.allbinary.math.NoDecimalTrigTable;

class AxisMathVectorUtil {
    private static final instance : AxisMathVectorUtil = new AxisMathVectorUtil();
    public static function getInstance() : AxisMathVectorUtil {
        return AxisMathVectorUtil.instance;
    }

    private final noDecimalTrigTable : NoDecimalTrigTable = NoDecimalTrigTable.getInstance();
    public function calculateX(magnitude : haxe.Int64, angle : Int) : haxe.Int64 {
        return jre.lang.JavaNumber.divide(magnitude * this.noDecimalTrigTable.cos(angle), 10);
    }

    public function calculateY(magnitude : haxe.Int64, angle : Int) : haxe.Int64 {
        return jre.lang.JavaNumber.divide(magnitude * this.noDecimalTrigTable.sin(angle), 10);
    }

    public function calculateZ(magnitude : haxe.Int64, otherAngle : Int) : haxe.Int64 {
        return jre.lang.JavaNumber.divide(magnitude * this.noDecimalTrigTable.sin(otherAngle), 10);
    }

    public function new() {
    }
}

