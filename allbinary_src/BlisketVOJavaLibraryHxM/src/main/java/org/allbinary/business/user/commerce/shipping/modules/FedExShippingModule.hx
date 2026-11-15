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
package org.allbinary.business.user.commerce.shipping.modules;

import org.allbinary.business.user.commerce.inventory.order.OrderInterface;
import org.allbinary.business.user.commerce.money.Money;

class FedExShippingModule implements ShippingInterface {
    private final name : String = "FedEx";
    private final description : String = "Fast Mail";
    public function new() {
    }

    public function getCost(order : OrderInterface) : Money {
        return new Money();
    }

    public function getDescription() : String {
        return this.description;
    }

    public function getName() : String {
        return this.name;
    }

}

