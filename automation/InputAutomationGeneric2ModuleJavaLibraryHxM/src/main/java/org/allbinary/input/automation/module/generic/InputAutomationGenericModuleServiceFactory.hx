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
package org.allbinary.input.automation.module.generic;

import org.allbinary.input.automation.module.InputAutomationModuleFactoryInterface;
import org.allbinary.input.automation.module.osgi.InputAutomationModuleServiceFactory;
import org.allbinary.logic.communication.log.LogUtil;

class InputAutomationGenericModuleServiceFactory extends InputAutomationModuleServiceFactory {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static var inputAutomationGenericModuleServiceFactory : InputAutomationGenericModuleServiceFactory = new InputAutomationGenericModuleServiceFactory();
    public function new() {
        super();
        try {
            var inputAutomationModuleInterfaceArray : haxe.ds.Vector<InputAutomationModuleFactoryInterface> = haxe.ds.Vector.fromArrayCopy([for (index in 0...1) null]);
            inputAutomationModuleInterfaceArray[0] = new GenericModuleFactory();
            this.setInputAutomationModuleInterfaceArray(inputAutomationModuleInterfaceArray);
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.CONSTRUCTOR, e);
        }
    }

    public static function getInstance() : InputAutomationGenericModuleServiceFactory {
        return InputAutomationGenericModuleServiceFactory.inputAutomationGenericModuleServiceFactory;
    }

}

