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
package org.allbinary.input.automation.robot.osgi;

import org.allbinary.input.automation.robot.InputRobotInterface;

class InputAutomationRobotInterfaceWrapper {
    private var inputRobotInterface : InputRobotInterface = null;
    public function new(inputRobotInterface : InputRobotInterface) {
        this.setInputRobotInterface(inputRobotInterface);
    }

    public function getInputRobotInterface() : InputRobotInterface {
        return this.inputRobotInterface;
    }

    public function setInputRobotInterface(inputRobotInterface : InputRobotInterface) : Void {
        this.inputRobotInterface = inputRobotInterface;
    }

}

