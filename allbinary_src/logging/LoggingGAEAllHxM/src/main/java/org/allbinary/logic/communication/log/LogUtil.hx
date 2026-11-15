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
//import java.util.logging.Logger;
import org.allbinary.logic.NullUtil;
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

    public function putL(log : Log) : Void {
        final specialMessage : String = log.getSpecialMessage();
        final anyType : Any = log.getObject();
        final functionName : String = log.getFunctionName();
        final exception : Any = log.getThrowable();
        this.put(specialMessage, anyType, functionName, exception);
    }

    public function putF(specialMessage : String, anyType : Any, functionName : String) : Void {
        this.put(specialMessage, anyType, functionName, NullUtil.getInstance().NULL_OBJECT);
    }

    public function putFS(specialMessage : String, className : String, functionName : String) : Void {
        this.putS(specialMessage, className, functionName, NullUtil.getInstance().NULL_OBJECT);
    }

    public function put(specialMessage : String, anyType : Any, functionName : String, exception : Any) : Void {
        try {
            var className : String = CommonStrings.getInstance().EMPTY;
            final clazz : Class<Dynamic> = Type.getClass(anyType);
            if (clazz.getName() != null) {
                className = clazz.getName();
            }
            final message : String = this.logFormatUtil.getS(className, functionName, specialMessage);
            if (exception != null) {
                this.logger.log(Level.SEVERE, message, exception);
            } else {
                this.logger.log(Level.INFO, message);
            }
        } catch (e : haxe.Exception) {
        }
    }

    public function putS(specialMessage : String, className : String, functionName : String, exception : Any) : Void {
        try {
            final message : String = this.logFormatUtil.getS(className, functionName, specialMessage);
            if (exception != null) {
                this.logger.log(Level.SEVERE, message, exception);
            } else {
                this.logger.log(Level.INFO, message);
            }
        } catch (e : haxe.Exception) {
        }
    }

}

