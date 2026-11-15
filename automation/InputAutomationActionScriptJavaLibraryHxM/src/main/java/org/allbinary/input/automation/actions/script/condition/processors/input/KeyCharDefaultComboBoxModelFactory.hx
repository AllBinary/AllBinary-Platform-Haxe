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

//import javax.swing.*;
import abbot.tester.KeyStrokeMap;
import org.allbinary.input.KeySingletonFactory;

class KeyCharDefaultComboBoxModelFactory {
    public function new() {
    }

    public static function getInstance() : DefaultComboBoxModel {
        var defaultComboBoxModel : DefaultComboBoxModel = new DefaultComboBoxModel();
        var keyArray : haxe.ds.Vector<Null<Int>> = KeySingletonFactory.getArray();
        for (index in 0...keyArray.length) {
            var nextKey : Null<Int> = keyArray[index];
            var keyStroke : KeyStroke = KeyStroke.getKeyStroke(Std.int(nextKey), 0);
            var keyChar : Int = KeyStrokeMap.getChar(keyStroke);
            defaultComboBoxModel.addElement(Std.string(keyChar));
        }
        return defaultComboBoxModel;
    }

}

