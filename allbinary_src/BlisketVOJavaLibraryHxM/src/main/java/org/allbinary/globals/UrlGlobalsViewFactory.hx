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
package org.allbinary.globals;

import org.allbinary.data.tree.dom.DomNodeInterface;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;

class UrlGlobalsViewFactory {
    public function new() {
    }

    public static function getInstance() : DomNodeInterface {
        final logUtil : LogUtil = LogUtil.getInstance();
        try {
            return (cast new UrlGlobalsView() : DomNodeInterface);
        } catch (e : haxe.Exception) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().FACTORYERROR)) {
                logUtil.put(commonStrings.EXCEPTION, "GlobalsViewFactory", commonStrings.GET_INSTANCE, e);
            }
            return null;
        }
    }

}

