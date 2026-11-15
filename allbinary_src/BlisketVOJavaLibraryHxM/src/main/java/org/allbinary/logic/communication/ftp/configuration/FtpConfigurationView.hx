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
package org.allbinary.logic.communication.ftp.configuration;

//import java.util.HashMap;
import org.allbinary.data.tree.dom.DomNodeHelper;
import org.allbinary.data.tree.dom.DomNodeInterface;
import org.allbinary.data.tree.dom.ModDomHelper;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

class FtpConfigurationView implements DomNodeInterface {
    private var ftpConfigurationInterface : FtpConfigurationInterface = null;
    public function new(node : Node) {
        this.setFtpConfigurationInterface((cast new FtpConfiguration() : FtpConfigurationInterface));
        var chileNodeList : NodeList = node.getChildNodes();
        var server : String = DomNodeHelper.getTextNodeValue(FtpConfigurationData.SERVER, chileNodeList);
        this.getFtpConfigurationInterface().setServer(server);
        var userName : String = DomNodeHelper.getTextNodeValue(FtpConfigurationData.USERNAME, chileNodeList);
        this.getFtpConfigurationInterface().setUserName(userName);
        var password : String = DomNodeHelper.getTextNodeValue(FtpConfigurationData.PASSWORD, chileNodeList);
        this.getFtpConfigurationInterface().setPassword(password);
        var path : String = DomNodeHelper.getTextNodeValue(FtpConfigurationData.PATH, chileNodeList);
        this.getFtpConfigurationInterface().setPath(path);
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(ftpConfigurationInterface : FtpConfigurationInterface) {
        this.setFtpConfigurationInterface(ftpConfigurationInterface);
    }

    // throws Exception
    public function toXmlNode(document : Document) : Node {
        var ftpConfigurationMapping : FtpConfigurationMapping = new FtpConfigurationMapping(this.getFtpConfigurationInterface());
        var hashMap : HashMap = ftpConfigurationMapping.toHashMap();
        var node : Node = ModDomHelper.createNameValueNodes(document, FtpConfigurationData.NAME, hashMap);
        return node;
    }

    public function getFtpConfigurationInterface() : FtpConfigurationInterface {
        return this.ftpConfigurationInterface;
    }

    public function setFtpConfigurationInterface(ftpConfigurationInterface : FtpConfigurationInterface) : Void {
        this.ftpConfigurationInterface = ftpConfigurationInterface;
    }

}

