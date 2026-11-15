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
package org.allbinary.logic.system.os.android;

import org.allbinary.TsUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.system.os.GenericOperatingSystem;
import org.allbinary.logic.system.os.NoOperatingSystem;
import org.allbinary.logic.system.os.OperatingSystems;
import org.allbinary.logic.system.os.SystemProperties;
import org.allbinary.string.CommonStrings;

class AndroidOperatingSystemFactory {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : AndroidOperatingSystemFactory = new AndroidOperatingSystemFactory();
    public static function getInstance() : AndroidOperatingSystemFactory {
        return AndroidOperatingSystemFactory.instance;
    }

    private final tsUtil : TsUtil = TsUtil.getInstance();
    public function new() {
    }

    // throws Exception
    public function getOperatingSystemInstance() : GenericOperatingSystem {
        try {
            var GenericOperatingSystem : GenericOperatingSystem = null;
            final systemProperties : SystemProperties = SystemProperties.getInstance();
            var osName : String = systemProperties.getName();
            if (this.tsUtil.compareTo(osName, OperatingSystems.getInstance().ANDROID) == 0) {
                GenericOperatingSystem = new AndroidOS();
            } else {
                if (OperatingSystems.getInstance().isUnknownSpecificOSAllowed()) {
                    GenericOperatingSystem = new AndroidOS();
                } else {
                    throw new jre.lang.JavaException("Specific Android OS Not Supported: " + osName);
                }
            }
            return GenericOperatingSystem;
        } catch (e : haxe.Exception) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            this.logUtil.put("Failed to get OperatingSystem returning NoOperatingSystem", this, commonStrings.GET_INSTANCE, e);
            return NoOperatingSystem.NO_OPERATING_SYSTEM;
        }
    }

}

