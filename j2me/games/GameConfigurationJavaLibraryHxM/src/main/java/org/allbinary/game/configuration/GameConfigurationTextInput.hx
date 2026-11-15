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
package org.allbinary.game.configuration;

//import javax.microedition.lcdui.TextField;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.util.ABHashtable;

class GameConfigurationTextInput {
    private static var hashtable : ABHashtable<Any, Any> = StdUtil.getInstance().createHashtable();
    public static var SIMULATOR_IP : GameConfigurationTextInput = new GameConfigurationTextInput("IP: ", "192.168.1.3");
    public static var SIMULATOR_PORT : GameConfigurationTextInput = new GameConfigurationTextInput("Port: ", "8010");
    private var label : String = StringUtil.getInstance().EMPTY_STRING;
    private var text : String = StringUtil.getInstance().EMPTY_STRING;
    public function new(label : String, text : String) {
        this.setText(text);
        this.setLabel(label);
        GameConfigurationTextInput.hashtable.put(this.getLabel(), this);
    }

    public static function update(textField : TextField) : Void {
        final anyType : Any = (cast textField.getLabel() : Any);
        var gameConfigurationTextInput : GameConfigurationTextInput = (cast GameConfigurationTextInput.hashtable.get(anyType) : GameConfigurationTextInput);
        gameConfigurationTextInput.setText(textField.getString());
    }

    public function setText(text : String) : Void {
        this.text = text;
    }

    public function getText() : String {
        return this.text;
    }

    public function setLabel(label : String) : Void {
        this.label = label;
    }

    public function getLabel() : String {
        return this.label;
    }

    public static function getHashtable() : ABHashtable<Any, Any> {
        return GameConfigurationTextInput.hashtable;
    }

}

