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
package org.allbinary.logic.system.os;

import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.string.CommonStrings;

class OperatingSystemFactory {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : OperatingSystemFactory = new OperatingSystemFactory();
    public static function getInstance() : OperatingSystemFactory {
        return OperatingSystemFactory.instance;
    }

    private var genericOperatingSystem : GenericOperatingSystem = NoOperatingSystem.NO_OPERATING_SYSTEM;
    public function new() {
    }

    // synchronized
    public function getOperatingSystemInstance() : GenericOperatingSystem {
        final commonStrings : CommonStrings = CommonStrings.getInstance();
        try {
            final osString : String = new StringMaker().append("OperatingSystem Info: ").append(this.genericOperatingSystem.toString()).toString();
            trace(osString);
            this.logUtil.putF(osString, this, commonStrings.GET_INSTANCE);
        } catch (e : haxe.Exception) {
            this.logUtil.put(commonStrings.EXCEPTION, this, commonStrings.GET_INSTANCE, e);
        }
        return this.genericOperatingSystem;
    }

}

