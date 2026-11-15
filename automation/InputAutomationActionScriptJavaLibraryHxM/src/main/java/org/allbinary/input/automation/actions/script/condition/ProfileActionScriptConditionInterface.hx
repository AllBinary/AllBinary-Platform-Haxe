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
package org.allbinary.input.automation.actions.script.condition;

import org.allbinary.input.automation.actions.script.ProfileActionScriptItemInterface;
import org.allbinary.input.automation.actions.script.ProfileActionScriptNodeInterface;
import org.allbinary.input.automation.actions.script.condition.processors.ProfileActionScriptProcessorInterface;

interface ProfileActionScriptConditionInterface extends ProfileActionScriptNodeInterface extends CustomTreeNodeInterface extends ProfileActionScriptItemInterface {
    function addProcessor(profileActionProcessorInterface : ProfileActionScriptProcessorInterface) : Void;

    function removeProcessor(profileActionProcessorInterface : ProfileActionScriptProcessorInterface) : Void;

    // throws Exception
    function shouldProcess(frame : Null<haxe.Int64>) : Bool;

}

