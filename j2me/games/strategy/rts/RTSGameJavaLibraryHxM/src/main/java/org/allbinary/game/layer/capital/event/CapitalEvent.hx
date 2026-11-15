/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2002 AllBinary 
 *  
 * By agreeing to this license you and any business entity you represent are 
 * legally bound to the AllBinary Open License Version 1 legal agreement. 
 *  
 * You may obtain the AllBinary Open License Version 1 legal agreement from 
 * AllBinary or the root directory of AllBinary's AllBinary Platform repository. 
 *  
 * Created By: Travis Berthelot  
 */
// Generated Code Do Not Modify
package org.allbinary.game.layer.capital.event;

import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.util.event.AllBinaryEventObject;

class CapitalEvent extends AllBinaryEventObject {
    private var value : Int = 0;
    public function new(anyType : Any) {
        super(anyType);
    }

    public function toString() : String {
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append("CapitalEvent: Value: \n");
        stringBuffer.appendint(this.getValue());
        return stringBuffer.toString();
    }

    public function getValue() : Int {
        return this.value;
    }

    public function setValue(value : Int) : Void {
        this.value = value;
    }

}

