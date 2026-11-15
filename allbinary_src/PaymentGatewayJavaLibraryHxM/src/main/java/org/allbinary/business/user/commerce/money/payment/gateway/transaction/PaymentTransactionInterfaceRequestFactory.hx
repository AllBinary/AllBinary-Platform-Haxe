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
package org.allbinary.business.user.commerce.money.payment.gateway.transaction;

//import java.util.HashMap;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.jsp.PageContext;
import org.allbinary.business.context.modules.storefront.StoreFrontFactory;
import org.allbinary.business.context.modules.storefront.StoreFrontInterface;
import org.allbinary.business.user.address.StreetAddress;
import org.allbinary.business.user.commerce.inventory.basket.Basket;
import org.allbinary.business.user.commerce.inventory.order.OrderHistory;
import org.allbinary.business.user.commerce.inventory.order.OrderInterface;
import org.allbinary.business.user.commerce.money.Money;
import org.allbinary.business.user.commerce.money.payment.Payment;
import org.allbinary.business.user.commerce.money.payment.PaymentData;
import org.allbinary.business.user.commerce.money.payment.gateway.PaymentGatewayData;
import org.allbinary.business.user.commerce.money.payment.types.TenderTypeFactory;
import org.allbinary.business.user.commerce.money.payment.types.TransactionTypeFactory;
import org.allbinary.data.generator.OrderIdGenerator;
import org.allbinary.data.tables.user.commerce.inventory.order.OrderHistoryEntityFactory;
import org.allbinary.data.tables.user.commerce.inventory.order.OrderHistoryEntityInterface;
import org.allbinary.logic.communication.http.request.session.WeblisketSession;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.string.StringValidationUtil;
import org.allbinary.logic.visual.transform.info.TransformInfoHttpInterface;
import org.allbinary.logic.visual.transform.info.TransformInfoInterface;
import org.allbinary.string.CommonStrings;

class PaymentTransactionInterfaceRequestFactory {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : PaymentTransactionInterfaceRequestFactory = new PaymentTransactionInterfaceRequestFactory();
    public static function getInstance() : PaymentTransactionInterfaceRequestFactory {
        return PaymentTransactionInterfaceRequestFactory.instance;
    }

