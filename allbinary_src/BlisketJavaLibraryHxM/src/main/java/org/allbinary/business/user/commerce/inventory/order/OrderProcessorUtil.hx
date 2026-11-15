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
package org.allbinary.business.user.commerce.inventory.order;

import org.allbinary.data.generator.OrderIdGenerator;
import org.allbinary.data.tables.user.commerce.inventory.order.OrderHistoryEntity;
import org.allbinary.data.tables.user.commerce.inventory.order.OrderItemsEntity;

class OrderProcessorUtil {
    private static final instance : OrderProcessorUtil = new OrderProcessorUtil();
    public static function getInstance() : OrderProcessorUtil {
        return OrderProcessorUtil.instance;
    }

    private final ORDER_PROCESSED : String = "Order Processed";
    // throws Exception
    public function process(userName : String, order : Order) : String {
        var orderItems : OrderItemsEntity = new OrderItemsEntity();
        var orderHistory : OrderHistoryEntity = new OrderHistoryEntity();
        order.setId(new OrderIdGenerator().getNext());
        orderItems.insert(userName, order);
        orderHistory.insert(userName, order);
        return this.ORDER_PROCESSED;
    }

    public function new() {
    }
}

