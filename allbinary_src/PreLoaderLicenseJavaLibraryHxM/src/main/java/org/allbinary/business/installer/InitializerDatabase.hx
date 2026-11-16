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
package org.allbinary.business.installer;

import jre.util.HashMap;
import jre.util.Map;
import jre.util.Set;
import org.allbinary.business.init.db.DatabaseConnectionInfoInterface;
import org.allbinary.business.init.db.DbConnectionInfo;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.string.StringValidationUtil;
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;
import org.allbinary.string.CommonStrings;

class InitializerDatabase {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var adminDbUserName : String = null;
    private var adminDbPassword : String = null;
    private var adminJdbcDriver : String = null;
    private var adminSchema : String = null;
    private var adminServer : String = null;
    private var adminPort : String = null;
    private static final MAXDB : Int = 30;
    private static final MAX : Int = 16;
    private static final MIN : Int = 4;
    private static final MINPASSWORD : Int = 0;
    private var initDb : DynamicInitDb = null;
    public function new(...args : Dynamic) {
        if (args.length == 2 && Std.isOfType(args[0], AbeClientInformationInterface) && Std.isOfType(args[0], Map)) {
            final abeClientInformation : AbeClientInformationInterface = args[0];
            final map : Map<Dynamic, Dynamic> = args[1];
            this._newInitializerDatabase0(abeClientInformation, map);
        }
        else if (args.length == 2) {
            final abeClientInformation : AbeClientInformationInterface = args[0];
            final initHashMap : HashMap<Dynamic, Dynamic> = args[1];
            this._newInitializerDatabase1(abeClientInformation, initHashMap);
        }
    }

    private function _newInitializerDatabase0(abeClientInformation : AbeClientInformationInterface, map : Map<Dynamic, Dynamic>) : Void {
        final stringBuffer : StringMaker = new StringMaker();
        final hashMap : HashMap<Dynamic, Dynamic> = StdUtil.getInstance().createHashMap();
        final keys : Set<Dynamic> = map.keySet();
        final keyArray : haxe.ds.Vector<Any> = keys.toArray();
        final size : Int = keyArray.length;
        for (index in 0...size) {
            final key : String = (cast keyArray[index] : String);
            final values : haxe.ds.Vector<String> = (cast map.get(key) : haxe.ds.Vector<String>);
            hashMap.put(key, values[0]);
            stringBuffer.delete(0, stringBuffer.length());
            stringBuffer.append("key: ");
            stringBuffer.append(key);
            stringBuffer.append(" Value: ");
            stringBuffer.append(values[0]);
            this.logUtil.putF(Std.string(stringBuffer), this, "getFormData()");
        }
        this.getFormData(abeClientInformation, hashMap);
    }

    private function _newInitializerDatabase1(abeClientInformation : AbeClientInformationInterface, initHashMap : HashMap<Dynamic, Dynamic>) : Void {
        this.getFormData(abeClientInformation, initHashMap);
    }

    public function getFormData(abeClientInformation : AbeClientInformationInterface, hashMap : HashMap<Dynamic, Dynamic>) : Void {
        try {
            var initializerData : InitializerData = InitializerData.getInstance();
            this.setAdminDbUserName((cast hashMap.get(initializerData.DBUSER) : String));
            this.setAdminDbPassword((cast hashMap.get(initializerData.DBPASSWORD) : String));
            this.setAdminJdbcDriver((cast hashMap.get(initializerData.ADMINJDBCDRIVER) : String));
            this.setAdminSchema((cast hashMap.get(initializerData.ADMINSCHEMA) : String));
            this.setAdminServer((cast hashMap.get(initializerData.ADMINSERVER) : String));
            this.setAdminPort((cast hashMap.get(initializerData.ADMINPORT) : String));
            var dbConnectionInfo : DbConnectionInfo = new DbConnectionInfo();
            var adminDbName : String = StringUtil.getInstance().EMPTY_STRING;
            dbConnectionInfo.setJdbcDriver(getAdminJdbcDriver());
            dbConnectionInfo.setName(adminDbName);
            dbConnectionInfo.setUserName(getAdminDbUserName());
            dbConnectionInfo.setPassword(getAdminDbPassword());
            dbConnectionInfo.setSchema(getAdminSchema());
            dbConnectionInfo.setServer(getAdminServer());
            dbConnectionInfo.setPort(getAdminPort());
            this.initDb = new DynamicInitDb(abeClientInformation, (cast dbConnectionInfo : DatabaseConnectionInfoInterface));
        } catch (e : haxe.Exception) {
            this.logUtil.put("Unable to get form data", this, "getFormData()", e);
        }
    }

