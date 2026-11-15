/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2025 AllBinary 
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
package org.allbinary.logic.math;


class J2SEMath {
    private static final instance : J2SEMath = new J2SEMath();
    public static function getInstance() : J2SEMath {
        return J2SEMath.instance;
    }

    public function round(value : Float) : Int {
        return Std.int(value);
    }

    public function abs(value : Float) : Float {
        return ((value < 0.0) ? -value : value);
    }

    public function absdouble(value : Float) : Float {
        return ((value < 0.0) ? -value : value);
    }

    public function new() {
    }
}

