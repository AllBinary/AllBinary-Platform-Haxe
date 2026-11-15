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
package org.allbinary.logic.io;

//import java.io.FileInputStream;
//import java.io.FileNotFoundException;
//import java.io.IOException;
//import java.io.InputStream;
//import java.nio.channels.FileChannel;

class AbFileInputStream extends InputStream {
    private var fileInputStream : FileInputStream;
    public function new(fileInputStream : FileInputStream) {
        super();
        this.fileInputStream = fileInputStream;
    }

    public override function mark(readlimit : Int) : Void {
        this.fileInputStream.mark(readlimit);
    }

    public override function markSupported() : Bool {
        return this.fileInputStream.markSupported();
    }

    // throws IOException
    // synchronized
    public override function reset() : Void {
        this.fileInputStream.reset();
    }

    // throws IOException
    public override function available() : Int {
        return this.fileInputStream.available();
    }

    // throws IOException
    public override function close() : Void {
        this.fileInputStream.close();
    }

    public function getChannel() : FileChannel {
        return this.fileInputStream.getChannel();
    }

    // throws IOException
    public override function read() : Int {
        return this.fileInputStream.read();
    }

    // throws IOException
    public override function read(b : haxe.ds.Vector<Int>) : Int {
        return this.fileInputStream.read(b);
    }

    // throws IOException
    public override function read(buffer : haxe.ds.Vector<Int>, offset : Int, count : Int) : Int {
        return this.fileInputStream.read(buffer, offset, count);
    }

    // throws IOException
    public override function skip(n : haxe.Int64) : haxe.Int64 {
        return this.fileInputStream.skip(n);
    }

}

