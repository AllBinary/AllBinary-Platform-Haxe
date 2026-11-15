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

import org.allbinary.logic.system.os.android.AndroidOperatingSystemFactory;
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
    private var hasDetected : Bool = false;
    public function new() {
    }

    // synchronized
    public function getOperatingSystemInstance() : GenericOperatingSystem {
        final commonStrings : CommonStrings = CommonStrings.getInstance();
        try {
            final systemProperties : SystemProperties = SystemProperties.getInstance();
            var osName : String = systemProperties.getName();
            if (!this.hasDetected) {
                this.hasDetected = true;
                if (osName.indexOf(OperatingSystems.getInstance().ANDROID) >= 0) {
                    this.logUtil.putF("Found a Android OS", this, commonStrings.GET_INSTANCE);
                    this.genericOperatingSystem = AndroidOperatingSystemFactory.getInstance().getOperatingSystemInstance();
                    this.logUtil.putF(Std.string(new StringMaker().append("Operating System Info: ").append(Std.string(this.genericOperatingSystem))), this, commonStrings.GET_INSTANCE);
                } else if (osName.indexOf(OperatingSystems.getInstance().HARMONY) >= 0) {
                    this.logUtil.putF("Found a Harmony OS", this, commonStrings.GET_INSTANCE);
                    this.genericOperatingSystem = AndroidOperatingSystemFactory.getInstance().getOperatingSystemInstance();
                    this.logUtil.putF(Std.string(new StringMaker().append("Operating System Info: ").append(Std.string(this.genericOperatingSystem))), this, commonStrings.GET_INSTANCE);
                } else {
                    throw new jre.lang.JavaException(Std.string(new StringMaker().append("OS Not Supported: ").append(osName)));
                }
            }
        } catch (e : haxe.Exception) {
            this.genericOperatingSystem = NoOperatingSystem.NO_OPERATING_SYSTEM;
            this.logUtil.put(commonStrings.EXCEPTION, this, commonStrings.GET_INSTANCE, e);
        }
        return this.genericOperatingSystem;
    }

}

