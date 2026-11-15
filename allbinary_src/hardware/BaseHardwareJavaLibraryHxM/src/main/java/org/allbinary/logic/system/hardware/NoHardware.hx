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

import org.allbinary.logic.StdUtil;
import org.allbinary.logic.system.hardware.components.interfaces.HardwareComponentInterface;
import org.allbinary.logic.system.hardware.components.interfaces.NoHardwareComponent;
import org.allbinary.util.ABHashtable;

class NoHardware implements HardwareInterface {
    private static final instance : HardwareInterface = new NoHardware();
    public static function getInstance() : HardwareInterface {
        return NoHardware.instance;
    }

    public function getComponent(index : Int) : HardwareComponentInterface {
        return NoHardwareComponent.getInstance();
    }

    public function toString() : String {
        return "No Hardware";
    }

    public function compareTo(hardwareInterface : HardwareInterface) : Bool {
        return true;
    }

    public function difference(hardwareInterface : HardwareInterface) : ABHashtable<Any, Any> {
        return StdUtil.getInstance().NULL_TABLE;
    }

    public function new() {
    }
}

