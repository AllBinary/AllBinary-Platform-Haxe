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
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.data.tables.TableMappingInterface;

class PaymentGatewayMapping implements TableMappingInterface {
    private var paymentGatewayInterface : PaymentGatewayInterface;
    public function new(paymentGatewayInterface : PaymentGatewayInterface) {
        this.paymentGatewayInterface = paymentGatewayInterface;
    }

    // throws Exception
    public function toHashMap() : HashMap {
        return this.paymentGatewayInterface.toHashMap(false);
    }

    public function toVector() : BasicArrayList {
        return this.paymentGatewayInterface.toVector(false);
    }

    // throws Exception
    public function getKey() : Any {
        return (cast this.paymentGatewayInterface.getKey() : Any);
    }

}

