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
package org.allbinary.osgi;

import org.allbinary.logic.StdUtil;
import org.allbinary.util.ABHashtable;
import org.osgi.framework.BundleContext;
import org.osgi.framework.NullServiceReferenceFactory;
import org.osgi.framework.ServiceReference;
import org.osgi.framework.ServiceRegistration;

class OSGIActivatorUtil {
    public function new() {
    }

    // throws Exception
    public static function registerAsService(bundleContext : BundleContext, anyType : Any, serviceName : String) : Void {
        OSGIActivatorUtil.registerAsService(bundleContext, anyType, serviceName, StdUtil.getInstance().createHashtable());
    }

    // throws Exception
    public static function registerAsService(bundleContext : BundleContext, anyType : Any, serviceName : String, properties : ABHashtable<Any, Any>) : Void {
        final serviceRegistration : ServiceRegistration = bundleContext.registerService(serviceName, anyType, properties);
        var serviceReference : ServiceReference = serviceRegistration.getReference();
        serviceReference = bundleContext.getServiceReference(serviceName);
        if (serviceReference == NullServiceReferenceFactory.getInstance().NULL_SERVICE_REFERENCE) {
            throw new haxe.Exception("No Such Service Reference");
        }
    }

}

