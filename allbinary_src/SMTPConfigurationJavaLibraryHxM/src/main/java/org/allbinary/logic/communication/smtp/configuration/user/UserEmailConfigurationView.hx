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
package org.allbinary.logic.communication.smtp.configuration.user;

//import java.util.HashMap;
import org.allbinary.data.tree.dom.DomNodeInterface;
import org.allbinary.data.tree.dom.DomSearchHelper;
import org.allbinary.data.tree.dom.ModDomHelper;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.smtp.configuration.user.event.UserEmailEventsConfigurationData;
import org.allbinary.logic.communication.smtp.configuration.user.event.UserEmailEventsConfigurationInterface;
import org.allbinary.logic.communication.smtp.configuration.user.event.UserEmailEventsConfigurationView;
import org.allbinary.string.CommonStrings;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

class UserEmailConfigurationView implements DomNodeInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    private var userEmailConfigurationInterface : UserEmailConfigurationInterface;
    public function new(node : Node) {
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().EMAILLOGGING)) {
            this.logUtil.putF(this.commonStrings.CONSTRUCTOR, this, this.commonStrings.CONSTRUCTOR);
        }
        this.userEmailConfigurationInterface = (cast new UserEmailConfiguration() : UserEmailConfigurationInterface);
        var childNodeList : NodeList = node.getChildNodes();
        var userEmailEventsConfigurationNode : Node = DomSearchHelper.getNodeNoThrow(UserEmailEventsConfigurationData.NAME, childNodeList);
        var userEmailEventsConfigurationView : UserEmailEventsConfigurationView = new UserEmailEventsConfigurationView(userEmailEventsConfigurationNode);
        this.userEmailConfigurationInterface.setUserEmailEventsConfigurationInterface(userEmailEventsConfigurationView.getUserEmailEventsConfigurationInterface());
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(userEmailConfigurationInterface : UserEmailConfigurationInterface) {
        this.userEmailConfigurationInterface = userEmailConfigurationInterface;
    }

    public function getEmailConfigurationInterface() : UserEmailConfigurationInterface {
        return this.userEmailConfigurationInterface;
    }

    // throws Exception
    public function toXmlNode(document : Document) : Node {
        var emailConfigurationMapping : UserEmailConfigurationMapping = new UserEmailConfigurationMapping(this.userEmailConfigurationInterface);
        var hashMap : HashMap = emailConfigurationMapping.toHashMap();
        var node : Node = ModDomHelper.createNameValueNodes(document, UserEmailConfigurationData.NAME, hashMap);
        var userEmailConfigurationInterface : UserEmailConfigurationInterface = this.getEmailConfigurationInterface();
        var userEmailEventsConfigurationInterface : UserEmailEventsConfigurationInterface = userEmailConfigurationInterface.getUserEmailEventsConfigurationInterface();
        var userEmailEventsConfigurationView : UserEmailEventsConfigurationView = new UserEmailEventsConfigurationView(userEmailEventsConfigurationInterface);
        node.appendChild(userEmailEventsConfigurationView.toXmlNode(document));
        return node;
    }

}

