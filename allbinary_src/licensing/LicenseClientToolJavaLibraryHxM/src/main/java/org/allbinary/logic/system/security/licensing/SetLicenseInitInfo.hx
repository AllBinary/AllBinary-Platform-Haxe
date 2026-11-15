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

//import java.io.BufferedReader;
//import java.io.InputStreamReader;
import org.allbinary.business.init.LicenseInitInfo;
import org.allbinary.business.init.LicenseInitInfoUtil;
import org.allbinary.logic.io.file.FileFactory;
import org.allbinary.globals.PATH_GLOBALS;
//import java.io.File;
//import java.io.FileReader;
//import java.io.LineNumberReader;
import org.allbinary.util.BasicArrayList;

class SetLicenseInitInfo {
    private static var stdinput : BufferedReader = new BufferedReader(new InputStreamReader(System.in_));
    private var vector : BasicArrayList = new BasicArrayListD();
    public function new(options : haxe.ds.Vector<String>) {
        LicenseInitInfoUtil.getInstance().setFilePath(PrintLicenseInitInfo.PATH + PATH_GLOBALS.getInstance().INIT_PATH);
        for (index in 1...options.length) {
            this.vector.add(options[index]);
        }
    }

    // throws Exception
    public function getLicenseInitInfo() : LicenseInitInfo {
        var licenseInitInfoUtil : LicenseInitInfoUtil = LicenseInitInfoUtil.getInstance();
        if (FileFactory.getInstance().isFile(licenseInitInfoUtil.INITFILENAME)) {
            return licenseInitInfoUtil.read();
        } else {
            return new LicenseInitInfo();
        }
    }

    public function createNewLicenseInitInfo(licenceServerVector : BasicArrayList) : Void {
        try {
            if (licenceServerVector == null) {
                throw new haxe.Exception("null BasicArrayList Passed - Just Make Empty if you want");
            }
            var licenseInitInfo : LicenseInitInfo = this.getLicenseInitInfo();
            trace("License Serv Example: http://www.dartstatistics.com/LicServ/serverssl.php");
            licenseInitInfo.clearServers();
            var file : File = new File(PrintLicenseInitInfo.PATH + "licenseservers.txt");
            var reader : FileReader = new FileReader(file);
            var lineNumberReader : LineNumberReader = new LineNumberReader(reader);
            while (true) {
                var line : String = lineNumberReader.readLine();
                if (line != null) {
                    licenseInitInfo.addServer(line);
                } else {
                    break;
                }
            }
            LicenseInitInfoUtil.getInstance().write(licenseInitInfo);
            LicenseInitInfoUtil.getInstance().read();
        } catch (e : haxe.Exception) {
            trace("Error: " + e);
            trace(e.details());
        }
    }

    // throws Exception
    public static function main(args : haxe.ds.Vector<String>) : Void {
        var initInfo : SetLicenseInitInfo = new SetLicenseInitInfo(args);
        initInfo.createNewLicenseInitInfo(new BasicArrayListD());
    }

}

