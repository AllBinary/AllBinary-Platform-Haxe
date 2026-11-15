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
package org.allbinary.input.automation.actions.script.condition.processors.input;

//import java.util.Set;
//import javax.swing.*;
import org.allbinary.input.automation.robot.InputRobotFactory;

class InputAutomationTypeDefaultComboBoxModelFactory {
    public function new() {
    }

    // throws Exception
    public static function getInstance() : DefaultComboBoxModel {
        var defaultComboBoxModel : DefaultComboBoxModel = new DefaultComboBoxModel();
        var set : Set = InputRobotFactory.getInstance().get().keySet();
        final nameArray : haxe.ds.Vector<Any> = set.toArray();
        final size : Int = nameArray.length;
        for (index in 0...size) {
            defaultComboBoxModel.addElement((cast nameArray[index] : String));
        }
        return defaultComboBoxModel;
    }

}

