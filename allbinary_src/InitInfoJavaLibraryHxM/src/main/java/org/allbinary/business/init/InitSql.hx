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

//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.ResultSet;
//import java.sql.ResultSetMetaData;
//import java.sql.SQLException;
//import java.sql.Statement;
import jre.util.HashMap;
import jre.util.Set;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.business.init.db.DatabaseConnectionInfoInterface;
import org.allbinary.business.init.db.DbConnectionInfo;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.PreLogUtil;
import org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory;
import org.allbinary.logic.communication.log.config.type.LogConfigTypes;
import org.allbinary.logic.communication.sql.SqlStrings;
import org.allbinary.logic.communication.sql.SqlTypeStrings;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.string.StringValidationUtil;
import org.allbinary.string.CommonSeps;
import org.allbinary.string.CommonStrings;

class InitSql {
    public final stringUtil : StringUtil = StringUtil.getInstance();
    public final commonSeps : CommonSeps = CommonSeps.getInstance();
    public final sqlTypeStrings : SqlTypeStrings = SqlTypeStrings.getInstance();
    public final sqlStrings : SqlStrings = SqlStrings.getInstance();
    public final stdUtil : StdUtil = StdUtil.getInstance();
    public final INSERT : String = "insert";
    public final UPDATE : String = "update";
    private var databaseConnectionInfoInterface : DbConnectionInfo = null;
    private var userid : String = null;
    private var password : String = null;
    private var tableName : String = null;
    private var conn : Connection = null;
    private var useridAndPassword : Bool = false;
    public final SUCCESS_SQL_STATEMENT : String = "Success\nSQL Statement: ";
    public final FAILED_SQL_STATEMENT : String = "Failed\nSQL Statement: ";
    private final INIT_SQL : String = "InitSql";
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    private final EQUAL_QUOTE : String = "=\"";
    private final METHOD_GET_ROW : String = "getRow()";
    private final METHOD_UPDATE_WHERE : String = "updateWhere()";
    private final ROW_VALUE_LABEL : String = "Row Value: ";
    private final NO_RESULTS_IN_RESULT_SET : String = "No Results in ResultSet";
    private final INSERT_END : String = "')";
    public function new(databaseConnectionInfoInterface : DbConnectionInfo) {
        this.setDatabaseConnectionInfoInterface(databaseConnectionInfoInterface);
    }

    public function setTable(tableName : String) : Void {
        this.tableName = tableName;
    }

    public function setDatabaseConnectionInfoInterface(databaseConnectionInfoInterface : DbConnectionInfo) : Void {
        this.databaseConnectionInfoInterface = databaseConnectionInfoInterface;
    }

    public function createTable(tableData : String) : Bool {
        try {
            final stringBuffer : StringMaker = new StringMaker();
            stringBuffer.append("Creating Table: ");
            stringBuffer.append(tableData);
            PreLogUtil.put(Std.string(stringBuffer), INIT_SQL, "createTable()");
            this.executeSQLStatement(tableData);
            return true;
        } catch (e : haxe.Exception) {
            if (LogConfigTypes.LOGGING.contains(LogConfigTypeFactory.getInstance().SQLLOGGINGERROR)) {
                PreLogUtil.putOE(this.commonStrings.EXCEPTION, INIT_SQL, "createTable()", e);
            }
            return false;
        }
    }

    public function dropTable() : Bool {
        var sqlStatement : String = this.sqlStrings.DROP_TABLE + this.tableName;
        try {
            this.executeSQLStatement(sqlStatement);
            return true;
        } catch (e : haxe.Exception) {
            if (LogConfigTypes.LOGGING.contains(LogConfigTypeFactory.getInstance().SQLLOGGINGERROR)) {
                PreLogUtil.putOE(this.commonStrings.EXCEPTION, INIT_SQL, "dropTables()", e);
            }
            return false;
        }
    }

