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
package org.allbinary.logic.util.cache;

//import jsinterop.annotations.JsType;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
//import jsinterop.annotations.JsMethod;
//import jsinterop.annotations.JsProperty;

class BaseBasicArrayListCache {
    public final list : BasicArrayList = new BasicArrayListD();
    public function log() : String {
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append("S: ");
        stringBuffer.appendint(this.list.size());
        return Std.string(stringBuffer);
    }

    public function new() {
    }
}

