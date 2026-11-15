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
package org.allbinary.input.automation.configuration;

import org.allbinary.input.automation.module.InputAutomationModuleFactoryInterface;
import org.allbinary.input.automation.module.configuration.InputAutomationModuleConfiguration;

class InputAutomationConfigurationUtil {
    public function new() {
    }

    // throws Exception
    public static function getChangeEvent(inputAutomationModuleInterface : InputAutomationModuleFactoryInterface) : InputAutomationConfigurationModuleChangeEvent {
        var inputAutomationModuleConfiguration : InputAutomationModuleConfiguration = new InputAutomationModuleConfiguration(inputAutomationModuleInterface);
        var inputAutomationConfigurationModuleChangeEvent : InputAutomationConfigurationModuleChangeEvent = new InputAutomationConfigurationModuleChangeEvent(inputAutomationModuleConfiguration);
        return inputAutomationConfigurationModuleChangeEvent;
    }

}

