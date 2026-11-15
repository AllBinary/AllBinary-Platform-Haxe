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

//import java.util.logging.Level;
import org.allbinary.logic.string.StringMaker;
//import java.util.logging.Logger;
import org.allbinary.string.CommonStrings;

//ActualPlatform
class LogUtil {
    private static final instance : LogUtil = new LogUtil();
    public static function getInstance() : LogUtil {
        return LogUtil.instance;
    }

    private final logger : Logger = Logger.getLogger(LogUtil.getName());
    private final logFormatUtil : LogFormatUtil = LogFormatUtil.getInstance();
    public function new() {
    }

    public function init() : Void {
        PreLogUtil.put("Loggin Initialized", this, "init()");
    }

    public function putL(log : Log) : Void {
        var exception : Any = log.getThrowable();
        try {
            if (exception != null) {
                var specialMessage : String = log.getSpecialMessage();
                var anyType : Any = log.getObject();
                var functionName : String = log.getFunctionName();
                var className : String = CommonStrings.getInstance().EMPTY;
                var clazz : Class<Dynamic> = Type.getClass(anyType);
                if (clazz.getName() != null) {
                    className = clazz.getName();
                }
                var message : String = this.logFormatUtil.get(className, functionName, specialMessage, exception);
                this.logger.log(Level.INFO, message);
            }
        } catch (e : haxe.Exception) {
        }
    }

    public function put(specialMessage : String, anyType : Any, functionName : String, exception : Any) : Void {
        try {
            var className : String = CommonStrings.getInstance().EMPTY;
            var clazz : Class<Dynamic> = Type.getClass(anyType);
            if (clazz.getName() != null) {
                className = clazz.getName();
            }
            var message : String = this.logFormatUtil.getS(className, functionName, specialMessage);
            if (exception != null) {
                this.logger.log(Level.SEVERE, message, exception);
            } else {
                this.logger.log(Level.INFO, message);
            }
        } catch (e : haxe.Exception) {
        }
    }

}

