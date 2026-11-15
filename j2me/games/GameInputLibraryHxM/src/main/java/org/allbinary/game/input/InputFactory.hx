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

import org.allbinary.logic.NullUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.math.SmallIntegerSingletonFactory;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.string.CommonStrings;

class InputFactory {
    private static var instance : Any = NullUtil.getInstance().NULL_OBJECT;
    public static function getInstance() : InputFactory {
        if (InputFactory.instance == NullUtil.getInstance().NULL_OBJECT) {
            InputFactory.instance = new InputFactory();
        }
        return (cast InputFactory.instance : InputFactory);
    }

    public final logUtil : LogUtil = LogUtil.getInstance();
    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    public final KEY_CODE_LABEL : String = "KeyCode: ";
    public final DEVICE_ID_LABEL : String = "DeviceId: ";
    public final MAX : Int = SmallIntegerSingletonFactory.getInstance().getMin();
    public final inputIntegerArray : haxe.ds.Vector<Input>;
    public final NO_INPUT : Input;
    public function new() {
        this.inputIntegerArray = haxe.ds.Vector.fromArrayCopy([for (index in 0...this.MAX) null]);
        this.NO_INPUT = new Input(0, this.commonStrings.UNKNOWN);
        final size : Int = this.inputIntegerArray.length;
        for (index in 0...size) {
            this.inputIntegerArray[index] = this.NO_INPUT;
        }
    }

    public function add(id : Int, input : Input) : Void {
        this.inputIntegerArray[id] = input;
    }

    public function getInstanceById(id : Int) : Input {
        if (id < 0) {
            id = -id;
        }
        if (id > this.inputIntegerArray.length) {
            this.logUtil.putF(Std.string(new StringMaker().append("Warning id: ").appendint(id)), this, this.commonStrings.GET_INSTANCE);
            return this.NO_INPUT;
        }
        return this.inputIntegerArray[id];
    }

}

