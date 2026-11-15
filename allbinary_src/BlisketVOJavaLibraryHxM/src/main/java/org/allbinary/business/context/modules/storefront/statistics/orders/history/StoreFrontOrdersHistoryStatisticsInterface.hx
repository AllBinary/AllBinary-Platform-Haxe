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
package org.allbinary.business.context.modules.storefront.statistics.orders.history;

import org.allbinary.business.user.commerce.money.Money;
import org.allbinary.data.tables.TableMappingInterface;

interface StoreFrontOrdersHistoryStatisticsInterface extends TableMappingInterface {
    function getNumberOfOrders() : Null<haxe.Int64>;

    function getSubTotal() : Money;

    function getShippingCost() : Money;

    function getTaxes() : Money;

    function getTotal() : Money;

}

