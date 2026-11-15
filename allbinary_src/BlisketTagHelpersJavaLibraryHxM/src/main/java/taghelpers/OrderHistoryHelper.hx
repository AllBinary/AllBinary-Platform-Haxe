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
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.jsp.PageContext;
import admin.taghelpers.TagHelper;
import org.allbinary.business.context.modules.storefront.StoreFrontData;
import org.allbinary.business.context.modules.storefront.StoreFrontFactory;
import org.allbinary.business.context.modules.storefront.StoreFrontInterface;
import org.allbinary.business.user.address.StreetAddress;
import org.allbinary.business.user.commerce.inventory.order.OrderData;
import org.allbinary.business.user.commerce.inventory.order.OrderHistoryData;
import org.allbinary.business.user.commerce.inventory.order.OrderHistoryFactory;
import org.allbinary.business.user.commerce.inventory.order.OrderHistoryInterface;
import org.allbinary.business.user.commerce.shipping.ShippingMethodData;
import org.allbinary.data.tables.user.commerce.inventory.order.OrderHistoryEntityFactory;
import org.allbinary.data.tables.user.commerce.inventory.order.OrderHistoryEntityInterface;
import org.allbinary.logic.communication.http.request.session.WeblisketSession;
import org.allbinary.logic.communication.log.LogUtil;

class OrderHistoryHelper extends TagHelper {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var weblisketSession : WeblisketSession = null;
    private var storeFrontInterface : StoreFrontInterface = null;
    private final propertiesHashMap : HashMap;
    private final pageContext : PageContext;
    private final request : HttpServletRequest;
    private var streetAddress : StreetAddress = null;
    private var id : String = null;
    private var groupId : String = null;
    private var status : String = null;
    private var newStatus : String;
    public function new(propertiesHashMap : HashMap, pageContext : PageContext) {
        super();
        this.propertiesHashMap = propertiesHashMap;
        this.pageContext = pageContext;
        this.request = (cast pageContext.getRequest() : HttpServletRequest);
        var storeName : String = (cast propertiesHashMap.get(StoreFrontData.getInstance().NAME) : String);
        this.newStatus = (cast propertiesHashMap.get(OrderHistoryData.STATUS) : String);
        if (storeName != null) {
            this.storeFrontInterface = StoreFrontFactory.getInstance(storeName);
        }
        this.getFormData();
    }

    private function getFormData() : Void {
        this.id = this.request.getParameter(OrderData.ID);
        this.groupId = this.request.getParameter(ShippingMethodData.GROUP);
        if (this.newStatus == null) {
            this.newStatus = this.request.getParameter(OrderHistoryData.STATUS);
        }
    }

    public function setOrderStatus() : String {
        try {
            var success : String = "Status successfully set to: " + this.status;
            var orderReviewInterface : OrderHistoryInterface = OrderHistoryFactory.getInstance(this.id);
            var status : String = orderReviewInterface.getStatus();
            if (Reflect.compare(status, OrderHistoryData.CANCELLED) == 0) {
                return "Order " + this.id + " Already Cancelled<br/>";
            } else if (Reflect.compare(status, OrderHistoryData.SHIPPED) == 0) {
                return "Order " + this.id + " Already Shipped. You can't cancel a shipped order.<br/>";
            } else if (Reflect.compare(status, OrderHistoryData.PREPROCESSING) == 0) {
                return "Order " + this.id + " has been cancelled.<br/>";
            } else if (Reflect.compare(status, OrderHistoryData.PARTIALLYSHIPPED) == 0) {
                return "Order " + this.id + " Partially Shipped. You can cancel unshipped items, but not the whole order.<br/>";
            } else if (Reflect.compare(status, OrderHistoryData.PROCESSING) == 0) {
                var orderHistoryEntityInterface : OrderHistoryEntityInterface = OrderHistoryEntityFactory.getInstance();
                orderHistoryEntityInterface.setStatus(this.id, this.newStatus);
                return "Order " + this.id + " has been cancelled.<br/>";
            }
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGS)) {
                this.logUtil.putF(success, this, "setOrderStatus()");
            }
            return "Error Setting Order Status";
        } catch (e : haxe.Exception) {
            var error : String = "Failed to set order status";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "setOrderStatus()", e);
            }
            return error + "<br/>" + "Exception: " + e + "<br/>";
        }
    }

}

