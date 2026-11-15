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

import org.osgi.framework.BundleContext;
import bundle.input.automation.robot.InputAutomationRobotServiceInterface;
import org.allbinary.osgi.service.InputAutomationServiceConsumer;

class InputAutomationRobotServiceConsumer extends InputAutomationServiceConsumer {
    public function new(bundleContext : BundleContext) {
        super(InputAutomationRobotServiceInterface.getName(), bundleContext, new InputAutomationRobotOSGIServiceVisitor());
    }

}

