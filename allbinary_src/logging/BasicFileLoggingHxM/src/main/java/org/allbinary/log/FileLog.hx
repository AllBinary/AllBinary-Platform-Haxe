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
package org.allbinary.log;

//import java.io.BufferedReader;
//import java.io.BufferedWriter;
//import java.io.File;
//import java.io.FileReader;
//import java.io.FileWriter;
//import java.io.RandomAccessFile;
import org.allbinary.string.CommonSeps;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.communication.log.LogFormatUtil;
import org.allbinary.logic.string.StringMaker;

class FileLog {
    private static final stringUtil : StringUtil = StringUtil.getInstance();
    private static final logLength : haxe.Int64 = 33000000;
    private static final logPath : String = "g:\\log\\";
    private static final extension : String = "dat";
    private static final fileName : String = "log." + FileLog.extension;
    private static final backupFileName : String = FileLog.fileName.concat(".bak");
    private static final ORG_ALLBINARY : String = "org.allbinary: ";
    private static var firstTime : Bool = true;
    private static var logFile : File = new File(FileLog.logPath, FileLog.fileName);
    private static var logFileBak : File = null;
    private static var fileOut : BufferedWriter = null;
    private static var backupIndex : Int = 0;
    public function new() {
    }

    // synchronized
    public static function createLogFile() : Bool {
        try {
            FileLog.logFile = new File(logPath, fileName);
            if (!FileLog.firstTime) {
                FileLog.fileOut = new BufferedWriter(new FileWriter(logFile));
            } else {
                FileLog.firstTime = false;
                var raFile : RandomAccessFile = new RandomAccessFile(logFile, "rw");
                raFile.seek(raFile.length());
                FileLog.fileOut = new BufferedWriter(new FileWriter(raFile.getFD()));
            }
            var canWrite : Bool = FileLog.logFile.canWrite();
            return canWrite;
        } catch (e : haxe.Exception) {
            trace("Error Creating Log: " + e);
            return false;
        }
    }

    // synchronized
    private static function createLogFileBackup() : Bool {
        try {
            final stringMaker : StringMaker = new StringMaker();
            FileLog.logFileBak = new File(logPath, stringMaker.append(backupFileName).append(CommonSeps.getInstance().PERIOD).appendint(backupIndex).toString());
            while (FileLog.logFileBak.isFile()) {
                FileLog.backupIndex++;
                stringMaker.delete(0, stringMaker.length());
                FileLog.logFileBak = new File(logPath, stringMaker.append(backupFileName).append(CommonSeps.getInstance().PERIOD).appendint(backupIndex).toString());
            }
            var line : String = "";
            var tmpOut : BufferedWriter = new BufferedWriter(new FileWriter(logFileBak));
            var tmpIn : BufferedReader = new BufferedReader(new FileReader(logFile));
            while (((line = tmpIn.readLine())) != null) {
                tmpOut.write(line, 0, line.length);
                tmpOut.newLine();
            }
            tmpOut.flush();
            tmpOut.close();
            tmpIn.close();
            FileLog.logFile.delete();
            return true;
        } catch (e : haxe.Exception) {
            trace("Error Creating Backup: " + e);
            return false;
        }
    }

    // synchronized
    public static function put(specialMessage : String, anyType : Any, functionName : String) : String {
        return FileLog.put(specialMessage, anyType, functionName, null);
    }

    // synchronized
    public static function put(specialMessage : String, anyType : Any, functionName : String, exception : haxe.Exception) : String {
        try {
            if (FileLog.firstTime == true) {
                FileLog.createLogFileBackup();
                if (createLogFile() == false) {
                    return "Log File Creation Error";
                }
            }
            var length : haxe.Int64 = haxe.Int64.ofInt(FileLog.logFile.length());
            if (length > FileLog.logLength) {
                if (!(createLogFileBackup()) || createLogFile() == false) {
                    return "Couldn't Create a Backup file";
                }
            }
            var className : String = stringUtil.NULL_STRING;
            if (functionName == null) {
                functionName = FileLog.stringUtil.NULL_STRING;
            }
            if (specialMessage == null) {
                specialMessage = FileLog.stringUtil.NULL_STRING;
            }
            if (Type.getClassName(Type.getClass(anyType)) != null) {
                className = Type.getClassName(Type.getClass(anyType));
            }
            final message : String = LogFormatUtil.getInstance().get(className, functionName, specialMessage, exception);
            FileLog.fileOut.write(message, 0, message.length);
            FileLog.fileOut.newLine();
            FileLog.fileOut.flush();
            return FileLog.ORG_ALLBINARY + message;
        } catch (e : haxe.Exception) {
            return "Error: " + e;
        }
    }

    // synchronized
    public static function put(specialMessage : String, className : String, functionName : String) : String {
        return FileLog.put(specialMessage, className, functionName, null);
    }

    // synchronized
    public static function put(specialMessage : String, className : String, functionName : String, exception : haxe.Exception) : String {
        try {
            if (FileLog.firstTime == true) {
                FileLog.createLogFileBackup();
                if (createLogFile() == false) {
                    return "Log File Creation Error";
                }
            }
            var length : haxe.Int64 = haxe.Int64.ofInt(FileLog.logFile.length());
            if (length > FileLog.logLength) {
                if (!(createLogFileBackup()) || createLogFile() == false) {
                    return "Couldn't Create a Backup file";
                }
            }
            if (functionName == null) {
                functionName = FileLog.stringUtil.NULL_STRING;
            }
            if (specialMessage == null) {
                specialMessage = FileLog.stringUtil.NULL_STRING;
            }
            final message : String = LogFormatUtil.getInstance().get(className, functionName, specialMessage, exception);
            FileLog.fileOut.write(message, 0, message.length);
            FileLog.fileOut.newLine();
            FileLog.fileOut.flush();
            return FileLog.ORG_ALLBINARY + message;
        } catch (e : haxe.Exception) {
            return "Error: " + e;
        }
    }

    public static function getFilePath() : String {
        return FileLog.logPath + FileLog.fileName;
    }

}

