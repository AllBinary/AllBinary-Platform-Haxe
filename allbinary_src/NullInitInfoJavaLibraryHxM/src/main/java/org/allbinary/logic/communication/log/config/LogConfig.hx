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
import org.allbinary.logic.java.bool.BooleanUtil;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.w3c.dom.Node;

class LogConfig {
    private var isEnabled : Bool;
    private var name : String;
    private var description : String;
    private var path : String;
    private var fileName : String;
    public function new(aName : String, aDescription : String, aPath : String, aFileName : String) {
        this.isEnabled = false;
        this.name = aName;
        this.description = aDescription;
        this.path = aPath;
        this.fileName = aFileName;
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(node : Node) {
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
    public function getTypeVector() : BasicArrayList {
        var logKeyVector : BasicArrayList = new BasicArrayListD();
        return logKeyVector;
    }

}

