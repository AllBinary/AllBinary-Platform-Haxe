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
package org.allbinary.logic.util.event;

//import jsinterop.annotations.JsType;
import org.allbinary.logic.NullUtil;
//import jsinterop.annotations.JsMethod;
//import jsinterop.annotations.JsConstructor;
//import jsinterop.annotations.JsProperty;

class AllBinaryEventObject {
    public static final NULL_EVENT : AllBinaryEventObject = new AllBinaryEventObject(NullUtil.getInstance().NULL_OBJECT);
    private var source : Any;
    public function new(anyType : Any) {
        this.source = anyType;
    }

    public function getSource() : Any {
        return this.source;
    }

    public function setSource(source : Any) : Void {
        this.source = source;
    }

}

