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
import org.allbinary.time.TimeStampUtil;
import org.allbinary.string.CommonSeps;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.java.exception.ExceptionUtil;
import org.allbinary.string.CommonLabels;

//ActualPlatform
class LogFormatUtil {
    private static final instance : LogFormatUtil = new LogFormatUtil();
    public static function getInstance() : LogFormatUtil {
        return LogFormatUtil.instance;
    }

    private final timeStampUtil : TimeStampUtil = TimeStampUtil.getInstance();
    private final commonSeps : CommonSeps = CommonSeps.getInstance();
    private final LOG_ERROR : String = "\nLog-Error: ";
    private final EMPTY : String = "Empty";
    private final STACK_TRACE : String = "\nStack Trace: ";
    private final TIME : String = "Time: ";
    private final CLASS_NAME : String = this.commonSeps.SPACE;
    private final FUNCTION_CALL : String = CommonLabels.getInstance().COLON_SEP;
    private final SPECIAL_MESSAGE : String = "> ";
    public function new() {
    }

    public function get(className : String, functionName : String, specialMessage : String, exception : Any) : String {
        final stringBuffer : StringMaker = this.getF(className, functionName);
        stringBuffer.append(this.getO(exception));
        stringBuffer.append(this.SPECIAL_MESSAGE);
        stringBuffer.append(specialMessage);
        stringBuffer.append(this.commonSeps.NEW_LINE);
        return stringBuffer.toString();
    }

    public function getS(className : String, functionName : String, specialMessage : String) : String {
        final stringBuffer : StringMaker = this.getF(className, functionName);
        stringBuffer.append(this.SPECIAL_MESSAGE);
        stringBuffer.append(specialMessage);
        stringBuffer.append(this.commonSeps.NEW_LINE);
        return stringBuffer.toString();
    }

    private function getF(className : String, functionName : String) : StringMaker {
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(this.TIME);
        stringBuffer.append(this.timeStampUtil.getAsString());
        stringBuffer.append(this.CLASS_NAME);
        stringBuffer.append(className);
        stringBuffer.append(this.FUNCTION_CALL);
        stringBuffer.append(functionName);
        return stringBuffer;
    }

    private final stringUtil : StringUtil = StringUtil.getInstance();
    private final exceptionUtil : ExceptionUtil = ExceptionUtil.getInstance();
    private final nullUtil : NullUtil = NullUtil.getInstance();
    public function getO(exception : Any) : String {
        if (exception != this.nullUtil.NULL_OBJECT) {
            final stringBuffer : StringMaker = new StringMaker();
            stringBuffer.append(this.LOG_ERROR);
            final exceptionAsString : String = exception.toString();
            if (exceptionAsString != null) {
                stringBuffer.append(exceptionAsString);
            } else {
                stringBuffer.append(this.EMPTY);
            }
            stringBuffer.append(this.STACK_TRACE);
            if (exception != this.nullUtil.NULL_OBJECT) {
                stringBuffer.append(this.exceptionUtil.getStackTrace((cast exception : haxe.Exception)));
            } else {
                stringBuffer.append(this.stringUtil.NULL_STRING);
            }
            return stringBuffer.toString();
        } else {
            return StringUtil.getInstance().EMPTY_STRING;
        }
    }

}

