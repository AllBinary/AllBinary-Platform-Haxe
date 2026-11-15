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
package org.allbinary.logic.communication.log.config.type;

import org.allbinary.data.tree.dom.DomNodeHelper;
import org.allbinary.data.tree.dom.DomSearchHelper;
import org.allbinary.logic.communication.log.PreLogUtil;
import org.allbinary.logic.communication.log.config.LoggingInitInfo;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.w3c.dom.Node;

class LogConfigTypes {
    public static final JSP_ERROR_NO_FUNCTION : String = "in JSP Not In Function";
    public static var LOGGING : BasicArrayList = new BasicArrayListD();
    static function __init__() {
        LogConfigTypes.init();
    }
    public function new() {
    }

    // synchronized
    public static function init() : Void {
        try {
            PreLogUtil.put("Initialize LogconfigTypes", "LogConfigTypes", "init()");
            LogConfigTypeFactory.getInstance();
            final loggingInitInfo : LoggingInitInfo = new LoggingInitInfo();
            final logConfigTypeVector : BasicArrayList = loggingInitInfo.getTypeList();
            PreLogUtil.put("Number Of Log Configs: " + loggingInitInfo.getNumberOfLogConfigs(), "LogConfigTypes", "init()");
            PreLogUtil.put("Number Of Log Config Type Names: " + logConfigTypeVector.size(), "LogConfigTypes", "init()");
            LogConfigTypes.LOGGING.addAllList(logConfigTypeVector);
            LogConfigTypes.LOGGING.add(LogConfigTypeFactory.getInstance().NETBEANS_MODULE);
        } catch (e : haxe.Exception) {
            PreLogUtil.putSE("Unable to initialize LogConfigTypes", "LogConfigTypes", "init()", e);
        }
    }

    // throws Exception
    public static function getInstance(node : Node) : LogConfigType {
        final nameValueNode : Node = DomSearchHelper.getNode(LogConfigTypeData.getInstance().NAME, node.getChildNodes());
        final name : String = DomNodeHelper.getTextNodeValue(nameValueNode);
        final descriptionValueNode : Node = DomSearchHelper.getNodeNoThrow(LogConfigTypeData.getInstance().DESCRIPTION, node.getChildNodes());
        if (descriptionValueNode != null) {
            final description : String = DomNodeHelper.getTextNodeValue(descriptionValueNode);
        }
        final availableLogConfigTypes : BasicArrayList = LogConfigType.availableLogConfigTypes;
        final size : Int = availableLogConfigTypes.size();
        var logConfigType : LogConfigType = null;
        for (index in 0...size) {
            logConfigType = (cast availableLogConfigTypes.get(index) : LogConfigType);
            if (logConfigType.getName().compareTo(name) == 0) {
                return logConfigType;
            }
        }
        throw new jre.lang.JavaException("No Such LogConfigType: " + name);
    }

}

