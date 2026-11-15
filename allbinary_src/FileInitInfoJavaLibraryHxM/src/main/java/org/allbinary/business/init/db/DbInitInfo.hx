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
package org.allbinary.business.init.db;

import org.allbinary.globals.FREEBLISKET_PATH_GLOBALS;
import org.allbinary.globals.URLGLOBALS;
import org.allbinary.logic.communication.http.HttpData;
import org.allbinary.logic.communication.log.PreLogUtil;
import org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory;
import org.allbinary.logic.communication.log.config.type.LogConfigTypes;
import org.allbinary.logic.io.AbDataInputStream;
import org.allbinary.logic.io.AbDataOutputStream;
import org.allbinary.logic.io.AbFileInputStream;
import org.allbinary.logic.io.DataOutputStreamFactory;
import org.allbinary.logic.io.StreamUtil;
import org.allbinary.logic.io.file.AbFile;
import org.allbinary.logic.io.file.directory.Directory;
import org.allbinary.logic.io.path.AbPath;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.system.security.crypt.DatabaseEncoder;
import org.allbinary.logic.system.security.crypt.WeakCrypt;
import org.allbinary.string.CommonStrings;

class DbInitInfo extends DbConnectionInfo {
    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    private final directory : Directory = Directory.getInstance();
    private final httpData : HttpData = HttpData.getInstance();
    private final GET_URL : String = "getUrl";
    private final PACKAGE : String = FREEBLISKET_PATH_GLOBALS.getInstance().DBINITPATH;
    private var initFileName : String;
    private var hasRead : Bool = false;
    public function new(initFileName : String, read : Bool) {
        super();
        this.initFileName = initFileName;
        if (read) {
            this.updateIfNeeded();
        } else {
            this.setHasRead(true);
        }
    }

    public function getUrl() : String {
        var url : String = super.getUrl();
        if (LogConfigTypes.LOGGING.contains(LogConfigTypeFactory.getInstance().PRELOADER)) {
            PreLogUtil.put(this.httpData.URL_LABEL + url, this, GET_URL);
        }
        return url;
    }

    // throws Exception
    public function write() : Void {
        final PATH : AbPath = new AbPath(URLGLOBALS.getWebappPath() + this.PACKAGE, StringUtil.getInstance().EMPTY_STRING);
        this.directory.create(PATH);
        final FILEABPATH : AbPath = new AbPath(URLGLOBALS.getWebappPath() + this.PACKAGE, this.initFileName);
        try {
            final newFile : AbFile = AbFile.createAbFileFromAbPath(FILEABPATH);
            newFile.createNewFile();
            final dataOutputStream : AbDataOutputStream = DataOutputStreamFactory.getInstance().getInstanceForAbFile(newFile);
            try {
                final cryptedJdbcDriver : haxe.ds.Vector<Int> = new WeakCrypt(1).encrypt(this.getJdbcDriver()).getBytes();
                final cryptedName : haxe.ds.Vector<Int> = new WeakCrypt(2).encrypt(this.getName()).getBytes();
                final cryptedUserName : haxe.ds.Vector<Int> = new WeakCrypt(3).encrypt(this.getUserName()).getBytes();
                final cryptedPassword : haxe.ds.Vector<Int> = new WeakCrypt(4).encrypt(this.getPassword()).getBytes();
                final cryptedSchema : haxe.ds.Vector<Int> = new WeakCrypt(5).encrypt(this.getSchema()).getBytes();
                final cryptedServer : haxe.ds.Vector<Int> = new WeakCrypt(6).encrypt(this.getServer()).getBytes();
                final cryptedPort : haxe.ds.Vector<Int> = new WeakCrypt(7).encrypt(this.getPort()).getBytes();
                dataOutputStream.writeUTF(DatabaseEncoder.encode(cryptedJdbcDriver));
                dataOutputStream.writeUTF(DatabaseEncoder.encode(cryptedName));
                dataOutputStream.writeUTF(DatabaseEncoder.encode(cryptedUserName));
                dataOutputStream.writeUTF(DatabaseEncoder.encode(cryptedPassword));
                dataOutputStream.writeUTF(DatabaseEncoder.encode(cryptedSchema));
                dataOutputStream.writeUTF(DatabaseEncoder.encode(cryptedServer));
                dataOutputStream.writeUTF(DatabaseEncoder.encode(cryptedPort));
                this.hasRead = false;
            }
            // Java finally: Haxe has no finally so this always runs after the try
            {
                StreamUtil.getInstance().close(dataOutputStream);
            }
        } catch (e : haxe.Exception) {
            if (LogConfigTypes.LOGGING.contains(LogConfigTypeFactory.getInstance().PRELOADERERROR)) {
                PreLogUtil.putOE("Failed Write: " + Std.string(FILEABPATH), this, "write", e);
            }
        }
    }

