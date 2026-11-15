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
package org.allbinary.logic.java.array;

import org.allbinary.logic.string.StringMaker;

class IntArrayUtil {
    public function new() {
    }

    public static function toString(...args : Dynamic) : Dynamic {
        if (args.length == 1) {
            return IntArrayUtil.toString_intArray(args[0]);
        }
        if (args.length == 1) {
            return IntArrayUtil.toString_intArrayArray(args[0]);
        }
        if (args.length == 1) {
            return IntArrayUtil.toString_intArrayArrayArray(args[0]);
        }
        throw new jre.lang.IllegalArgumentException("No matching overload: toString");
    }

    public static function toString_intArray(array : haxe.ds.Vector<Int>) : String {
        var stringBuffer : StringMaker = new StringMaker();
        for (index in 0...array.length) {
            stringBuffer.appendint(array[index]);
            if (index < array.length) {
                stringBuffer.append(", ");
            }
        }
        return Std.string(stringBuffer);
    }

    public static function toString_intArrayArray(array : haxe.ds.Vector<haxe.ds.Vector<Int>>) : String {
        var stringBuffer : StringMaker = new StringMaker();
        for (index in 0...array.length) {
            stringBuffer.append("{");
            for (index2 in 0...array[index].length) {
                stringBuffer.appendint(Std.int(array[index][index2]));
                if (index2 < array[index].length - 1) {
                    stringBuffer.append(", ");
                }
            }
            stringBuffer.append("}");
            if (index < array.length - 1) {
                stringBuffer.append(", \n");
            }
        }
        return Std.string(stringBuffer);
    }

    public static function toString_intArrayArrayArray(array : haxe.ds.Vector<haxe.ds.Vector<haxe.ds.Vector<Int>>>) : String {
        var stringBuffer : StringMaker = new StringMaker();
        for (index in 0...array.length) {
            stringBuffer.append("{");
            for (index2 in 0...array[index].length) {
                stringBuffer.append("{");
                for (index3 in 0...array[index][index2].length) {
                    stringBuffer.appendint(Std.int(array[index][index2][index3]));
                    if (index3 < array[index][index2].length - 1) {
                        stringBuffer.append(", ");
                    }
                }
                stringBuffer.append("}");
                if (index2 < array[index].length - 1) {
                    stringBuffer.append(", ");
                }
            }
            stringBuffer.append("}");
            if (index < array.length - 1) {
                stringBuffer.append(", \n");
            }
        }
        return Std.string(stringBuffer);
    }

}

