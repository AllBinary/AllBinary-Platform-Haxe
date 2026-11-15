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
package org.allbinary.logic.java.anyType;

import org.allbinary.logic.string.StringMaker;

class ParamsUtil {
    public function new() {
    }

    public static function viewParams(params : haxe.ds.Vector<Class<Dynamic>>) : String {
        if (params != null) {
            var stringBuffer : StringMaker = new StringMaker();
            for (index in 0...params.length) {
                stringBuffer.append(" ");
                stringBuffer.append(params[index].getName());
            }
            return Std.string(stringBuffer);
        } else {
            return "Params Null";
        }
    }

}

