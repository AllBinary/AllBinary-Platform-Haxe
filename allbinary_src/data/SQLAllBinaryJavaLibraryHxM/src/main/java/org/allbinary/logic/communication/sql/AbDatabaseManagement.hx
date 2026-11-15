/*
 * 
 * To change this license header, choose License Headers in Project Properties. 
 * To change this template file, choose Tools | Templates 
 * and open the template in the editor.  
 */
// Generated Code Do Not Modify
package org.allbinary.logic.communication.sql;

//import java.net.InetAddress;
import org.allbinary.business.init.db.DatabaseConnectionInfoInterface;
import org.allbinary.business.init.db.DbConnectionInfo;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.string.CommonStrings;

class AbDatabaseManagement extends AbSqlBean {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public var commonStrings : CommonStrings = CommonStrings.getInstance();
    public final sqlCommandLog : StringMaker = new StringMaker();
    private final GRANT_ALL : String = "GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, INDEX, ALTER ON ";
    private final DOT_STAR : String = ".*";
    private final TO : String = " TO ";
    private final AT_LOCALHOST : String = "@localhost";
    private final IDENTIFIED_BY : String = " IDENTIFIED BY '";
    private final WITH_GRANT_OPTION : String = "' WITH GRANT OPTION";
    private final FAILED : String = "Failed";
    private final GET_HOST_NAME : String = "getHostName()";
    private final METHOD_ADD_USER : String = "addUser()";
    public final METHOD_ADD_USERS : String = "addUsers()";
    private final METHOD_ADD_DB : String = "addDb()";
    public final METHOD_ADD_DATABASES : String = "addDatabases()";
    public final METHOD_ADD_TABLES : String = "addTables()";
    public final UNABLE_TO_CREATE_USER : String = "Unable to Create User: ";
    public final UNABLE_TO_CREATE_DATABASE : String = "Unable to Create Database: ";
    public final UNABLE_TO_CREATE_TABLES : String = "Unable to Create Tables";
    public final ADD_TABLES_RESULTS_LABEL : String = "Add Table Results: ";
    public function new(databaseConnectionInfoInterface : DatabaseConnectionInfoInterface) {
        super((cast databaseConnectionInfoInterface : DbConnectionInfo));
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(connectionInfo : DbConnectionInfo) {
        super(connectionInfo);
    }

    private function getHostName() : String {
        try {
            var addr : InetAddress = InetAddress.getLocalHost();
            return addr.getHostName();
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.FAILED, this, GET_HOST_NAME, e);
            return null;
        }
    }

    // throws Exception
    public function addDbUser(hostName : String, db : String, userName : String, password : String) : Bool {
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(this.GRANT_ALL);
        stringBuffer.append(db);
        stringBuffer.append(this.DOT_STAR);
        stringBuffer.append(this.TO);
        stringBuffer.append(userName);
        stringBuffer.append(hostName);
        stringBuffer.append(this.IDENTIFIED_BY);
        stringBuffer.append(password);
        stringBuffer.append(this.WITH_GRANT_OPTION);
        var sqlStatement : String = Std.string(stringBuffer);
        this.sqlCommandLog.append(sqlStatement);
        this.sqlCommandLog.append(this.commonSeps.NEW_LINE);
        super.executeSQLStatement(sqlStatement);
        return true;
    }

    public function addDbUser(db : String, userName : String, password : String) : Bool {
        try {
            this.addDbUser(this.AT_LOCALHOST, db, userName, password);
            var hostName : String = this.getHostName();
            if (hostName != null) {
                this.addDbUser(hostName, db, userName, password);
            }
            return true;
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.UNABLE_TO_CREATE_USER + userName, this, this.METHOD_ADD_USER, e);
            return false;
        }
    }

    public function addDb(db : String) : Null<Bool> {
        try {
            var sqlStatement : String = this.sqlStrings.CREATE_DATABASE + db;
            this.sqlCommandLog.append(sqlStatement);
            this.sqlCommandLog.append(this.commonSeps.NEW_LINE);
            super.executeSQLStatement(sqlStatement);
            return true;
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.UNABLE_TO_CREATE_DATABASE + db, this, this.METHOD_ADD_DB, e);
            return false;
        }
    }

}

