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

import org.allbinary.logic.system.os.OperatingSystemInterface;

class HardwareFactory {
    private static final instance : HardwareFactory = new HardwareFactory();
    public static function getInstance() : HardwareFactory {
        return HardwareFactory.instance;
    }

    private final SINGLETON : HardwareInterface = NoHardware.getInstance();
    public function new() {
    }

    // throws Exception
    public function getInstance(os : OperatingSystemInterface) : HardwareInterface {
        try {
            return this.SINGLETON;
        } catch (e : haxe.Exception) {
            throw e;
        }
    }

}

