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
package org.allbinary.data.tables.workflow;

import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;

class WorkFlowEntityFactory {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : WorkFlowEntityFactory = new WorkFlowEntityFactory();
    public static function getInstance() : WorkFlowEntityFactory {
        return WorkFlowEntityFactory.instance;
    }

    public function new() {
    }

    public function create2() : WorkFlowEntity {
        try {
            return new org.allbinary.data.tables.workflow.WorkFlowEntity();
        } catch (e : haxe.Exception) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().ENTITYFACTORYERROR)) {
                this.logUtil.put(commonStrings.EXCEPTION, this, commonStrings.GET_INSTANCE, e);
            }
            return null;
        }
    }

}

