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

//import java.io.FileNotFoundException;
//import java.io.FileOutputStream;
//import java.io.IOException;
//import java.io.OutputStream;
//import java.nio.channels.FileChannel;
import org.allbinary.logic.io.file.AbFile;
import org.allbinary.logic.io.file.AbFileNativeUtil;

class AbFileOutputStream extends OutputStream {
    // throws FileNotFoundException
    public static function createFromAbFile(file : AbFile) : AbFileOutputStream {
        return new AbFileOutputStream(new FileOutputStream(AbFileNativeUtil.get(file)));
    }

    // throws FileNotFoundException
    public static function createFromAbFileAppend(file : AbFile, append : Bool) : AbFileOutputStream {
        return new AbFileOutputStream(new FileOutputStream(file.getPath()));
    }

    // throws FileNotFoundException
    public static function createFromFilePath(name : String) : AbFileOutputStream {
        return new AbFileOutputStream(new FileOutputStream(name));
    }

    // throws FileNotFoundException
    public static function createFromFilePathAppend(name : String, append : Bool) : AbFileOutputStream {
        return new AbFileOutputStream(new FileOutputStream(name));
    }

    private var fileOutputStream : FileOutputStream;
    public function new(fileOutputStream : FileOutputStream) {
        super();
        this.fileOutputStream = fileOutputStream;
    }

    // throws IOException
    public override function close() : Void {
        this.fileOutputStream.close();
    }

    public function getChannel() : FileChannel {
        return this.fileOutputStream.getChannel();
    }

    // throws IOException
    public override function write(buffer : haxe.ds.Vector<Int>) : Void {
        this.fileOutputStream.write(buffer);
    }

    // throws IOException
    public override function write(buffer : haxe.ds.Vector<Int>, offset : Int, count : Int) : Void {
        this.fileOutputStream.write(buffer, offset, count);
    }

    // throws IOException
    public override function write(b : Int) : Void {
        this.fileOutputStream.write(b);
    }

}

