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
package admin.taghelpers;

//import java.util.HashMap;
//import javax.servlet.jsp.PageContext;
import org.allbinary.data.tables.workflow.WorkFlowEntityFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.control.workflow.NewWorkFlowFactory;
import org.allbinary.logic.control.workflow.WorkFlowData;
import org.allbinary.logic.control.workflow.WorkFlowInterface;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;
import org.allbinary.logic.system.security.licensing.ServiceClientInformationInterfaceFactory;

class WorkFlowRequestHelper extends ModifyTable {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final abeClientInformation : AbeClientInformationInterface = ServiceClientInformationInterfaceFactory.getInstance();
    private var workFlowInterface : WorkFlowInterface;
    public function new(hashMap : HashMap, pageContext : PageContext) {
        super();
        this.workFlowInterface = NewWorkFlowFactory.getInstance().getInstance(this.abeClientInformation, hashMap, pageContext);
    }

    // throws Exception
    public function delete() : String {
        try {
            final stringUtil : StringUtil = StringUtil.getInstance();
            WorkFlowEntityFactory.getInstance().create2().delete(this.workFlowInterface.getName(), stringUtil.EMPTY_STRING);
            var success : String = "Successfully Removed the workflow with " + WorkFlowData.getInstance().NAME + "= " + this.workFlowInterface.getName() + " from ";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGS)) {
                this.logUtil.putF(success, this, "delete()");
            }
            return success;
        } catch (e : haxe.Exception) {
            try {
                var error : String = "Failed to remove workflow with " + WorkFlowData.getInstance().NAME + "= " + this.workFlowInterface.getName() + " from ";
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                    this.logUtil.put(this.commonStrings.EXCEPTION, this, "delete()", e);
                }
                throw new haxe.Exception(e);
            } catch (e2 : haxe.Exception) {
                var error : String = "Failed to get data from workflowinterface to set error string";
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                    this.logUtil.put(this.commonStrings.EXCEPTION, this, "delete()", e2);
                }
                return error;
            }
        }
    }

    public function insert() : String {
        try {
            var success : String = "New User Successfully added to the Users Table";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGS)) {
                this.logUtil.putF(success, this, "add()");
            }
            return success;
        } catch (e : haxe.Exception) {
            var error : String = "Failed to add User";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "add()", e);
            }
            return error;
        }
    }

    public function update() : String {
        try {
            var success : String = "Updated WorkFlow Successfully";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGS)) {
                this.logUtil.putF(success, this, "update()");
            }
            return success;
        } catch (e : haxe.Exception) {
            var error : String = "Failed to update WorkFlow";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "update()", e);
            }
            return error;
        }
    }

}

