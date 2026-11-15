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
package org.allbinary.logic.system.os.linux;

import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory;
import org.allbinary.logic.communication.log.config.type.LogConfigTypes;
import org.allbinary.logic.system.os.GenericOperatingSystem;
import org.allbinary.logic.system.os.NoOperatingSystem;
import org.allbinary.logic.system.os.OperatingSystems;
import org.allbinary.logic.system.os.SystemProperties;
import org.allbinary.string.CommonStrings;

class LinuxOperatingSystemFactory {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : LinuxOperatingSystemFactory = new LinuxOperatingSystemFactory();
    public static function getInstance() : LinuxOperatingSystemFactory {
        return LinuxOperatingSystemFactory.instance;
    }

    public function new() {
    }

    public function getOperatingSystemInstance() : GenericOperatingSystem {
        try {
            final operatingSystems : OperatingSystems = OperatingSystems.getInstance();
            final osName : String = SystemProperties.getInstance().getName();
            var operatingSystemInterface : GenericOperatingSystem = null;
            if (Reflect.compare(osName, operatingSystems.LINUX) == 0) {
                operatingSystemInterface = new LinuxOS();
            } else {
                if (operatingSystems.isUnknownSpecificOSAllowed()) {
                    operatingSystemInterface = new LinuxOS();
                } else {
                    throw new jre.lang.JavaException("Specific Linux OS Not Supported: " + osName);
                }
            }
            return operatingSystemInterface;
        } catch (e : haxe.Exception) {
            if (LogConfigTypes.LOGGING.contains(LogConfigTypeFactory.getInstance().FACTORYERROR)) {
                final commonStrings : CommonStrings = CommonStrings.getInstance();
                this.logUtil.put(commonStrings.EXCEPTION, this, commonStrings.GET_INSTANCE, e);
            }
            return NoOperatingSystem.NO_OPERATING_SYSTEM;
        }
    }

}

