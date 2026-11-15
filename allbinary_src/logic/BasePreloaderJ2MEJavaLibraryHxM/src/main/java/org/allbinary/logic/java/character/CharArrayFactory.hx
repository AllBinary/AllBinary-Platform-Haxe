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
package org.allbinary.logic.java.character;


class CharArrayFactory {
    private static final instance : CharArrayFactory = new CharArrayFactory();
    public static function getInstance() : CharArrayFactory {
        return CharArrayFactory.instance;
    }

    private final zeroCharArray : haxe.ds.Vector<Int> = haxe.ds.Vector.fromArrayCopy([for (index in 0...0) 0]);
    public function getZeroCharArray() : haxe.ds.Vector<Int> {
        return this.zeroCharArray;
    }

    public function new() {
    }
}

