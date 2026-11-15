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
package org.allbinary.bundle.logic.preloader;

import org.osgi.framework.BundleActivator;
import org.osgi.framework.BundleContext;
import org.osgi.framework.ServiceReference;
import org.osgi.framework.ServiceRegistration;
import org.allbinary.bundle.logic.system.loader.CryptServiceFactory;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;
import org.allbinary.util.ABHashtable;

class AllBinaryPreloaderActivator implements BundleActivator {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static var context : BundleContext = null;
    public function new() {
    }

    private static final CRYPT_REGISTRY_NAME : String = "bundle.abcs.logic.system.loader.CryptService";
    public static function getBundleContext() : BundleContext {
        return AllBinaryPreloaderActivator.context;
    }

    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    // throws Exception
    public function start(context : BundleContext) : Void {
        try {
            this.logUtil.putF(this.commonStrings.START, this, "start");
            AllBinaryPreloaderActivator.context = context;
            this.registerAsService();
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "start", e);
            throw e;
        }
    }

    // throws Exception
    public function registerAsService() : Void {
        final properties : ABHashtable<Any, Any> = StdUtil.getInstance().createHashtable();
        final serviceRegistration : ServiceRegistration = AllBinaryPreloaderActivator.context.registerService(CRYPT_REGISTRY_NAME, new CryptServiceFactory(), properties);
        var serviceReference : ServiceReference = serviceRegistration.getReference();
        serviceReference = AllBinaryPreloaderActivator.context.getServiceReference(CRYPT_REGISTRY_NAME);
        if (serviceReference == null) {
            throw new haxe.Exception("No Such Service Reference");
        }
    }

    // throws Exception
    public function stop(context : BundleContext) : Void {
        this.logUtil.putF(this.commonStrings.START, this, "stop");
    }

}

