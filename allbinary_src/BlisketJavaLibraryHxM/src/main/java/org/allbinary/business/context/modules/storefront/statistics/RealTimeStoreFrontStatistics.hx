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
package org.allbinary.business.context.modules.storefront.statistics;

import org.allbinary.business.context.modules.storefront.StoreFrontInterface;
import org.allbinary.business.context.modules.storefront.statistics.advertisements.StoreFrontAdvertisementsStatistics;
import org.allbinary.business.context.modules.storefront.statistics.advertisements.StoreFrontAdvertisementsStatisticsInterface;
import org.allbinary.business.context.modules.storefront.statistics.inventory.StoreFrontInventoryStatistics;
import org.allbinary.business.context.modules.storefront.statistics.inventory.StoreFrontInventoryStatisticsInterface;
import org.allbinary.business.context.modules.storefront.statistics.orders.history.StoreFrontOrdersHistoryStatistics;
import org.allbinary.business.context.modules.storefront.statistics.orders.history.StoreFrontOrdersHistoryStatisticsInterface;
import org.allbinary.business.context.modules.storefront.statistics.users.StoreFrontUsersStatistics;
import org.allbinary.business.context.modules.storefront.statistics.users.StoreFrontUsersStatisticsInterface;

class RealTimeStoreFrontStatistics implements StoreFrontStatisticsInterface {
    private var storeFrontAdvertisementsStatisticsInterface : StoreFrontAdvertisementsStatisticsInterface;
    private var storeFrontUsersStatisticsInterface : StoreFrontUsersStatisticsInterface;
    private var storeFrontInventoryStatisticsInterface : StoreFrontInventoryStatisticsInterface;
    private var storeFrontOrderHistoryStatisticsInterface : StoreFrontOrdersHistoryStatisticsInterface;
    public function new(storeFrontInterface : StoreFrontInterface) {
        this.storeFrontAdvertisementsStatisticsInterface = (cast new StoreFrontAdvertisementsStatistics(storeFrontInterface) : StoreFrontAdvertisementsStatisticsInterface);
        this.storeFrontUsersStatisticsInterface = (cast new StoreFrontUsersStatistics(storeFrontInterface) : StoreFrontUsersStatisticsInterface);
        this.storeFrontInventoryStatisticsInterface = (cast new StoreFrontInventoryStatistics(storeFrontInterface) : StoreFrontInventoryStatisticsInterface);
        this.storeFrontOrderHistoryStatisticsInterface = (cast new StoreFrontOrdersHistoryStatistics(storeFrontInterface) : StoreFrontOrdersHistoryStatisticsInterface);
    }

    public function getAdvertisements() : StoreFrontAdvertisementsStatisticsInterface {
        return this.storeFrontAdvertisementsStatisticsInterface;
    }

    public function getUsers() : StoreFrontUsersStatisticsInterface {
        return this.storeFrontUsersStatisticsInterface;
    }

    public function getInventory() : StoreFrontInventoryStatisticsInterface {
        return this.storeFrontInventoryStatisticsInterface;
    }

    public function getOrders() : StoreFrontOrdersHistoryStatisticsInterface {
        return this.storeFrontOrderHistoryStatisticsInterface;
    }

}

