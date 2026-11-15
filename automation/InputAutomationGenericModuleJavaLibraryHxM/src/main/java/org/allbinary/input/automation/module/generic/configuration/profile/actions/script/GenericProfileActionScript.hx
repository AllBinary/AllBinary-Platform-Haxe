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
package org.allbinary.input.automation.module.generic.configuration.profile.actions.script;

//import java.util.HashMap;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
//import javax.swing.tree.DefaultMutableTreeNode;
import org.allbinary.data.tree.dom.DomSearchHelper;
import org.allbinary.input.automation.actions.script.ProfileActionScriptNodeInterface;
import org.allbinary.input.automation.actions.script.condition.ProfileActionScriptConditionFactory;
import org.allbinary.input.automation.actions.script.condition.ProfileActionScriptConditionInterface;
import org.allbinary.input.automation.module.generic.configuration.profile.actions.GenericProfileActionData;
import org.allbinary.input.automation.module.generic.configuration.profile.actions.GenericProfileActionJPanel;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

class GenericProfileActionScript extends DefaultMutableTreeNode implements ProfileActionScriptNodeInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    private var genericProfileActionJPanel : GenericProfileActionJPanel;
    private var profileActionConditionInterfaceVector : BasicArrayList = null;
    private static final NAME : String = "Root";
    public function new(genericProfileActionJPanel : GenericProfileActionJPanel, node : Node) {
        super(NAME);
        this.genericProfileActionJPanel = genericProfileActionJPanel;
        this.setProfileActionConditionInterfaceVector(new BasicArrayListD());
        var actionScriptNode : Node = DomSearchHelper.getNode(GenericProfileActionData.SCRIPT, node.getChildNodes());
        if (actionScriptNode != null) {
            var nodeList : NodeList = actionScriptNode.getChildNodes();
            for (index in 0...nodeList.getLength()) {
                var actionConditionNode : Node = nodeList.item(index);
                if (actionConditionNode.getNodeType() == Node.ELEMENT_NODE) {
                    this.addCondition(ProfileActionScriptConditionFactory.getInstance(actionConditionNode));
                }
            }
        } else {
            throw new haxe.Exception("Profile Action Script Node Null");
        }
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(genericProfileActionJPanel : GenericProfileActionJPanel) {
        super();
        this.genericProfileActionJPanel = genericProfileActionJPanel;
        this.setProfileActionConditionInterfaceVector(new BasicArrayListD());
    }

    public function addCondition(profileActionScriptNodeInterface : ProfileActionScriptNodeInterface) : Void {
        this.logUtil.putF(this.commonStrings.START, this, "addCondition");
        this.getProfileActionConditionInterfaceVector().add(profileActionScriptNodeInterface);
        this.add(profileActionScriptNodeInterface);
    }

    public function removeCondition(profileActionScriptNodeInterface : ProfileActionScriptNodeInterface) : Void {
        this.logUtil.putF(this.commonStrings.START, this, "removeCondition");
        this.getProfileActionConditionInterfaceVector().remove(profileActionScriptNodeInterface);
        this.remove(profileActionScriptNodeInterface);
    }

    public function toHashMap() : HashMap {
        var hashMap : HashMap = StdUtil.getInstance().createHashMap();
        this.logUtil.putF("HashMap: " + hashMap.toString(), this, "toHashMap()");
        return hashMap;
    }

    public function getProfileActionConditionInterfaceVector() : BasicArrayList {
        return this.profileActionConditionInterfaceVector;
    }

    public function setProfileActionConditionInterfaceVector(profileActionConditionInterfaceVector : BasicArrayList) : Void {
        this.profileActionConditionInterfaceVector = profileActionConditionInterfaceVector;
    }

    // throws Exception
    public function toXmlNode(document : Document) : Node {
        var node : Node = document.createElement(GenericProfileActionData.SCRIPT);
        final vector : BasicArrayList = this.getProfileActionConditionInterfaceVector();
        final size : Int = vector.size();
        for (index in 0...size) {
            var profileActionConditionInterface : ProfileActionScriptConditionInterface = (cast vector.get(index) : ProfileActionScriptConditionInterface);
            node.appendChild(profileActionConditionInterface.toXmlNode(document));
        }
        return node;
    }

}

