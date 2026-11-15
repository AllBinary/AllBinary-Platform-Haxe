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
package org.allbinary.logic.control.workflow;

//import java.lang.reflect.Method;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;

class WorkFlowWrapper implements WorkFlowInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    private var anyType : Any;
    public function new(anyType : Any) {
        this.anyType = anyType;
    }

    public function getWorkFlowObject() : Any {
        return this.anyType;
    }

    // throws Exception
    public function getName() : String {
        try {
            var helperClass : Class<Dynamic> = Type.getClass(this.anyType);
            var method : Method = helperClass.getMethod("getName", null);
            var result : String = (cast method.invoke(this.anyType, null) : String);
            return result;
        } catch (e : haxe.Exception) {
            var error : String = "Reflection Exception";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "getName()", e);
            }
            throw new haxe.Exception(error);
        }
    }

    // throws Exception
    public function getStoreName() : String {
        try {
            var helperClass : Class<Dynamic> = Type.getClass(this.anyType);
            var method : Method = helperClass.getMethod("getStoreName", null);
            var result : String = (cast method.invoke(this.anyType, null) : String);
            return result;
        } catch (e : haxe.Exception) {
            var error : String = "Reflection Exception";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "getStoreName()", e);
            }
            throw new haxe.Exception(error);
        }
    }

    // throws Exception
    public function process() : Null<Int> {
        try {
            var helperClass : Class<Dynamic> = Type.getClass(this.anyType);
            var method : Method = helperClass.getMethod(this.commonStrings.PROCESS, null);
            var result : Null<Int> = (cast method.invoke(this.anyType, null) : Null<Int>);
            return result;
        } catch (e : haxe.Exception) {
            var error : String = "Reflection Exception";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.PROCESS, e);
            }
            throw new haxe.Exception(error);
        }
    }

}

