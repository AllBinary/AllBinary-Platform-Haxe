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
import org.allbinary.business.init.db.HistoryDbInitInfo;
import org.allbinary.business.init.db.InventoryDbInitInfo;
import org.allbinary.business.init.db.LogDbInitInfo;
import org.allbinary.business.init.db.StaticPagesDbInitInfo;
import org.allbinary.business.init.db.UserDbInitInfo;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringValidationUtil;
import org.allbinary.string.CommonStrings;

class Initializer {
    public var logUtil : LogUtil = LogUtil.getInstance();
    private var userJdbcDriver : String = null;
    private var userName : String = null;
    private var userUserName : String = null;
    private var userPassword : String = null;
    private var userSchema : String = null;
    private var userServer : String = null;
    private var userPort : String = null;
    private var historyJdbcDriver : String = null;
    private var historyName : String = null;
    private var historyUserName : String = null;
    private var historyPassword : String = null;
    private var historySchema : String = null;
    private var historyServer : String = null;
    private var historyPort : String = null;
    private var logJdbcDriver : String = null;
    private var logName : String = null;
    private var logUserName : String = null;
    private var logPassword : String = null;
    private var logSchema : String = null;
    private var logServer : String = null;
    private var logPort : String = null;
    private var inventoryJdbcDriver : String = null;
    private var inventoryName : String = null;
    private var inventoryUserName : String = null;
    private var inventoryPassword : String = null;
    private var inventorySchema : String = null;
    private var inventoryServer : String = null;
    private var inventoryPort : String = null;
    private var staticPagesJdbcDriver : String = null;
    private var staticPagesName : String = null;
    private var staticPagesUserName : String = null;
    private var staticPagesPassword : String = null;
    private var staticPagesSchema : String = null;
    private var staticPagesServer : String = null;
    private var staticPagesPort : String = null;
    private static final MAXDB : Int = 30;
    private static final MAX : Int = 16;
    private static final MIN : Int = 4;
    private static final MINPASSWORD : Int = 0;
    public function new(...args : Dynamic) {
        if (args.length == 1 && Std.isOfType(args[0], Map)) {
            final map : Map<Dynamic, Dynamic> = args[0];
            this._newInitializer0(map);
        }
        else if (args.length == 1) {
            final initHashMap : HashMap<Dynamic, Dynamic> = args[0];
            this._newInitializer1(initHashMap);
        }
    }

    private function _newInitializer0(map : Map<Dynamic, Dynamic>) : Void {
        final stringBuffer : StringMaker = new StringMaker();
        var hashMap : HashMap<Dynamic, Dynamic> = StdUtil.getInstance().createHashMap();
        var keys : Set<Dynamic> = map.keySet();
        final keyArray : haxe.ds.Vector<Any> = keys.toArray();
        final size : Int = keyArray.length;
        for (index in 0...size) {
            var key : String = (cast keyArray[index] : String);
            var values : haxe.ds.Vector<String> = (cast map.get(key) : haxe.ds.Vector<String>);
            hashMap.put(key, values[0]);
            stringBuffer.delete(0, stringBuffer.length());
            stringBuffer.append("key: ");
            stringBuffer.append(key);
            stringBuffer.append(" Value: ");
            stringBuffer.append(values[0]);
            this.logUtil.putF(Std.string(stringBuffer), this, "getFormData()");
        }
        this.getFormData(hashMap);
    }

    private function _newInitializer1(initHashMap : HashMap<Dynamic, Dynamic>) : Void {
        this.getFormData(initHashMap);
    }

