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
import org.allbinary.logic.java.exception.ExceptionUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.string.CommonLabels;
import org.allbinary.string.CommonSeps;
import org.allbinary.time.TimeStampUtil;

//NoPlatform
class LogFormatUtil {
    private static final instance : LogFormatUtil = new LogFormatUtil();
    public static function getInstance() : LogFormatUtil {
        return LogFormatUtil.instance;
    }

    public function new() {
    }

    public function get(className : String, functionName : String, specialMessage : String, exception : Any) : String {
        throw new haxe.Exception();
    }

    public function getS(className : String, functionName : String, specialMessage : String) : String {
        throw new haxe.Exception();
    }

    public function getO(exception : Any) : String {
        throw new haxe.Exception();
    }

}

