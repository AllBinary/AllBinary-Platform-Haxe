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
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.jsp.PageContext;
import org.allbinary.business.context.modules.storefront.StoreFrontData;
import org.allbinary.business.context.modules.storefront.StoreFrontFactory;
import org.allbinary.business.context.modules.storefront.StoreFrontInterface;
import org.allbinary.business.user.commerce.inventory.order.Order;
import org.allbinary.business.user.commerce.inventory.order.OrderInterface;
import org.allbinary.business.user.commerce.inventory.order.OrderProcessorUtil;
import org.allbinary.business.user.commerce.money.payment.gateway.PaymentGatewayData;
import org.allbinary.business.user.commerce.money.payment.gateway.PaymentGatewayInterface;
import org.allbinary.business.user.commerce.money.payment.types.BasicPaymentType;
import org.allbinary.data.tables.user.commerce.money.payment.gateway.PaymentGatewayEntity;
import org.allbinary.data.tables.user.commerce.money.payment.gateway.PaymentGatewayEntityFactory;
import org.allbinary.logic.communication.http.request.session.WeblisketSession;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringValidationUtil;

class OrderHelper extends TagHelper {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var weblisketSession : WeblisketSession;
    private var storeFrontInterface : StoreFrontInterface = null;
    private var propertiesHashMap : HashMap;
    private var pageContext : PageContext;
    private var request : HttpServletRequest;
    public function new(propertiesHashMap : HashMap, pageContext : PageContext) {
        super();
        this.propertiesHashMap = propertiesHashMap;
        this.pageContext = pageContext;
        this.request = (cast pageContext.getRequest() : HttpServletRequest);
        var storeName : String = (cast propertiesHashMap.get(StoreFrontData.getInstance().NAME) : String);
        if (!StringValidationUtil.getInstance().isEmpty(storeName)) {
            this.storeFrontInterface = StoreFrontFactory.getInstance(storeName);
        }
        this.weblisketSession = new WeblisketSession(this.propertiesHashMap, this.pageContext);
    }

    public function setPaymentGateway() : Null<Bool> {
        try {
            var paymentGatewayBoolean : Null<Bool> = false;
            var orderInterface : OrderInterface = this.weblisketSession.getOrder();
            var requestPaymentGateway : String = (cast this.request.getParameter(Std.string(PaymentGatewayData.NAME)) : String);
            if (!StringValidationUtil.getInstance().isEmpty(requestPaymentGateway)) {
                this.weblisketSession.setPaymentMethod(requestPaymentGateway);
                orderInterface.setPaymentMethod(requestPaymentGateway);
                paymentGatewayBoolean = true;
            }
            var paymentGatewayEntityInterface : PaymentGatewayEntity = (cast PaymentGatewayEntityFactory.getInstance() : PaymentGatewayEntity);
            var paymentTypeVector : BasicArrayList = paymentGatewayEntityInterface.findPaymentTypeVectorByStore(this.weblisketSession.getStoreName());
            if (paymentTypeVector.size() == 1) {
                var paymentType : BasicPaymentType = (cast paymentTypeVector.get(0) : BasicPaymentType);
                var paymentGatewayInterface : PaymentGatewayInterface = (cast paymentGatewayEntityInterface.getPaymentGatewayInterface(this.weblisketSession.getStoreName(), paymentType) : PaymentGatewayInterface);
                var paymentGateway : String = paymentGatewayInterface.getName();
                this.weblisketSession.setPaymentMethod(paymentGateway);
                orderInterface.setPaymentMethod(paymentGateway);
                paymentGatewayBoolean = true;
            }
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGS)) {
                var stringBuffer : StringMaker = new StringMaker();
                stringBuffer.append("Successfully set PaymentGateway Order: ");
                stringBuffer.append(orderInterface.getId());
                stringBuffer.append(" to: ");
                stringBuffer.append(orderInterface.getPaymentMethod());
                this.logUtil.putF(Std.string(stringBuffer), this, "setPaymentGateway()");
            }
            return paymentGatewayBoolean;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                var stringBuffer : StringMaker = new StringMaker();
                stringBuffer.append("Failed to set PaymentGateway for Order: ");
                try {
                    var orderInterface : OrderInterface = this.weblisketSession.getOrder();
                    if (orderInterface != null) {
                        stringBuffer.append(orderInterface.getId());
                        stringBuffer.append(" to: ");
                        stringBuffer.append(orderInterface.getPaymentMethod());
                    }
                } catch (ex : haxe.Exception) {
                    stringBuffer.append(" Exception Getting");
                }
                this.logUtil.put(Std.string(stringBuffer), this, "setPaymentGateway()", e);
            }
            return false;
        }
    }

    public function process() : String {
        try {
            var order : OrderInterface = this.weblisketSession.getOrder();
            order.setStoreName(this.storeFrontInterface.getName());
            var result : String = OrderProcessorUtil.getInstance().process(this.weblisketSession.getUserName(), (cast order : Order));
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGS)) {
                this.logUtil.putF("Successfully Processed Order: " + result, this, "processOrder()");
            }
            return result;
        } catch (e : haxe.Exception) {
            final stringBuffer : StringMaker = new StringMaker();
            stringBuffer.append("Failed to Process Order: ");
            try {
                stringBuffer.append(this.weblisketSession.getOrder().getId());
            } catch (ex : haxe.Exception) {
                stringBuffer.append(" Exception Getting Id");
            }
            final error : String = Std.string(stringBuffer);
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.PROCESS, e);
            }
            return error;
        }
    }

}

