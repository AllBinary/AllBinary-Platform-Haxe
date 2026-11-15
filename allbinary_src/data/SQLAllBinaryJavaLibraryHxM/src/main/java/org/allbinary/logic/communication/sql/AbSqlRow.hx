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

//import java.sql.ResultSet;
//import java.sql.ResultSetMetaData;
//import java.util.HashMap;
//import java.util.Set;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.business.init.db.DbConnectionInfo;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.string.StringValidationUtil;
import org.allbinary.logic.string.regex.replace.Replace;

class AbSqlRow extends AbSqlColumn {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final EQUAL_QUOTE : String = "=\"";
    private final ESCAPE_QUOTES : String = "\\\"";
    private final GET_ROW : String = "Row Value: ";
    private final METHOD_GET_ROW : String = "getRow()";
    private final METHOD_GET_ROWS : String = "getRows()";
    private final METHOD_GET_ALL_ROWS : String = "getAllRows()";
    private final METHOD_UPDATE_WHERE : String = "updateWhere()";
    private final METHOD_GET_ROWS_WHERE_BETWEEN : String = "getRowsWhereBetween()";
    private final METHOD_DELETE_WHERE : String = "deleteWhere()";
    private final ROW_VALUE_LABEL : String = "Row Value: ";
    private final ROW_VALUES_LABEL : String = "Row Values: ";
    private final NO_RESULTS_IN_RESULT_SET : String = "No Results in ResultSet";
    private final COLUMN_NAME_LABEL : String = "columnName: ";
    private final INSERT_END : String = "')";
    public function new(databaseConnectionInfoInterface : DbConnectionInfo) {
        super(databaseConnectionInfoInterface);
    }

    // synchronized
    private function getValue(value : String) : String {
        if (StringValidationUtil.getInstance().isEmpty(value)) {
            return this.stringUtil.EMPTY_STRING;
        } else {
            return value;
        }
    }

