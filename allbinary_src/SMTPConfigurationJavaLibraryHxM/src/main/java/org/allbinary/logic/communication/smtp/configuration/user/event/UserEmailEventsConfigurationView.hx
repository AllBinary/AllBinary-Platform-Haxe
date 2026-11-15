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
package org.allbinary.logic.communication.smtp.configuration.user.event;

//import java.util.HashMap;
//import java.util.Set;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.data.tree.dom.DomNodeInterface;
import org.allbinary.data.tree.dom.DomSearchHelper;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

class UserEmailEventsConfigurationView implements DomNodeInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    private var userEmailEventsConfigurationInterface : UserEmailEventsConfigurationInterface;
    public function new(node : Node) {
        this.userEmailEventsConfigurationInterface = (cast new UserEmailEventsConfiguration() : UserEmailEventsConfigurationInterface);
        var childNodeList : NodeList = node.getChildNodes();
        var emailEventConfigurationNodeVector : BasicArrayList = DomSearchHelper.getAllNodesNoThrow(UserEmailEventConfigurationData.NAME, childNodeList);
        final size : Int = emailEventConfigurationNodeVector.size();
        for (index in 0...size) {
            var userEmailConfigurationNode : Node = (cast emailEventConfigurationNodeVector.get(index) : Node);
            var userEmailEventConfigurationView : UserEmailEventConfigurationView = new UserEmailEventConfigurationView(userEmailConfigurationNode);
            this.userEmailEventsConfigurationInterface.addUserEmailEventConfiguration(userEmailEventConfigurationView.getUserEmailEventConfigurationInterface());
        }
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(userEmailEventsConfigurationInterface : UserEmailEventsConfigurationInterface) {
        this.userEmailEventsConfigurationInterface = userEmailEventsConfigurationInterface;
    }

    public function getUserEmailEventsConfigurationInterface() : UserEmailEventsConfigurationInterface {
        return this.userEmailEventsConfigurationInterface;
    }

    // throws Exception
    public function toXmlNode(document : Document) : Node {
        var userEmailConfigurationMapping : UserEmailEventsConfigurationMapping = new UserEmailEventsConfigurationMapping(this.userEmailEventsConfigurationInterface);
        var node : Node = document.createElement(UserEmailEventsConfigurationData.NAME);
        var emailEventHashMap : HashMap = this.getUserEmailEventsConfigurationInterface().getEventConfigurationHashMap();
        var set : Set = emailEventHashMap.keySet();
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().EMAILLOGGING)) {
            this.logUtil.putF("Number Of Email Events Specified in file: " + set.size(), this, this.commonStrings.CONSTRUCTOR);
        }
        final eventNameArray : haxe.ds.Vector<Any> = set.toArray();
        final size : Int = eventNameArray.length;
        for (index in 0...size) {
            var eventName : String = (cast eventNameArray[index] : String);
            var userEmailEventsConfigurationInterface : UserEmailEventConfigurationInterface = (cast emailEventHashMap.get(eventName) : UserEmailEventConfigurationInterface);
            var userEmailEventConfigurationView : UserEmailEventConfigurationView = new UserEmailEventConfigurationView(userEmailEventsConfigurationInterface);
            node.appendChild(userEmailEventConfigurationView.toXmlNode(document));
        }
        return node;
    }

}

