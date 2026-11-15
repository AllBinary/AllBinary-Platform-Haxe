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
package org.allbinary.logic.system.hardware;

import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.system.os.GenericOperatingSystem;
import org.allbinary.string.CommonStrings;

class SystemHardwareFactory {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : SystemHardwareFactory = new SystemHardwareFactory();
    public static function getInstance() : SystemHardwareFactory {
        return SystemHardwareFactory.instance;
    }

    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    private var hardwareInterface : HardwareInterface = NoHardware.getInstance();
    public function new() {
    }

    public function getInstance(operatingSystemInterface : GenericOperatingSystem) : HardwareInterface {
        try {
            if (this.hardwareInterface == NoHardware.getInstance()) {
                this.hardwareInterface = HardwareFactory.getInstance().getInstance(operatingSystemInterface);
            }
            this.logUtil.putF("Found Hardware", this, this.commonStrings.CONSTRUCTOR);
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.CONSTRUCTOR, e);
        }
        return this.hardwareInterface;
    }

    public static function static_toString() : String {
        final systemHardwareFactory : SystemHardwareFactory = SystemHardwareFactory.getInstance();
        final osBuffer : StringMaker = new StringMaker();
        osBuffer.append("Hardware Info: \n");
        if (systemHardwareFactory.hardwareInterface != null) {
            osBuffer.append(Std.string(systemHardwareFactory.hardwareInterface));
        } else {
            osBuffer.append(StringUtil.getInstance().NULL_STRING);
        }
        return Std.string(osBuffer);
    }

}