    // synchronized
    public function updateWhere(key : String, value : String, updatedKeyValuePairs : HashMap) : Void {
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(this.sqlStrings.UPDATE);
        stringBuffer.append(this.getTableName());
        stringBuffer.append(this.sqlStrings.SET);
        try {
            final keyArray : haxe.ds.Vector<Any> = updatedKeyValuePairs.keySet().toArray();
            final size : Int = keyArray.length;
            for (i in 0...size) {
                final columnName : String = keyArray[i].toString();
                stringBuffer.append(this.commonSeps.SPACE);
                stringBuffer.append(columnName);
                stringBuffer.append(this.EQUAL_QUOTE);
                var columnValue : String = (cast updatedKeyValuePairs.get(columnName) : String);
                if (columnValue == null) {
                    columnValue = this.stringUtil.EMPTY_STRING;
                } else {
                    columnValue = new Replace(this.sqlStrings.CLOSE_QUOTE, this.ESCAPE_QUOTES).all(columnValue);
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
            final sqlStatement : String = stringBuffer.toString();
            this.executeSQLStatement(sqlStatement);
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                this.logUtil.putF(this.SUCCESS_SQL_STATEMENT + sqlStatement, this, this.METHOD_UPDATE_WHERE);
            }
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGINGERROR)) {
                this.logUtil.put(this.FAILED_SQL_STATEMENT + stringBuffer, this, METHOD_UPDATE_WHERE, e);
            }
        }
    }

    // throws Exception
    // synchronized
    public function updateWhere(whereKeyValuePairs : HashMap, updatedKeyValuePairs : HashMap) : Void {
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(this.sqlStrings.UPDATE);
        stringBuffer.append(this.getTableName());
        stringBuffer.append(this.sqlStrings.SET);
        try {
            final keyArray : haxe.ds.Vector<Any> = updatedKeyValuePairs.keySet().toArray();
            final size : Int = keyArray.length;
            for (i in 0...size) {
                final columnName : String = keyArray[i].toString();
                stringBuffer.append(this.commonSeps.SPACE);
                stringBuffer.append(columnName);
                stringBuffer.append(this.EQUAL_QUOTE);
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                    this.logUtil.putF(this.COLUMN_NAME_LABEL + columnName, this, this.METHOD_UPDATE_WHERE);
                }
                var columnValue : String = (cast updatedKeyValuePairs.get(columnName) : String);
                if (columnValue == null) {
                    columnValue = this.stringUtil.EMPTY_STRING;
                } else {
                    columnValue = new Replace(this.sqlStrings.CLOSE_QUOTE, this.ESCAPE_QUOTES).all(columnValue);
                }
                stringBuffer.append(this.getValue(columnValue));
                stringBuffer.append(this.sqlStrings.CLOSE_QUOTE);
                if (i < size - 1) {
                    stringBuffer.append(this.commonSeps.COMMA);
                }
            }
            stringBuffer.append(this.sqlStrings.WHERE);
            final set : Set = whereKeyValuePairs.keySet();
            final keyArray2 : haxe.ds.Vector<Any> = set.toArray();
            final size2 : Int = keyArray2.length;
            for (i in 0...size2) {
                final key : String = (cast keyArray2[i] : String);
                final value : String = (cast whereKeyValuePairs.get(key) : String);
                {
                    stringBuffer.append(key);
                    stringBuffer.append(this.sqlStrings.EQUAL_QUOTE);
                    stringBuffer.append(this.getValue(value));
                    stringBuffer.append(this.sqlStrings.CLOSE_QUOTE);
                    if (i < size2 - 1) {
                        stringBuffer.append(this.sqlStrings.AND);
                    }
                }
            }
            final sqlStatement : String = stringBuffer.toString();
            this.executeSQLStatement(sqlStatement);
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                this.logUtil.putF(this.SUCCESS_SQL_STATEMENT + sqlStatement, this, this.METHOD_UPDATE_WHERE);
            }
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGINGERROR)) {
                this.logUtil.put(this.FAILED_SQL_STATEMENT + stringBuffer, this, METHOD_UPDATE_WHERE, e);
            }
            throw e;
        }
    }

    // synchronized
    public function deleteWhere(key : String, value : String) : Void {
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(this.sqlStrings.DELETE);
        stringBuffer.append(this.sqlStrings.FROM);
        stringBuffer.append(this.getTableName());
        stringBuffer.append(this.sqlStrings.WHERE);
        stringBuffer.append(key);
        stringBuffer.append(this.sqlStrings.EQUAL_QUOTE);
        stringBuffer.append(value);
        stringBuffer.append(this.sqlStrings.CLOSE_QUOTE);
        try {
            final sqlStatement : String = stringBuffer.toString();
            this.executeSQLStatement(sqlStatement);
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                this.logUtil.putF(this.SUCCESS_SQL_STATEMENT + sqlStatement, this, this.METHOD_DELETE_WHERE);
            }
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGINGERROR)) {
                this.logUtil.put(this.FAILED_SQL_STATEMENT + stringBuffer.toString(), this, this.METHOD_DELETE_WHERE, e);
            }
        }
    }

    // synchronized
    public function deleteWhere(keysAndValues : HashMap) : Void {
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(this.sqlStrings.DELETE);
        stringBuffer.append(this.sqlStrings.FROM);
        stringBuffer.append(this.getTableName());
        stringBuffer.append(this.sqlStrings.WHERE);
        try {
            final set : Set = keysAndValues.keySet();
            final keyArray : haxe.ds.Vector<Any> = set.toArray();
            final size : Int = keyArray.length;
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
            final sqlStatement : String = stringBuffer.toString();
            this.executeSQLStatement(sqlStatement);
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                this.logUtil.putF(this.SUCCESS_SQL_STATEMENT + sqlStatement, this, this.METHOD_DELETE_WHERE);
            }
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGINGERROR)) {
                this.logUtil.put(this.FAILED_SQL_STATEMENT + stringBuffer.toString(), this, this.METHOD_DELETE_WHERE, e);
            }
        }
    }

    public function insert(values : BasicArrayList) : Void {
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(this.sqlStrings.INSERT_INTO);
        stringBuffer.append(this.getTableName());
        stringBuffer.append(this.sqlStrings.VALUES);
        try {
            for (i in 0...values.size() - 1) {
                var value : String = this.getValue((cast values.get(i) : String));
                value = new Replace(this.sqlStrings.ESCAPE, this.sqlStrings.DOUBLE_ESCAPE).all(value);
                stringBuffer.append(value);
                stringBuffer.append(this.sqlStrings.SINGLE_QUOTE_COMMA_SEP);
            }
            var value : String = this.getValue((cast values.get(values.size() - 1) : String));
            value = new Replace(this.sqlStrings.ESCAPE, this.sqlStrings.DOUBLE_ESCAPE).all(value);
            stringBuffer.append(value);
            stringBuffer.append(this.INSERT_END);
            var sqlStatement : String = stringBuffer.toString();
            this.executeSQLStatement(sqlStatement);
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                this.logUtil.putF(this.SUCCESS_SQL_STATEMENT + sqlStatement, this, this.INSERT);
            }
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGINGERROR)) {
                this.logUtil.put(this.FAILED_SQL_STATEMENT + stringBuffer.toString(), this, INSERT, e);
            }
        }
    }

    public function getRow(keysAndValues : HashMap) : HashMap {
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(this.sqlStrings.SELECT_ALL_FROM);
        stringBuffer.append(this.getTableName());
        stringBuffer.append(this.sqlStrings.WHERE);
        try {
            var result : HashMap = null;
            final set : Set = keysAndValues.keySet();
            final keyArray : haxe.ds.Vector<Any> = set.toArray();
            final size : Int = keyArray.length;
            for (index in 0...size) {
                final key : String = (cast keyArray[index] : String);
                final value : String = (cast keysAndValues.get(key) : String);
                stringBuffer.append(key);
                stringBuffer.append(this.sqlStrings.EQUAL_QUOTE);
                stringBuffer.append(this.getValue(value));
                stringBuffer.append(this.sqlStrings.CLOSE_QUOTE);
                if (index < size - 1) {
                    stringBuffer.append(this.sqlStrings.AND);
                }
            }
            final sqlStatement : String = stringBuffer.toString();
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                this.logUtil.putF(this.sqlStrings.SQL_STATEMENT_LABEL + sqlStatement, this, this.METHOD_GET_ROW);
            }
            final rset : ResultSet = this.executeSQLStatement(sqlStatement);
            final resultSetMetaData : ResultSetMetaData = rset.getMetaData();
            while (rset.next()) {
                result = this.stdUtil.createHashMap();
                var columnCount : Int = resultSetMetaData.getColumnCount();
                for (index in 1...columnCount + 1) {
                    var columnName : String = resultSetMetaData.getColumnName(index);
                    var field : String = rset.getString(columnName);
                    result.put(columnName, field);
                }
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                    this.logUtil.putF(this.ROW_VALUE_LABEL + result.toString(), this, this.METHOD_GET_ROW);
                }
                return result;
            }
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGINGERROR)) {
                this.logUtil.putF(this.NO_RESULTS_IN_RESULT_SET, this, this.METHOD_GET_ROW);
            }
            return null;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGINGERROR)) {
                this.logUtil.put(this.FAILED_SQL_STATEMENT + stringBuffer, this, this.METHOD_GET_ROW, e);
            }
            return null;
        }
    }

    public function getRows(keysAndValues : HashMap) : BasicArrayList {
        return this.getRows(keysAndValues, StringUtil.getInstance().EMPTY_STRING);
    }

    public function getRows(keysAndValues : HashMap, more : String) : BasicArrayList {
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(this.sqlStrings.SELECT_ALL_FROM);
        stringBuffer.append(this.getTableName());
        stringBuffer.append(this.sqlStrings.WHERE);
        try {
            final rows : BasicArrayList = new BasicArrayListD();
            final set : Set = keysAndValues.keySet();
            final keyArray : haxe.ds.Vector<Any> = set.toArray();
            final size : Int = keyArray.length;
            for (index in 0...size) {
                final key : String = (cast keyArray[index] : String);
                final value : String = (cast keysAndValues.get(key) : String);
                stringBuffer.append(key);
                stringBuffer.append(this.sqlStrings.EQUAL_QUOTE);
                stringBuffer.append(this.getValue(value));
                stringBuffer.append(this.sqlStrings.CLOSE_QUOTE);
                if (index < size - 1) {
                    stringBuffer.append(this.sqlStrings.AND);
                }
            }
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                this.logUtil.putF(this.sqlStrings.SQL_STATEMENT_LABEL + stringBuffer, this, this.METHOD_GET_ROWS);
            }
            stringBuffer.append(more);
            final sqlStatement : String = stringBuffer.toString();
            final rset : ResultSet = this.executeSQLStatement(sqlStatement);
            final resultSetMetaData : ResultSetMetaData = rset.getMetaData();
            while (rset.next()) {
                final result : HashMap = this.stdUtil.createHashMap();
                final columnCount : Int = resultSetMetaData.getColumnCount();
                for (index in 1...columnCount + 1) {
                    final columnName : String = resultSetMetaData.getColumnName(index);
                    final field : String = rset.getString(columnName);
                    result.put(columnName, field);
                }
                final resultAsString : String = result.toString();
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                    this.logUtil.putF(this.GET_ROW + resultAsString, this, this.METHOD_GET_ROWS);
                }
                rows.add(result);
            }
            return rows;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGINGERROR)) {
                this.logUtil.put(this.FAILED_SQL_STATEMENT + stringBuffer, this, this.METHOD_GET_ROWS, e);
            }
            return null;
        }
    }

    public function getAllRows() : BasicArrayList {
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(this.sqlStrings.SELECT_ALL_FROM);
        stringBuffer.append(this.getTableName());
        try {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                this.logUtil.putF(this.sqlStrings.SQL_STATEMENT_LABEL + stringBuffer, this, this.METHOD_GET_ALL_ROWS);
            }
            final rows : BasicArrayList = new BasicArrayListD();
            final sqlStatement : String = stringBuffer.toString();
            final rset : ResultSet = this.executeSQLStatement(sqlStatement);
            final resultSetMetaData : ResultSetMetaData = rset.getMetaData();
            while (rset.next()) {
                final result : HashMap = this.stdUtil.createHashMap();
                var columnCount : Int = resultSetMetaData.getColumnCount();
                for (index in 1...columnCount + 1) {
                    final columnName : String = resultSetMetaData.getColumnName(index);
                    final field : String = rset.getString(columnName);
                    result.put(columnName, field);
                }
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                    this.logUtil.putF(this.ROW_VALUES_LABEL + result.toString(), this, this.METHOD_GET_ALL_ROWS);
                }
                rows.add(result);
            }
            return rows;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGINGERROR)) {
                this.logUtil.put(this.FAILED_SQL_STATEMENT + stringBuffer, this, this.METHOD_GET_ALL_ROWS, e);
            }
            return null;
        }
    }

    public function getRowsWhereBetween(whereKeyValuePairs : HashMap, betweenColumn : String, smallest : String, largest : String) : BasicArrayList {
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(this.sqlStrings.SELECT_ALL_FROM);
        stringBuffer.append(this.getTableName());
        try {
            final rows : BasicArrayList = new BasicArrayListD();
            stringBuffer.append(this.sqlStrings.WHERE);
            final set : Set = whereKeyValuePairs.keySet();
            var key : String = null;
            var value : String = null;
            final keyArray : haxe.ds.Vector<Any> = set.toArray();
            final size : Int = keyArray.length;
            for (index in 0...size) {
                key = (cast keyArray[index] : String);
                value = (cast whereKeyValuePairs.get(key) : String);
                stringBuffer.append(key);
                stringBuffer.append(this.sqlStrings.EQUAL_QUOTE);
                stringBuffer.append(this.getValue(value));
                stringBuffer.append(this.sqlStrings.CLOSE_QUOTE);
                stringBuffer.append(this.sqlStrings.AND);
            }
            stringBuffer.append(betweenColumn);
            stringBuffer.append(this.sqlStrings.MORE_THAN_QUOTE);
            stringBuffer.append(smallest);
            stringBuffer.append(this.sqlStrings.CLOSE_QUOTE);
            stringBuffer.append(this.sqlStrings.AND);
            stringBuffer.append(betweenColumn);
            stringBuffer.append(this.sqlStrings.LESS_THAN_QUOTE);
            stringBuffer.append(largest);
            stringBuffer.append(this.sqlStrings.CLOSE_QUOTE);
            final sqlStatement : String = stringBuffer.toString();
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                this.logUtil.putF(this.sqlStrings.SQL_STATEMENT_LABEL + sqlStatement, this, this.METHOD_GET_ROWS_WHERE_BETWEEN);
            }
            final rset : ResultSet = this.executeSQLStatement(sqlStatement);
            final resultSetMetaData : ResultSetMetaData = rset.getMetaData();
            var result : HashMap = null;
            var columnNames : BasicArrayList = null;
            var columnCount : Int = 0;
            var columnName : String = null;
            var field : String = null;
            while (rset.next()) {
                result = this.stdUtil.createHashMap();
                columnNames = new BasicArrayListD();
                columnCount = resultSetMetaData.getColumnCount();
                for (index in 1...columnCount + 1) {
                    columnName = resultSetMetaData.getColumnName(index);
                    field = rset.getString(columnName);
                    result.put(columnName, field);
                }
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                    this.logUtil.putF(this.ROW_VALUE_LABEL + result.toString(), this, this.METHOD_GET_ROWS_WHERE_BETWEEN);
                }
                rows.add(result);
            }
            return rows;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGINGERROR)) {
                this.logUtil.put(this.FAILED_SQL_STATEMENT + stringBuffer, this, METHOD_GET_ROWS_WHERE_BETWEEN, e);
            }
            return null;
        }
    }

    public function getRowsWhereBetween(betweenColumn : String, smallest : String, largest : String) : BasicArrayList {
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(this.sqlStrings.SELECT_ALL_FROM);
        stringBuffer.append(this.getTableName());
        try {
            final rows : BasicArrayList = new BasicArrayListD();
            stringBuffer.append(this.sqlStrings.WHERE);
            stringBuffer.append(betweenColumn);
            stringBuffer.append(this.sqlStrings.MORE_THAN_QUOTE);
            stringBuffer.append(smallest);
            stringBuffer.append(this.sqlStrings.CLOSE_QUOTE);
            stringBuffer.append(this.sqlStrings.AND);
            stringBuffer.append(betweenColumn);
            stringBuffer.append(this.sqlStrings.LESS_THAN_QUOTE);
            stringBuffer.append(largest);
            stringBuffer.append(this.sqlStrings.CLOSE_QUOTE);
            final sqlStatement : String = stringBuffer.toString();
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                this.logUtil.putF(this.sqlStrings.SQL_STATEMENT_LABEL + sqlStatement, this, this.METHOD_GET_ROWS_WHERE_BETWEEN);
            }
            final rset : ResultSet = this.executeSQLStatement(sqlStatement);
            final resultSetMetaData : ResultSetMetaData = rset.getMetaData();
            var columnName : String = null;
            var field : String = null;
            var result : HashMap = null;
            var columnNames : BasicArrayList = null;
            var columnCount : Int = 0;
            while (rset.next()) {
                result = this.stdUtil.createHashMap();
                columnNames = new BasicArrayListD();
                columnCount = resultSetMetaData.getColumnCount();
                for (index in 1...columnCount + 1) {
                    columnName = resultSetMetaData.getColumnName(index);
                    field = rset.getString(columnName);
                    result.put(columnName, field);
                }
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                    this.logUtil.putF(this.ROW_VALUE_LABEL + result.toString(), this, this.METHOD_GET_ROWS_WHERE_BETWEEN);
                }
                rows.add(result);
            }
            return rows;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGINGERROR)) {
                this.logUtil.put(this.FAILED_SQL_STATEMENT + stringBuffer, this, METHOD_GET_ROWS_WHERE_BETWEEN, e);
            }
            return null;
        }
    }

}

