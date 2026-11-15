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
import org.allbinary.data.tree.dom.DomNodeHelper;
import org.allbinary.data.tree.dom.DomNodeInterface;
import org.allbinary.data.tree.dom.ModDomHelper;
import org.allbinary.logic.StdUtil;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

class UserEmailEventConfigurationView implements DomNodeInterface {
    private var userEmailEventConfigurationInterface : UserEmailEventConfigurationInterface = null;
    public function new(node : Node) {
        var childNodeList : NodeList = node.getChildNodes();
        var hashMap : HashMap = StdUtil.getInstance().createHashMap();
        var name : String = DomNodeHelper.getTextNodeValue(UserEmailEventConfigurationData.NAME, childNodeList);
        hashMap.put(UserEmailEventConfigurationData.NAME, name);
        var eventListenerClassPath : String = DomNodeHelper.getTextNodeValue(UserEmailEventConfigurationData.LISTENER_CLASSPATH, childNodeList);
        hashMap.put(UserEmailEventConfigurationData.LISTENER_CLASSPATH, eventListenerClassPath);
        this.setUserEmailEventConfigurationInterface((cast new UserEmailEventConfiguration(hashMap) : UserEmailEventConfigurationInterface));
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(userEmailEventConfigurationInterface : UserEmailEventConfigurationInterface) {
        this.setUserEmailEventConfigurationInterface(userEmailEventConfigurationInterface);
    }

    // throws Exception
    public function toXmlNode(document : Document) : Node {
        var userEmailEventConfigurationMapping : UserEmailEventConfigurationMapping = new UserEmailEventConfigurationMapping(this.getUserEmailEventConfigurationInterface());
        var hashMap : HashMap = userEmailEventConfigurationMapping.toHashMap();
        var node : Node = ModDomHelper.createNameValueNodes(document, UserEmailEventConfigurationData.NAME, hashMap);
        return node;
    }

    public function getUserEmailEventConfigurationInterface() : UserEmailEventConfigurationInterface {
        return this.userEmailEventConfigurationInterface;
    }

    public function setUserEmailEventConfigurationInterface(userEmailEventConfigurationInterface : UserEmailEventConfigurationInterface) : Void {
        this.userEmailEventConfigurationInterface = userEmailEventConfigurationInterface;
    }

}

