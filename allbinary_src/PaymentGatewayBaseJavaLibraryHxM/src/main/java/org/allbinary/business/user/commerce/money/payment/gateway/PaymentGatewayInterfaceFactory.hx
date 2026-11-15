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

//import java.util.HashMap;
//import javax.servlet.http.HttpServletRequest;
import org.allbinary.business.user.commerce.money.payment.types.BasicPaymentType;
import org.allbinary.business.user.commerce.money.payment.types.BasicPaymentTypeUtil;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.http.request.RequestParams;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;

class PaymentGatewayInterfaceFactory implements PaymentGatewayInterfaceFactoryInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public function new() {
    }

    // throws Exception
    public function getInstance(httpServletRequest : HttpServletRequest) : PaymentGatewayInterface {
        final commonStrings : CommonStrings = CommonStrings.getInstance();
        try {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().PAYMENT)) {
                this.logUtil.putF("Getting", this, commonStrings.GET_INSTANCE);
            }
            return this.getInstance(new RequestParams(httpServletRequest).toHashMap());
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().PAYMENTERROR)) {
                this.logUtil.put(commonStrings.EXCEPTION, this, "getInstance(HttpServletRequest)", e);
            }
            throw e;
        }
    }

    // throws Exception
    public function getInstance(paymentType : BasicPaymentType) : PaymentGatewayInterface {
        var hashMap : HashMap = StdUtil.getInstance().createHashMap();
        hashMap.put(PaymentGatewayData.NAME.toString(), paymentType.getName());
        return this.getInstance(hashMap);
    }

    // throws Exception
    public function getInstance(hashMap : HashMap) : PaymentGatewayInterface {
        final commonStrings : CommonStrings = CommonStrings.getInstance();
        try {
            var gatewayName : String = (cast hashMap.get(PaymentGatewayData.NAME.toString()) : String);
            var paymentType : BasicPaymentType = BasicPaymentTypeUtil.getInstance().get(gatewayName);
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().PAYMENT)) {
                this.logUtil.putF("Getting PaymentGatewayInterface for PaymentType: " + paymentType.getName() + " with: " + hashMap, this, commonStrings.GET_INSTANCE);
            }
            var paymentGatewayInterfaceFactoryInterface : PaymentGatewayInterfaceFactoryInterface = paymentType.getPaymentGatewayInterfaceFactoryInterface();
            return paymentGatewayInterfaceFactoryInterface.getInstance(hashMap);
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().PAYMENTERROR)) {
                this.logUtil.put(commonStrings.EXCEPTION, this, commonStrings.GET_INSTANCE, e);
            }
            throw e;
        }
    }

}

