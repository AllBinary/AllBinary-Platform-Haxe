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

import org.allbinary.business.user.commerce.inventory.order.OrderHistory;
import org.allbinary.business.user.commerce.money.payment.types.PaymentType;
import org.allbinary.business.user.commerce.money.payment.types.PaymentTypeUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;

class PaymentTransactionInterfaceFactory {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : PaymentTransactionInterfaceFactory = new PaymentTransactionInterfaceFactory();
    public static function getInstance() : PaymentTransactionInterfaceFactory {
        return PaymentTransactionInterfaceFactory.instance;
    }

    public function new() {
    }

    // throws Exception
    public function getInstance(orderReview : OrderHistory) : PaymentTransactionInterface {
        try {
            var gatewayName : String = orderReview.getPaymentMethod();
            if (gatewayName != null) {
                var paymentType : PaymentType = PaymentTypeUtil.getInstance().get(gatewayName);
                var paymentTransactionInterfaceFactoryInterface : PaymentTransactionInterfaceFactoryInterface = paymentType.getPaymentTransactionInterfaceFactoryInterface();
                var paymentTransactionInterface : PaymentTransactionInterface = paymentTransactionInterfaceFactoryInterface.getInstance(orderReview);
                return paymentTransactionInterface;
            }
            throw new haxe.Exception("Failed to create PaymentTransactionInterface: " + "GatewayName is: " + gatewayName);
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().PAYMENTERROR)) {
                final commonStrings : CommonStrings = CommonStrings.getInstance();
                this.logUtil.put("Failed to generate test data", this, commonStrings.GET_INSTANCE, e);
            }
            throw e;
        }
    }

}

