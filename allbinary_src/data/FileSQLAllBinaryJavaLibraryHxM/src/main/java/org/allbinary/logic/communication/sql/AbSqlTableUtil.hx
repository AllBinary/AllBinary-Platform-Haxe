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

import org.allbinary.logic.string.StringMaker;
//import java.sql.ResultSet;
//import java.sql.ResultSetMetaData;
//import java.util.Calendar;
import org.allbinary.business.installer.Portion;
import org.allbinary.logic.io.AbFileOutputStream;
import org.allbinary.logic.io.BufferedLineReader;
import org.allbinary.logic.io.StreamUtil;
import org.allbinary.logic.io.file.AbFile;
import org.allbinary.logic.io.file.FileUtil;
import org.allbinary.logic.io.file.directory.Directory;
import org.allbinary.logic.io.path.AbPath;
import org.allbinary.logic.io.path.AbPathData;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.globals.PATH_GLOBALS;
//import java.io.OutputStream;
import org.allbinary.string.CommonSeps;
import org.allbinary.string.CommonStrings;
import org.allbinary.logic.string.StringUtil;

class AbSqlTableUtil {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : AbSqlTableUtil = new AbSqlTableUtil();
    public static function getInstance() : AbSqlTableUtil {
        return AbSqlTableUtil.instance;
    }

