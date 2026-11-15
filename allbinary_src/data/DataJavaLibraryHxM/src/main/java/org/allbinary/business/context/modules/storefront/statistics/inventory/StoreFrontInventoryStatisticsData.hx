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
package org.allbinary.business.context.modules.storefront.statistics.inventory;


class StoreFrontInventoryStatisticsData {
    private static final instance : StoreFrontInventoryStatisticsData = new StoreFrontInventoryStatisticsData();
    public static function getInstance() : StoreFrontInventoryStatisticsData {
        return StoreFrontInventoryStatisticsData.instance;
    }

    public function new() {
    }

    public final NAME : String = "STOREFRONT_INVENTORY_STATISTICS_NAME";
    public final NUMBEROFITEMS : String = "STOREFRONT_INVENTORY_STATISTICS_NUMBER_OF_ITEMS";
    public final TOTALVALUE : String = "STOREFRONT_INVENTORY_STATISTICS_TOTAL_VALUE";
}

