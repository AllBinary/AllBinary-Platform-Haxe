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

import org.allbinary.business.user.commerce.inventory.basket.BasketInterface;
import org.allbinary.business.user.commerce.inventory.order.OrderInterface;
import org.allbinary.business.user.commerce.money.Money;
import org.allbinary.string.CommonStrings;

class BasicWeightShippingModule implements ShippingInterface {
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    private final name : String = "Basic Shipping (5 to 7 working days)";
    private final description : String = "We will soon provide a variety of shipping methods.";
    public function new() {
    }

    public function getCost(order : OrderInterface) : Money {
        var basket : BasketInterface = order.getBasket();
        var money : Money = new Money();
        money.add(basket.getTotalWeight());
        money.multiply(1);
        money.add("3.50");
        return money;
    }

    public function getDescription() : String {
        return this.description;
    }

    public function getName() : String {
        return this.name;
    }

}

