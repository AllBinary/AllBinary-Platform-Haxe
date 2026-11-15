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

import org.allbinary.TsUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.system.hardware.android.AndroidHardware;
import org.allbinary.logic.system.os.GenericOperatingSystem;
import org.allbinary.logic.system.os.OperatingSystems;
import org.allbinary.string.CommonStrings;

class HardwareFactory {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : HardwareFactory = new HardwareFactory();
    public static function getInstance() : HardwareFactory {
        return HardwareFactory.instance;
    }

    private final tsUtil : TsUtil = TsUtil.getInstance();
    public function new() {
    }

    // throws Exception
    public function getInstance(os : GenericOperatingSystem) : HardwareInterface {
        try {
            final operatingSystems : OperatingSystems = OperatingSystems.getInstance();
            if (this.tsUtil.compareTo(os.getName(), operatingSystems.ANDROID) == 0) {
                return new AndroidHardware();
            } else if (this.tsUtil.compareTo(os.getName(), operatingSystems.HARMONY) == 0) {
                return new AndroidHardware();
            }
            throw new jre.lang.JavaException("No Hardware Imp for: " + os.getName());
        } catch (e : haxe.Exception) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            this.logUtil.put("Ignoring Exception Returning NoHardware", this, commonStrings.GET_INSTANCE, e);
            return new NoHardware();
        }
    }

}

