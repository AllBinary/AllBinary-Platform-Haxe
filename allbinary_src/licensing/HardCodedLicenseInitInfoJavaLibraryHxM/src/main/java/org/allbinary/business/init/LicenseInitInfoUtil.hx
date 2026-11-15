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
package org.allbinary.business.init;


class LicenseInitInfoUtil {
    private static final instance : LicenseInitInfoUtil = new LicenseInitInfoUtil();
    public static function getInstance() : LicenseInitInfoUtil {
        return LicenseInitInfoUtil.instance;
    }

    public final INITFILENAME : String = "licenseinitdata.dat";
    public final ABOUT : String = "about";
    public final PRIVACY_POLICY : String = "privacy_policy";
    private final OFFICIAL_ALLBINARY_SERVICES_SERVER : String = "https://services.allbinary.com/LicServ/serverssl.php";
    // synchronized
    public function setFilePath(filePath : String) : Void {
    }

    public function new() {
    }

    // throws Exception
    // synchronized
    public function write(initData : LicenseInitInfo) : Void {
    }

    // throws Exception
    // synchronized
    public function read() : LicenseInitInfo {
        return this.readAgain(0);
    }

    // throws Exception
    // synchronized
    public function readAgain(initializeCounter : Int) : LicenseInitInfo {
        var licenseInitInfo : LicenseInitInfo = new LicenseInitInfo();
        licenseInitInfo.clearServers();
        licenseInitInfo.addServer(this.OFFICIAL_ALLBINARY_SERVICES_SERVER);
        return licenseInitInfo;
    }

}

