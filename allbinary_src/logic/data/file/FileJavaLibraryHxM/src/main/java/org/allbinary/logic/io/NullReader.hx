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
package org.allbinary.logic.io;

import jre.io.IOException;
import jre.io.Reader;

class NullReader extends Reader {
    public static final NULL_READER : NullReader = new NullReader();
    public override function read(...args : Dynamic) : Dynamic {
        if (args.length == 0) {
            return this.read_();
        }
        if (args.length == 3) {
            return this.read_charArray_int_int(args[0], args[1], args[2]);
        }
        return super.read(...args);
    }

    // throws IOException
    public override function read_() : Int {
        return -1;
    }

    // throws IOException
    public override function read_charArray_int_int(cbuf : haxe.ds.Vector<Int>, off : Int, len : Int) : Int {
        return -1;
    }

    // throws IOException
    public override function ready() : Bool {
        return false;
    }

    // throws IOException
    public override function skip(n : haxe.Int64) : haxe.Int64 {
        return haxe.Int64.ofInt(0);
    }

    public override function close() : Void {
    }

    public function new() {
        super();
    }
}

