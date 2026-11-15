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

import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.business.user.commerce.inventory.basket.BasketReview;
import org.allbinary.business.user.commerce.inventory.order.OrderInterface;
import org.allbinary.data.tables.BasicDataTableInterface;

interface OrderItemsEntityInterface extends BasicDataTableInterface {
    function setStatus(orderId : String, groupId : String, status : String) : Void;

    function isEverythingShipped(orderId : String) : Bool;

    function getBasketReview(orderId : String) : BasketReview;

    function insert(userName : String, order : OrderInterface) : Void;

    function insert(values : BasicArrayList) : Void;

}

