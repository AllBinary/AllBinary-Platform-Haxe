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

import org.allbinary.logic.io.path.AbPathData;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.string.CommonSeps;

class DbConnectionInfo implements DatabaseConnectionInfoInterface {
    private var jdbcDriver : String = null;
    private var name : String = null;
    private var userName : String = null;
    private var password : String = null;
    private var schema : String = null;
    private var server : String = null;
    private var port : String = null;
    private var url : String = null;
    private var host : String = null;
    private final SCHEMA_SEP : String = "://";
    private final USER_NAME_KEY : String = "?user=";
    private final PASSWORD_KEY : String = "&password=";
    public function new() {
    }

    private function updateUrl() : Void {
        this.updateHost();
        var stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(this.getHost());
        stringBuffer.append(this.getName());
        stringBuffer.append(this.getUserNameKey());
        stringBuffer.append(this.getUserName());
        stringBuffer.append(this.getPasswordKey());
        stringBuffer.append(this.getPassword());
        this.url = Std.string(stringBuffer);
    }

    public function getUrl() : String {
        return this.url;
    }

    public function getJdbcDriver() : String {
        return this.jdbcDriver;
    }

    public function getName() : String {
        return this.name;
    }

    public function getUserName() : String {
        return this.userName;
    }

    public function getPassword() : String {
        return this.password;
    }

    private function updateHost() : Void {
        var stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(this.getSchema());
        stringBuffer.append(this.SCHEMA_SEP);
        stringBuffer.append(this.getServer());
        if (this.getPort() != null && this.getPort().length() > 1) {
            stringBuffer.append(CommonSeps.getInstance().COLON);
            stringBuffer.append(this.getPort());
        }
        stringBuffer.append(AbPathData.getInstance().SEPARATOR);
        this.host = Std.string(stringBuffer);
    }

    public function getHost() : String {
        return this.host;
    }

    public function getSchema() : String {
        return this.schema;
    }

    public function getServer() : String {
        return this.server;
    }

    public function getPort() : String {
        return this.port;
    }

    public function setJdbcDriver(value : String) : Void {
        this.jdbcDriver = value;
    }

    public function setName(value : String) : Void {
        this.name = value;
        this.updateUrl();
    }

    public function setUserName(value : String) : Void {
        this.userName = value;
        this.updateUrl();
    }

    public function setPassword(value : String) : Void {
        this.password = value;
        this.updateUrl();
    }

    public function setSchema(value : String) : Void {
        this.schema = value;
        this.updateUrl();
    }

    public function setServer(value : String) : Void {
        this.server = value;
        this.updateUrl();
    }

    public function setPort(value : String) : Void {
        this.port = value;
        this.updateUrl();
    }

    public function getUserNameKey() : String {
        return this.USER_NAME_KEY;
    }

    public function getPasswordKey() : String {
        return this.PASSWORD_KEY;
    }

}

