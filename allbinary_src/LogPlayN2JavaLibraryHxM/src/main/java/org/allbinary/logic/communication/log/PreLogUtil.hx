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

import jsinterop.annotations.JsType;
import org.allbinary.string.CommonSeps;
import org.allbinary.string.CommonStrings;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import playn.core.PlayN;

//ActualPlatform
class PreLogUtil {
    public function new() {
    }

    public static function put(specialMessage : String, anyType : Any, functionName : String) : Void {
        var className : String = PreLogUtil.getClassName(anyType);
        if (className == null) {
            className = CommonStrings.getInstance().EMPTY;
        }
        className = new StringMaker().append(className).append(CommonSeps.getInstance().FORWARD_SLASH).append(StringUtil.getInstance().toString(anyType)).toString();
        final message : String = LogFormatUtil.getInstance().getS(className, functionName, specialMessage);
        PlayN.getInstance().log().debug(PreLogUtil.LOG_SUCCESS + message);
    }

    private static final LOG_SUCCESS : String = "org.allbinary: ";
    public static function putOE(specialMessage : String, anyType : Any, functionName : String, exception : Any) : Void {
        var className : String = PreLogUtil.getClassName(anyType);
        if (className == null) {
            className = CommonStrings.getInstance().EMPTY;
        }
        className = new StringMaker().append(className).append(CommonSeps.getInstance().FORWARD_SLASH).append(StringUtil.getInstance().toString(anyType)).toString();
        final message : String = LogFormatUtil.getInstance().get(className, functionName, specialMessage, exception);
        PlayN.getInstance().log().error(PreLogUtil.LOG_SUCCESS + message, (cast exception : haxe.Exception));
    }

    public static function putS(specialMessage : String, className : String, functionName : String) : Void {
        final message : String = LogFormatUtil.getInstance().getS(className, functionName, specialMessage);
        PlayN.getInstance().log().debug(PreLogUtil.LOG_SUCCESS + message);
    }

    public static function putSE(specialMessage : String, className : String, functionName : String, exception : Any) : Void {
        final message : String = LogFormatUtil.getInstance().get(className, functionName, specialMessage, exception);
        PlayN.getInstance().log().error(PreLogUtil.LOG_SUCCESS + message, (cast exception : haxe.Exception));
    }

    public static function getClassName(anyType : Any) : String;

}

