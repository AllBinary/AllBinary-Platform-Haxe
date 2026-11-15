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
package org.allbinary.input.automation.module.actions.script.condition.processors.output;

import org.allbinary.data.tree.dom.DomSearchHelper;
import org.w3c.dom.Node;

class ProfileActionScriptOutputFactory {
    public function new() {
    }

    // throws Exception
    public static function getInstance(node : Node) : ProfileActionScriptOutputInterface {
        var profileActionScriptOutputInterface : ProfileActionScriptOutputInterface = null;
        if (DomSearchHelper.getNodeNoThrow(ImageActionScriptOutputData.NAME, node.getChildNodes()) != null) {
            profileActionScriptOutputInterface = new ImageActionScriptOutput(node);
        } else {
            throw new haxe.Exception("No Such ActionScript Output");
        }
        return profileActionScriptOutputInterface;
    }

}

