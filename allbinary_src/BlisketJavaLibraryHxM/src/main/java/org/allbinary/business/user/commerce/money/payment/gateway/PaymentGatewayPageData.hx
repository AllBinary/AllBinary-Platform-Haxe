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
package org.allbinary.business.user.commerce.money.payment.gateway;

import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;

class PaymentGatewayPageData {
    private static final EXTENSION : String = ".jsp";
    private static final NAME : String = StringUtil.getInstance().EMPTY_STRING;
    public static final FORWARDMAKEPAYMENT : String = "MakePayment.jsp";
    public final MAKEPAYMENT : String;
    public static final PAYMENTOPTIONS : String = "PaymentOptions" + PaymentGatewayPageData.EXTENSION;
    public static final STARTCHECKOUT : String = "StartCheckout" + PaymentGatewayPageData.EXTENSION;
    public final CHECKOUT : String;
    public final SHIPPING : String;
    public final SHIPPINGADDRESS : String;
    public final SHIPPINGADDRESSACTION : String;
    public final BILLINGADDRESS : String;
    public final PAYMENT : String;
    public final AUTHORIZE : String;
    public final FINISH : String;
    public function new(location : String, paymentMethod : String) {
        final paymentMethodString : String = PaymentGatewayPageData.NAME + paymentMethod;
        var stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(location);
        stringBuffer.append("MakePayment");
        stringBuffer.append(PaymentGatewayPageData.EXTENSION);
        MAKEPAYMENT = stringBuffer.toString();
        stringBuffer.delete(0, stringBuffer.length());
        stringBuffer.append(paymentMethodString);
        stringBuffer.append("Checkout");
        stringBuffer.append(PaymentGatewayPageData.EXTENSION);
        CHECKOUT = stringBuffer.toString();
        stringBuffer.delete(0, stringBuffer.length());
        stringBuffer.append(paymentMethodString);
        stringBuffer.append("Shipping");
        stringBuffer.append(PaymentGatewayPageData.EXTENSION);
        SHIPPING = stringBuffer.toString();
        stringBuffer.delete(0, stringBuffer.length());
        stringBuffer.append(paymentMethodString);
        stringBuffer.append("ShippingAddress");
        stringBuffer.append(PaymentGatewayPageData.EXTENSION);
        SHIPPINGADDRESS = stringBuffer.toString();
        stringBuffer.delete(0, stringBuffer.length());
        stringBuffer.append(paymentMethodString);
        stringBuffer.append("ShippingAddressAction");
        stringBuffer.append(PaymentGatewayPageData.EXTENSION);
        SHIPPINGADDRESSACTION = stringBuffer.toString();
        stringBuffer.delete(0, stringBuffer.length());
        stringBuffer.append(paymentMethodString);
        stringBuffer.append("BillingAddress");
        stringBuffer.append(PaymentGatewayPageData.EXTENSION);
        BILLINGADDRESS = stringBuffer.toString();
        stringBuffer.delete(0, stringBuffer.length());
        stringBuffer.append(paymentMethodString);
        stringBuffer.append("Payment");
        stringBuffer.append(PaymentGatewayPageData.EXTENSION);
        PAYMENT = stringBuffer.toString();
        stringBuffer.delete(0, stringBuffer.length());
        stringBuffer.append(paymentMethodString);
        stringBuffer.append("Authorize");
        stringBuffer.append(PaymentGatewayPageData.EXTENSION);
        AUTHORIZE = stringBuffer.toString();
        stringBuffer.delete(0, stringBuffer.length());
        stringBuffer.append(paymentMethodString);
        stringBuffer.append("PaymentFinish");
        stringBuffer.append(PaymentGatewayPageData.EXTENSION);
        FINISH = stringBuffer.toString();
    }

}