    private function isJdbcDriverValid(jdbcDriverClassPathString : String) : Bool {
        try {
            Class.forName(jdbcDriverClassPathString).newInstance();
            return true;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstanceFor().PRELOADERERROR)) {
                final commonStrings : CommonStrings = CommonStrings.getInstance();
                this.logUtil.put(commonStrings.EXCEPTION, this, commonStrings.IS_VALID, e);
            }
            return false;
        }
    }

    public function isValid() : Bool {
        var isValid : Bool = true;
        if (!this.isJdbcDriverValid(this.adminJdbcDriver)) {
            isValid = false;
        }
        var stringValidationUtil : StringValidationUtil = StringValidationUtil.getInstance();
        if (!stringValidationUtil.isValidRequired(this.adminDbUserName, InitializerDatabase.MIN, InitializerDatabase.MAX)) {
            isValid = false;
        }
        if (!stringValidationUtil.isValidNotRequired(this.adminDbPassword, InitializerDatabase.MINPASSWORD, InitializerDatabase.MAX)) {
            isValid = false;
        }
        return isValid;
    }

    private function getJdbcDriverValidationInfo(jdbcDriver : String) : String {
        var stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append("The JDBC driver (");
        stringBuffer.append(jdbcDriver);
        stringBuffer.append(") you have provided is not valid.<br/>");
        return Std.string(stringBuffer);
    }

    public function getInvalidInfo() : String {
        var isValid : Bool = true;
        var isJdbcDriversValid : Bool = true;
        var stringBuffer : StringMaker = new StringMaker();
        if (!this.isJdbcDriverValid(this.adminJdbcDriver)) {
            isJdbcDriversValid = false;
            stringBuffer.append(this.getJdbcDriverValidationInfo(this.getAdminJdbcDriver()));
        }
        var stringValidationUtil : StringValidationUtil = StringValidationUtil.getInstance();
        if (!stringValidationUtil.isValidRequired(this.adminDbUserName, InitializerDatabase.MIN, InitializerDatabase.MAX)) {
            stringBuffer.append("Admin username should be < " + InitializerDatabase.MAX + " and > " + InitializerDatabase.MIN + " characters in length.<br />");
        }
        if (!stringValidationUtil.isValidNotRequired(this.adminDbPassword, InitializerDatabase.MINPASSWORD, InitializerDatabase.MAX)) {
            stringBuffer.append("Admin password should be < " + InitializerDatabase.MAX + " and > " + InitializerDatabase.MINPASSWORD + " characters in length.<br />");
        }
        if (!isJdbcDriversValid) {
            stringBuffer.append(InitializerData.getInstance().getJdbcDriverSolutionInfo());
        }
        return Std.string(stringBuffer);
    }

    public function createUsers() : Bool {
        try {
            this.initDb.addUsers();
            return true;
        } catch (e : haxe.Exception) {
            this.logUtil.put("Unable to Create Users", this, "createUsers()", e);
            return false;
        }
    }

    public function createDatabases() : Bool {
        try {
            this.initDb.addDatabases();
            return true;
        } catch (e : haxe.Exception) {
            this.logUtil.put("Unable to Create Databases", this, "createDatabases()", e);
            return false;
        }
    }

    public function createTables() : Bool {
        try {
            this.initDb.addTables();
            return true;
        } catch (e : haxe.Exception) {
            this.logUtil.put("Unable to Create Tables", this, "createTables()", e);
            return false;
        }
    }

    public function getAdminDbUserName() : String {
        return this.adminDbUserName;
    }

    public function setAdminDbUserName(adminDbUserName : String) : Void {
        this.adminDbUserName = adminDbUserName;
    }

    public function getAdminDbPassword() : String {
        return this.adminDbPassword;
    }

    public function setAdminDbPassword(adminDbPassword : String) : Void {
        this.adminDbPassword = adminDbPassword;
    }

    public function getAdminJdbcDriver() : String {
        return this.adminJdbcDriver;
    }

    public function setAdminJdbcDriver(adminJdbcDriver : String) : Void {
        this.adminJdbcDriver = adminJdbcDriver;
    }

    public function getAdminSchema() : String {
        return this.adminSchema;
    }

    public function setAdminSchema(adminSchema : String) : Void {
        this.adminSchema = adminSchema;
    }

    public function getAdminServer() : String {
        return this.adminServer;
    }

    public function setAdminServer(adminServer : String) : Void {
        this.adminServer = adminServer;
    }

    public function getAdminPort() : String {
        return this.adminPort;
    }

    public function setAdminPort(adminPort : String) : Void {
        this.adminPort = adminPort;
    }

}

