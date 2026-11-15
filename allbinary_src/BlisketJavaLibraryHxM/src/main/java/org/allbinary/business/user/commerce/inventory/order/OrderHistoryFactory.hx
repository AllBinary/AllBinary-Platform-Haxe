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

import org.allbinary.data.tables.user.commerce.inventory.order.OrderHistoryEntity;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;

//Retrieves a single order for a user
class OrderHistoryFactory {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public function new() {
    }

    public static function getInstance(id : String) : OrderHistory {
        final logUtil : LogUtil = LogUtil.getInstance();
        try {
            var orderHistoryEntityInterface : OrderHistoryEntity = new org.allbinary.data.tables.user.commerce.inventory.order.OrderHistoryEntity();
            return (cast orderHistoryEntityInterface.getOrder(id) : OrderHistory);
        } catch (e : haxe.Exception) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().FACTORYERROR)) {
                logUtil.put(commonStrings.EXCEPTION, "OrderHistoryFactory", commonStrings.GET_INSTANCE, e);
            }
            return null;
        }
    }

}

