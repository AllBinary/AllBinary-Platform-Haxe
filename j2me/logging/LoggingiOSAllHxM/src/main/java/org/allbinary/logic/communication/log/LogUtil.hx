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

import org.allbinary.logic.TsUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.string.CommonSeps;
import org.allbinary.string.CommonStrings;

//ActualPlatform
class LogUtil {
    private static final instance : LogUtil = new LogUtil();
    public static function getInstance() : LogUtil {
        return LogUtil.instance;
    }

    private final logFormatUtil : LogFormatUtil = LogFormatUtil.getInstance();
    public function new() {
    }

    public function putL(log : Log) : Void {
        final specialMessage : String = log.getSpecialMessage();
        final anyType : Any = log.getObject();
        final functionName : String = log.getFunctionName();
        final exception : Any = log.getThrowable();
        this.put(specialMessage, anyType, functionName, exception);
    }

    public function putF(specialMessage : String, anyType : Any, functionName : String) : Void {
        var className : String = CommonStrings.getInstance().EMPTY;
        if (Type.getClassName(Type.getClass(anyType)) != null) {
            className = new StringMaker().append(Type.getClassName(Type.getClass(anyType))).append(CommonSeps.getInstance().COLON).append(StringTools.hex(TsUtil.getInstance().hashCode(anyType))).toString();
        }
        final message : String = this.logFormatUtil.getS(className, functionName, specialMessage);
        trace(LogUtil.LOG_SUCCESS);
        trace(message);
    }

    public function putFS(specialMessage : String, className : String, functionName : String) : Void {
        className = new StringMaker().append(className).append(CommonSeps.getInstance().COLON).append(StringTools.hex(TsUtil.getInstance().hashCode(anyType))).toString();
        final message : String = this.logFormatUtil.getS(className, functionName, specialMessage);
        trace(LogUtil.LOG_SUCCESS);
        trace(message);
    }

    private static final LOG_SUCCESS : String = "org.allbinary: ";
    public function put(specialMessage : String, anyType : Any, functionName : String, exception : Any) : Void {
        var className : String = CommonStrings.getInstance().EMPTY;
        if (Type.getClassName(Type.getClass(anyType)) != null) {
            className = new StringMaker().append(Type.getClassName(Type.getClass(anyType))).append(CommonSeps.getInstance().COLON).append(StringTools.hex(TsUtil.getInstance().hashCode(anyType))).toString();
        }
        final message : String = this.logFormatUtil.get(className, functionName, specialMessage, exception);
        trace(LogUtil.LOG_SUCCESS);
        trace(message);
    }

}

