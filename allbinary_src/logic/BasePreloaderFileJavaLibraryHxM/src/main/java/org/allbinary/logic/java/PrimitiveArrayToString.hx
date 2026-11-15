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
package org.allbinary.logic.java;

import org.allbinary.logic.string.StringMaker;

class PrimitiveArrayToString {
    public static function toString(floats : haxe.ds.Vector<Float>) : String {
        final stringBuffer : StringMaker = new StringMaker();
        for (index in 0...floats.length) {
            stringBuffer.appendfloat(floats[index]);
        }
        return Std.string(stringBuffer);
    }

    public function new() {
    }
}

