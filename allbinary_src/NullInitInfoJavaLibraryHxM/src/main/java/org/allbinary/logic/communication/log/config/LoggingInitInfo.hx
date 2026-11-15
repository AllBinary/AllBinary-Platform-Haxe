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
package org.allbinary.logic.communication.log.config;

import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class LoggingInitInfo {
    private static var logConfigInfoList : BasicArrayList = null;
    private static var hasRead : Bool = false;
    public function new() {
    }

    // throws Exception
    // synchronized
    public static function write() : Void {
        try {
            LoggingInitInfo.hasRead = false;
        } catch (e : haxe.Exception) {
            throw e;
        }
    }

    // throws Exception
    // synchronized
    private static function read() : Void {
        try {
        } catch (e : haxe.Exception) {
            throw e;
        }
    }

    // synchronized
    public static function setHasRead(value : Bool) : Void {
        LoggingInitInfo.hasRead = value;
    }

    // throws Exception
    // synchronized
    private static function updateIfNeeded() : Void {
        if (!LoggingInitInfo.hasRead) {
            LoggingInitInfo.read();
            LoggingInitInfo.hasRead = true;
            if (LoggingInitInfo.logConfigInfoList == null) {
                throw new jre.lang.JavaException("Read Failed");
            }
        }
    }

    public function isValid() : Bool {
        try {
            return true;
        } catch (e : haxe.Exception) {
            return false;
        }
    }

    // synchronized
    public static function set(logConfigInfoList : BasicArrayList) : Void {
        LoggingInitInfo.logConfigInfoList = logConfigInfoList;
    }

    // throws Exception
    public static function get() : BasicArrayList {
        LoggingInitInfo.updateIfNeeded();
        return LoggingInitInfo.logConfigInfoList;
    }

    // throws Exception
    public static function getTypeList() : BasicArrayList {
        LoggingInitInfo.updateIfNeeded();
        final allLogTypeVector : BasicArrayList = new BasicArrayListD();
        final size : Int = LoggingInitInfo.logConfigInfoList.size();
        for (index in 0...size) {
            final logConfigInfo : LogConfig = (cast LoggingInitInfo.logConfigInfoList.objectArray[index] : LogConfig);
            final logTypeVector : BasicArrayList = logConfigInfo.getTypeVector();
            if (logConfigInfo.isEnabled()) {
                allLogTypeVector.addAllList(logTypeVector);
            }
        }
        return allLogTypeVector;
    }

    // throws Exception
    public function getNumberOfLogConfigs() : Int {
        return LoggingInitInfo.logConfigInfoList.size();
    }

    public function toString() : String {
        try {
            return null;
        } catch (e : haxe.Exception) {
            return "Error";
        }
    }

}

