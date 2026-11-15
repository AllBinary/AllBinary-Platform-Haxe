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
package org.allbinary.util;

//import jsinterop.annotations.JsType;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.string.CommonLabels;
//import jsinterop.annotations.JsMethod;
//import jsinterop.annotations.JsConstructor;
//import jsinterop.annotations.JsProperty;

class CircularIndexUtil {
    public static final NULL_CIRCULAR_INDEX_UTIL : CircularIndexUtil = new CircularIndexUtil(0, 0);
    private var index : Int = 0;
    private var lastIndex : Int = 0;
    private var size : Int = 0;
    public function new(index : Int, size : Int) {
        this.setSize(size);
        this.setIndex(index);
    }

    public function next() : Int {
        if (this.index >= this.lastIndex) {
            this.index = 0;
        } else {
            this.index++;
        }
        return this.index;
    }

    public function previous() : Int {
        if (this.index < 1) {
            this.index = this.lastIndex;
        } else {
            this.index--;
        }
        return this.index;
    }

    public function setIndex(index : Int) : Void {
        if (index > this.lastIndex) {
            return;
        }
        this.index = index;
    }

    public function getIndex() : Int {
        return this.index;
    }

    public static function createInstance(max : Int) : CircularIndexUtil {
        return new CircularIndexUtil(0, max);
    }

    public static function createInstanceAt(index : Int, max : Int) : CircularIndexUtil {
        return new CircularIndexUtil(index, max);
    }

    public function setSize(size : Int) : Void {
        this.size = size;
        this.lastIndex = size - 1;
        this.index = 0;
    }

    public function getSize() : Int {
        return this.size;
    }

    public function toString() : String {
        return Std.string(new StringMaker().append(CommonLabels.getInstance().INDEX_LABEL).appendint(this.index).append("lastIndex: ").appendint(this.lastIndex).append("size: ").appendint(this.size));
    }

}

