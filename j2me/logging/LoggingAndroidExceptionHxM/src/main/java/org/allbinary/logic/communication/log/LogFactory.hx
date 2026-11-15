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


//ActualPlatform
class LogFactory {
    public static function getInstance(specialMessage : String, anyType : Any, functionName : String, exception : Any) : Log {
        return new Log(specialMessage, anyType, functionName, exception);
    }

    public static function getInstanceF(specialMessage : String, anyType : Any, functionName : String) : Log {
        return null;
    }

    public static function getInstanceSE(specialMessage : String, className : String, functionName : String, exception : Any) : Log {
        return LogFactory.getInstance(specialMessage, className, functionName, exception);
    }

    public function new() {
    }
}

