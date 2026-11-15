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

import org.allbinary.globals.PATH_GLOBALS;
import org.allbinary.globals.URLGLOBALS;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.io.AbDataInputStream;
import org.allbinary.logic.io.AbDataOutputStream;
import org.allbinary.logic.io.AbFileLocalInputStream;
import org.allbinary.logic.io.DataOutputStreamFactory;
import org.allbinary.logic.io.file.AbFile;
import org.allbinary.logic.io.path.AbPath;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.system.security.crypt.DatabaseEncoder;
import org.allbinary.logic.system.security.crypt.WeakCrypt;

class InstallerInfo {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : InstallerInfo = new InstallerInfo();
    private static final INITFILENAME : String = "installerdata.dat";
    private static final PACKAGE : String = PATH_GLOBALS.getInstance().INIT_PATH;
    private static var userName : String = StringUtil.getInstance().EMPTY_STRING;
    private static var password : String = StringUtil.getInstance().EMPTY_STRING;
    private static var hasRead : Bool = false;
    public function new() {
    }

    // throws Exception
    // synchronized
    public function write() : Void {
        var FILEABPATH : AbPath = new AbPath(URLGLOBALS.getMainPath() + InstallerInfo.PACKAGE, InstallerInfo.INITFILENAME);
        try {
            var newFile : AbFile = AbFile.createAbFileFromAbPath(FILEABPATH);
            newFile.createNewFile();
            var dataOutputStream : AbDataOutputStream = DataOutputStreamFactory.getInstance().getInstanceForAbFile(newFile);
            var cryptedUserName : haxe.ds.Vector<Int> = new WeakCrypt(1).encrypt(this.getUserName()).getBytes();
            var cryptedPassword : haxe.ds.Vector<Int> = new WeakCrypt(2).encrypt(this.getPassword()).getBytes();
            dataOutputStream.writeUTF(DatabaseEncoder.encode(cryptedUserName));
            dataOutputStream.writeUTF(DatabaseEncoder.encode(cryptedPassword));
            InstallerInfo.hasRead = false;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().PRELOADERERROR)) {
                this.logUtil.putF("Failed", this, "write");
            }
            throw e;
        }
    }

    // throws Exception
    // synchronized
    private function read() : Void {
        var FILEABPATH : AbPath = new AbPath(URLGLOBALS.getMainPath() + InstallerInfo.PACKAGE, InstallerInfo.INITFILENAME);
        try {
            var file : AbFile = AbFile.createAbFileFromAbPath(FILEABPATH);
            if (file.isFile()) {
                var iFile : AbFileLocalInputStream = new AbFileLocalInputStream(file);
                var iData : AbDataInputStream = new AbDataInputStream(iFile);
                var decryptedUserName : String = DatabaseEncoder.decode(iData.readUTF());
                var decryptedPassword : String = DatabaseEncoder.decode(iData.readUTF());
                this.setUserName(new WeakCrypt(1).decrypt(decryptedUserName));
                this.setPassword(new WeakCrypt(2).decrypt(decryptedPassword));
            } else {
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().PRELOADER)) {
                    this.logUtil.putF("Not a File - Failed Loading: " + Std.string(FILEABPATH), this, "read");
                }
            }
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().PRELOADERERROR)) {
                this.logUtil.putF("Failed", this, "read");
            }
        }
    }

    // synchronized
    public static function setHasRead(value : Bool) : Void {
        InstallerInfo.hasRead = value;
    }

    public function setUserName(userName : String) : Void {
        InstallerInfo.userName = userName;
    }

    public function setPassword(password : String) : Void {
        InstallerInfo.password = password;
    }

    // throws Exception
    // synchronized
    private function updateIfNeeded() : Void {
        if (!InstallerInfo.hasRead) {
            InstallerInfo.hasRead = true;
            this.read();
            if (InstallerInfo.userName == null || InstallerInfo.password == null) {
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().PRELOADER)) {
                    this.logUtil.putF("Failed", this, "updateIfNeeded");
                }
            }
        }
    }

    // throws Exception
    public function getUserName() : String {
        this.updateIfNeeded();
        return InstallerInfo.userName;
    }

    // throws Exception
    public function getPassword() : String {
        this.updateIfNeeded();
        return InstallerInfo.password;
    }

    // throws Exception
    public function isValid(userName : String, password : String) : Bool {
        this.updateIfNeeded();
        if (this.userName != null && Reflect.compare(this.userName, userName) == 0 && this.password != null && Reflect.compare(this.password, password) == 0) {
            return true;
        }
        return false;
    }

}

