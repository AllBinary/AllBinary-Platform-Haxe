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
package org.allbinary.data.tables.log;

import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;

class LogTableEntityFactory {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : LogTableEntityFactory = new LogTableEntityFactory();
    public static function getInstance() : LogTableEntityFactory {
        return LogTableEntityFactory.instance;
    }

    public function new() {
    }

    public function getLogTableEntityInstance() : LogTableEntity {
        try {
            return new org.allbinary.data.tables.log.LogTableEntity();
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().ENTITYFACTORYERROR)) {
                final commonStrings : CommonStrings = CommonStrings.getInstance();
                this.logUtil.put(commonStrings.EXCEPTION, this, commonStrings.GET_INSTANCE, e);
            }
            return null;
        }
    }

}

