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
package org.allbinary.logic.system.security;

import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;
import org.allbinary.logic.system.security.licensing.AbeLicenseInterfaceFactory;
import org.allbinary.logic.system.security.licensing.LicensingException;

class AbKeys {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : AbKeys = new AbKeys();
    public static function getInstance() : AbKeys {
        return AbKeys.instance;
    }

    public function new() {
    }

    // throws LicensingException
    // synchronized
    public function getKey(abeClientInformation : AbeClientInformationInterface, keyName : String) : String {
        try {
            this.logUtil.putF("Getting Key: " + keyName, this, "getKey");
            if (Reflect.compare(keyName, "DirectX 8") == 0 || Reflect.compare(keyName, "DirectX") == 0 || Reflect.compare(keyName, "Low Level") == 0 || Reflect.compare(keyName, "System Drivers") == 0) {
                return "Temp For Input Library";
            }
            return AbeLicenseInterfaceFactory.getInstance().getLicenseInstance(abeClientInformation).getKey(keyName);
        } catch (e : LicensingException) {
            throw e;
        } catch (e : haxe.Exception) {
            this.logUtil.put("Licensing Failure", this, "getKey()", e);
            throw new LicensingException("Unknown License Failure");
        }
    }

}

