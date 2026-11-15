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

import org.allbinary.logic.system.os.GenericOperatingSystem;
import org.allbinary.logic.system.os.OperatingSystems;
import org.allbinary.logic.system.hardware.linux.LinuxHardware;
import org.allbinary.logic.system.hardware.windows.WindowsHardware;

class HardwareFactory {
    private static final instance : HardwareFactory = new HardwareFactory();
    public static function getInstance() : HardwareFactory {
        return HardwareFactory.instance;
    }

    public function new() {
    }

    // throws Exception
    public static function getInstance(os : GenericOperatingSystem) : HardwareInterface {
        try {
            final operatingSystems : OperatingSystems = OperatingSystems.getInstance();
            if (os.getName().compareTo(operatingSystems.LINUX) == 0) {
                return (cast new LinuxHardware() : HardwareInterface);
            } else if (os.getName().indexOf(operatingSystems.WINDOWS) >= 0) {
                return (cast new WindowsHardware() : HardwareInterface);
            }
            throw new haxe.Exception("No Hardware Imp for: " + os.getName());
        } catch (e : haxe.Exception) {
            throw e;
        }
    }

}

