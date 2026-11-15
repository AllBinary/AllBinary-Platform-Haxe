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
package org.allbinary.logic.communication.smtp.configuration.server;

//import java.util.HashMap;
import org.allbinary.data.tree.dom.DomNodeHelper;
import org.allbinary.data.tree.dom.DomNodeInterface;
import org.allbinary.data.tree.dom.ModDomHelper;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

class EmailServerConfigurationView implements DomNodeInterface {
    private var emailServerConfigurationInterface : EmailServerConfigurationInterface;
    public function new(node : Node) {
        var childNodeList : NodeList = node.getChildNodes();
        var server : String = DomNodeHelper.getTextNodeValue(EmailServerConfigurationData.SERVER, childNodeList);
        var accountName : String = DomNodeHelper.getTextNodeValue(EmailServerConfigurationData.ACCOUNT, childNodeList);
        var password : String = DomNodeHelper.getTextNodeValue(EmailServerConfigurationData.PASSWORD, childNodeList);
        this.emailServerConfigurationInterface = (cast new EmailServerConfiguration(accountName, password, server) : EmailServerConfigurationInterface);
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(emailServerConfigurationInterface : EmailServerConfigurationInterface) {
        this.emailServerConfigurationInterface = emailServerConfigurationInterface;
    }

    public function getEmailConfigurationInterface() : EmailServerConfigurationInterface {
        return this.emailServerConfigurationInterface;
    }

    // throws Exception
    public function toXmlNode(document : Document) : Node {
        var emailConfigurationMapping : EmailServerConfigurationMapping = new EmailServerConfigurationMapping(this.emailServerConfigurationInterface);
        var hashMap : HashMap = emailConfigurationMapping.toHashMap();
        var node : Node = ModDomHelper.createNodeWithValueNodes(document, EmailServerConfigurationData.NAME, hashMap);
        return node;
    }

}

