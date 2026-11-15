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

import org.allbinary.data.tree.dom.DomSearchHelper;
import org.w3c.dom.Document;
import org.w3c.dom.Node;

class BasicProfileActionScriptProcessorNode {
    public function new(node : Node) {
        var actionNode : Node = DomSearchHelper.getNode(GenericProfileActionScriptProcessorData.NAME, node.getChildNodes());
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new() {
    }

    // throws Exception
    public function toXmlNode(document : Document) : Node {
        var node : Node = document.createElement(GenericProfileActionScriptProcessorData.NAME);
        return node;
    }

}

