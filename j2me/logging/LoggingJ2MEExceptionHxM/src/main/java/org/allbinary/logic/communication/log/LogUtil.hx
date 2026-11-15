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

import org.allbinary.string.CommonStrings;

//ActualPlatform
class LogUtil {
    private static final instance : LogUtil = new LogUtil();
    public static function getInstance() : LogUtil {
        return LogUtil.instance;
    }

    private final logFormatUtil : LogFormatUtil = LogFormatUtil.getInstance();
    private final LOG_SUCCESS : String = "org.allbinary: ";
    public function new() {
    }

    public function putL(log : Log) : Void {
        if (log == LogFactory.LOG) {
            return;
        }
        final exception : Any = log.getThrowable();
        if (exception == null) {
            return;
        }
        final specialMessage : String = log.getSpecialMessage();
        final anyType : Any = log.getObject();
        final functionName : String = log.getFunctionName();
        this.put(specialMessage, anyType, functionName, exception);
    }

    public function putF(specialMessage : String, anyType : Any, functionName : String) : Void {
    }

    public function putFS(specialMessage : String, className : String, functionName : String) : Void {
    }

    public function put(specialMessage : String, anyType : Any, functionName : String, exception : Any) : Void {
        var className : String = CommonStrings.getInstance().EMPTY;
        if (Type.getClassName(Type.getClass(anyType)) != null) {
            className = Type.getClassName(Type.getClass(anyType));
        }
        final message : String = this.logFormatUtil.get(className, functionName, specialMessage, exception);
        trace(this.LOG_SUCCESS);
        trace(message);
    }

}

