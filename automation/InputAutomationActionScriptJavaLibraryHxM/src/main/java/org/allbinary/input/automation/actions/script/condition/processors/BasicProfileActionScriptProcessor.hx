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
package org.allbinary.input.automation.actions.script.condition.processors;

//import java.awt.event.ActionEvent;
import org.allbinary.input.automation.actions.script.JTreeInterfaceFactory;
import org.allbinary.input.automation.actions.script.ProfileActionScriptItem;
import org.allbinary.input.automation.actions.script.condition.ProfileActionScriptConditionInterface;
import org.w3c.dom.Document;
import org.w3c.dom.Node;

class BasicProfileActionScriptProcessor extends ProfileActionScriptItem implements ProfileActionScriptProcessorInterface {
    public function new(label : String, node : Node) {
        super(label, node);
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(label : String) {
        super(label);
    }

    public function actionPerformed(actionEvent : ActionEvent) : Void {
        super.actionPerformed(actionEvent);
        if (actionEvent.getActionCommand().compareTo(DELETE) == 0) {
            if (Std.isOfType(this.getParent(), ProfileActionScriptConditionInterface)) {
                var profileActionScriptConditionInterface : ProfileActionScriptConditionInterface = (cast this.getParent() : ProfileActionScriptConditionInterface);
                profileActionScriptConditionInterface.removeProcessor((cast this : ProfileActionScriptProcessorInterface));
                JTreeInterfaceFactory.getInstance().getJTreeInterface().updateJTree();
            }
        }
    }

    // throws Exception
    public function toXmlNode(document : Document) : Node {
        var node : Node = document.createElement(GenericProfileActionScriptProcessorData.NAME);
        return node;
    }

}

