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
package org.allbinary.logic.string;

//import jsinterop.annotations.JsType;
//import jsinterop.annotations.JsMethod;
//import jsinterop.annotations.JsConstructor;
//import jsinterop.annotations.JsProperty;

class StringUtil {
    private static final instance : StringUtil = new StringUtil();
    public static function getInstance() : StringUtil {
        return StringUtil.instance;
    }

    public final INIT_STRING : String = "";
    public final NULL_STRING : String = "null";
    public final EMPTY_STRING : String = "";
    public var ONE_EMPTY_STRING_ARRAY : haxe.ds.Vector<String>;
    public var ONE_EMPTY_STRING_ARRAY_OF_ARRAYS : haxe.ds.Vector<haxe.ds.Vector<String>> = haxe.ds.Vector.fromArrayCopy([for (index in 0...0) haxe.ds.Vector.fromArrayCopy([for (index2 in 0...0) null])]);
    private final stringArray : haxe.ds.Vector<String> = haxe.ds.Vector.fromArrayCopy([for (index in 0...0) null]);
    public function new() {
        this.ONE_EMPTY_STRING_ARRAY = haxe.ds.Vector.fromArrayCopy(([this.EMPTY_STRING] : Array<String>));
    }

    public function getNonNull(string : String) : String {
        return string;
    }

    public function getArrayInstance() : haxe.ds.Vector<String> {
        return this.stringArray;
    }

    public function count(string : String, aChar : Int) : Int {
        var count : Int = 0;
        final size : Int = string.length;
        for (index in 0...size) {
            if (string.charCodeAt(index) == aChar) {
                count++;
            }
        }
        return count;
    }

    public function toString(anyType : Any) : String {
        if (anyType != null) {
            return Std.string(anyType);
        } else {
            return this.NULL_STRING;
        }
    }

}

