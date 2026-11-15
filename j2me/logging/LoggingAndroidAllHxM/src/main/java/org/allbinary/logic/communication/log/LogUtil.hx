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
import org.allbinary.TsUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.string.CommonSeps;

//ActualPlatform
class LogUtil {
    private static final instance : LogUtil = new LogUtil();
    public static function getInstance() : LogUtil {
        return LogUtil.instance;
    }

    private final commonSeps : CommonSeps = CommonSeps.getInstance();
    private final logFormatUtil : LogFormatUtil = LogFormatUtil.getInstance();
    private final LABEL : String = "org.allbinary";
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

    public function putFS(specialMessage : String, string : String, functionName : String) : Void {
        this.putS(specialMessage, string, functionName, NullUtil.getInstance().NULL_OBJECT);
    }

    public function put(specialMessage : String, anyType : Any, functionName : String, exception : Any) : Void {
        var className : String = this.LABEL;
        className = Std.string(new StringMaker().append(Type.getClassName(Type.getClass(anyType))).append(this.commonSeps.COLON).append(StringTools.hex(TsUtil.getInstance().hashCode(anyType))));
        final message : String = this.logFormatUtil.get(className, functionName, specialMessage, exception);
        android.util.Log.i(this.LABEL, message);
    }

    public function putS(specialMessage : String, string : String, functionName : String, exception : Any) : Void {
        var className : String = this.LABEL;
        className = Std.string(new StringMaker().append(string).append(this.commonSeps.COLON).append(StringTools.hex(TsUtil.getInstance().hashCode(string))));
        final message : String = this.logFormatUtil.get(className, functionName, specialMessage, exception);
        android.util.Log.i(this.LABEL, message);
    }

}

