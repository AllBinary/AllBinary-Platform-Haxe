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
package taghelpers;

//import java.util.HashMap;
//import javax.servlet.jsp.PageContext;
import admin.taghelpers.TagHelper;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.control.workflow.StoreTagWorkFlowFactory;
import org.allbinary.logic.control.workflow.StoreWorkFlowInterface;
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;
import org.allbinary.logic.system.security.licensing.ServiceClientInformationInterfaceFactory;

class StoreTagWorkFlowHelper extends TagHelper {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final abeClientInformation : AbeClientInformationInterface = ServiceClientInformationInterfaceFactory.getInstance();
    private var storeWorkFlowInterface : StoreWorkFlowInterface;
    public function new(hashMap : HashMap, pageContext : PageContext) {
        super();
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAGHELPER)) {
            this.logUtil.putF("Properties: " + Std.string(hashMap), this, "StoreTagWorkFlowHelper()");
        }
        this.storeWorkFlowInterface = StoreTagWorkFlowFactory.getInstance().getInstance(this.abeClientInformation, hashMap, pageContext);
    }

    // throws Exception
    public function process() : Null<Int> {
        try {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAGHELPER)) {
                this.logUtil.putF("Process", this, this.commonStrings.PROCESS);
            }
            return this.storeWorkFlowInterface.process();
        } catch (e : haxe.Exception) {
            var error : String = "Failed to process workflow: ";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "view()", e);
            }
            throw e;
        }
    }

}

