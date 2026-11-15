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
import jre.io.Writer;

class NullWriter extends Writer {
    public static final NULL_WRITER : NullWriter = new NullWriter();
    public override function write(...args : Dynamic) : Dynamic {
        if (args.length == 1 && Std.isOfType(args[0], Int)) {
            this.write_int(args[0]);
            return null;
        }
        if (args.length == 3 && Std.isOfType(args[0], Int) && Std.isOfType(args[0], Int)) {
            this.write_charArray_int_int(args[0], args[1], args[2]);
            return null;
        }
        if (args.length == 1) {
            this.write_String(args[0]);
            return null;
        }
        if (args.length == 3) {
            this.write_String_int_int(args[0], args[1], args[2]);
            return null;
        }
        throw new jre.lang.IllegalArgumentException("No matching overload: write");
    }

    // throws IOException
    public override function write_int(c : Int) : Void {
    }

    // throws IOException
    public override function write_charArray_int_int(cbuf : haxe.ds.Vector<Int>, off : Int, len : Int) : Void {
    }

    // throws IOException
    public override function write_String(str : String) : Void {
    }

    // throws IOException
    public override function write_String_int_int(str : String, off : Int, len : Int) : Void {
    }

    // throws IOException
    public override function flush() : Void {
    }

    // throws IOException
    public override function close() : Void {
    }

    public function new() {
        super();
    }
}

