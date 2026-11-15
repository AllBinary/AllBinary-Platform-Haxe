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
import org.allbinary.string.CommonStrings;

//ActualPlatform
class PreLogUtil {
    public function new() {
    }

    public static function put(specialMessage : String, anyType : Any, functionName : String) : Void {
        PreLogUtil.putOE(specialMessage, anyType, functionName, NullUtil.getInstance().NULL_OBJECT);
    }

    private static final LOG_SUCCESS : String = "org.allbinary: ";
    public static function putOE(specialMessage : String, anyType : Any, functionName : String, exception : Any) : Void {
        var className : String = CommonStrings.getInstance().EMPTY;
        if (Type.getClassName(Type.getClass(anyType)) != null) {
            className = Type.getClassName(Type.getClass(anyType));
        }
        final message : String = LogFormatUtil.getInstance().get(className, functionName, specialMessage, exception);
        trace(PreLogUtil.LOG_SUCCESS);
        trace(message);
    }

    public static function putS(specialMessage : String, className : String, functionName : String) : Void {
        PreLogUtil.putSE(specialMessage, className, functionName, NullUtil.getInstance().NULL_OBJECT);
    }

    public static function putSE(specialMessage : String, className : String, functionName : String, exception : Any) : Void {
        final message : String = LogFormatUtil.getInstance().get(className, functionName, specialMessage, exception);
        trace(PreLogUtil.LOG_SUCCESS);
        trace(message);
    }

}

