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

import org.allbinary.TsUtil;
import org.allbinary.globals.PATH_GLOBALS;
import org.allbinary.globals.URLGLOBALS;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.io.AbDataInputStream;
import org.allbinary.logic.io.AbDataOutputStream;
import org.allbinary.logic.io.AbFileInputStream;
import org.allbinary.logic.io.DataOutputStreamFactory;
import org.allbinary.logic.io.FileStreamFactory;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.system.security.crypt.DatabaseEncoder;
import org.allbinary.logic.system.security.crypt.WeakCrypt;
import org.allbinary.string.CommonLabels;

class LicenseInitInfoUtil {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : LicenseInitInfoUtil = new LicenseInitInfoUtil();
    public static function getInstance() : LicenseInitInfoUtil {
        return LicenseInitInfoUtil.instance;
    }

    private final stringUtil : StringUtil = StringUtil.getInstance();
    public final INITFILENAME : String = "licenseinitdata.dat";
    public final ABOUT : String = "about";
    public final PRIVACY_POLICY : String = "privacy_policy";
    private var filePath : String = this.stringUtil.EMPTY_STRING;
    // synchronized
    public function setFilePath(filePath : String) : Void {
        this.filePath = filePath;
    }

    // throws Exception
    // synchronized
    public function write(initData : LicenseInitInfo) : Void {
        if (this.filePath == this.stringUtil.EMPTY_STRING) {
            this.filePath = URLGLOBALS.getMainPath() + PATH_GLOBALS.getInstance().INIT_PATH;
        }
        try {
            final tsUtil : TsUtil = TsUtil.getInstance();
            final dataOutputStream : AbDataOutputStream = DataOutputStreamFactory.getInstance().getInstance(this.filePath, this.INITFILENAME);
            final licenseIdCrypted : haxe.ds.Vector<Int> = tsUtil.getByteArray(new WeakCrypt(1).encrypt(initData.getLicenseId()));
            dataOutputStream.writeUTF(DatabaseEncoder.encode(licenseIdCrypted));
            final numberOfLicenseServers : Int = initData.getNumberOfServers();
            dataOutputStream.writeInt(numberOfLicenseServers);
            var licenseServerCrypted : haxe.ds.Vector<Int> = null;
            for (index in 0...numberOfLicenseServers) {
                licenseServerCrypted = tsUtil.getByteArray(new WeakCrypt(3).encrypt(initData.getServer(index)));
                dataOutputStream.writeUTF(DatabaseEncoder.encode(licenseServerCrypted));
            }
        } catch (e : haxe.Exception) {
            this.logUtil.put("Command Failed: " + this.INITFILENAME, this, "write", e);
            FileStreamFactory.getInstance().delete(this.filePath, this.INITFILENAME);
            throw e;
        }
    }

    // throws Exception
    // synchronized
    public function read() : LicenseInitInfo {
        return this.readAgain(0);
    }

    // throws Exception
    // synchronized
    public function readAgain(initializeCounter : Int) : LicenseInitInfo {
        final METHOD_NAME : String = "readAgain";
        if (this.filePath == this.stringUtil.EMPTY_STRING) {
            this.filePath = URLGLOBALS.getMainPath() + PATH_GLOBALS.getInstance().INIT_PATH;
        }
        try {
            this.logUtil.putF("LicenseInitInfo File: " + this.INITFILENAME, this, METHOD_NAME);
            final fileStreamFactory : FileStreamFactory = FileStreamFactory.getInstance();
            final iFile : AbFileInputStream = fileStreamFactory.getFileInputStreamInstance(this.filePath, this.INITFILENAME);
            if (iFile != null) {
                final iData : AbDataInputStream = new AbDataInputStream(iFile);
                final initInfo : LicenseInitInfo = new LicenseInitInfo();
                var decodedByteArray : haxe.ds.Vector<Int> = DatabaseEncoder.decode(iData.readUTF());
                final licenseIdDecoded : String = haxe.io.Bytes.ofData(decodedByteArray).toString();
                initInfo.setLicenseId(new WeakCrypt(1).decrypt(licenseIdDecoded));
                var numberOfLicenseServers : Int = iData.readInt();
                final NEXT_FILE : String = new StringMaker().append(CommonLabels.getInstance().NEXT).append(" License Server From File: ").toString();
                var licenseServerDecoded : String = null;
                for (index in 0...numberOfLicenseServers) {
                    decodedByteArray = DatabaseEncoder.decode(iData.readUTF());
                    licenseServerDecoded = haxe.io.Bytes.ofData(decodedByteArray).toString();
                    initInfo.setServer(new WeakCrypt(3).decrypt(licenseServerDecoded), index);
                    this.logUtil.putF(NEXT_FILE + initInfo.getServer(index), this, METHOD_NAME);
                }
                return initInfo;
            } else {
                throw new haxe.Exception("Could Not Load License InitInfo: " + this.INITFILENAME);
            }
        } catch (e : haxe.Exception) {
            try {
                this.logUtil.put("Command Failed: " + this.INITFILENAME, this, METHOD_NAME, e);
            } catch (e2 : haxe.Exception) {
                this.logUtil.put("LicenseInitInfo Read Retry: " + this.INITFILENAME, this, "readAgain()", e2);
            }
            throw new haxe.Exception("LicenseInitInfo Read Error: " + this.INITFILENAME);
        }
    }

    public function getFilePath() : String {
        return this.filePath;
    }

    public function new() {
    }
}