    public function new() {
    }

    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    // throws Exception
    public function getInstance(transformInfoInterface : TransformInfoInterface) : PaymentTransactionInterface {
        try {
            var httpTransformInfoInterface : TransformInfoHttpInterface = (cast transformInfoInterface : TransformInfoHttpInterface);
            var pageContext : PageContext = httpTransformInfoInterface.getPageContext();
            var httpServletRequest : HttpServletRequest = (cast pageContext.getRequest() : HttpServletRequest);
            var command : String = httpServletRequest.getParameter(org.allbinary.globals.GLOBALS2.ADMINCOMMAND);
            if (command != null && Reflect.compare(command, org.allbinary.globals.GLOBALS2.AUTHORIZEFORMEVALBODYONERROR) == 0) {
                return this.generateFromTestData(transformInfoInterface);
            } else {
                var propertiesHashMap : HashMap = httpTransformInfoInterface.getPropertiesHashMap();
                var weblisketSession : WeblisketSession = new WeblisketSession(propertiesHashMap, pageContext);
                var storeFrontInterface : StoreFrontInterface = StoreFrontFactory.getInstance(weblisketSession.getStoreName());
                var order : OrderInterface = weblisketSession.getOrder();
                var orderId : String = order.getId();
                var orderHistoryEntityInterface : OrderHistoryEntityInterface = OrderHistoryEntityFactory.getInstance();
                var orderReview : OrderHistory = orderHistoryEntityInterface.getOrder(orderId);
                var orderPaymentInfo : Payment = orderReview.getPaymentInfo();
                orderPaymentInfo.setTransactionType(TransactionTypeFactory.getInstance().SALE.toString());
                orderPaymentInfo.setTenderType(TenderTypeFactory.getInstance().CREDITCARD.toString());
                orderReview.setPaymentInfo(orderPaymentInfo);
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().PAYMENT)) {
                    this.logUtil.putF(orderReview.getId(), this, "getPaymentTransactionInterface()");
                }
                var paymentTransactionInterface : PaymentTransactionInterface = PaymentTransactionInterfaceFactory.getInstance().getInstance(orderReview);
                return paymentTransactionInterface;
            }
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().PAYMENTERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "getPaymentTransactionInterface()", e);
            }
            throw e;
        }
    }

    // throws Exception
    private function generateFromTestData(transformInfoInterface : TransformInfoInterface) : PaymentTransactionInterface {
        try {
            var httpTransformInfoInterface : TransformInfoHttpInterface = (cast transformInfoInterface : TransformInfoHttpInterface);
            var propertiesHashMap : HashMap = httpTransformInfoInterface.getPropertiesHashMap();
            var pageContext : PageContext = httpTransformInfoInterface.getPageContext();
            var weblisketSession : WeblisketSession = new WeblisketSession(propertiesHashMap, pageContext);
            var storeFrontInterface : StoreFrontInterface = StoreFrontFactory.getInstance(weblisketSession.getStoreName());
            var httpServletRequest : HttpServletRequest = (cast pageContext.getRequest() : HttpServletRequest);
            var gatewayName : String = (cast weblisketSession.getPaymentMethod() : String);
            if (StringValidationUtil.getInstance().isEmpty(gatewayName)) {
                gatewayName = httpServletRequest.getParameter(PaymentGatewayData.NAME.toString());
            }
            var transactionType : String = httpServletRequest.getParameter(PaymentData.TRANSACTIONTYPE);
            var tenderType : String = httpServletRequest.getParameter(PaymentData.TENDERTYPE);
            var payment : Payment = new Payment();
            payment.setTransactionType(transactionType);
            payment.setTenderType(tenderType);
            var orderReview : OrderHistory = new OrderHistory(new Basket());
            orderReview.setStoreName(storeFrontInterface.getName());
            orderReview.setPaymentMethod(gatewayName);
            orderReview.setUserName("testing");
            var orderId : String = httpServletRequest.getParameter("orderNumber");
            if (orderId == null || Reflect.compare(orderId, StringUtil.getInstance().EMPTY_STRING) == 0) {
                orderId = new OrderIdGenerator().getNext();
                orderReview.setId(orderId);
                var account : String = httpServletRequest.getParameter("account");
                var expirationDate : String = httpServletRequest.getParameter("expirationDate");
                var checkNumber : String = httpServletRequest.getParameter("checkNumber");
                var driversLicense : String = httpServletRequest.getParameter("driversLicense");
                var magneticInkCheckReader : String = httpServletRequest.getParameter("magneticInkCheckReader");
                var aba : String = httpServletRequest.getParameter("aba");
                var accountType : String = httpServletRequest.getParameter("accountType");
                var name : String = httpServletRequest.getParameter("name");
                payment.setName(name);
                payment.setNumber(account);
                payment.setExpiration(expirationDate);
                payment.setCheckNumber(checkNumber);
                payment.setDriversLicense(driversLicense);
                payment.setMagneticInkCheckReader(magneticInkCheckReader);
                payment.setAba(aba);
                payment.setAccountType(accountType);
                var street : String = httpServletRequest.getParameter("street");
                var city : String = httpServletRequest.getParameter("city");
                var state : String = httpServletRequest.getParameter("state");
                var zip : String = httpServletRequest.getParameter("zip");
                var streetAddress : StreetAddress = new StreetAddress();
                streetAddress.setName(name);
                streetAddress.setStreet(street);
                streetAddress.setCity(city);
                streetAddress.setState(state);
                streetAddress.setCode(zip);
                var email : String = httpServletRequest.getParameter("email");
                var amount : String = httpServletRequest.getParameter("amount");
                orderReview.setTotal(new Money(amount));
                orderReview.setBillingAddress(streetAddress);
            } else {
                orderReview.setId(orderId);
            }
            orderReview.setPaymentInfo(payment);
            var paymentTransactionInterface : PaymentTransactionInterface = PaymentTransactionInterfaceFactory.getInstance().getInstance(orderReview);
            return paymentTransactionInterface;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().PAYMENTERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "generatePaymentTransactionInterfaceFromTestData()", e);
            }
            throw e;
        }
    }

}

