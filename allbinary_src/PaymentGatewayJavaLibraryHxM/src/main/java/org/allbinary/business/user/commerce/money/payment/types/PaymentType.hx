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
package org.allbinary.business.user.commerce.money.payment.types;

//import java.util.HashMap;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.business.user.commerce.money.payment.gateway.PaymentGatewayData;
import org.allbinary.business.user.commerce.money.payment.gateway.processor.PaymentProcessorInterfaceFactoryInterface;
import org.allbinary.business.user.commerce.money.payment.gateway.transaction.PaymentTransactionInterfaceFactoryInterface;
import org.allbinary.logic.StdUtil;

class PaymentType {
    private final basicPaymentType : BasicPaymentType;
    private final paymentTransactionInterfaceFactoryInterface : PaymentTransactionInterfaceFactoryInterface;
    private final paymentProcessorInterfaceFactoryInterface : PaymentProcessorInterfaceFactoryInterface;
    public function new(basicPaymentType : BasicPaymentType) {
        this.basicPaymentType = basicPaymentType;
        this.paymentTransactionInterfaceFactoryInterface = null;
        this.paymentProcessorInterfaceFactoryInterface = null;
        PaymentTypeUtil.getInstance().add(this);
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(basicPaymentType : BasicPaymentType, paymentTransactionInterfaceFactoryInterface : PaymentTransactionInterfaceFactoryInterface, paymentProcessorInterfaceFactoryInterface : PaymentProcessorInterfaceFactoryInterface) {
        this.basicPaymentType = basicPaymentType;
        this.paymentTransactionInterfaceFactoryInterface = paymentTransactionInterfaceFactoryInterface;
        this.paymentProcessorInterfaceFactoryInterface = paymentProcessorInterfaceFactoryInterface;
        PaymentTypeUtil.getInstance().add(this);
    }

    // throws Exception
    public function getPaymentTransactionInterfaceFactoryInterface() : PaymentTransactionInterfaceFactoryInterface {
        if (this.paymentTransactionInterfaceFactoryInterface == null) {
            throw new haxe.Exception("PaymentTransactionInterfaceFactoryInterface is Null");
        }
        return this.paymentTransactionInterfaceFactoryInterface;
    }

    // throws Exception
    public function getPaymentProcessorInterfaceFactoryInterface() : PaymentProcessorInterfaceFactoryInterface {
        if (this.paymentProcessorInterfaceFactoryInterface == null) {
            throw new haxe.Exception("PaymentProcessorInterfaceFactoryInterface is Null");
        }
        return this.paymentProcessorInterfaceFactoryInterface;
    }

    public function toVector() : BasicArrayList {
        var vector : BasicArrayList = new BasicArrayListD();
        vector.addAllList(this.getBasicPaymentType().toVector());
        if (this.paymentTransactionInterfaceFactoryInterface != null) {
            vector.add(Type.getClassName(Type.getClass(this.paymentTransactionInterfaceFactoryInterface)));
        }
        if (this.paymentProcessorInterfaceFactoryInterface != null) {
            vector.add(Type.getClassName(Type.getClass(this.paymentProcessorInterfaceFactoryInterface)));
        }
        return vector;
    }

    public function toHashMap() : HashMap {
        var hashMap : HashMap = StdUtil.getInstance().createHashMap();
        hashMap.putAll(this.getBasicPaymentType().toHashMap());
        if (this.paymentTransactionInterfaceFactoryInterface != null) {
            hashMap.put(Std.string(PaymentGatewayData.PAYMENTTRANSACTIONINTERFACEFACTORYINTERFACE), Type.getClassName(Type.getClass(this.paymentTransactionInterfaceFactoryInterface)));
        }
        if (this.paymentProcessorInterfaceFactoryInterface != null) {
            hashMap.put(Std.string(PaymentGatewayData.PAYMENTPROCESSORINTERFACEFACTORYINTERFACE), Type.getClassName(Type.getClass(this.paymentProcessorInterfaceFactoryInterface)));
        }
        return hashMap;
    }

    public function getBasicPaymentType() : BasicPaymentType {
        return this.basicPaymentType;
    }

}

