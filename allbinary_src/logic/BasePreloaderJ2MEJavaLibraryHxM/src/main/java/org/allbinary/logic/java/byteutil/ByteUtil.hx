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
package org.allbinary.logic.java.byteutil;


class ByteUtil {
    private static final instance : ByteUtil = new ByteUtil();
    public static function getInstance() : ByteUtil {
        return ByteUtil.instance;
    }

    public function new() {
    }

    public function xor(array : haxe.ds.Vector<Int>, mask : Int) : haxe.ds.Vector<Int> {
        final bytes : haxe.ds.Vector<Int> = haxe.ds.Vector.fromArrayCopy([for (index in 0...array.length) 0]);
        final size : Int = array.length;
        var index : Int = 0;
        var currentByte : Int = 0;
        while (index < size) {
            currentByte = array[index];
            bytes[index] = (currentByte ^ mask);
            index++;
        }
        return bytes;
    }

    public function not(array : haxe.ds.Vector<Int>) : haxe.ds.Vector<Int> {
        final bytes : haxe.ds.Vector<Int> = haxe.ds.Vector.fromArrayCopy([for (index in 0...array.length) 0]);
        final size : Int = array.length;
        var index : Int = 0;
        while (index < size) {
            bytes[index] = ~array[index];
            index++;
        }
        return bytes;
    }

    public function xorByte(array : haxe.ds.Vector<Int>, index : Int) : haxe.ds.Vector<Int> {
        var mask : Int = 0;
        if (index == 0) {
            mask = 1;
        }
        if (index == 1) {
            mask = 2;
        }
        if (index == 2) {
            mask = 4;
        }
        if (index == 3) {
            mask = 8;
        }
        if (index == 4) {
            mask = 16;
        }
        if (index == 5) {
            mask = 32;
        }
        if (index == 6) {
            mask = 64;
        }
        if (index == 7) {
            mask = -127;
        }
        return this.xor(array, mask);
    }

    public function compare(newByteArray : haxe.ds.Vector<Int>, oldByteArray : haxe.ds.Vector<Int>) : Bool {
        if (newByteArray.length != oldByteArray.length) {
            return false;
        } else {
        }
        final size : Int = newByteArray.length;
        for (index in 0...size) {
            if (newByteArray[index] != oldByteArray[index]) {
                return false;
            }
        }
        return true;
    }

    public function compareWithStats(newByteArray : haxe.ds.Vector<Int>, newSize : Int, oldByteArray : haxe.ds.Vector<Int>, stats : haxe.ds.Vector<Int>) : Bool {
        if (newSize != oldByteArray.length) {
            stats[0] = -1;
            stats[2] = newSize;
            stats[3] = oldByteArray.length;
            return false;
        } else {
            stats[0] = newSize;
        }
        stats[1] = 0;
        final size : Int = newSize;
        for (index in 0...size) {
            if (newByteArray[index] != oldByteArray[index]) {
                return false;
            }
            stats[1]++;
        }
        return true;
    }

}

