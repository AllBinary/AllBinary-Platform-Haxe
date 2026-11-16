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

import org.allbinary.logic.communication.log.Log;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory;
import org.allbinary.logic.communication.log.config.type.LogConfigTypes;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.system.os.linux.LinuxOperatingSystemFactory;
import org.allbinary.logic.system.os.solaris.SolarisOperatingSystemFactory;
import org.allbinary.logic.system.os.windows.WindowsOperatingSystemFactory;
import org.allbinary.string.CommonStrings;

class OperatingSystemFactory {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : OperatingSystemFactory = new OperatingSystemFactory();
    public static function getInstance() : OperatingSystemFactory {
        return OperatingSystemFactory.instance;
    }

    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    private var genericOperatingSystem : GenericOperatingSystem = NoOperatingSystem.NO_OPERATING_SYSTEM;
    private var hasDetected : Bool = false;
    public function new() {
    }

    // synchronized
    public function getOperatingSystemInstance() : GenericOperatingSystem {
        try {
            final operatingSystems : OperatingSystems = OperatingSystems.getInstance();
            final systemProperties : SystemProperties = SystemProperties.getInstance();
            final osName : String = systemProperties.getName();
            final osArch : String = systemProperties.getArch();
            final osVersion : String = systemProperties.getVersion();
            if (!this.hasDetected) {
                this.logUtil.putF("osName: " + osName, this, this.commonStrings.GET_INSTANCE);
                this.hasDetected = true;
                if (osName.indexOf(jre.lang.JavaString.text(operatingSystems.LINUX)) >= 0) {
                    if (LogConfigTypes.LOGGING.contains(LogConfigTypeFactory.getInstance().FACTORYERROR)) {
                        this.logUtil.putF("Found a Linux OS", this, this.commonStrings.GET_INSTANCE);
                    }
                    this.genericOperatingSystem = LinuxOperatingSystemFactory.getInstance().getOperatingSystemInstance();
                } else if (osName.indexOf(jre.lang.JavaString.text(operatingSystems.WINDOWS)) >= 0) {
                    if (LogConfigTypes.LOGGING.contains(LogConfigTypeFactory.getInstance().FACTORYERROR)) {
                        this.logUtil.putF("Found a Windows OS", this, this.commonStrings.GET_INSTANCE);
                    }
                    this.genericOperatingSystem = WindowsOperatingSystemFactory.getInstance().getOperatingSystemInstance();
                } else if (osName.indexOf(jre.lang.JavaString.text(operatingSystems.SOLARIS)) >= 0) {
                    if (LogConfigTypes.LOGGING.contains(LogConfigTypeFactory.getInstance().FACTORYERROR)) {
                        this.logUtil.putF("Found a Solaris OS", this, this.commonStrings.GET_INSTANCE);
                    }
                    this.genericOperatingSystem = SolarisOperatingSystemFactory.getInstance().getOperatingSystemInstance();
                } else {
                    throw new jre.lang.JavaException(Std.string(new StringMaker().append("OS Not Supported: ").append(osName)));
                }
                var log : Log = LogFactory.getInstanceF(Std.string(new StringMaker().append("OperatingSystem Info: ").append(StringUtil.getInstance().toString(this.genericOperatingSystem))), this, this.commonStrings.GET_INSTANCE);
                trace(Std.string(log));
                this.logUtil.putL(log);
            }
            return this.genericOperatingSystem;
        } catch (e : haxe.Exception) {
            if (LogConfigTypes.LOGGING.contains(LogConfigTypeFactory.getInstance().FACTORYERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.GET_INSTANCE, e);
            }
            return NoOperatingSystem.NO_OPERATING_SYSTEM;
        }
    }

}

