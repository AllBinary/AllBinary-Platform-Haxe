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
package org.allbinary.logic.communication.log;

import org.allbinary.logic.NullUtil;

//NoPlatform
class PreLogUtil {
    public function new() {
    }

    public static function put(specialMessage : String, anyType : Any, functionName : String) : Void {
        PreLogUtil.putOE(specialMessage, anyType, functionName, NullUtil.getInstance().NULL_OBJECT);
    }

    public static function putOE(specialMessage : String, anyType : Any, functionName : String, exception : Any) : Void {
        throw new haxe.Exception();
    }

    public static function putSE(specialMessage : String, className : String, functionName : String, exception : Any) : Void {
        throw new haxe.Exception();
    }

}

