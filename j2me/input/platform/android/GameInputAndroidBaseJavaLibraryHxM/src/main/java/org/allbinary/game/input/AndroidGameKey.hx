// Generated Code Do Not Modify
package org.allbinary.game.input;

import org.allbinary.logic.string.StringUtil;

class AndroidGameKey extends Input {
    public function new(keyCode : Int, name : String) {
        super(keyCode, name);
        final inputFactory : InputFactory = InputFactory.getInstance();
        inputFactory.inputIntegerArray[this.getId()] = this;
    }

    public function toString() : String {
        return "AndroidGameKey: " + super.toString();
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

