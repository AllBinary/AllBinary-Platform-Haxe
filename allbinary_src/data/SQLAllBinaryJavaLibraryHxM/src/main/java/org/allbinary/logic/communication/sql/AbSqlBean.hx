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
//import java.util.HashMap;
//import java.util.Set;
import org.allbinary.business.init.db.DbConnectionInfo;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;

class AbSqlBean extends AbSqlRow {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final METHOD_GET_FIELD : String = "getField";
    private final METHOD_IS_SUBSET_OF_ENTRY : String = "isSubsetOfEntry";
    public function new(databaseConnectionInfoInterface : DbConnectionInfo) {
        super(databaseConnectionInfoInterface);
    }

    public function getField(key : String, value : String, requestedField : String) : String {
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(this.sqlStrings.SELECT);
        stringBuffer.append(requestedField);
        stringBuffer.append(this.sqlStrings.FROM);
        stringBuffer.append(this.getTableName());
        stringBuffer.append(this.sqlStrings.WHERE);
        stringBuffer.append(key);
        stringBuffer.append(this.sqlStrings.EQUAL_QUOTE);
        stringBuffer.append(value);
        stringBuffer.append(this.sqlStrings.CLOSE_QUOTE);
        final sqlStatement : String = stringBuffer.toString();
        try {
            var field : String = this.stringUtil.EMPTY_STRING;
            final rset : ResultSet = executeSQLStatement(sqlStatement);
            while (rset.next()) {
                field = rset.getString(requestedField);
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                    stringBuffer.delete(0, stringBuffer.length());
                    stringBuffer.append(this.sqlStrings.SQL_STATEMENT_LABEL);
                    stringBuffer.append(sqlStatement);
                    stringBuffer.append(this.sqlStrings.FIELD_VALUE);
                    stringBuffer.append(field);
                    this.logUtil.putF(stringBuffer.toString(), this, this.METHOD_GET_FIELD);
                }
                return field;
            }
            return null;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGINGERROR)) {
                this.logUtil.put(this.FAILED_SQL_STATEMENT + sqlStatement, this, METHOD_GET_FIELD, e);
            }
            return this.FAILED_SQL_STATEMENT + sqlStatement;
        }
    }

    public function getField(keysAndValues : HashMap, requestedField : String) : String {
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(this.sqlStrings.SELECT);
        stringBuffer.append(requestedField);
        stringBuffer.append(this.sqlStrings.FROM);
        stringBuffer.append(this.getTableName());
        stringBuffer.append(this.sqlStrings.WHERE);
        try {
            var field : String = this.stringUtil.EMPTY_STRING;
            final set : Set = keysAndValues.keySet();
            final keyArray : haxe.ds.Vector<Any> = set.toArray();
            final size : Int = keyArray.length;
            var key : String = null;
            var value : String = null;
            for (i in 0...size) {
                key = (cast keyArray[i] : String);
                value = (cast keysAndValues.get(key) : String);
                stringBuffer.append(key);
                stringBuffer.append(this.sqlStrings.EQUAL_QUOTE);
                stringBuffer.append(value);
                stringBuffer.append(this.sqlStrings.CLOSE_QUOTE);
                if (i < size - 1) {
                    stringBuffer.append(this.sqlStrings.AND);
                }
            }
            final sqlStatement : String = stringBuffer.toString();
            final rset : ResultSet = executeSQLStatement(sqlStatement);
            while (rset.next()) {
                field = rset.getString(requestedField);
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                    stringBuffer.delete(0, stringBuffer.length());
                    stringBuffer.append(this.sqlStrings.SQL_STATEMENT_LABEL);
                    stringBuffer.append(sqlStatement);
                    stringBuffer.append(this.sqlStrings.FIELD_VALUE);
                    stringBuffer.append(field);
                    this.logUtil.putF(stringBuffer.toString(), this, this.METHOD_GET_FIELD);
                }
                return field;
            }
            return null;
        } catch (e : haxe.Exception) {
            final sqlStatement : String = stringBuffer.toString();
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGINGERROR)) {
                this.logUtil.put(this.FAILED_SQL_STATEMENT + sqlStatement, this, METHOD_GET_FIELD, e);
            }
            return this.FAILED_SQL_STATEMENT + sqlStatement;
        }
    }

    public function isSubsetOfEntry(key : String, value : String, columnsAndValues : HashMap) : String {
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(this.sqlStrings.SELECT);
        try {
            final keyArray : haxe.ds.Vector<Any> = columnsAndValues.keySet().toArray();
            final size : Int = keyArray.length;
            stringBuffer.append(this.commonSeps.SPACE);
            stringBuffer.append(key);
            for (i in 0...size) {
                stringBuffer.append(this.commonSeps.SPACE);
                stringBuffer.append(keyArray[i].toString());
            }
            stringBuffer.append(this.sqlStrings.FROM);
            stringBuffer.append(this.getTableName());
            stringBuffer.append(this.sqlStrings.WHERE);
            stringBuffer.append(key);
            stringBuffer.append(this.sqlStrings.EQUAL_QUOTE);
            stringBuffer.append(value);
            stringBuffer.append(this.sqlStrings.CLOSE_QUOTE);
            final sqlStatement : String = stringBuffer.toString();
            final rset : ResultSet = executeSQLStatement(sqlStatement);
            var columnName : String = null;
            var field : String = null;
            while (rset.next()) {
                var keyArray2 : haxe.ds.Vector<Any> = columnsAndValues.keySet().toArray();
                var size2 : Int = keyArray2.length;
                for (i in 0...size2) {
                    columnName = keyArray2[i].toString();
                    field = rset.getObject(columnName).toString();
                    if (Reflect.compare(field, (cast columnsAndValues.get(columnName) : String)) != 0) {
                        return org.allbinary.globals.GLOBALS2.NOTASUBSET;
                    }
                }
            }
            if (rset.getRow() != 1) {
                return org.allbinary.globals.GLOBALS2.NOTASUBSET;
            } else {
                return org.allbinary.globals.GLOBALS2.ISASUBSET;
            }
        } catch (e : haxe.Exception) {
            final sqlStatement : String = stringBuffer.toString();
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGINGERROR)) {
                this.logUtil.put(this.FAILED_SQL_STATEMENT + sqlStatement, this, METHOD_IS_SUBSET_OF_ENTRY, e);
            }
            return this.FAILED_SQL_STATEMENT + sqlStatement;
        }
    }

}

