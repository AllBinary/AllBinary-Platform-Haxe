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
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.jsp.PageContext;
import org.allbinary.business.user.commerce.inventory.order.OrderData;
import org.allbinary.business.user.commerce.inventory.order.OrderHistoryData;
import org.allbinary.business.user.commerce.shipping.ShippingMethodData;
import org.allbinary.data.tables.user.commerce.inventory.order.OrderItemsEntityFactory;
import org.allbinary.logic.communication.log.LogUtil;

class OrderItemsRequestHelper extends TagHelper {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var request : HttpServletRequest;
    private var id : String = null;
    private var groupId : String = null;
    private var status : String = null;
    public function new(hashMap : HashMap, pageContext : PageContext) {
        super();
        this.request = (cast pageContext.getRequest() : HttpServletRequest);
        this.getFormData();
    }

    private function getFormData() : Void {
        this.id = this.request.getParameter(OrderData.ID);
        this.groupId = this.request.getParameter(ShippingMethodData.GROUP);
        this.status = this.request.getParameter(OrderHistoryData.STATUS);
    }

    public function setOrderStatus(newStatus : String) : String {
        try {
            if (newStatus == null) {
                newStatus = this.status;
            }
            var success : String = "Status successfully set to: " + newStatus;
            OrderItemsEntityFactory.getInstance().setStatus(this.id, this.groupId, newStatus);
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGS)) {
                this.logUtil.putF(success, this, "setOrderStatus(newStatus)");
            }
            return success;
        } catch (e : haxe.Exception) {
            var error : String = "Failed to view order table";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "setOrderStatus(newStatus)", e);
            }
            return error;
        }
    }

    public function setOrderStatus() : String {
        try {
            var success : String = "Status successfully set to: " + this.status;
            OrderItemsEntityFactory.getInstance().setStatus(this.id, this.groupId, this.status);
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGS)) {
                this.logUtil.putF(success, this, "setOrderStatus(newStatus)");
            }
            return success;
        } catch (e : haxe.Exception) {
            var error : String = "Failed to view order table";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "setOrderStatus(newStatus)", e);
            }
            return error;
        }
    }

}

