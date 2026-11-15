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

import org.osgi.framework.BundleActivator;
import org.osgi.framework.BundleContext;
import org.osgi.framework.ServiceFactory;
import org.osgi.framework.ServiceReference;
import bundle.input.automation.module.InputAutomationModuleServiceInterface;
import bundle.input.automation.module.configuration.InputAutomationConfigurationModuleChangeListener;
import org.allbinary.input.automation.configuration.InputAutomationConfigurationModuleChangeEvent;
import org.allbinary.input.automation.configuration.InputAutomationConfigurationUtil;
import org.allbinary.input.automation.module.InputAutomationModuleFactoryInterface;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.osgi.OSGIActivatorUtil;
import org.allbinary.string.CommonStrings;

class InputAutomationModuleBundleActivator implements BundleActivator {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    private var inputAutomationModuleInterface : haxe.ds.Vector<InputAutomationModuleFactoryInterface> = null;
    private var serviceFactory : ServiceFactory = null;
    public function new() {
        this.init();
    }

    // throws Exception
    public function init() : Void {
        throw new haxe.Exception();
    }

    // throws Exception
    private function getInputAutomationConfigurationModuleChangeListener(context : BundleContext) : InputAutomationConfigurationModuleChangeListener {
        var serviceReference : ServiceReference = context.getServiceReference(InputAutomationConfigurationModuleChangeListener.getName());
        if (serviceReference != null) {
            var inputAutomationConfigurationModuleChangeListener : InputAutomationConfigurationModuleChangeListener = (cast context.getService(serviceReference) : InputAutomationConfigurationModuleChangeListener);
            if (inputAutomationConfigurationModuleChangeListener == null) {
                throw new haxe.Exception("No Service For ServiceReference");
            }
            return inputAutomationConfigurationModuleChangeListener;
        } else {
            this.logUtil.putF("No ServiceReference: " + InputAutomationConfigurationModuleChangeListener.getName(), this, "addModules");
            return null;
        }
    }

    private function addModules(context : BundleContext) : Void {
        try {
            this.logUtil.putF(this.commonStrings.START, this, "addModules");
            var inputAutomationConfigurationModuleChangeListener : InputAutomationConfigurationModuleChangeListener = this.getInputAutomationConfigurationModuleChangeListener(context);
            if (inputAutomationConfigurationModuleChangeListener != null) {
                for (index in 0...this.getInputAutomationModuleInterface().length) {
                    var inputAutomationConfigurationModuleChangeEvent : InputAutomationConfigurationModuleChangeEvent = InputAutomationConfigurationUtil.getChangeEvent(this.getInputAutomationModuleInterface()[index]);
                    inputAutomationConfigurationModuleChangeListener.onAdd(inputAutomationConfigurationModuleChangeEvent);
                }
            }
        } catch (e : haxe.Exception) {
            this.logUtil.putF(this.commonStrings.EXCEPTION, this, "addModules");
        }
    }

    // throws Exception
    public function registerAsService(bundleContext : BundleContext) : Void {
        OSGIActivatorUtil.registerAsService(bundleContext, getServiceFactory(), InputAutomationModuleServiceInterface.getName());
    }

    private function removeModules(context : BundleContext) : Void {
        try {
            this.logUtil.putF(this.commonStrings.START, this, "removeModules");
            var inputAutomationConfigurationModuleChangeListener : InputAutomationConfigurationModuleChangeListener = this.getInputAutomationConfigurationModuleChangeListener(context);
            if (inputAutomationConfigurationModuleChangeListener != null) {
                for (index in 0...this.getInputAutomationModuleInterface().length) {
                    var inputAutomationConfigurationModuleChangeEvent : InputAutomationConfigurationModuleChangeEvent = InputAutomationConfigurationUtil.getChangeEvent(this.getInputAutomationModuleInterface()[index]);
                    inputAutomationConfigurationModuleChangeListener.onRemove(inputAutomationConfigurationModuleChangeEvent);
                }
            }
        } catch (e : haxe.Exception) {
            this.logUtil.putF(this.commonStrings.EXCEPTION, this, "removeModules");
        }
    }

    // throws Exception
    public function start(context : BundleContext) : Void {
        this.logUtil.putF(this.commonStrings.START, this, this.commonStrings.START);
        this.addModules(context);
        this.registerAsService(context);
    }

    // throws Exception
    public function stop(context : BundleContext) : Void {
        this.logUtil.putF(this.commonStrings.START, this, "stop");
        this.removeModules(context);
    }

    public function getInputAutomationModuleInterface() : haxe.ds.Vector<InputAutomationModuleFactoryInterface> {
        return this.inputAutomationModuleInterface;
    }

    public function setInputAutomationModuleInterface(inputAutomationModuleInterface : haxe.ds.Vector<InputAutomationModuleFactoryInterface>) : Void {
        this.inputAutomationModuleInterface = inputAutomationModuleInterface;
    }

    public function getServiceFactory() : Any {
        return this.serviceFactory;
    }

    public function setServiceFactory(serviceObject : ServiceFactory) : Void {
        this.serviceFactory = serviceObject;
    }

}