    // throws Exception
    private function load() : Void {
        final FILEABPATH : AbPath = new AbPath(URLGLOBALS.getWebappPath() + this.PACKAGE, this.initFileName);
        try {
            final file : AbFile = AbFile.createAbFileFromAbPath(FILEABPATH);
            if (file.isFile()) {
                final iFile : AbFileInputStream = AbFileInputStream.createFromAbFile(file);
                final iData : AbDataInputStream = new AbDataInputStream(iFile);
                try {
                    final decryptedJdbcDriver : String = DatabaseEncoder.decode(iData.readUTF());
                    final decryptedName : String = DatabaseEncoder.decode(iData.readUTF());
                    final decryptedUserName : String = DatabaseEncoder.decode(iData.readUTF());
                    final decryptedPassword : String = DatabaseEncoder.decode(iData.readUTF());
                    final decryptedSchema : String = DatabaseEncoder.decode(iData.readUTF());
                    final decryptedServer : String = DatabaseEncoder.decode(iData.readUTF());
                    final decryptedPort : String = DatabaseEncoder.decode(iData.readUTF());
                    this.setJdbcDriver(new WeakCrypt(1).decrypt(decryptedJdbcDriver));
                    this.setName(new WeakCrypt(2).decrypt(decryptedName));
                    this.setUserName(new WeakCrypt(3).decrypt(decryptedUserName));
                    this.setPassword(new WeakCrypt(4).decrypt(decryptedPassword));
                    this.setSchema(new WeakCrypt(5).decrypt(decryptedSchema));
                    this.setServer(new WeakCrypt(6).decrypt(decryptedServer));
                    this.setPort(new WeakCrypt(7).decrypt(decryptedPort));
                    final stringUtil : StringUtil = StringUtil.getInstance();
                }
                // Java finally: Haxe has no finally so this always runs after the try
                {
                    StreamUtil.getInstance().close(iData);
                }
            } else {
                this.hasRead = false;
                if (LogConfigTypes.LOGGING.contains(LogConfigTypeFactory.getInstance().PRELOADER)) {
                    PreLogUtil.put("Not a File - Failed Loading: " + Std.string(FILEABPATH), this, this.commonStrings.LOAD);
                }
            }
        } catch (e : haxe.Exception) {
            if (LogConfigTypes.LOGGING.contains(LogConfigTypeFactory.getInstance().PRELOADERERROR)) {
                PreLogUtil.putOE("Failed Loading: " + Std.string(FILEABPATH), this, this.commonStrings.LOAD, e);
            }
        }
    }

    public function setHasRead(value : Bool) : Void {
        this.hasRead = value;
    }

    private function updateIfNeeded() : Void {
        try {
            if (!this.hasRead) {
                this.hasRead = true;
                this.load();
            }
        } catch (e : haxe.Exception) {
            if (LogConfigTypes.LOGGING.contains(LogConfigTypeFactory.getInstance().PRELOADERERROR)) {
                PreLogUtil.putOE(this.commonStrings.EXCEPTION, this, "updateIfNeeded", e);
            }
        }
    }

    public function getName() : String {
        this.updateIfNeeded();
        if (LogConfigTypes.LOGGING.contains(LogConfigTypeFactory.getInstance().PRELOADER)) {
            PreLogUtil.put("Name: " + super.getName(), this, "getName");
        }
        return super.getName();
    }

    public function getUserName() : String {
        this.updateIfNeeded();
        if (LogConfigTypes.LOGGING.contains(LogConfigTypeFactory.getInstance().PRELOADER)) {
            PreLogUtil.put("Name: " + super.getUserName(), this, "getUserName");
        }
        return super.getUserName();
    }

    public function getPassword() : String {
        this.updateIfNeeded();
        return super.getPassword();
    }

    public function getSchema() : String {
        this.updateIfNeeded();
        return super.getSchema();
    }

    public function getServer() : String {
        this.updateIfNeeded();
        return super.getServer();
    }

    public function getPort() : String {
        this.updateIfNeeded();
        return super.getPort();
    }

}

