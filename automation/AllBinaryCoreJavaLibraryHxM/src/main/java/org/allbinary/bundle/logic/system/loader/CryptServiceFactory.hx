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
package org.allbinary.bundle.logic.system.loader;

import org.osgi.framework.Bundle;
import org.osgi.framework.ServiceFactory;
import org.osgi.framework.ServiceRegistration;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;

class CryptServiceFactory implements ServiceFactory {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    private var cryptService : CryptService = new CryptService();
    public function new() {
    }

    public function getService(bundle : Bundle, registration : ServiceRegistration) : Any {
        this.logUtil.putF(this.commonStrings.START, this, "getService");
        return this.cryptService;
    }

    public function ungetService(bundle : Bundle, registration : ServiceRegistration, service : Any) : Void {
    }

}

