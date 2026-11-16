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
import org.allbinary.logic.NullUtil;
import org.allbinary.util.CircularIndexUtil;
//import jsinterop.annotations.JsMethod;
//import jsinterop.annotations.JsProperty;

class BaseCircularPool {
    public var circularIndexUtil : CircularIndexUtil = CircularIndexUtil.NULL_CIRCULAR_INDEX_UTIL;
    public var OBJECT_ARRAY : haxe.ds.Vector<Any> = NullUtil.getInstance().NULL_OBJECT_ARRAY;
    // throws Exception
    // synchronized
    public function getNextInstance() : Any {
        var anyType : Any = this.OBJECT_ARRAY[this.circularIndexUtil.getIndex()];
        this.circularIndexUtil.next();
        return anyType;
    }

    public function init(allBinaryObjectFactoryInterface : AllBinaryObjectFactoryInterface) : Void {
        this.circularIndexUtil.setIndex(0);
        var size : Int = this.circularIndexUtil.getSize();
        for (index in 0...size) {
            this.OBJECT_ARRAY[index] = allBinaryObjectFactoryInterface.getInstanceFor();
        }
    }

    // throws Exception
    public function getInstanceFor(index : Int) : Any {
        return this.OBJECT_ARRAY[index];
    }

    public function new() {
    }
}

