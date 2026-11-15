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
package bundle.input.automation;

import org.osgi.framework.BundleActivator;
import org.osgi.framework.BundleContext;
import bundle.input.automation.module.configuration.InputAutomationConfigurationModuleChangeListener;
import bundle.input.automation.robot.InputAutomationRobotChangeListener;
import org.allbinary.input.automation.InputAutomationJFrame;
import org.allbinary.input.automation.module.osgi.InputAutomationModuleServiceConsumer;
import org.allbinary.input.automation.module.osgi.InputAutomationNewBundleRunnable;
import org.allbinary.input.automation.osgi.InputAutomationServiceFactory;
import org.allbinary.input.automation.robot.osgi.InputAutomationRobotServiceConsumer;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.osgi.OSGIActivatorUtil;
import org.allbinary.string.CommonStrings;

class InputAutomationBundleActivator implements BundleActivator implements InputAutomationBundleActivatorListenerInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    private static var moduleManagementThread : Thread = null;
    private static var bundleContext : BundleContext = null;
    public static function getBundleContext() : BundleContext {
        return InputAutomationBundleActivator.bundleContext;
    }

    // throws Exception
    public function start(bundleContext : BundleContext) : Void {
        try {
            this.logUtil.putF(this.commonStrings.START, this, this.commonStrings.START);
            this.bundleContext = bundleContext;
            InputAutomationBundleActivator.moduleManagementThread = new Thread(new InputAutomationNewBundleRunnable(this));
            InputAutomationBundleActivator.moduleManagementThread.start();
            InputAutomationJFrame.create(this);
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.START, e);
            throw e;
        }
    }

    // throws Exception
    public function registerAsService() : Void {
        OSGIActivatorUtil.registerAsService(this.getBundleContext(), InputAutomationServiceFactory.getInstance(), InputAutomationConfigurationModuleChangeListener.getName());
        OSGIActivatorUtil.registerAsService(this.getBundleContext(), InputAutomationServiceFactory.getInstance(), InputAutomationRobotChangeListener.getName());
    }

    // throws Exception
    public function useServices() : Void {
        new InputAutomationRobotServiceConsumer(this.getBundleContext()).process();
        new InputAutomationModuleServiceConsumer(this.getBundleContext()).process();
    }

    // throws Exception
    public function stop(context : BundleContext) : Void {
        this.logUtil.putF(this.commonStrings.START, this, "stop");
        if (InputAutomationJFrame.getInstance() != null) {
            InputAutomationJFrame.destroy();
        } else {
            this.logUtil.putF("Nothing to stop", this, "stop");
        }
    }

    public function new() {
    }
}

