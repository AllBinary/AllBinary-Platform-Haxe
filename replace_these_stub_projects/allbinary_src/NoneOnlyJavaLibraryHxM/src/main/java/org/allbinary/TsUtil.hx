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
package org.allbinary;


//None - Do not use
class TsUtil {
    private static final instance : TsUtil = new TsUtil();
    public static function getInstance() : TsUtil {
        return TsUtil.instance;
    }

    public function hashCode(anyType : Any) : Int {
        return anyType.hashCode();
    }

    // throws InterruptedException
    public function waitFor(any : Any, timeoutMillis : haxe.Int64) : Void {
        final anyType : Any = (cast any : Any);
        anyType.wait(timeoutMillis);
    }

    public function getRecord(anyType : Any, recordId : Int) : haxe.ds.Vector<Int> {
        return haxe.ds.Vector.fromArrayCopy([for (index in 0...0) 0]);
    }

    public function compareTo(a : String, b : String) : Int {
        return Reflect.compare(a, b);
    }

    public function equalIgnoreCase(a : String, b : String) : Bool {
        return (a.toLowerCase() == b.toLowerCase());
    }

    public function equalsNotstring(anyType : Any, object2 : Any) : Bool {
        return anyType.equals(object2);
    }

    public function toNumberFromChar(value : Int) : Int {
        return value;
    }

    public function toNumber(value : Int) : Int {
        return value;
    }

    public function getByteArray(string : String) : haxe.ds.Vector<Int> {
        return haxe.io.Bytes.ofString(string);
    }

    public function isItemListener(owner : Any) : Bool {
        return false;
    }

    public function printAvailableMethods(anyType : Any) : Void {
    }

    public function gc() : Void {
        null;
    }

    public function new() {
    }
}

