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
package org.allbinary.data.tables.user.commerce.inventory.order;

//import java.util.HashMap;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.business.context.modules.storefront.StoreFrontInterface;
import org.allbinary.business.user.commerce.inventory.order.Order;
import org.allbinary.business.user.commerce.inventory.order.OrderHistory;
import org.allbinary.data.tables.BasicDataTableInterface;

interface OrderHistoryEntityInterface extends BasicDataTableInterface {
    function insert(userName : String, order : Order) : Void;

    function setStatus(orderId : String, status : String) : Void;

    function setPaymentMethod(orderId : String, status : String) : Void;

    // throws Exception
    function getStoreOrders(storeFrontInterface : StoreFrontInterface) : BasicArrayList;

    // throws Exception
    function getOrders(userName : String) : BasicArrayList;

    // throws Exception
    function getOrders(status : String, fromDate : String, toDate : String) : BasicArrayList;

    // throws Exception
    function getOrder(id : String) : OrderHistory;

    // throws Exception
    function update(whereHashMap : HashMap, orderHashMap : HashMap) : Void;

}

