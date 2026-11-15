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
package bundle.input.automation.module;

import org.allbinary.input.automation.module.InputAutomationModuleFactoryInterface;

class InputAutomationModuleService implements InputAutomationModuleServiceInterface {
    private var inputAutomationModuleInterfaceArray : haxe.ds.Vector<InputAutomationModuleFactoryInterface> = null;
    public function new(inputAutomationModuleInterfaceArray : haxe.ds.Vector<InputAutomationModuleFactoryInterface>) {
        this.setInputAutomationModuleInterfaceArray(inputAutomationModuleInterfaceArray);
    }

    public function getInputAutomationModuleInterfaceArray() : haxe.ds.Vector<InputAutomationModuleFactoryInterface> {
        return this.inputAutomationModuleInterfaceArray;
    }

    public function setInputAutomationModuleInterfaceArray(inputAutomationModuleInterfaceArray : haxe.ds.Vector<InputAutomationModuleFactoryInterface>) : Void {
        this.inputAutomationModuleInterfaceArray = inputAutomationModuleInterfaceArray;
    }

}

