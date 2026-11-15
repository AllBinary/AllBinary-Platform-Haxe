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
package org.allbinary.business.user.modules.configuration;

import org.allbinary.business.entry.EntryData;
import org.allbinary.business.time.created.TimeCreatedView;
import org.allbinary.business.time.modified.TimeLastModifiedView;
import org.allbinary.data.tree.dom.DomNodeInterface;
import org.allbinary.data.tree.dom.DomSearchHelper;
import org.allbinary.logic.communication.smtp.configuration.user.UserEmailConfigurationData;
import org.allbinary.logic.communication.smtp.configuration.user.UserEmailConfigurationInterface;
import org.allbinary.logic.communication.smtp.configuration.user.UserEmailConfigurationView;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

class UserConfigurationView implements DomNodeInterface {
    private var userConfigurationInterface : UserConfigurationInterface;
    public function new(node : Node) {
        this.userConfigurationInterface = (cast new UserConfiguration() : UserConfigurationInterface);
        var childNodeList : NodeList = node.getChildNodes();
        var emailConfigurationNode : Node = DomSearchHelper.getNode(UserEmailConfigurationData.NAME, childNodeList);
        var userEmailConfigurationView : UserEmailConfigurationView = new UserEmailConfigurationView(emailConfigurationNode);
        var userEmailConfigurationInterface : UserEmailConfigurationInterface = (cast userEmailConfigurationView.getEmailConfigurationInterface() : UserEmailConfigurationInterface);
        this.userConfigurationInterface.setUserEmailConfigurationInterface(userEmailConfigurationInterface);
        var timeCreatedNode : Node = DomSearchHelper.getNode(EntryData.getInstance().TIMECREATED, childNodeList);
        var timeCreatedView : TimeCreatedView = new TimeCreatedView(timeCreatedNode);
        this.userConfigurationInterface.setTimeCreated(timeCreatedView.getTimeCreated());
        var timeLastModifiedNode : Node = DomSearchHelper.getNode(EntryData.getInstance().LASTMODIFIED, childNodeList);
        var timeLastModifiedView : TimeLastModifiedView = new TimeLastModifiedView(timeLastModifiedNode);
        this.userConfigurationInterface.setTimeLastModified(timeLastModifiedView.getTimeLastModified());
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(userConfigurationInterface : UserConfigurationInterface) {
        this.userConfigurationInterface = userConfigurationInterface;
    }

    public function getUserConfigurationInterface() : UserConfigurationInterface {
        return this.userConfigurationInterface;
    }

    // throws Exception
    public function toXmlNode(document : Document) : Node {
        var node : Node = document.createElement(UserConfigurationData.NAME);
        var userEmailConfigurationView : UserEmailConfigurationView = new UserEmailConfigurationView(this.userConfigurationInterface.getUserEmailConfigurationInterface());
        node.appendChild(userEmailConfigurationView.toXmlNode(document));
        var timeCreatedView : TimeCreatedView = new TimeCreatedView(this.userConfigurationInterface.getTimeCreated());
        node.appendChild(timeCreatedView.toXmlNode(document));
        var timeLastModifiedView : TimeLastModifiedView = new TimeLastModifiedView(this.userConfigurationInterface.getTimeLastModified());
        node.appendChild(timeLastModifiedView.toXmlNode(document));
        return node;
    }

}

