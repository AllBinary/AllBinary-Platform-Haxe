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

import org.osgi.framework.BundleActivator;
import org.osgi.framework.BundleContext;
import org.osgi.framework.ServiceFactory;
import org.osgi.framework.ServiceReference;
import bundle.input.automation.robot.InputAutomationRobotChangeListener;
import bundle.input.automation.robot.InputAutomationRobotServiceInterface;
import org.allbinary.input.automation.robot.InputRobotInterface;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.osgi.OSGIActivatorUtil;
import org.allbinary.string.CommonStrings;

class InputAutomationRobotBundleActivator implements BundleActivator {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    private var inputRobotInterface : haxe.ds.Vector<InputRobotInterface> = null;
    private var serviceFactory : ServiceFactory = null;
    public function new() {
        this.init();
    }

    // throws Exception
    public function init() : Void {
        throw new haxe.Exception();
    }

    // throws Exception
    public function registerAsService(bundleContext : BundleContext) : Void {
        OSGIActivatorUtil.registerAsService(bundleContext, getServiceFactory(), InputAutomationRobotServiceInterface.getName());
    }

    // throws Exception
    private function getInputAutomationRobotChangeListener(context : BundleContext) : InputAutomationRobotChangeListener {
        var serviceReference : ServiceReference = context.getServiceReference(InputAutomationRobotChangeListener.getName());
        if (serviceReference != null) {
            var inputAutomationRobotChangeListener : InputAutomationRobotChangeListener = (cast context.getService(serviceReference) : InputAutomationRobotChangeListener);
            if (inputAutomationRobotChangeListener == null) {
                throw new haxe.Exception("No Service For ServiceReference");
            }
            return inputAutomationRobotChangeListener;
        } else {
            this.logUtil.putF("No ServiceReference: " + InputAutomationRobotChangeListener.getName(), this, "getInputAutomationRobotChangeListener");
            return null;
        }
    }

    private function addRobots(context : BundleContext) : Void {
        try {
            this.logUtil.putF(this.commonStrings.START, this, "addRobots");
            var inputAutomationRobotChangeListener : InputAutomationRobotChangeListener = this.getInputAutomationRobotChangeListener(context);
            if (inputAutomationRobotChangeListener != null) {
                for (index in 0...this.getInputRobotInterface().length) {
                    var inputAutomationRobotChangeEvent : InputAutomationRobotChangeEvent = InputAutomationRobotUtil.getChangeEvent(this.getInputRobotInterface()[index]);
                    inputAutomationRobotChangeListener.onAdd(inputAutomationRobotChangeEvent);
                }
            }
        } catch (e : haxe.Exception) {
            this.logUtil.putF(this.commonStrings.EXCEPTION, this, "addModules");
        }
    }

    private function removeRobots(context : BundleContext) : Void {
        try {
            this.logUtil.putF(this.commonStrings.START, this, "removeRobots");
            var inputAutomationRobotChangeListener : InputAutomationRobotChangeListener = this.getInputAutomationRobotChangeListener(context);
            if (inputAutomationRobotChangeListener != null) {
                for (index in 0...this.getInputRobotInterface().length) {
                    var inputAutomationRobotChangeEvent : InputAutomationRobotChangeEvent = InputAutomationRobotUtil.getChangeEvent(this.getInputRobotInterface()[index]);
                    inputAutomationRobotChangeListener.onRemove(inputAutomationRobotChangeEvent);
                }
            }
        } catch (e : haxe.Exception) {
            this.logUtil.putF(this.commonStrings.EXCEPTION, this, "removeRobots");
        }
    }

    // throws Exception
    public function start(context : BundleContext) : Void {
        this.logUtil.putF(this.commonStrings.START, this, this.commonStrings.START);
        this.addRobots(context);
        this.registerAsService(context);
    }

    // throws Exception
    public function stop(context : BundleContext) : Void {
        this.logUtil.putF("Stop", this, this.commonStrings.START);
        this.removeRobots(context);
    }

    public function getServiceFactory() : Any {
        return this.serviceFactory;
    }

    public function setServiceFactory(serviceObject : ServiceFactory) : Void {
        this.serviceFactory = serviceObject;
    }

    public function getInputRobotInterface() : haxe.ds.Vector<InputRobotInterface> {
        return this.inputRobotInterface;
    }

    public function setInputRobotInterface(inputRobotInterface : haxe.ds.Vector<InputRobotInterface>) : Void {
        this.inputRobotInterface = inputRobotInterface;
    }

}

