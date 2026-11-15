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

import org.allbinary.logic.string.StringMaker;

class InitializerData {
    private static final instance : InitializerData = new InitializerData();
    public static function getInstance() : InitializerData {
        return InitializerData.instance;
    }

    public final DBUSER : String = "DBUSER";
    public final DBPASSWORD : String = "DBPASSWORD";
    public final ADMINJDBCDRIVER : String = "ADMIN_JDBCDRIVER";
    public final ADMINSCHEMA : String = "ADMINSCHEMA";
    public final ADMINSERVER : String = "ADMINSERVER";
    public final ADMINPORT : String = "ADMINPORT";
    public final CUSTOMERJDBCDRIVER : String = "CUSTOMER_JDBCDRIVER";
    public final CUSTOMERNAME : String = "CUSTOMERNAME";
    public final CUSTOMERUSERNAME : String = "CUSTOMERUSERNAME";
    public final CUSTOMERPASSWORD : String = "CUSTOMERPASSWORD";
    public final CUSTOMERSCHEMA : String = "CUSTOMERSCHEMA";
    public final CUSTOMERSERVER : String = "CUSTOMERSERVER";
    public final CUSTOMERPORT : String = "CUSTOMERPORT";
    public final HISTORYJDBCDRIVER : String = "HISTORY_JDBCDRIVER";
    public final HISTORYNAME : String = "HISTORYNAME";
    public final HISTORYUSERNAME : String = "HISTORYUSERNAME";
    public final HISTORYPASSWORD : String = "HISTORYPASSWORD";
    public final HISTORYSCHEMA : String = "HISTORYSCHEMA";
    public final HISTORYSERVER : String = "HISTORYSERVER";
    public final HISTORYPORT : String = "HISTORYPORT";
    public final LOGJDBCDRIVER : String = "LOG_JDBCDRIVER";
    public final LOGNAME : String = "LOGNAME";
    public final LOGUSERNAME : String = "LOGUSERNAME";
    public final LOGPASSWORD : String = "LOGPASSWORD";
    public final LOGSCHEMA : String = "LOGSCHEMA";
    public final LOGSERVER : String = "LOGSERVER";
    public final LOGPORT : String = "LOGPORT";
    public final INVENTORYJDBCDRIVER : String = "INVENTORY_JDBCDRIVER";
    public final INVENTORYNAME : String = "INVENTORYNAME";
    public final INVENTORYUSERNAME : String = "INVENTORYUSERNAME";
    public final INVENTORYPASSWORD : String = "INVENTORYPASSWORD";
    public final INVENTORYSCHEMA : String = "INVENTORYSCHEMA";
    public final INVENTORYSERVER : String = "INVENTORYSERVER";
    public final INVENTORYPORT : String = "INVENTORYPORT";
    public final STATICPAGESJDBCDRIVER : String = "STATICPAGES_JDBCDRIVER";
    public final STATICPAGESNAME : String = "STATICPAGESNAME";
    public final STATICPAGESUSERNAME : String = "STATICPAGESUSERNAME";
    public final STATICPAGESPASSWORD : String = "STATICPAGESPASSWORD";
    public final STATICPAGESSCHEMA : String = "STATICPAGESSCHEMA";
    public final STATICPAGESSERVER : String = "STATICPAGESSERVER";
    public final STATICPAGESPORT : String = "STATICPAGESPORT";
    public function getJdbcDriverSolutionInfo() : String {
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

    public function new() {
    }
}

