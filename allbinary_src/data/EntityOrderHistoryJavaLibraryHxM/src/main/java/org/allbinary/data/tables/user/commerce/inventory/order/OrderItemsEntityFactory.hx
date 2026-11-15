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

import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;

class OrderItemsEntityFactory {
    public function new() {
    }

    public static function getInstance() : OrderItemsEntity {
        final logUtil : LogUtil = LogUtil.getInstance();
        try {
            return new org.allbinary.data.tables.user.commerce.inventory.order.OrderItemsEntity();
        } catch (e : haxe.Exception) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().ENTITYFACTORYERROR)) {
                logUtil.put(commonStrings.EXCEPTION, "OrderItemsEntityFactory", commonStrings.GET_INSTANCE, e);
            }
            return null;
        }
    }

}

