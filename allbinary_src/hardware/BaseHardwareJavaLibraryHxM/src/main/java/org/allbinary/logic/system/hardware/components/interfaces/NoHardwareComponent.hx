/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2025 AllBinary 
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
package org.allbinary.logic.system.hardware.components.interfaces;

import org.allbinary.logic.string.StringUtil;

class NoHardwareComponent implements HardwareComponentInterface {
    private static final instance : NoHardwareComponent = new NoHardwareComponent();
    public static function getInstance() : NoHardwareComponent {
        return NoHardwareComponent.instance;
    }

    public function compareTo(componentInterface : HardwareComponentInterface) : Bool {
        if (this == componentInterface) {
            return true;
        }
        return false;
    }

    public function toString() : String {
        return StringUtil.getInstance().NULL_STRING;
    }

    public function new() {
    }
}