    private var EXTENSION : String = ".adb";
    private final END : String = "')\n";
    private final SAVING_BACKUP_PATH : String = "Saving Backup: Path: ";
    private final FILE_LABEL : String = " File: ";
    private final METHOD_RESTORE_TABLE : String = "restoreTable()";
    private final METHOD_BACKUP_TABLE : String = "backupTable()";
    private final METHOD_BACKUP_FILE : String = "backupFile()";
    private final METHOD_GET_OUTPUT_STREAM : String = "getOutputStream()";
    private final TABLE_CREATION_SUCCESS : String = "Table Creation Successful: ";
    private final DROPPED_SUCCESS : String = " Dropped Successfully";
    private final SAVING : String = "Saving: ";
    private final APPENDING : String = "Appending: ";
    private final TABLE_LABEL : String = "Table: ";
    private final BACKUP_SUCCESS : String = " Backup Success";
    private final ERROR_CREATING : String = "Error Creating: ";
    private final TOTAL_LABEL : String = " Total: ";
    private final SECTION_LABEL : String = " Section: ";
    private final DASH : String = " - ";
    private final PORTION_RESTORED : String = " Portion Restored";
    private final specialCharArray : haxe.ds.Vector<Int> = haxe.ds.Vector.fromArrayCopy(["\n".code, "\f".code, "\r".code]);
    private final NEW_LINE : String = "\\n";
    public final stringUtil : StringUtil = StringUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    public final commonSeps : CommonSeps = CommonSeps.getInstance();
    public final sqlStrings : SqlStrings = SqlStrings.getInstance();
    // synchronized
    private function getOutputStream(backupPath : String, tableName : String) : OutputStream {
        try {
            var fileName : String = tableName + this.EXTENSION;
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                this.logUtil.putF(this.SAVING + tableName, this, this.METHOD_GET_OUTPUT_STREAM);
            }
            var backupFilePath : AbPath = new AbPath(backupPath, fileName);
            var backupFile : AbFile = AbFile.createAbFile(backupFilePath);
            if (backupFile.exists()) {
                this.backupFile(backupFilePath, backupPath, tableName);
                backupFile.delete();
            }
            backupFile.createNewFile();
            var outputStream : OutputStream = new AbFileOutputStream(backupFile);
            return outputStream;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGINGERROR)) {
                this.logUtil.put("Create File", this, this.METHOD_GET_OUTPUT_STREAM, e);
            }
            return null;
        }
    }

    // synchronized
    private function backupFile(path : AbPath, backupPath : String, tableName : String) : Bool {
        try {
            var calendar : Calendar = Calendar.getInstance();
            var timeLong : Null<haxe.Int64> = calendar.getTimeInMillis();
            var time : String = timeLong.toString();
            final stringBuffer : StringMaker = new StringMaker();
            var fileName : String = tableName + this.EXTENSION;
            stringBuffer.append(backupPath);
            stringBuffer.append(AbPathData.getInstance().SEPARATOR);
            stringBuffer.append(time);
            var backupAbPath : AbPath = new AbPath(stringBuffer.toString());
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                stringBuffer.delete(0, stringBuffer.length());
                stringBuffer.append(this.SAVING_BACKUP_PATH);
                stringBuffer.append(backupAbPath.toFileSystemString());
                stringBuffer.append(this.FILE_LABEL);
                stringBuffer.append(fileName);
                this.logUtil.putF(stringBuffer.toString(), this, this.METHOD_BACKUP_FILE);
            }
            Directory.create(backupAbPath);
            var backupFileBak : AbFile = AbFile.createAbFile(backupAbPath.toFileSystemString());
            backupFileBak.createNewFile();
            FileUtil.getInstance().copy(path, backupAbPath);
            return true;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGINGERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, this.METHOD_BACKUP_FILE, e);
            }
            return false;
        }
    }

    private function convertNewLines(value : String) : String {
        var stringBuffer : StringMaker = new StringMaker();
        var index : Int = 0;
        var lastIndex : Int = 0;
        while (index < value.length) {
            index = value.indexOf(specialCharArray[0], lastIndex);
            if (index != -1) {
                var nextLine : String = value.substring(lastIndex, index - 1);
                stringBuffer.append(nextLine);
                stringBuffer.append(this.NEW_LINE);
                lastIndex = index + 1;
            } else {
                break;
            }
        }
        if (lastIndex < value.length) {
            stringBuffer.append(value.substring(lastIndex, value.length));
        }
        return stringBuffer.toString();
    }

    // synchronized
    public function backupTable(abSqlTable : AbSqlTable) : String {
        final tableName : String = abSqlTable.getTableName();
        try {
            var count : Int = 0;
            var sqlStatement : String = this.sqlStrings.SELECT_ALL_FROM + tableName;
            var path : String = org.allbinary.globals.URLGLOBALS.getMainPath() + PATH_GLOBALS.getInstance().BACKUP_PATH;
            if (!Directory.create(new AbPath(path))) {
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                    this.logUtil.putF(ERROR_CREATING + path, this, this.METHOD_BACKUP_TABLE);
                }
            }
            var rset : ResultSet = abSqlTable.executeSQLStatement(sqlStatement);
            var rsmd : ResultSetMetaData = rset.getMetaData();
            var colNum : Int = rsmd.getColumnCount();
            final QUERY_START : String = new StringBuf().append(this.sqlStrings.INSERT_INTO).append(tableName).append(this.sqlStrings.VALUES).toString();
            var stringBuffer : StringMaker = new StringMaker();
            var outputStream : OutputStream = this.getOutputStream(path, tableName);
            while (rset.next()) {
                stringBuffer.delete(0, stringBuffer.length());
                stringBuffer.append(QUERY_START);
                for (i in 1...colNum) {
                    var value : String = rset.getString(i);
                    stringBuffer.append(this.convertNewLines(value));
                    stringBuffer.append(this.sqlStrings.SINGLE_QUOTE_COMMA_SEP);
                }
                stringBuffer.append(rset.getString(colNum));
                stringBuffer.append(this.END);
                var sqlStatementLine : String = stringBuffer.toString();
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                    this.logUtil.putF(this.APPENDING + sqlStatementLine, this, this.METHOD_BACKUP_TABLE);
                }
                outputStream.write(haxe.io.Bytes.ofString(sqlStatementLine));
            }
            StreamUtil.getInstance().close(outputStream);
            return this.TABLE_LABEL + tableName + this.BACKUP_SUCCESS;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGINGERROR)) {
                this.logUtil.put("Backup Table Failed\nSQL Statement", this, this.METHOD_BACKUP_TABLE, e);
            }
            return this.TABLE_LABEL + tableName + " Backup Failed";
        }
    }

    // synchronized
    public function restoreTable(abSqlTable : AbSqlTable, portion : Portion) : String {
        final tableName : String = abSqlTable.getTableName();
        try {
            var path : String = org.allbinary.globals.URLGLOBALS.getMainPath() + PATH_GLOBALS.getInstance().BACKUP_PATH;
            var current : Int = Std.int(portion.getCurrent());
            if (current == 0) {
                if (Directory.create(new AbPath(path))) {
                    if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                        this.logUtil.putF(this.ERROR_CREATING + path, this, this.METHOD_RESTORE_TABLE);
                    }
                }
            }
            var backupFile : AbFile = AbFile.createAbFile(path, tableName + this.EXTENSION);
            var bufferedLineReader : BufferedLineReader = new BufferedLineReader(backupFile);
            var size : haxe.Int64 = bufferedLineReader.getSize();
            var section : haxe.Int64 = size / Std.int(portion.getTotal()) + 1;
            var start : haxe.Int64 = section * haxe.Int64.ofInt(current);
            var end : haxe.Int64 = start + section;
            if (end > size) {
                end = size;
            }
            final stringBuffer : StringMaker = new StringMaker();
            stringBuffer.append(this.TOTAL_LABEL);
            stringBuffer.append(size);
            stringBuffer.append(this.SECTION_LABEL);
            stringBuffer.append(start);
            stringBuffer.append(this.DASH);
            stringBuffer.append(end);
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                this.logUtil.putF(stringBuffer.toString(), this, this.METHOD_RESTORE_TABLE);
            }
            bufferedLineReader.readUpToLines(start);
            var line : String = this.stringUtil.EMPTY_STRING;
            while (bufferedLineReader.getCurrent() < end && ((line = bufferedLineReader.readLine())) != null) {
                if (line.length > 1) {
                    abSqlTable.executeSQLStatement(line);
                }
            }
            stringBuffer.append(this.commonSeps.SPACE);
            stringBuffer.append(this.TABLE_LABEL);
            stringBuffer.append(tableName);
            stringBuffer.append(this.PORTION_RESTORED);
            return stringBuffer.toString();
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGINGERROR)) {
                this.logUtil.put("Restore Table Failed\nSQL Statement", this, this.METHOD_RESTORE_TABLE, e);
            }
            var stringBuffer : StringMaker = new StringMaker();
            stringBuffer.append(this.TABLE_LABEL);
            stringBuffer.append(tableName);
            stringBuffer.append(" Restoration Failed");
            return stringBuffer.toString();
        }
    }

    public function new() {
    }
}

