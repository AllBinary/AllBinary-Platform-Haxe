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
package org.allbinary.osgi.service;

import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.osgi.framework.BundleContext;
import org.osgi.framework.ServiceReference;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.osgi.OSGIServiceInterface;
import org.allbinary.osgi.OSGIServiceVisitorInterface;
import org.allbinary.string.CommonStrings;

class InputAutomationServiceConsumer {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    public final osgiServiceUtil : OSGIServiceUtil = OSGIServiceUtil.getInstance();
    private var registryName : String = null;
    private var bundleContext : BundleContext = null;
    private var osgiServiceVisitorInterface : OSGIServiceVisitorInterface = null;
    public function new(registryName : String, bundleContext : BundleContext, osgiServiceVisitorInterface : OSGIServiceVisitorInterface) {
        this.setRegistryName(registryName);
        this.setBundleContext(bundleContext);
        this.setOsgiServiceVisitorInterface(osgiServiceVisitorInterface);
    }

    // throws Exception
    public function process() : Void {
        this.logUtil.putF(this.commonStrings.START, this, this.commonStrings.PROCESS);
        final vector : BasicArrayList = this.osgiServiceUtil.getServicesObjectVector(this.getBundleContext(), this.getServiceReferences());
        this.logUtil.putF("Processing " + vector.size() + " Services", this, this.commonStrings.PROCESS);
        final size : Int = vector.size();
        var osgiServiceInterface : OSGIServiceInterface = null;
        for (index in 0...size) {
            osgiServiceInterface = (cast vector.get(index) : OSGIServiceInterface);
            if (!getOsgiServiceVisitorInterface().visit(osgiServiceInterface)) {
                throw new haxe.Exception("Unable to process service: " + osgiServiceInterface);
            }
        }
    }

    // throws Exception
    private function getServiceReferences() : haxe.ds.Vector<ServiceReference> {
        return this.getBundleContext().getServiceReferences(this.getRegistryName(), null);
    }

    public function getBundleContext() : BundleContext {
        return this.bundleContext;
    }

    public function setBundleContext(aBundleContext : BundleContext) : Void {
        this.bundleContext = aBundleContext;
    }

    public function getRegistryName() : String {
        return this.registryName;
    }

    public function setRegistryName(registryName : String) : Void {
        this.registryName = registryName;
    }

    public function getOsgiServiceVisitorInterface() : OSGIServiceVisitorInterface {
        return this.osgiServiceVisitorInterface;
    }

    public function setOsgiServiceVisitorInterface(osgiServiceVisitorInterface : OSGIServiceVisitorInterface) : Void {
        this.osgiServiceVisitorInterface = osgiServiceVisitorInterface;
    }

}

