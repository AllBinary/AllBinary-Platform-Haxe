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
package org.allbinary.logic.math;

import org.allbinary.logic.string.StringMaker;

class PrimitiveLongSingleton {
    private static final instance : PrimitiveLongSingleton = new PrimitiveLongSingleton();
    public static function getInstance() : PrimitiveLongSingleton {
        return PrimitiveLongSingleton.instance;
    }

    public final UNK : haxe.ds.Vector<Int> = haxe.ds.Vector.fromArrayCopy(["U".code, "n".code, "k".code]);
    public final NUMBER_ARRAY : haxe.ds.Vector<Int> = haxe.ds.Vector.fromArrayCopy([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]);
    public final NUMBER_CHAR_ARRAY : haxe.ds.Vector<Int> = haxe.ds.Vector.fromArrayCopy(["0".code, "1".code, "2".code, "3".code, "4".code, "5".code, "6".code, "7".code, "8".code, "9".code]);
    public final NUMBER_CHAR_ARRAYS : haxe.ds.Vector<haxe.ds.Vector<Int>> = haxe.ds.Vector.fromArrayCopy([haxe.ds.Vector.fromArrayCopy(["0".code]), haxe.ds.Vector.fromArrayCopy(["1".code]), haxe.ds.Vector.fromArrayCopy(["2".code]), haxe.ds.Vector.fromArrayCopy(["3".code]), haxe.ds.Vector.fromArrayCopy(["4".code]), haxe.ds.Vector.fromArrayCopy(["5".code]), haxe.ds.Vector.fromArrayCopy(["6".code]), haxe.ds.Vector.fromArrayCopy(["7".code]), haxe.ds.Vector.fromArrayCopy(["8".code]), haxe.ds.Vector.fromArrayCopy(["9".code])]);
    public final ZERO : haxe.ds.Vector<Int>;
    // throws Exception
    public function getNumberFromChar(numberAsChar : Int) : Int {
        final size : Int = this.NUMBER_CHAR_ARRAY.length;
        for (index in 0...size) {
            if (this.NUMBER_CHAR_ARRAY[index] == numberAsChar) {
                return this.NUMBER_ARRAY[index];
            }
        }
        throw new jre.lang.JavaException(Std.string(new StringMaker().append("numberAsChar was not in array: ").appendchar(numberAsChar)));
    }

    public function new() {
        this.ZERO = haxe.ds.Vector.fromArrayCopy([this.NUMBER_CHAR_ARRAY[0]]);
    }
}

