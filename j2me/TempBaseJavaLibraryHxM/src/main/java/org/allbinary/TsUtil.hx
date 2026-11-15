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
package org.allbinary;


//TempBase
class TsUtil {
    private static final instance : TsUtil = new TsUtil();
    public static function getInstance() : TsUtil {
        return TsUtil.instance;
    }

    public function longBitsToDouble(bits : haxe.Int64) : Float {
        return jre.lang.Double.longBitsToDouble(bits);
    }

    public function intBitsToFloat(bits : Int) : Float {
        return jre.lang.Float.intBitsToFloat(bits);
    }

    public function hashCode(anyType : Any) : Int {
        return jre.lang.JavaObject.hashCode(anyType);
    }

    // throws InterruptedException
    public function waitFor(any : Any, timeoutMillis : haxe.Int64) : Void {
        final anyType : Any = (cast any : Any);
        anyType.wait(timeoutMillis);
    }

    public function compareTo(a : String, b : String) : Int {
        return Reflect.compare(a, b);
    }

    public function new() {
    }
}

