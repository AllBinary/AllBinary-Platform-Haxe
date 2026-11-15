/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2002 AllBinary 
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
package org.allbinary.data.tables.generator;

import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;

class IdGeneratorEntityFactory {
    public function new() {
    }

    public static function getInstance() : IdGeneratorEntityInterface {
        try {
            return (cast new org.allbinary.data.tables.generator.IdGeneratorEntity() : IdGeneratorEntityInterface);
        } catch (e : haxe.Exception) {
            final logUtil : LogUtil = LogUtil.getInstance();
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            logUtil.put(commonStrings.EXCEPTION, "ServerLicenseRequestEntityFactory", commonStrings.GET_INSTANCE, e);
            return null;
        }
    }

}

