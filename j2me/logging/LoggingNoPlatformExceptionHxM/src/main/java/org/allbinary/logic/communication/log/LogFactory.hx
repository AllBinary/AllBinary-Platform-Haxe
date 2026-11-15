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
import org.allbinary.logic.string.StringUtil;

//NoPlatform
class LogFactory {
    public static final LOG : Log = new Log(StringUtil.getInstance().EMPTY_STRING, NullUtil.getInstance().NULL_OBJECT, StringUtil.getInstance().EMPTY_STRING, NullUtil.getInstance().NULL_OBJECT);
    public static function getInstance(specialMessage : String, anyType : Any, functionName : String, exception : Any) : Log {
        throw new haxe.Exception();
    }

    public static function getInstanceF(specialMessage : String, anyType : Any, functionName : String) : Log {
        throw new haxe.Exception();
    }

    public function new() {
    }
}

