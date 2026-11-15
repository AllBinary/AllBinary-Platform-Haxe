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
package org.allbinary.input.automation.module.osgi;

import org.osgi.framework.Bundle;
import org.osgi.framework.ServiceFactory;
import org.osgi.framework.ServiceRegistration;
import bundle.input.automation.module.InputAutomationModuleService;
import org.allbinary.input.automation.module.InputAutomationModuleFactoryInterface;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;

class InputAutomationModuleServiceFactory implements ServiceFactory {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    private var inputAutomationModuleInterfaceArray : haxe.ds.Vector<InputAutomationModuleFactoryInterface> = null;
    public function new() {
    }

    public function getService(bundle : Bundle, registration : ServiceRegistration) : Any {
        this.logUtil.putF(this.commonStrings.START, this, "getService");
        return new InputAutomationModuleService(this.getInputAutomationModuleInterfaceArray());
    }

    public function ungetService(bundle : Bundle, registration : ServiceRegistration, service : Any) : Void {
    }

    public function getInputAutomationModuleInterfaceArray() : haxe.ds.Vector<InputAutomationModuleFactoryInterface> {
        return this.inputAutomationModuleInterfaceArray;
    }

    public function setInputAutomationModuleInterfaceArray(inputAutomationModuleInterfaceArray : haxe.ds.Vector<InputAutomationModuleFactoryInterface>) : Void {
        this.inputAutomationModuleInterfaceArray = inputAutomationModuleInterfaceArray;
    }

}

