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

import org.allbinary.business.init.LicenseInitInfo;
import org.allbinary.business.init.LicenseInitInfoUtil;
import org.allbinary.logic.io.file.FileFactory;
import org.allbinary.globals.PATH_GLOBALS;
import org.allbinary.util.BasicArrayList;

class PrintLicenseInitInfo {
    public static final PATH : String = "G:\\mnt\\bc\\mydev\\work\\allbinary_src\\licensing\\data\\";
    public function new(options : haxe.ds.Vector<String>) {
        LicenseInitInfoUtil.getInstance().setFilePath(PrintLicenseInitInfo.PATH + PATH_GLOBALS.getInstance().INIT_PATH);
    }

    // throws Exception
    public function getLicenseInitInfo() : LicenseInitInfo {
        final licenseInitInfoUtil : LicenseInitInfoUtil = LicenseInitInfoUtil.getInstance();
        if (FileFactory.getInstance().isFile(licenseInitInfoUtil.getFilePath())) {
            return licenseInitInfoUtil.read();
        } else {
            trace("No Licence File at: " + licenseInitInfoUtil.getFilePath());
            return new LicenseInitInfo();
        }
    }

    public function printInitInfo() : Void {
        try {
            final licenseInitInfo : LicenseInitInfo = this.getLicenseInitInfo();
            trace("License ID: " + licenseInitInfo.getLicenseId());
            final list : BasicArrayList = licenseInitInfo.getServerList();
            final size : Int = list.size();
            for (index in 0...size) {
                trace("Lic Serv: " + list.get(index));
            }
        } catch (e : haxe.Exception) {
            trace("Error: " + e);
            trace(e.details());
        }
    }

    // throws Exception
    public static function main(args : haxe.ds.Vector<String>) : Void {
        final initInfo : PrintLicenseInitInfo = new PrintLicenseInitInfo(args);
        initInfo.printInitInfo();
    }

}

