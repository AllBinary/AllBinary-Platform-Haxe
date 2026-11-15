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

import org.allbinary.log.FileLog;
import org.allbinary.string.CommonSeps;
import org.allbinary.string.CommonStrings;
import org.allbinary.logic.string.StringMaker;

//ActualPlatform
class LogUtil {
    private static final instance : LogUtil = new LogUtil();
    public static function getInstance() : LogUtil {
        return LogUtil.instance;
    }

    public function new() {
    }

    public function putL(log : Log) : Void {
        var specialMessage : String = log.getSpecialMessage();
        var anyType : Any = log.getObject();
        var functionName : String = log.getFunctionName();
        var exception : Any = log.getThrowable();
        this.put(specialMessage, anyType, functionName, exception);
    }

    public function putF(specialMessage : String, anyType : Any, functionName : String) : Void {
        FileLog.put(specialMessage, anyType, functionName);
    }

    public function putFS(specialMessage : String, className : String, functionName : String) : Void {
        FileLog.put(specialMessage, className, functionName);
    }

    public function put(specialMessage : String, anyType : Any, functionName : String, exception : Any) : Void {
        FileLog.put(specialMessage, anyType, functionName, (cast exception : haxe.Exception));
    }

}

