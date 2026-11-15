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

import org.allbinary.business.context.modules.storefront.statistics.advertisements.StoreFrontAdvertisementsStatisticsInterface;
import org.allbinary.business.context.modules.storefront.statistics.advertisements.StoreFrontAdvertisementsStatisticsView;
import org.allbinary.business.context.modules.storefront.statistics.inventory.StoreFrontInventoryStatisticsInterface;
import org.allbinary.business.context.modules.storefront.statistics.inventory.StoreFrontInventoryStatisticsView;
import org.allbinary.business.context.modules.storefront.statistics.orders.history.StoreFrontOrdersHistoryStatisticsInterface;
import org.allbinary.business.context.modules.storefront.statistics.orders.history.StoreFrontOrdersHistoryStatisticsView;
import org.allbinary.business.context.modules.storefront.statistics.users.StoreFrontUsersStatisticsInterface;
import org.allbinary.business.context.modules.storefront.statistics.users.StoreFrontUsersStatisticsView;
import org.allbinary.business.user.role.UserRole;
import org.allbinary.business.user.role.UserRoleFactory;
import org.allbinary.data.tree.dom.DomNodeInterface;
import org.w3c.dom.Document;
import org.w3c.dom.Node;

class RealTimeStoreFrontStatisticsView implements DomNodeInterface {
    private final storeFrontStatisticsInterface : StoreFrontStatisticsInterface;
    private final userRole : UserRole;
    public function new(storeFrontStatisticsInterface : StoreFrontStatisticsInterface, userRole : UserRole) {
        this.storeFrontStatisticsInterface = storeFrontStatisticsInterface;
        this.userRole = userRole;
    }

    // throws Exception
    public function toXmlNode(document : Document) : Node {
        var node : Node = document.createElement(StoreFrontStatisticsData.getInstance().NAME);
        var storeFrontAdvertisementsStatisticsInterface : StoreFrontAdvertisementsStatisticsInterface = this.storeFrontStatisticsInterface.getAdvertisements();
        var storeFrontAdvertisementsStatisticsDomNodeInterface : DomNodeInterface = new StoreFrontAdvertisementsStatisticsView(storeFrontAdvertisementsStatisticsInterface);
        node.appendChild(storeFrontAdvertisementsStatisticsDomNodeInterface.toXmlNode(document));
        var storeFrontInventoryStatisticsInterface : StoreFrontInventoryStatisticsInterface = this.storeFrontStatisticsInterface.getInventory();
        var storeFrontInventoryStatisticsDomNodeInterface : DomNodeInterface = new StoreFrontInventoryStatisticsView(storeFrontInventoryStatisticsInterface);
        node.appendChild(storeFrontInventoryStatisticsDomNodeInterface.toXmlNode(document));
        var storeFrontOrdersHistoryStatisticsInterface : StoreFrontOrdersHistoryStatisticsInterface = this.storeFrontStatisticsInterface.getOrders();
        var storeFrontOrdersHistoryStatisticsDomNodeInterface : DomNodeInterface = new StoreFrontOrdersHistoryStatisticsView(storeFrontOrdersHistoryStatisticsInterface);
        node.appendChild(storeFrontOrdersHistoryStatisticsDomNodeInterface.toXmlNode(document));
        if (this.userRole == UserRoleFactory.getInstance().ADMINISTRATOR) {
            var storeFrontUsersStatisticsInterface : StoreFrontUsersStatisticsInterface = this.storeFrontStatisticsInterface.getUsers();
            var storeFrontUsersStatisticsDomNodeInterface : DomNodeInterface = new StoreFrontUsersStatisticsView(storeFrontUsersStatisticsInterface);
            node.appendChild(storeFrontUsersStatisticsDomNodeInterface.toXmlNode(document));
        }
        return node;
    }

}

