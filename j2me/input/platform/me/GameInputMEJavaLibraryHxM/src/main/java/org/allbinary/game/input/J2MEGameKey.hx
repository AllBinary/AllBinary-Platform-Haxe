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

import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;

class J2MEGameKey extends Input {
    public function new(key : Int, keyName : String) {
        super(key, keyName);
        var id : Int = this.getId();
        if (id >= 0) {
            final inputFactory : InputFactory = InputFactory.getInstance();
            inputFactory.add(id, this);
        }
    }

    public function toString() : String {
        return new StringMaker().append("J2MEGameKey: ").append(super.toString()).toString();
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

