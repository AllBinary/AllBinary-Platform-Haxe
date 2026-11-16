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

import org.allbinary.data.tree.dom.DomSearchHelper;
import org.allbinary.data.tree.dom.document.DomDocumentHelper;
import org.allbinary.data.tree.dom.document.XmlDocumentHelper;
import org.allbinary.globals.PATH_GLOBALS;
import org.allbinary.globals.URLGLOBALS;
import org.allbinary.logic.io.AbFileLocalInputStream;
import org.allbinary.logic.io.file.AbFile;
import org.allbinary.logic.io.path.AbPath;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

class LoggingInitInfo {
    private static final INITFILENAME : String = "logConfig.xml";
    private static final PACKAGE : String = PATH_GLOBALS.getInstance().INIT_PATH;
    private static var logConfigInfoList : BasicArrayList = null;
    private static var hasRead : Bool = false;
    public function new() {
    }

    // throws Exception
    // synchronized
    public static function getDoc() : Document {
        final path : String = URLGLOBALS.getWebappPath() + LoggingInitInfo.PACKAGE;
        final FILEABPATH : AbPath = new AbPath(path, INITFILENAME);
        final file : AbFile = AbFile.createAbFileFromAbPath(FILEABPATH);
        final document : Document = DomDocumentHelper.create(new AbFileLocalInputStream(file));
        return document;
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
            final document : Document = LoggingInitInfo.getDoc();
            final logConfigsNodeList : NodeList = document.getElementsByTagName(LogConfigsData.getInstance().NAME);
            final logConfigsNode : Node = logConfigsNodeList.item(0);
            final logConfigNodeVector : BasicArrayList = DomSearchHelper.getAllNodes(LogConfigData.getInstance().NAME, logConfigsNode.getChildNodes());
            LoggingInitInfo.logConfigInfoList = new BasicArrayListD();
            final size : Int = logConfigNodeVector.size();
            for (i in 0...size) {
                final node : Node = (cast logConfigNodeVector.get(i) : Node);
                var logConfigInfo : LogConfig = new LogConfig(node);
                LoggingInitInfo.logConfigInfoList.add(logConfigInfo);
            }
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
    public static function set(logConfigInfoVector : BasicArrayList) : Void {
        LoggingInitInfo.logConfigInfoList = logConfigInfoVector;
    }

    // throws Exception
    public static function get() : BasicArrayList {
        LoggingInitInfo.updateIfNeeded();
        return LoggingInitInfo.logConfigInfoList;
    }

    // throws Exception
    public static function getTypeNameList() : BasicArrayList {
        LoggingInitInfo.updateIfNeeded();
        var allLogTypeVector : BasicArrayList = new BasicArrayListD();
        final size : Int = LoggingInitInfo.logConfigInfoList.size();
        for (index in 0...size) {
            final logConfigInfo : LogConfig = (cast LoggingInitInfo.logConfigInfoList.objectArray[index] : LogConfig);
            var logTypeVector : BasicArrayList = logConfigInfo.getTypeVector();
            if (logConfigInfo.isEnabled()) {
                allLogTypeVector.addAllList(logTypeVector);
            }
        }
        return allLogTypeVector;
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
            final document : Document = LoggingInitInfo.getDoc();
            return XmlDocumentHelper.toString(document);
        } catch (e : haxe.Exception) {
            return "Error";
        }
    }

}