    public function getFormData(hashMap : HashMap<Dynamic, Dynamic>) : Void {
        try {
            var initializerData : InitializerData = InitializerData.getInstance();
            this.userJdbcDriver = (cast hashMap.get(initializerData.CUSTOMERJDBCDRIVER) : String);
            this.userName = (cast hashMap.get(initializerData.CUSTOMERNAME) : String);
            this.userUserName = (cast hashMap.get(initializerData.CUSTOMERUSERNAME) : String);
            this.userPassword = (cast hashMap.get(initializerData.CUSTOMERPASSWORD) : String);
            this.userSchema = (cast hashMap.get(initializerData.CUSTOMERSCHEMA) : String);
            this.userServer = (cast hashMap.get(initializerData.CUSTOMERSERVER) : String);
            this.userPort = (cast hashMap.get(initializerData.CUSTOMERPORT) : String);
            this.historyJdbcDriver = (cast hashMap.get(initializerData.HISTORYJDBCDRIVER) : String);
            this.historyName = (cast hashMap.get(initializerData.HISTORYNAME) : String);
            this.historyUserName = (cast hashMap.get(initializerData.HISTORYUSERNAME) : String);
            this.historyPassword = (cast hashMap.get(initializerData.HISTORYPASSWORD) : String);
            this.historySchema = (cast hashMap.get(initializerData.HISTORYSCHEMA) : String);
            this.historyServer = (cast hashMap.get(initializerData.HISTORYSERVER) : String);
            this.historyPort = (cast hashMap.get(initializerData.HISTORYPORT) : String);
            this.logJdbcDriver = (cast hashMap.get(initializerData.LOGJDBCDRIVER) : String);
            this.logName = (cast hashMap.get(initializerData.LOGNAME) : String);
            this.logUserName = (cast hashMap.get(initializerData.LOGUSERNAME) : String);
            this.logPassword = (cast hashMap.get(initializerData.LOGPASSWORD) : String);
            this.logSchema = (cast hashMap.get(initializerData.LOGSCHEMA) : String);
            this.logServer = (cast hashMap.get(initializerData.LOGSERVER) : String);
            this.logPort = (cast hashMap.get(initializerData.LOGPORT) : String);
            this.inventoryJdbcDriver = (cast hashMap.get(initializerData.INVENTORYJDBCDRIVER) : String);
            this.inventoryName = (cast hashMap.get(initializerData.INVENTORYNAME) : String);
            this.inventoryUserName = (cast hashMap.get(initializerData.INVENTORYUSERNAME) : String);
            this.inventoryPassword = (cast hashMap.get(initializerData.INVENTORYPASSWORD) : String);
            this.inventorySchema = (cast hashMap.get(initializerData.INVENTORYSCHEMA) : String);
            this.inventoryServer = (cast hashMap.get(initializerData.INVENTORYSERVER) : String);
            this.inventoryPort = (cast hashMap.get(initializerData.INVENTORYPORT) : String);
            this.staticPagesJdbcDriver = (cast hashMap.get(initializerData.STATICPAGESJDBCDRIVER) : String);
            this.staticPagesName = (cast hashMap.get(initializerData.STATICPAGESNAME) : String);
            this.staticPagesUserName = (cast hashMap.get(initializerData.STATICPAGESUSERNAME) : String);
            this.staticPagesPassword = (cast hashMap.get(initializerData.STATICPAGESPASSWORD) : String);
            this.staticPagesSchema = (cast hashMap.get(initializerData.STATICPAGESSCHEMA) : String);
            this.staticPagesServer = (cast hashMap.get(initializerData.STATICPAGESSERVER) : String);
            this.staticPagesPort = (cast hashMap.get(initializerData.STATICPAGESPORT) : String);
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
        if (!this.isJdbcDriverValid(this.userJdbcDriver)) {
            isValid = false;
        }
        var stringValidationUtil : StringValidationUtil = StringValidationUtil.getInstance();
        if (!stringValidationUtil.isValidRequired(this.userName, Initializer.MIN, Initializer.MAXDB)) {
            isValid = false;
        }
        if (!stringValidationUtil.isValidRequired(this.userUserName, Initializer.MIN, Initializer.MAX)) {
            isValid = false;
        }
        if (!stringValidationUtil.isValidNotRequired(this.userPassword, Initializer.MINPASSWORD, Initializer.MAX)) {
            isValid = false;
        }
        if (!this.isJdbcDriverValid(this.historyJdbcDriver)) {
            isValid = false;
        }
        if (!stringValidationUtil.isValidRequired(this.historyName, Initializer.MIN, Initializer.MAXDB)) {
            isValid = false;
        }
        if (!stringValidationUtil.isValidRequired(this.historyUserName, Initializer.MIN, Initializer.MAX)) {
            isValid = false;
        }
        if (!stringValidationUtil.isValidNotRequired(this.historyPassword, Initializer.MINPASSWORD, Initializer.MAX)) {
            isValid = false;
        }
        if (!this.isJdbcDriverValid(this.logJdbcDriver)) {
            isValid = false;
        }
        if (!stringValidationUtil.isValidRequired(this.logName, Initializer.MIN, Initializer.MAXDB)) {
            isValid = false;
        }
        if (!stringValidationUtil.isValidRequired(this.logUserName, Initializer.MIN, Initializer.MAX)) {
            isValid = false;
        }
        if (!stringValidationUtil.isValidNotRequired(this.logPassword, Initializer.MINPASSWORD, Initializer.MAX)) {
            isValid = false;
        }
        if (!this.isJdbcDriverValid(this.inventoryJdbcDriver)) {
            isValid = false;
        }
        if (!stringValidationUtil.isValidRequired(this.inventoryName, Initializer.MIN, Initializer.MAXDB)) {
            isValid = false;
        }
        if (!stringValidationUtil.isValidRequired(this.inventoryUserName, Initializer.MIN, Initializer.MAX)) {
            isValid = false;
        }
        if (!stringValidationUtil.isValidNotRequired(this.inventoryPassword, Initializer.MINPASSWORD, Initializer.MAX)) {
            isValid = false;
        }
        if (!this.isJdbcDriverValid(this.staticPagesJdbcDriver)) {
            isValid = false;
        }
        if (!stringValidationUtil.isValidRequired(this.staticPagesName, Initializer.MIN, Initializer.MAXDB)) {
            isValid = false;
        }
        if (!stringValidationUtil.isValidRequired(this.staticPagesUserName, Initializer.MIN, Initializer.MAX)) {
            isValid = false;
        }
        if (!stringValidationUtil.isValidNotRequired(this.staticPagesPassword, Initializer.MINPASSWORD, Initializer.MAX)) {
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

    private function getJdbcDriverSolutionInfo() : String {
        var stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append("The following describes the possible problems and solutions regarding the Jdbc Driver error(s):<p/>");
        stringBuffer.append("1. A JDBC driver you specified is not in your classpath.<br/>");
        stringBuffer.append("Solution 1: Move the JDBC driver into any directory specified in the existing classpath. <br/>");
        stringBuffer.append("Solution 2: Add the directory that contains the JDBC driver to the classpath.<br/>");
        stringBuffer.append("Solution 3: Add the JDBC driver to the WEB-INF/lib directory where you installed this webapp.<br/>");
        stringBuffer.append("2. The JDBC driver you specified does not exit.<br/>");
        stringBuffer.append("Solution: Get a JDBC driver. <br/>");
        stringBuffer.append("3. The JDBC driver you specified is not valid.<br/>");
        stringBuffer.append("Solution: Use a valid JDBC driver.<p/>");
        return Std.string(stringBuffer);
    }

    public function getInvalidInfo() : String {
        var isJdbcDriversValid : Bool = true;
        var stringBuffer : StringMaker = new StringMaker();
        if (!this.isJdbcDriverValid(this.userJdbcDriver)) {
            isJdbcDriversValid = false;
            stringBuffer.append(this.getJdbcDriverValidationInfo(this.userJdbcDriver));
        }
        var stringValidationUtil : StringValidationUtil = StringValidationUtil.getInstance();
        if (!stringValidationUtil.isValidRequired(this.userName, Initializer.MIN, Initializer.MAXDB)) {
            stringBuffer.append("User db name should be < " + Initializer.MAXDB + " and > " + Initializer.MIN + " characters in length.<br />");
        }
        if (!stringValidationUtil.isValidRequired(this.userUserName, Initializer.MIN, Initializer.MAX)) {
            stringBuffer.append("User db username should be < " + Initializer.MAX + " and > " + Initializer.MIN + " characters in length.<br />");
        }
        if (!stringValidationUtil.isValidNotRequired(this.userPassword, Initializer.MINPASSWORD, Initializer.MAX)) {
            stringBuffer.append("User DB password should be < " + Initializer.MAX + " and > " + Initializer.MINPASSWORD + " characters in length.<br />");
        }
        if (!this.isJdbcDriverValid(this.historyJdbcDriver)) {
            isJdbcDriversValid = false;
            stringBuffer.append(this.getJdbcDriverValidationInfo(this.historyJdbcDriver));
        }
        if (!stringValidationUtil.isValidRequired(this.historyName, Initializer.MIN, Initializer.MAXDB)) {
            stringBuffer.append("History db should be < " + Initializer.MAXDB + " and > " + Initializer.MIN + " characters in length.<br />");
        }
        if (!stringValidationUtil.isValidRequired(this.historyUserName, Initializer.MIN, Initializer.MAX)) {
            stringBuffer.append("History db username should be < " + Initializer.MAX + " and > " + Initializer.MIN + " characters in length.<br />");
        }
        if (!stringValidationUtil.isValidNotRequired(this.historyPassword, Initializer.MINPASSWORD, Initializer.MAX)) {
            stringBuffer.append("History db password should be < " + Initializer.MAX + " and > " + Initializer.MINPASSWORD + " characters in length.<br />");
        }
        if (!this.isJdbcDriverValid(this.logJdbcDriver)) {
            isJdbcDriversValid = false;
            stringBuffer.append(this.getJdbcDriverValidationInfo(this.logJdbcDriver));
        }
        if (!stringValidationUtil.isValidRequired(this.logName, Initializer.MIN, Initializer.MAXDB)) {
            stringBuffer.append("Log db should be < " + Initializer.MAXDB + " and > " + Initializer.MIN + " characters in length.<br />");
        }
        if (!stringValidationUtil.isValidRequired(this.logUserName, Initializer.MIN, Initializer.MAX)) {
            stringBuffer.append("Log db username should be < " + Initializer.MAX + " and > " + Initializer.MIN + " characters in length.<br />");
        }
        if (!stringValidationUtil.isValidNotRequired(this.logPassword, Initializer.MINPASSWORD, Initializer.MAX)) {
            stringBuffer.append("Log db password should be < " + Initializer.MAX + " and > " + Initializer.MINPASSWORD + " characters in length.<br />");
        }
        if (!this.isJdbcDriverValid(this.inventoryJdbcDriver)) {
            isJdbcDriversValid = false;
            stringBuffer.append(this.getJdbcDriverValidationInfo(this.inventoryJdbcDriver));
        }
        if (!stringValidationUtil.isValidRequired(this.inventoryName, Initializer.MIN, Initializer.MAXDB)) {
            stringBuffer.append("Inventory db should be < " + Initializer.MAXDB + " and > " + Initializer.MIN + " characters in length.<br />");
        }
        if (!stringValidationUtil.isValidRequired(this.inventoryUserName, Initializer.MIN, Initializer.MAX)) {
            stringBuffer.append("Inventory db username should be < " + Initializer.MAX + " and > " + Initializer.MIN + " characters in length.<br />");
        }
        if (!stringValidationUtil.isValidNotRequired(this.inventoryPassword, Initializer.MINPASSWORD, Initializer.MAX)) {
            stringBuffer.append("Inventory DB password should be < " + Initializer.MAX + " and > " + Initializer.MINPASSWORD + " characters in length.<br />");
        }
        if (!this.isJdbcDriverValid(this.staticPagesJdbcDriver)) {
            isJdbcDriversValid = false;
            stringBuffer.append(this.getJdbcDriverValidationInfo(this.staticPagesJdbcDriver));
        }
        if (!stringValidationUtil.isValidRequired(this.staticPagesName, Initializer.MIN, Initializer.MAXDB)) {
            stringBuffer.append("Static Pages db should be < " + Initializer.MAXDB + " and > " + Initializer.MIN + " characters in length.<br />");
        }
        if (!stringValidationUtil.isValidRequired(this.staticPagesUserName, Initializer.MIN, Initializer.MAX)) {
            stringBuffer.append("Static Pages db username should be < " + Initializer.MAX + " and > " + Initializer.MIN + " characters in length.<br />");
        }
        if (!stringValidationUtil.isValidNotRequired(this.staticPagesPassword, Initializer.MINPASSWORD, Initializer.MAX)) {
            stringBuffer.append("Static Pages DB password should be < " + Initializer.MAX + " and > " + Initializer.MINPASSWORD + " characters in length.<br />");
        }
        if (!isJdbcDriversValid) {
            stringBuffer.append(getJdbcDriverSolutionInfo());
        }
        return Std.string(stringBuffer);
    }

    // throws Exception
    public function set() : Void {
        this.logUtil.putF("Creating DB connection files", this, "set()");
        var userDbInitInfo : UserDbInitInfo = new UserDbInitInfo(false);
        userDbInitInfo.setJdbcDriver(this.userJdbcDriver);
        userDbInitInfo.setName(this.userName);
        userDbInitInfo.setUserName(this.userUserName);
        userDbInitInfo.setPassword(this.userPassword);
        userDbInitInfo.setSchema(this.userSchema);
        userDbInitInfo.setServer(this.userServer);
        userDbInitInfo.setPort(this.userPort);
        userDbInitInfo.setHasRead(true);
        userDbInitInfo.write();
        var historyDbInitInfo : HistoryDbInitInfo = new HistoryDbInitInfo(false);
        historyDbInitInfo.setJdbcDriver(this.historyJdbcDriver);
        historyDbInitInfo.setName(this.historyName);
        historyDbInitInfo.setUserName(this.historyUserName);
        historyDbInitInfo.setPassword(this.historyPassword);
        historyDbInitInfo.setSchema(this.historySchema);
        historyDbInitInfo.setServer(this.historyServer);
        historyDbInitInfo.setPort(this.historyPort);
        historyDbInitInfo.setHasRead(true);
        historyDbInitInfo.write();
        var logDbInitInfo : LogDbInitInfo = new LogDbInitInfo(false);
        logDbInitInfo.setJdbcDriver(this.logJdbcDriver);
        logDbInitInfo.setName(this.logName);
        logDbInitInfo.setUserName(this.logUserName);
        logDbInitInfo.setPassword(this.logPassword);
        logDbInitInfo.setSchema(this.logSchema);
        logDbInitInfo.setServer(this.logServer);
        logDbInitInfo.setPort(this.logPort);
        logDbInitInfo.setHasRead(true);
        logDbInitInfo.write();
        var staticPagesDbInitInfo : StaticPagesDbInitInfo = new StaticPagesDbInitInfo(false);
        staticPagesDbInitInfo.setJdbcDriver(this.staticPagesJdbcDriver);
        staticPagesDbInitInfo.setName(this.staticPagesName);
        staticPagesDbInitInfo.setUserName(this.staticPagesUserName);
        staticPagesDbInitInfo.setPassword(this.staticPagesPassword);
        staticPagesDbInitInfo.setSchema(this.staticPagesSchema);
        staticPagesDbInitInfo.setServer(this.staticPagesServer);
        staticPagesDbInitInfo.setPort(this.staticPagesPort);
        staticPagesDbInitInfo.setHasRead(true);
        staticPagesDbInitInfo.write();
        var inventoryDbInitInfo : InventoryDbInitInfo = new InventoryDbInitInfo(false);
        inventoryDbInitInfo.setJdbcDriver(this.inventoryJdbcDriver);
        inventoryDbInitInfo.setName(this.inventoryName);
        inventoryDbInitInfo.setUserName(this.inventoryUserName);
        inventoryDbInitInfo.setPassword(this.inventoryPassword);
        inventoryDbInitInfo.setSchema(this.inventorySchema);
        inventoryDbInitInfo.setServer(this.inventoryServer);
        inventoryDbInitInfo.setPort(this.inventoryPort);
        inventoryDbInitInfo.setHasRead(true);
        inventoryDbInitInfo.write();
        this.logUtil.putF("Created DB connection files", this, "set()");
    }

}

