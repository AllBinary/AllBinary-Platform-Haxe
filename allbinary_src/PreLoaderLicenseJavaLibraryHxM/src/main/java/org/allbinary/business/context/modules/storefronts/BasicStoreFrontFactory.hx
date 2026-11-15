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
package org.allbinary.business.context.modules.storefronts;

import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;

class BasicStoreFrontFactory {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : BasicStoreFrontFactory = new BasicStoreFrontFactory();
    public static function getInstance() : BasicStoreFrontFactory {
        return BasicStoreFrontFactory.instance;
    }

    public function new() {
    }

    // throws Exception
    public function getInstance(storeName : String) : BasicStoreFrontInterface {
        try {
            var storeFronts : BasicStoreFrontsEntity = new BasicStoreFrontsEntity();
            return storeFronts.getStoreFrontInterface(storeName);
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().FACTORYERROR)) {
                final commonStrings : CommonStrings = CommonStrings.getInstance();
                this.logUtil.put(commonStrings.EXCEPTION, this, commonStrings.GET_INSTANCE, e);
            }
            return null;
        }
    }

}

