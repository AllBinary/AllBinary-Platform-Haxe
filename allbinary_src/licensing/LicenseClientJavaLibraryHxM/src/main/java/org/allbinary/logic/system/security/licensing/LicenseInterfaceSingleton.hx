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
package org.allbinary.logic.system.security.licensing;


class LicenseInterfaceSingleton {
    private static var licenseInterface : AbeLicenseInterface = AbeNoLicense.getInstance();
    public static function getInstance() : AbeLicenseInterface {
        return LicenseInterfaceSingleton.licenseInterface;
    }

    public static function init(licenseInterface : AbeLicenseInterface) : Void {
        if (licenseInterface != null) {
            LicenseInterfaceSingleton.licenseInterface = licenseInterface;
        }
    }

    public function new() {
    }
}

