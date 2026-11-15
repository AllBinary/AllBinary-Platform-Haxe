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
package org.allbinary.logic.java.exception;

//import jsinterop.annotations.JsType;

//ActualPlatform
class ExceptionUtil {
    private static final instance : ExceptionUtil = new ExceptionUtil();
    public static function getInstance() : ExceptionUtil {
        return ExceptionUtil.instance;
    }

    public function new() {
    }

    public static final PRETEND_EXCEPTION : haxe.Exception = new jre.lang.JavaException("Not Really An Exception");
    private final NONE : String = "No Stack Trace";
    public function getStackTrace(e : haxe.Exception) : String {
        trace(e.details());
        return this.NONE;
    }

}

