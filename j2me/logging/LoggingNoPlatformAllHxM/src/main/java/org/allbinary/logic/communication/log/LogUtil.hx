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


class LogUtil {
    private static final instance : LogUtil = new LogUtil();
    public static function getInstance() : LogUtil {
        return LogUtil.instance;
    }

    public function new() {
    }

    public function putL(log : Log) : Void {
        final specialMessage : String = log.getSpecialMessage();
        final anyType : Any = log.getObject();
        final functionName : String = log.getFunctionName();
        final exception : Any = log.getThrowable();
        throw new haxe.Exception();
    }

    public function putF(specialMessage : String, anyType : Any, functionName : String) : Void {
        throw new haxe.Exception();
    }

    public function putF(specialMessage : String, className : String, functionName : String) : Void {
        throw new haxe.Exception();
    }

    public function put(specialMessage : String, anyType : Any, functionName : String, exception : Any) : Void {
        throw new haxe.Exception();
    }

}

