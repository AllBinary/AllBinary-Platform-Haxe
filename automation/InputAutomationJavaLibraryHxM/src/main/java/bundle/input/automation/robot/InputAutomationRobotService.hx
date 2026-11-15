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
package bundle.input.automation.robot;

import org.allbinary.input.automation.robot.InputRobotInterface;

class InputAutomationRobotService implements InputAutomationRobotServiceInterface {
    private var inputRobotInterfaceArray : haxe.ds.Vector<InputRobotInterface> = null;
    public function new(inputRobotInterfaceArray : haxe.ds.Vector<InputRobotInterface>) {
        this.setInputRobotInterfaceArray(inputRobotInterfaceArray);
    }

    public function getInputRobotInterfaceArray() : haxe.ds.Vector<InputRobotInterface> {
        return this.inputRobotInterfaceArray;
    }

    public function setInputRobotInterfaceArray(inputRobotInterfaceArray : haxe.ds.Vector<InputRobotInterface>) : Void {
        this.inputRobotInterfaceArray = inputRobotInterfaceArray;
    }

}

