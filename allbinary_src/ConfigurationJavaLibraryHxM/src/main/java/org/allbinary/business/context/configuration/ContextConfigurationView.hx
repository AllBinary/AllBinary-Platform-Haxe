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
package org.allbinary.business.context.configuration;

import org.allbinary.data.tree.dom.DomNodeInterface;
import org.allbinary.data.tree.dom.DomSearchHelper;
import org.allbinary.logic.communication.smtp.configuration.server.EmailServerConfigurationData;
import org.allbinary.logic.communication.smtp.configuration.server.EmailServerConfigurationInterface;
import org.allbinary.logic.communication.smtp.configuration.server.EmailServerConfigurationView;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

class ContextConfigurationView implements DomNodeInterface {
    private var contextConfigurationInterface : ContextConfigurationInterface;
    public function new(node : Node) {
        var childNodeList : NodeList = node.getChildNodes();
        this.contextConfigurationInterface = new ContextConfiguration();
        var emailConfigurationNode : Node = DomSearchHelper.getNode(EmailServerConfigurationData.NAME, childNodeList);
        var emailServerConfigurationView : EmailServerConfigurationView = new EmailServerConfigurationView(emailConfigurationNode);
        this.contextConfigurationInterface.setEmailServerConfigurationInterface((cast emailServerConfigurationView.getEmailConfigurationInterface() : EmailServerConfigurationInterface));
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(contextConfigurationInterface : ContextConfigurationInterface) {
        this.contextConfigurationInterface = contextConfigurationInterface;
    }

    public function getContextConfigurationInterface() : ContextConfigurationInterface {
        return this.contextConfigurationInterface;
    }

    // throws Exception
    public function toXmlNode(document : Document) : Node {
        var node : Node = document.createElement(ContextConfigurationData.getInstance().NAME);
        var emailServerConfigurationView : EmailServerConfigurationView = new EmailServerConfigurationView(this.getContextConfigurationInterface().getEmailServerConfigurationInterface());
        node.appendChild(emailServerConfigurationView.toXmlNode(document));
        return node;
    }

}

