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

import org.allbinary.business.entry.EntryData;
import org.allbinary.data.tree.dom.DomNodeHelper;
import org.allbinary.data.tree.dom.DomSearchHelper;
import org.allbinary.data.tree.dom.document.DomDocumentHelper;
import org.allbinary.globals.PATH_GLOBALS;
import org.allbinary.globals.URLGLOBALS;
import org.allbinary.logic.communication.log.config.type.LogConfigType;
import org.allbinary.logic.communication.log.config.type.LogConfigTypeData;
import org.allbinary.logic.communication.log.config.type.LogConfigTypes;
import org.allbinary.logic.communication.log.config.type.LogConfigTypesData;
import org.allbinary.logic.io.AbFileLocalInputStream;
import org.allbinary.logic.io.file.AbFile;
import org.allbinary.logic.java.bool.BooleanUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

class LogConfig {
    private var isEnabled : Bool;
    private var name : String;
    private var description : String;
    private var path : String;
    private var fileName : String;
    public function new(...args : Dynamic) {
        if (args.length == 4) {
            final aName : String = args[0];
            final aDescription : String = args[1];
            final aPath : String = args[2];
            final aFileName : String = args[3];
            this._newLogConfig0(aName, aDescription, aPath, aFileName);
        }
        else if (args.length == 1) {
            final node : Node = args[0];
            this._newLogConfig1(node);
        }
    }

    private function _newLogConfig0(aName : String, aDescription : String, aPath : String, aFileName : String) : Void {
        this.isEnabled = false;
        this.name = aName;
        this.description = aDescription;
        this.path = aPath;
        this.fileName = aFileName;
    }

    private function _newLogConfig1(node : Node) : Void {
        var enabledValueNode : Node = DomSearchHelper.getNode(EntryData.getInstance().ENABLE, node.getChildNodes());
        var isEnabledString : String = DomNodeHelper.getTextNodeValue(enabledValueNode);
        this.isEnabled = BooleanUtil.getInstance().getFromString(isEnabledString);
        var logConfigData : LogConfigData = LogConfigData.getInstance();
        var nameValueNode : Node = DomSearchHelper.getNode(logConfigData.NAME, node.getChildNodes());
        this.name = DomNodeHelper.getTextNodeValue(nameValueNode);
        var descriptionValueNode : Node = DomSearchHelper.getNode(logConfigData.DESCRIPTION, node.getChildNodes());
        this.description = DomNodeHelper.getTextNodeValue(descriptionValueNode);
        var fileValueNode : Node = DomSearchHelper.getNode(logConfigData.FILE, node.getChildNodes());
        this.fileName = DomNodeHelper.getTextNodeValue(fileValueNode);
    }

    public function getName() : String {
        return this.name;
    }

    public function isEnabled() : Bool {
        return this.isEnabled;
    }

    public function enable() : Void {
        this.isEnabled = true;
    }

    public function disable() : Void {
        this.isEnabled = false;
    }

    public function getDescription() : String {
        return this.description;
    }

    public function getFileName() : String {
        return this.fileName;
    }

    public function setName(value : String) : Void {
        this.name = value;
    }

    public function setDescription(value : String) : Void {
        this.description = value;
    }

    public function setPath(value : String) : Void {
        this.path = value;
    }

    public function setFileName(value : String) : Void {
        this.fileName = value;
    }

    // throws Exception
    private function getDoc() : Document {
        var stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(URLGLOBALS.getWebappPath());
        stringBuffer.append(PATH_GLOBALS.getInstanceFor().INIT_PATH);
        stringBuffer.append(this.getFileName());
        var file : AbFile = AbFile.createAbFile(Std.string(stringBuffer));
        var document : Document = DomDocumentHelper.create(new AbFileLocalInputStream(file));
        return document;
    }

    // throws Exception
    public function getTypeVector() : BasicArrayList {
        var logKeyVector : BasicArrayList = new BasicArrayListD();
        var document : Document = this.getDoc();
        var logConfigTypesNodeList : NodeList = document.getElementsByTagName(LogConfigTypesData.getInstance().NAME);
        var logConfigTypesNode : Node = logConfigTypesNodeList.item(0);
        var logConfigTypeNodeVector : BasicArrayList = DomSearchHelper.getAllNodes(LogConfigTypeData.getInstance().NAME, logConfigTypesNode.getChildNodes());
        final size : Int = logConfigTypeNodeVector.size();
        for (i in 0...size) {
            var node : Node = (cast logConfigTypeNodeVector.get(i) : Node);
            var logType : LogConfigType = LogConfigTypes.getInstance(node);
            logKeyVector.add(logType);
        }
        return logKeyVector;
    }

}

