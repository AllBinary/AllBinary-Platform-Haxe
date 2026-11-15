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
import org.allbinary.business.user.commerce.money.payment.gateway.PaymentGatewayInterfaceFactoryInterface;
import org.allbinary.business.user.commerce.money.payment.gateway.modules.gateway.PaymentGatewayDomNodeFactoryInterface;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.io.path.AbPathData;
import org.allbinary.logic.string.regex.replace.Replace;
import org.allbinary.string.CommonSeps;

class BasicPaymentType {
    private var name : String = null;
    private var value : String = null;
    private var paymentGatewayInterfaceFactoryInterface : PaymentGatewayInterfaceFactoryInterface;
    private var paymentGatewayDomNodeFactoryInterface : PaymentGatewayDomNodeFactoryInterface;
    public function new(paymentMethod : String) {
        this.init(paymentMethod);
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(paymentMethod : String, paymentGatewayInterfaceFactoryInterface : PaymentGatewayInterfaceFactoryInterface, paymentGatewayDomNodeFactoryInterface : PaymentGatewayDomNodeFactoryInterface) {
        this.init(paymentMethod);
        this.paymentGatewayInterfaceFactoryInterface = paymentGatewayInterfaceFactoryInterface;
        this.paymentGatewayDomNodeFactoryInterface = paymentGatewayDomNodeFactoryInterface;
    }

    private function init(paymentMethod : String) : Void {
        var hashMap : HashMap = StdUtil.getInstance().createHashMap();
        final UNDERSCORE : String = "_";
        hashMap.put(CommonSeps.getInstance().SPACE, UNDERSCORE);
        hashMap.put(AbPathData.getInstance().EXTENSION_SEP, UNDERSCORE);
        hashMap.put("-", UNDERSCORE);
        var replace : Replace = new Replace(hashMap);
        this.name = replace.all(paymentMethod);
        this.value = paymentMethod;
        BasicPaymentTypeUtil.getInstance().add(this);
    }

    public function getName() : String {
        return this.name;
    }

    public function getValue() : String {
        return this.value;
    }

    // throws Exception
    public function getPaymentGatewayInterfaceFactoryInterface() : PaymentGatewayInterfaceFactoryInterface {
        if (this.paymentGatewayInterfaceFactoryInterface == null) {
            throw new haxe.Exception("PaymentGatewayInterfaceFactoryInterface is Null");
        }
        return this.paymentGatewayInterfaceFactoryInterface;
    }

    // throws Exception
    public function getPaymentGatewayDomNodeFactoryInterface() : PaymentGatewayDomNodeFactoryInterface {
        if (this.paymentGatewayDomNodeFactoryInterface == null) {
            throw new haxe.Exception("PaymentGatewayDomNodeFactoryInterface is Null");
        }
        return this.paymentGatewayDomNodeFactoryInterface;
    }

    public function getKey() : Any {
        return this.getName();
    }

    public function toVector() : BasicArrayList {
        var vector : BasicArrayList = new BasicArrayListD();
        vector.add(this.name);
        vector.add(this.value);
        return vector;
    }

    public function toHashMap() : HashMap {
        var hashMap : HashMap = StdUtil.getInstance().createHashMap();
        hashMap.put(Std.string(PaymentGatewayData.NAME), this.name);
        hashMap.put(Std.string(PaymentGatewayData.VALUE), this.value);
        return hashMap;
    }

    public function toString() : String {
        return this.name;
    }

}

