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

//import java.io.IOException;
import org.apache.xmlrpc.XmlRpcException;
import org.allbinary.string.CommonSeps;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;
import org.allbinary.canvas.SpecialMessageUtil;
import org.allbinary.string.CommonStrings;
import org.allbinary.time.TimeDelayHelper;
import org.allbinary.util.ABHashtable;

//ActualPlatform
class LogUtil {
    private static final instance : LogUtil = new LogUtil();
    public static function getInstance() : LogUtil {
        return LogUtil.instance;
    }

    private final MESSAGE : String = "message";
    private var isFirstException : Bool = true;
    private var timeDelayHelper : TimeDelayHelper = new TimeDelayHelper(200000);
    public var abeClientInformation : AbeClientInformationInterface = null;
    public function new() {
    }

    private final stringBuffer : StringMaker = new StringMaker();
    public function putL(log : Log) : Void {
        if (log == null) {
            return;
        }
        final specialMessage : String = log.getSpecialMessage();
        final anyType : Any = log.getObject();
        final functionName : String = log.getFunctionName();
        final exception : Any = log.getThrowable();
        this.put(specialMessage, anyType, functionName, exception);
    }

    public function putF(specialMessage : String, anyType : Any, functionName : String) : Void {
    }

    public function putF(specialMessage : String, className : String, functionName : String) : Void {
    }

    public function put(specialMessage : String, anyType : Any, functionName : String, exception : Any) : Void {
        if (exception != null) {
            if (Type.getClassName(Type.getClass(exception)).compareTo(XmlRpcException.getName()) == 0) {
                return;
            }
            if (Type.getClassName(Type.getClass(exception)).compareTo(IOException.getName()) == 0) {
                return;
            }
            if (this.isFirstException || this.timeDelayHelper.isTimeTNT()) {
                var className : String = CommonStrings.getInstance().EMPTY;
                this.isFirstException = false;
                if (anyType != null && Type.getClassName(Type.getClass(anyType)) != null) {
                    className = Type.getClassName(Type.getClass(anyType));
                }
                final message : String = LogFormatUtil.getInstance().get(className, functionName, specialMessage, exception);
                try {
                    trace("Eeeek");
                    if (this.abeClientInformation == null) {
                        throw new haxe.Exception();
                    }
                    final hashtable : ABHashtable<Any, Any> = this.abeClientInformation.toHashtable();
                    this.stringBuffer.delete(0, this.stringBuffer.length());
                    this.stringBuffer.append(message);
                    this.stringBuffer.append(CommonSeps.getInstance().SPACE);
                    this.stringBuffer.append(SpecialMessageUtil.getInstance().get());
                    hashtable.put(this.MESSAGE, this.stringBuffer.toString());
                    new XmlRpcRemoteLogClient(this.abeClientInformation).get(hashtable);
                } catch (e : haxe.Exception) {
                    trace("Exception");
                    trace(e.details());
                }
            }
        }
    }

}

