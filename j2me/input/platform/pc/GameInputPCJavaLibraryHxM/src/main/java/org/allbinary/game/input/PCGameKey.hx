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
package org.allbinary.game.input;

import org.allbinary.logic.string.StringUtil;

class PCGameKey extends Input {
    public function new(keyCode : Int, name : String) {
        super(keyCode, name);
        var id : Int = this.getId();
        if (id >= 0) {
            InputFactory.getInstance().add(id, this);
        }
    }

    public function toString() : String {
        return "PCGameKey: " + super.toString();
    }

    public static function getString(keyCode : Int) : String {
        var input : Input = InputFactory.getInstance().getInstanceById(keyCode);
        if (input != null) {
            return input.getName();
        } else {
            return StringUtil.getInstance().EMPTY_STRING;
        }
    }

}

