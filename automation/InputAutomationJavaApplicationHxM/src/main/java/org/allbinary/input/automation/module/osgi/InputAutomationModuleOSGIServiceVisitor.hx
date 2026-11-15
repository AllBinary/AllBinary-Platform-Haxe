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

import bundle.input.automation.module.InputAutomationModuleService;
import org.allbinary.input.automation.InputAutomationJFrame;
import org.allbinary.input.automation.configuration.InputAutomationConfigurationUtil;
import org.allbinary.input.automation.module.InputAutomationModuleFactoryInterface;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.osgi.OSGIServiceInterface;
import org.allbinary.osgi.OSGIServiceVisitorInterface;
import org.allbinary.string.CommonStrings;

class InputAutomationModuleOSGIServiceVisitor implements OSGIServiceVisitorInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    public function new() {
    }

    public function visit(anyType : Any) : Any {
        return this.visit((cast anyType : OSGIServiceInterface));
    }

    public function visit(osgiServiceInterface : OSGIServiceInterface) : Null<Bool> {
        try {
            final inputAutomationModuleService : InputAutomationModuleService = (cast osgiServiceInterface : InputAutomationModuleService);
            final inputAutomationModuleInterfaceArray : haxe.ds.Vector<InputAutomationModuleFactoryInterface> = inputAutomationModuleService.getInputAutomationModuleInterfaceArray();
            for (index in 0...inputAutomationModuleInterfaceArray.length) {
                InputAutomationJFrame.getInstance().onAdd(InputAutomationConfigurationUtil.getChangeEvent(inputAutomationModuleInterfaceArray[index]));
            }
            return true;
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "visit", e);
            return false;
        }
    }

}

