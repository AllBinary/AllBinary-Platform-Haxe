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

//import java.io.File;
//import java.io.FileReader;
//import java.io.LineNumberReader;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.business.init.LicenseInitInfo;
import org.allbinary.business.init.LicenseInitInfoUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.system.security.licensing.client.XmlRpcAbeLicenseRetrievalClient;
import org.allbinary.globals.PATH_GLOBALS;
import org.allbinary.util.BasicArrayList;

class LicenseClientAndServerTest {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var vector : BasicArrayList = new BasicArrayListD();
    public function new(options : haxe.ds.Vector<String>) {
        LicenseInitInfoUtil.getInstance().setFilePath(PrintLicenseInitInfo.PATH + PATH_GLOBALS.getInstance().INIT_PATH);
        for (index in 1...options.length) {
            this.vector.add(options[index]);
        }
        if (options.length < 2) {
            var file : File = new File(PrintLicenseInitInfo.PATH + "testlicenseservers.txt");
            var reader : FileReader = new FileReader(file);
            var lineNumberReader : LineNumberReader = new LineNumberReader(reader);
            while (true) {
                var line : String = lineNumberReader.readLine();
                if (line != null) {
                    this.vector.add(line);
                } else {
                    break;
                }
            }
        }
    }

    // synchronized
    public function test() : Void {
        var stringBuffer : StringMaker = new StringMaker();
        try {
            var list : BasicArrayList = new BasicArrayListD();
            final TESTING : String = "Testing with new licence:<br/>";
            final PROCESSING : String = "Processing: <br/>";
            final END : String = "<br/>End<br/>";
            final RESULT : String = "Test Result: ";
            final size : Int = this.vector.size();
            for (index in 0...size) {
                stringBuffer.append(TESTING);
                var serverName : String = (cast this.vector.get(index) : String);
                try {
                    var licenseInitInfo : LicenseInitInfo = new LicenseInitInfo();
                    licenseInitInfo.addServer(serverName);
                    LicenseInitInfoUtil.getInstance().write(licenseInitInfo);
                    var abeClientInformation : AbeClientInformationInterface = AbeClientInformationInterfaceFactory.getInstance();
                    var xmlRpcAbeLicenseClient : XmlRpcAbeLicenseRetrievalClient = new XmlRpcAbeLicenseRetrievalClient(abeClientInformation);
                    var abeLicenseInterface : AbeLicenseInterface = (cast xmlRpcAbeLicenseClient.get(null) : AbeLicenseInterface);
                    if (abeLicenseInterface != null) {
                        stringBuffer.append(PROCESSING);
                        stringBuffer.append(abeLicenseInterface.toString());
                    }
                    stringBuffer.append(END);
                    this.logUtil.putF(RESULT + stringBuffer.toString(), this, "test");
                    stringBuffer.delete(0, stringBuffer.length());
                } catch (e : haxe.Exception) {
                    list.add(serverName);
                    this.logUtil.put("Test Error: " + stringBuffer.toString(), this, "test", e);
                }
            }
            this.logUtil.putF("Total Servers Failed: " + list.size() + " Failed Servers: " + list.toString(), this, "test");
        } catch (e : haxe.Exception) {
            this.logUtil.put("Test Error: " + stringBuffer.toString(), this, "test", e);
        }
    }

    public static function main(args : haxe.ds.Vector<String>) : Void {
        try {
            var licensingTest : LicenseClientAndServerTest = new LicenseClientAndServerTest(args);
            licensingTest.test();
        } catch (e : haxe.Exception) {
            final logUtil : LogUtil = LogUtil.getInstance();
            this.logUtil.put(this.commonStrings.EXCEPTION, "main()", "main()", e);
        }
    }

}

