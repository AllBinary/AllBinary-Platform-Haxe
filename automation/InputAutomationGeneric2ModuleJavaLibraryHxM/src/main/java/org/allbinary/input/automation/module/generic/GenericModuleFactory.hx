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

import org.allbinary.input.automation.module.AbstractInputAutomationFactory;
import org.allbinary.input.automation.module.InputAutomationActionInterface;
import org.allbinary.input.automation.module.InputAutomationModuleData;
import org.allbinary.input.automation.module.generic.configuration.GenericModuleConfigurationJPanel;
import org.allbinary.input.automation.module.generic.configuration.profile.GenericProfile;
import org.allbinary.input.automation.module.generic.constraints.NoImageComparatorConstraints;
import org.allbinary.input.automation.module.generic.constraints.NoMotionRectangleConstraints;
import org.allbinary.thread.RunnableInterface;

class GenericModuleFactory extends AbstractInputAutomationFactory {
    private static var NAME : String = "Generic" + InputAutomationModuleData.MODULE_NAME_END;
    public function new() {
        super(NAME, new GenericModuleConfigurationJPanel());
    }

    // throws Exception
    // synchronized
    public function getInstance() : RunnableInterface {
        var genericProfile : GenericProfile = ((cast this.getConfigurationJPanel() : GenericModuleConfigurationJPanel)).getSelectedGenericProfile();
        var inputAutomationActionInterface : InputAutomationActionInterface = (cast new GenericInputAutomationAction() : InputAutomationActionInterface);
        return (cast new GenericInputAutomationWorker(inputAutomationActionInterface, genericProfile, new NoMotionRectangleConstraints(), new NoImageComparatorConstraints()) : RunnableInterface);
    }

}

