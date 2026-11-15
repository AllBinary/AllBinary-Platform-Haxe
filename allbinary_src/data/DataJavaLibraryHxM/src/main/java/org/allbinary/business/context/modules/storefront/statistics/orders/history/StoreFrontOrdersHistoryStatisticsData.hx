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


class StoreFrontOrdersHistoryStatisticsData {
    private static final instance : StoreFrontOrdersHistoryStatisticsData = new StoreFrontOrdersHistoryStatisticsData();
    public static function getInstance() : StoreFrontOrdersHistoryStatisticsData {
        return StoreFrontOrdersHistoryStatisticsData.instance;
    }

    public function new() {
    }

    public final NAME : String = "STOREFRONT_ORDERS_HISTORY_STATISTICS_NAME";
    public final NUMBEROFORDERS : String = "STOREFRONT_ORDERS_HISTORY_STATISTICS_NUMBER_OF_ORDERS";
    public final SUBTOTAL : String = "STOREFRONT_ORDERS_HISTORY_STATISTICS_SUBTOTAL";
    public final SHIPPINGCOST : String = "STOREFRONT_ORDERS_HISTORY_STATISTICS_SHIPPINGCOST";
    public final TAXES : String = "STOREFRONT_ORDERS_HISTORY_STATISTICS_TAXES";
    public final TOTAL : String = "STOREFRONT_ORDERS_HISTORY_STATISTICS_TOTAL";
}

