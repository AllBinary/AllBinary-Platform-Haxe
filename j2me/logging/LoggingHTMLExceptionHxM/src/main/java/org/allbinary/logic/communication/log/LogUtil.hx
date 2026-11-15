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
import playn.core.PlayN;

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
        if (log == null) {
            return;
        }
        final specialMessage : String = log.getSpecialMessage();
        final anyType : Any = log.getObject();
        final functionName : String = log.getFunctionName();
        final exception : Any = log.getThrowable();
        this.put(specialMessage, anyType, functionName, exception);
    }

    public function putF(specialMessage : String, anyType : Any, functionName : String) : Void {
        var className : String = PreLogUtil.getClassName(anyType);
        if (className == null) {
            className = CommonStrings.getInstance().EMPTY;
        }
        final message : String = this.logFormatUtil.getS(className, functionName, specialMessage);
        PlayN.log().debug(this.LOG_SUCCESS + message);
    }

    public function putFS(specialMessage : String, className : String, functionName : String) : Void {
        final message : String = this.logFormatUtil.getS(className, functionName, specialMessage);
        PlayN.log().debug(this.LOG_SUCCESS + message);
    }

    public function put(specialMessage : String, anyType : Any, functionName : String, exception : Any) : Void {
        var className : String = PreLogUtil.getClassName(anyType);
        if (className == null) {
            className = CommonStrings.getInstance().EMPTY;
        }
        final message : String = this.logFormatUtil.get(className, functionName, specialMessage, exception);
        if (exception != null) {
            PlayN.log().error(this.LOG_SUCCESS + message, (cast exception : haxe.Exception));
        } else {
            PlayN.log().debug(this.LOG_SUCCESS + message);
        }
    }

}

