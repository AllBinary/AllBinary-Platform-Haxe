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
import jre.io.OutputStream;

class NullOutputStream extends OutputStream {
    public static final NULL_OUTPUT_STREAM : NullOutputStream = new NullOutputStream();
    public override function write(...args : Dynamic) : Dynamic {
        if (args.length == 1) {
            this.write_int(args[0]);
            return null;
        }
        if (args.length == 3) {
            this.write_byteArray_int_int(args[0], args[1], args[2]);
            return null;
        }
        return super.write(...args);
    }

    // throws IOException
    public override function write_int(b : Int) : Void {
    }

    // throws IOException
    public override function write_byteArray_int_int(b : haxe.ds.Vector<Int>, off : Int, len : Int) : Void {
    }

    public override function close() : Void {
    }

    public function new() {
        super();
    }
}

