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
package org.allbinary.logic.communication.sql;

//import java.sql.Connection;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import java.sql.Statement;
import org.allbinary.business.init.db.DatabaseConnectionInfoInterface;
import org.allbinary.business.init.db.DbConnectionInfo;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.sql.connection.pool.SqlConnectionPool;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.string.CommonSeps;
import org.allbinary.string.CommonStrings;

class AbSqlBasic {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final sqlConnectionPool : SqlConnectionPool = SqlConnectionPool.getInstance();
    private var databaseConnectionInfoInterface : DbConnectionInfo;
    private var connectAttemptCounter : Int;
    public var conn : Connection;
    public final stringUtil : StringUtil = StringUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    public final commonSeps : CommonSeps = CommonSeps.getInstance();
    public final stdUtil : StdUtil = StdUtil.getInstance();
    public final sqlTypeStrings : SqlTypeStrings = SqlTypeStrings.getInstance();
    public final sqlStrings : SqlStrings = SqlStrings.getInstance();
    public final INSERT : String = "insert";
    public final UPDATE : String = "update";
    public final FAILED_SQL_STATEMENT : String = "Failed\nSQL Statement: ";
    public final SUCCESS_SQL_STATEMENT : String = "Success\nSQL Statement: ";
    private final METHOD_EXECUTED_SQL_STATEMENT : String = "executedSQLStatement";
    private final METHOD_CREATE : String = "create";
    private final DATABASE_CREATED_LABEL : String = "Database Created: ";
    private final DATABASE_CREATION_FAILED_LABEL : String = "Database Creation Failed: ";
    private final SQL_CONNECTION_FAILED : String = "SQL Connection Failed";
    private final SQL_CONNECTION_RETRYING : String = "SQL Connection Retrying";
    private final SQL_CONNECTION_RETRY : String = "SQL Connection Retry";
    private final METHOD_CREATE_CONNECTION : String = "createConnection()";
    private final METHOD_INITIALIZE : String = "initialize";
    private final LOAD_JDBC_DRIVER_FAILED_LABEL : String = "Load JDBC Driver Failed: ";
    public function new(databaseConnectionInfoInterface : DbConnectionInfo) {
        this.databaseConnectionInfoInterface = databaseConnectionInfoInterface;
        this.connectAttemptCounter = 0;
        this.conn = null;
    }

    // throws SQLException
    public function executeSQLStatement(statement : String) : ResultSet {
        try {
            this.initialize();
            var stmt : Statement = this.conn.createStatement();
            stmt.execute(statement);
            var rset : ResultSet = stmt.getResultSet();
            stmt.close();
            var tempConnection : Connection = this.conn;
            this.conn = null;
            this.sqlConnectionPool.add(this.getDatabaseConnectionInfoInterface().getUrl(), tempConnection);
            return rset;
        } catch (e : SQLException) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGINGERROR)) {
                this.logUtil.put(this.FAILED_SQL_STATEMENT + statement, this, METHOD_EXECUTED_SQL_STATEMENT, e);
            }
            this.conn.close();
            this.conn = null;
            throw e;
        }
    }

    public function create(databaseName : String) : String {
        try {
            this.executeSQLStatement(this.sqlStrings.CREATE_DATABASE + databaseName);
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                this.logUtil.putF(this.DATABASE_CREATED_LABEL + databaseName, this, this.METHOD_CREATE);
            }
            return databaseName + this.sqlStrings.CREATE_RETURN;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGINGERROR)) {
                this.logUtil.put(this.DATABASE_CREATION_FAILED_LABEL + databaseName, this, this.METHOD_CREATE, e);
            }
            return this.DATABASE_CREATION_FAILED_LABEL + databaseName;
        }
    }

    private function createConnection() : Void {
        try {
            this.conn = this.sqlConnectionPool.get(this.getDatabaseConnectionInfoInterface().getUrl());
        } catch (se : SQLException) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGINGERROR)) {
                this.logUtil.put(this.SQL_CONNECTION_RETRYING, this, METHOD_CREATE_CONNECTION, se);
            }
            try {
                Thread.currentThread().sleep(2000);
                if (this.connectAttemptCounter < 10) {
                    this.connectAttemptCounter++;
                    this.initialize();
                }
            } catch (e : haxe.Exception) {
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGINGERROR)) {
                    this.logUtil.put(this.SQL_CONNECTION_RETRY + se.message, this, this.METHOD_CREATE_CONNECTION, e);
                }
            }
        }
    }

    private function initialize() : Void {
        try {
            {
                try {
                    var loader : ClassLoader = Thread.currentThread().getContextClassLoader();
                    var jdbcDriverClass : Class<Dynamic> = loader.loadClass(this.getDatabaseConnectionInfoInterface().getJdbcDriver());
                    jdbcDriverClass.newInstance();
                } catch (e : haxe.Exception) {
                    if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGINGERROR)) {
                        this.logUtil.put(this.LOAD_JDBC_DRIVER_FAILED_LABEL + this.getDatabaseConnectionInfoInterface().getJdbcDriver(), this, METHOD_INITIALIZE, e);
                    }
                }
            }
            this.createConnection();
        } catch (se : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGINGERROR)) {
                this.logUtil.put(this.SQL_CONNECTION_FAILED, this, this.METHOD_INITIALIZE, se);
            }
        }
    }

    public function getDatabaseConnectionInfoInterface() : DatabaseConnectionInfoInterface {
        return this.databaseConnectionInfoInterface;
    }

    public function setDatabaseConnectionInfoInterface(databaseConnectionInfoInterface : DbConnectionInfo) : Void {
        this.databaseConnectionInfoInterface = databaseConnectionInfoInterface;
    }

}

