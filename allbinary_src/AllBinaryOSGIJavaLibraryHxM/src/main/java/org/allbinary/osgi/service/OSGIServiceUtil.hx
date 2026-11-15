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
import org.allbinary.logic.StdUtil;
import org.osgi.framework.BundleContext;
import org.osgi.framework.ServiceReference;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.osgi.OSGIServiceInterface;

class OSGIServiceUtil {
    private static final instance : OSGIServiceUtil = new OSGIServiceUtil();
    public static function getInstance() : OSGIServiceUtil {
        return OSGIServiceUtil.instance;
    }

    public final logUtil : LogUtil = LogUtil.getInstance();
    public function new() {
    }

    // throws Exception
    public function getServicesObjectVector(bundleContext : BundleContext, serviceReferences : haxe.ds.Vector<ServiceReference>) : BasicArrayList {
        final vector : BasicArrayList = new BasicArrayListD();
        if (serviceReferences != null) {
            final size : Int = serviceReferences.length;
            this.logUtil.putF("Service References: " + size, this, "getServicesObjectVector");
            for (index in 0...size) {
                var serviceReference : ServiceReference = serviceReferences[index];
                if (serviceReference != null) {
                    final osgiServiceInterface : OSGIServiceInterface = (cast bundleContext.getService(serviceReference) : OSGIServiceInterface);
                    if (osgiServiceInterface == null) {
                        throw new haxe.Exception("No Service For Reference");
                    }
                    vector.add(osgiServiceInterface);
                }
            }
        }
        return vector;
    }

}

