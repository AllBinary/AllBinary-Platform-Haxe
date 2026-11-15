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

class StoreWorkFlowWrapper extends WorkFlowWrapper {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public function new(anyType : Any) {
        super(anyType);
    }

    // throws Exception
    public function getStoreName() : String {
        try {
            var helperClass : Class<Dynamic> = Type.getClass(this.getWorkFlowObject());
            var method : Method = helperClass.getMethod("getStoreName", null);
            var result : String = (cast method.invoke(this.getWorkFlowObject(), null) : String);
            return result;
        } catch (e : haxe.Exception) {
            var error : String = "Reflection Exception";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                final commonStrings : CommonStrings = CommonStrings.getInstance();
                this.logUtil.put(commonStrings.EXCEPTION, this, "getStoreName()", e);
            }
            throw new haxe.Exception(error);
        }
    }

}

