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
import org.allbinary.logic.communication.log.LogFormatUtil;

class Log {
    private final logFormatUtil : LogFormatUtil = LogFormatUtil.getInstance();
    private final specialMessage : String;
    private final anyType : Any;
    private final functionName : String;
    private final exception : Any;
    public function new(specialMessage : String, anyType : Any, functionName : String, exception : Any) {
        this.specialMessage = specialMessage;
        this.anyType = anyType;
        this.functionName = functionName;
        this.exception = exception;
    }

    public function getSpecialMessage() : String {
        return this.specialMessage;
    }

    public function getObject() : Any {
        return this.anyType;
    }

    public function getFunctionName() : String {
        return this.functionName;
    }

    public function getThrowable() : Any {
        return this.exception;
    }

    public function toString() : String {
        var className : String = CommonStrings.getInstance().EMPTY;
        var clazz : Class<Dynamic> = Type.getClass(this.anyType);
        if (Type.getClassName(clazz) != null) {
            className = Type.getClassName(clazz);
        }
        return this.logFormatUtil.get(className, this.functionName, this.specialMessage, this.exception);
    }

}

