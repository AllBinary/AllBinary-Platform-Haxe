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
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.business.init.db.DbConnectionInfo;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;

class AbSqlColumn extends AbSqlTable {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final LARGEST_INT_VALUE_IN_COLUMN : String = "\nLargest Int Value in column: ";
    private final METHOD_GET_LARGETS_INTEGER_IN_COLUMN : String = "getLargestIntegerInColumn";
    private final METHOD_GET_COLUMN : String = "getColumn";
    private final METHOD_GET_COLUMN_WHERE : String = "getColumnWhere";
    private final INVALID_RESULT : String = "-1";
    public function new(databaseConnectionInfoInterface : DbConnectionInfo) {
        super(databaseConnectionInfoInterface);
    }

    public function getLargestIntegerInColumnWhere(columnName : String, key : String, value : String) : String {
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(this.sqlStrings.SELECT);
        stringBuffer.append(columnName);
        stringBuffer.append(this.sqlStrings.FROM);
        stringBuffer.append(this.getTableName());
        stringBuffer.append(this.sqlStrings.WHERE);
        stringBuffer.append(key);
        stringBuffer.append(this.sqlStrings.EQUAL_QUOTE);
        stringBuffer.append(value);
        stringBuffer.append(this.sqlStrings.CLOSE_QUOTE);
        final sqlStatement : String = stringBuffer.toString();
        try {
            var largest : Int = 0;
            final rset : ResultSet = executeSQLStatement(sqlStatement);
            while (rset.next()) {
                var intValue : Int = rset.getInt(columnName);
                if (intValue > largest) {
                    largest = intValue;
                }
            }
            var largestAsString : String = largest.toString();
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                stringBuffer.delete(0, stringBuffer.length());
                stringBuffer.append(this.sqlStrings.SQL_STATEMENT_LABEL);
                stringBuffer.append(sqlStatement);
                stringBuffer.append(this.LARGEST_INT_VALUE_IN_COLUMN);
                stringBuffer.append(largestAsString);
                this.logUtil.putF(stringBuffer.toString(), this, this.METHOD_GET_LARGETS_INTEGER_IN_COLUMN);
            }
            return largestAsString;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGINGERROR)) {
                this.logUtil.put(this.FAILED_SQL_STATEMENT + sqlStatement, this, METHOD_GET_LARGETS_INTEGER_IN_COLUMN, e);
            }
            return this.INVALID_RESULT;
        }
    }

    public function getColumn(columnName : String) : BasicArrayList {
        final column : BasicArrayList = new BasicArrayListD();
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(this.sqlStrings.SELECT);
        stringBuffer.append(columnName);
        stringBuffer.append(this.sqlStrings.FROM);
        stringBuffer.append(this.getTableName());
        final sqlStatement : String = stringBuffer.toString();
        try {
            final rset : ResultSet = executeSQLStatement(sqlStatement);
            while (rset.next()) {
                var field : String = rset.getObject(columnName).toString();
                column.add(field);
            }
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                stringBuffer.delete(0, stringBuffer.length());
                stringBuffer.append(this.sqlStrings.SQL_STATEMENT_LABEL);
                stringBuffer.append(sqlStatement);
                stringBuffer.append(this.sqlStrings.COLUMN_VALUE);
                stringBuffer.append(column.toString());
                this.logUtil.putF(stringBuffer.toString(), this, this.METHOD_GET_COLUMN);
            }
            return column;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGINGERROR)) {
                this.logUtil.put(this.FAILED_SQL_STATEMENT + sqlStatement, this, METHOD_GET_COLUMN, e);
            }
            return column;
        }
    }

    public function getColumnWhere(columnName : String, key : String, value : String) : BasicArrayList {
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(this.sqlStrings.SELECT);
        stringBuffer.append(columnName);
        stringBuffer.append(this.sqlStrings.FROM);
        stringBuffer.append(this.getTableName());
        stringBuffer.append(this.sqlStrings.WHERE);
        stringBuffer.append(key);
        stringBuffer.append(this.sqlStrings.EQUAL_QUOTE);
        stringBuffer.append(value);
        stringBuffer.append(this.sqlStrings.CLOSE_QUOTE);
        final sqlStatement : String = stringBuffer.toString();
        var column : BasicArrayList = new BasicArrayListD();
        var rset : ResultSet = null;
        var field : String = null;
        try {
            rset = executeSQLStatement(sqlStatement);
            while (rset.next()) {
                field = rset.getObject(columnName).toString();
                column.add(field);
            }
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                stringBuffer.delete(0, stringBuffer.length());
                stringBuffer.append(this.sqlStrings.SQL_STATEMENT_LABEL);
                stringBuffer.append(sqlStatement);
                stringBuffer.append(this.sqlStrings.COLUMN_VALUE);
                stringBuffer.append(column.toString());
                this.logUtil.putF(stringBuffer.toString(), this, this.METHOD_GET_COLUMN_WHERE);
            }
            return column;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGINGERROR)) {
                this.logUtil.put(this.FAILED_SQL_STATEMENT + sqlStatement, this, this.METHOD_GET_COLUMN_WHERE, e);
            }
            return column;
        }
    }

}

