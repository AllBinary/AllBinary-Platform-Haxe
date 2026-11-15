/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2025 AllBinary 
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
package org.allbinary.util;

//import jsinterop.annotations.JsType;
import org.allbinary.logic.NullUtil;
import org.allbinary.logic.string.StringMaker;
//import jsinterop.annotations.JsConstructor;

class BasicArrayListS extends BasicArrayList {
    public function new(size : Int) {
        super(NullUtil.getInstance().NULL_OBJECT_ARRAY);
        if (size < 0) {
            throw new IllegalArgumentException(Std.string(new StringMaker().append("Init Size Exception: ").appendint(size)));
        }
        this.objectArray = haxe.ds.Vector.fromArrayCopy([for (index in 0...size) null]);
    }

}

