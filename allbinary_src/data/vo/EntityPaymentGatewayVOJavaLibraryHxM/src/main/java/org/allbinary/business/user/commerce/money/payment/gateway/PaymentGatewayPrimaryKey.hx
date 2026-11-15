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

import org.allbinary.business.context.modules.storefront.StoreFront;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.string.CommonSeps;

class PaymentGatewayPrimaryKey implements java.io.Serializable {
    private var storeName : String = null;
    private var name : String = null;
    public function new(storeName : String, gatewayName : String) {
        this.setStoreName(storeName);
        this.setName(gatewayName);
    }

    public function getStoreName() : String {
        return this.storeName;
    }

    public function setStoreName(storeName : String) : Void {
        this.storeName = storeName;
    }

    public function getName() : String {
        return this.name;
    }

    public function setName(name : String) : Void {
        this.name = name;
    }

    public function toString() : String {
        var stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(PaymentGatewayPrimaryKey.getName());
        stringBuffer.append(StoreFront.getName());
        stringBuffer.append(" =");
        stringBuffer.append(this.getStoreName());
        stringBuffer.append(CommonSeps.getInstance().SPACE);
        stringBuffer.append(PaymentGateway.getName());
        stringBuffer.append("=");
        stringBuffer.append(this.getName());
        return Std.string(stringBuffer);
    }

}

