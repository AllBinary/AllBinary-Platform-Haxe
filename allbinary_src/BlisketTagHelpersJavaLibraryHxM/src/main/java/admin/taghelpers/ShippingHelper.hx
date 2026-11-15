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
import org.allbinary.business.context.modules.storefront.StoreFrontData;
import org.allbinary.business.context.modules.storefront.StoreFrontFactory;
import org.allbinary.business.context.modules.storefront.StoreFrontInterface;
import org.allbinary.business.user.commerce.inventory.order.OrderInterface;
import org.allbinary.business.user.commerce.shipping.ShippingMethodData;
import org.allbinary.logic.communication.http.request.session.WeblisketSession;
import org.allbinary.logic.communication.log.LogUtil;

class ShippingHelper extends TagHelper {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var weblisketSession : WeblisketSession;
    private var storeFrontInterface : StoreFrontInterface = null;
    private var propertiesHashMap : HashMap = null;
    private var pageContext : PageContext;
    private var request : HttpServletRequest;
    private var shippingType : String = null;
    public function new(hashMap : HashMap, pageContext : PageContext) {
        super();
        this.pageContext = pageContext;
        this.request = (cast pageContext.getRequest() : HttpServletRequest);
        var storeName : String = (cast hashMap.get(StoreFrontData.getInstance().NAME) : String);
        if (storeName != null) {
            this.storeFrontInterface = StoreFrontFactory.getInstance(storeName);
        }
        this.weblisketSession = new WeblisketSession(hashMap, pageContext);
        this.getFormData();
    }

    private function getFormData() : Void {
        this.shippingType = this.request.getParameter(ShippingMethodData.NAME);
    }

    public function setShippingType() : String {
        try {
            var success : String = "Successfully Set Shipping Type";
            var order : OrderInterface = this.weblisketSession.getOrder();
            order.setShippingMethod(this.shippingType);
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGS)) {
                this.logUtil.putF(success, this, "setShippingType()");
            }
            return success;
        } catch (e : haxe.Exception) {
            var error : String = "Failed to view Shipping Type";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "setShippingType()", e);
            }
            return error;
        }
    }

}

