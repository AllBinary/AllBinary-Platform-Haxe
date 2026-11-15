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
package org.allbinary.business.user.commerce.money.payment.gateway.processor;

import org.allbinary.business.user.commerce.money.payment.gateway.transaction.PaymentTransactionInterface;
import org.allbinary.business.user.commerce.money.payment.gateway.transaction.PaymentTransactionInterfaceRequestFactory;
import org.allbinary.business.user.commerce.money.payment.types.PaymentType;
import org.allbinary.business.user.commerce.money.payment.types.PaymentTypeUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringValidationUtil;
import org.allbinary.logic.visual.transform.info.TransformInfoInterface;
import org.allbinary.string.CommonStrings;

class PaymentProcessorInterfaceFactory {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : PaymentProcessorInterfaceFactory = new PaymentProcessorInterfaceFactory();
    public static function getInstance() : PaymentProcessorInterfaceFactory {
        return PaymentProcessorInterfaceFactory.instance;
    }

    public function new() {
    }

    // throws Exception
    // synchronized
    public function getInstance(transformInfoInterface : TransformInfoInterface) : PaymentProcessorInterface {
        try {
            var paymentTransactionInterface : PaymentTransactionInterface = PaymentTransactionInterfaceRequestFactory.getInstance().getInstance(transformInfoInterface);
            var gatewayName : String = paymentTransactionInterface.getOrderHistory().getPaymentMethod();
            if (!StringValidationUtil.getInstance().isEmpty(gatewayName)) {
                var paymentType : PaymentType = PaymentTypeUtil.getInstance().get(gatewayName);
                var paymentProcessorInterfaceFactoryInterface : PaymentProcessorInterfaceFactoryInterface = paymentType.getPaymentProcessorInterfaceFactoryInterface();
                return (cast paymentProcessorInterfaceFactoryInterface.getInstance(transformInfoInterface, paymentTransactionInterface) : PaymentProcessorInterface);
            }
            throw new haxe.Exception("Error Getting PaymentProcessorInterface");
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().PAYMENTERROR)) {
                final commonStrings : CommonStrings = CommonStrings.getInstance();
                this.logUtil.put(commonStrings.EXCEPTION, this, commonStrings.GET_INSTANCE, e);
            }
            throw e;
        }
    }

}