    public function getRow(keysAndValues : HashMap<Dynamic, Dynamic>) : HashMap<Dynamic, Dynamic> {
        var stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(this.sqlStrings.SELECT_ALL_FROM);
        stringBuffer.append(this.tableName);
        stringBuffer.append(this.sqlStrings.WHERE);
        try {
            var result : HashMap<Dynamic, Dynamic> = null;
            var set : Set<Dynamic> = keysAndValues.keySet();
            var keyArray : haxe.ds.Vector<Any> = set.toArray();
            var size : Int = keyArray.length;
            for (i in 0...size) {
                var key : String = (cast keyArray[i] : String);
                var value : String = (cast keysAndValues.get(key) : String);
                stringBuffer.append(key);
                stringBuffer.append(this.sqlStrings.EQUAL_QUOTE);
                stringBuffer.append(this.getValue(value));
                stringBuffer.append(this.sqlStrings.CLOSE_QUOTE);
                if (i < size - 1) {
                    stringBuffer.append(this.sqlStrings.AND);
                }
            }
            var sqlStatement : String = Std.string(stringBuffer);
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstanceFor().SQLLOGGING)) {
                PreLogUtil.put(this.sqlStrings.SQL_STATEMENT_LABEL + sqlStatement, this.INIT_SQL, this.METHOD_GET_ROW);
            }
            var rset : ResultSet = this.executeSQLStatement(sqlStatement);
            var resultSetMetaData : ResultSetMetaData = rset.getMetaData();
            while (rset.next()) {
                result = stdUtil.createHashMap();
                var columnCount : Int = resultSetMetaData.getColumnCount();
                for (index in 1...columnCount + 1) {
                    var columnName : String = resultSetMetaData.getColumnName(index);
                    var field : String = rset.getString(columnName);
                    result.put(columnName, field);
                }
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstanceFor().SQLLOGGING)) {
                    PreLogUtil.put(this.ROW_VALUE_LABEL + Std.string(result), this.INIT_SQL, this.METHOD_GET_ROW);
                }
                return result;
            }
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstanceFor().SQLLOGGINGERROR)) {
                PreLogUtil.put(this.NO_RESULTS_IN_RESULT_SET, this.INIT_SQL, this.METHOD_GET_ROW);
            }
            return null;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstanceFor().SQLLOGGINGERROR)) {
                PreLogUtil.putOE(this.FAILED_SQL_STATEMENT + stringBuffer, this.INIT_SQL, this.METHOD_GET_ROW, e);
            }
            return null;
        }
    }

    // synchronized
    public function updateWhere(key : String, value : String, updatedKeyValuePairs : HashMap<Dynamic, Dynamic>) : Void {
        var stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(this.sqlStrings.UPDATE);
        stringBuffer.append(this.tableName);
        stringBuffer.append(this.sqlStrings.SET);
        try {
            var columnArray : haxe.ds.Vector<Any> = updatedKeyValuePairs.keySet().toArray();
            var size : Int = columnArray.length;
            for (i in 0...size) {
                var columnName : String = Std.string(columnArray[i]);
                stringBuffer.append(this.commonSeps.SPACE);
                stringBuffer.append(columnName);
                stringBuffer.append(this.EQUAL_QUOTE);
                var columnValue : String = (cast updatedKeyValuePairs.get(columnName) : String);
                if (columnValue == null) {
                    columnValue = this.stringUtil.EMPTY_STRING;
                } else {
                }
                stringBuffer.append(this.getValue(columnValue));
                stringBuffer.append(this.sqlStrings.CLOSE_QUOTE);
                if (i < size - 1) {
                    stringBuffer.append(this.commonSeps.COMMA);
                }
            }
            stringBuffer.append(this.sqlStrings.WHERE);
            stringBuffer.append(key);
            stringBuffer.append(this.sqlStrings.EQUAL_QUOTE);
            stringBuffer.append(this.getValue(value));
            stringBuffer.append(this.sqlStrings.CLOSE_QUOTE);
            var sqlStatement : String = Std.string(stringBuffer);
            this.executeSQLStatement(sqlStatement);
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstanceFor().SQLLOGGING)) {
                PreLogUtil.put(this.SUCCESS_SQL_STATEMENT + sqlStatement, this.INIT_SQL, METHOD_UPDATE_WHERE);
            }
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstanceFor().SQLLOGGINGERROR)) {
                PreLogUtil.putOE(this.FAILED_SQL_STATEMENT + stringBuffer, this.INIT_SQL, METHOD_UPDATE_WHERE, e);
            }
        }
    }

    public function insert(values : BasicArrayList) : Void {
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(this.sqlStrings.INSERT_INTO);
        stringBuffer.append(this.tableName);
        stringBuffer.append(this.sqlStrings.VALUES);
        try {
            final size : Int = values.size();
            for (i in 0...size - 1) {
                var value : String = this.getValue((cast values.get(i) : String));
                stringBuffer.append(value);
                stringBuffer.append(this.sqlStrings.SINGLE_QUOTE_COMMA_SEP);
            }
            final value : String = this.getValue((cast values.get(values.size() - 1) : String));
            stringBuffer.append(value);
            stringBuffer.append(this.INSERT_END);
            final sqlStatement : String = Std.string(stringBuffer);
            this.executeSQLStatement(sqlStatement);
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstanceFor().SQLLOGGING)) {
                PreLogUtil.put(this.SUCCESS_SQL_STATEMENT + sqlStatement, this.INIT_SQL, INSERT);
            }
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstanceFor().SQLLOGGINGERROR)) {
                PreLogUtil.putOE(this.FAILED_SQL_STATEMENT + Std.string(stringBuffer), this.INIT_SQL, INSERT, e);
            }
        }
    }

    // synchronized
    private function getValue(value : String) : String {
        if (StringValidationUtil.getInstance().isEmpty(value)) {
            return this.stringUtil.EMPTY_STRING;
        } else {
            return value;
        }
    }

    // throws Exception, SQLException
    public function executeSQLStatement(statement : String) : ResultSet {
        try {
            if (this.conn == null) {
                this.initialize();
            }
            var stmt : Statement = this.conn.createStatement();
            stmt.execute(statement);
            var rset : ResultSet = stmt.getResultSet();
            stmt.close();
            return rset;
        } catch (e : SQLException) {
            if (LogConfigTypes.LOGGING.contains(LogConfigTypeFactory.getInstance().SQLLOGGINGERROR)) {
                PreLogUtil.putOE(this.commonStrings.EXCEPTION, INIT_SQL, "executeSQLStatement()", e);
            }
            throw e;
        } catch (e : haxe.Exception) {
            if (LogConfigTypes.LOGGING.contains(LogConfigTypeFactory.getInstance().SQLLOGGINGERROR)) {
                PreLogUtil.putOE(this.commonStrings.EXCEPTION, INIT_SQL, "executeSQLStatement()", e);
            }
            throw e;
        }
    }

    // throws SQLException
    private function createConnection() : Void {
        try {
            if (this.useridAndPassword == true) {
                this.conn = DriverManager.getConnection(this.databaseConnectionInfoInterface.getUrl(), this.userid, this.password);
            } else {
                this.conn = DriverManager.getConnection(this.databaseConnectionInfoInterface.getUrl());
            }
        } catch (se : SQLException) {
            PreLogUtil.putOE(this.commonStrings.EXCEPTION, INIT_SQL, "createConnection()", se);
            throw se;
        }
    }

    // throws Exception
    private function initialize() : Void {
        try {
            try {
                final jdbcDriver : String = this.databaseConnectionInfoInterface.getJdbcDriver();
                PreLogUtil.put(Std.string(new StringMaker().append("Loading DbConnnectionInfo: ").append(Type.getClassName(Type.getClass(this.databaseConnectionInfoInterface))).append(" Driver: ").append(jdbcDriver)), this.INIT_SQL, "initialize()");
                Class.forName(jdbcDriver).newInstance();
            } catch (e : haxe.Exception) {
                if (LogConfigTypes.LOGGING.contains(LogConfigTypeFactory.getInstance().SQLLOGGINGERROR)) {
                    PreLogUtil.putOE("LoadDriver Failed: " + this.databaseConnectionInfoInterface.getJdbcDriver(), this.INIT_SQL, "initialize()", e);
                }
                throw e;
            }
            if (this.userid == null && this.password == null) {
                this.useridAndPassword = true;
            }
            this.createConnection();
        } catch (se : haxe.Exception) {
            if (LogConfigTypes.LOGGING.contains(LogConfigTypeFactory.getInstance().SQLLOGGINGERROR)) {
                PreLogUtil.putOE(this.commonStrings.EXCEPTION, INIT_SQL, "initialize()", se);
            }
            throw se;
        }
    }

    public function getDatabaseConnectionInfoInterface() : DatabaseConnectionInfoInterface {
        return this.databaseConnectionInfoInterface;
    }

}

