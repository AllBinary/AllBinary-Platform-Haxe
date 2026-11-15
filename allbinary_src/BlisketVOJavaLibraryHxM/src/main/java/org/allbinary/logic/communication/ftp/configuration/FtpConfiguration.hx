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
package org.allbinary.logic.communication.ftp.configuration;

//import java.util.HashMap;

class FtpConfiguration implements FtpConfigurationInterface {
    private var ftpServer : String;
    private var ftpPath : String;
    private var ftpUserName : String;
    private var ftpPassword : String;
    public function new() {
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(hashMap : HashMap) {
        this.ftpServer = (cast hashMap.get(FtpConfigurationData.SERVER) : String);
        this.ftpPath = (cast hashMap.get(FtpConfigurationData.PATH) : String);
        this.ftpUserName = (cast hashMap.get(FtpConfigurationData.USERNAME) : String);
        this.ftpPassword = (cast hashMap.get(FtpConfigurationData.PASSWORD) : String);
    }

    public function getServer() : String {
        return this.ftpServer;
    }

    public function getPath() : String {
        return this.ftpPath;
    }

    public function getUserName() : String {
        return this.ftpUserName;
    }

    public function getPassword() : String {
        return this.ftpPassword;
    }

    public function setServer(value : String) : Void {
        this.ftpServer = value;
    }

    public function setPath(value : String) : Void {
        this.ftpPath = value;
    }

    public function setUserName(value : String) : Void {
        this.ftpUserName = value;
    }

    public function setPassword(value : String) : Void {
        this.ftpPassword = value;
    }

}

