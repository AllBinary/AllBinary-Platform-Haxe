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
package org.allbinary.game.input;

import org.allbinary.game.input.mapping.PersistentInputMapping;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;

class PlatformInputMappingFactory {
    private static final instance : PlatformInputMappingFactory = new PlatformInputMappingFactory();
    public static function getInstance() : PlatformInputMappingFactory {
        return PlatformInputMappingFactory.instance;
    }

    public final logUtil : LogUtil = LogUtil.getInstance();
    private var inputToGameKeyMapping : PersistentInputMapping = PersistentInputMapping.getNullInstance();
    public function getPersistentInputMappingInstance() : PersistentInputMapping {
        try {
            if (this.inputToGameKeyMapping == PersistentInputMapping.getNullInstance()) {
                this.inputToGameKeyMapping = new LaptopGameInputMapping();
            }
        } catch (e : haxe.Exception) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            this.logUtil.put(commonStrings.EXCEPTION, this, commonStrings.GET_INSTANCE, e);
        }
        return this.inputToGameKeyMapping;
    }

    public function new() {
    }
}

