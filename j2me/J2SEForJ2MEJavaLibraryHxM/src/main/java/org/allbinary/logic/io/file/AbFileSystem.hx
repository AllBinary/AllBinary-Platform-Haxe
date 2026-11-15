/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2026 AllBinary 
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
package org.allbinary.logic.io.file;

import jre.io.File;
import jre.io.FileInputStream;
import jre.io.InputStream;
import org.allbinary.logic.NullUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.string.CommonStrings;

//J2SEForJ2ME
class AbFileSystem {
    private static final instance : AbFileSystem = new AbFileSystem();
    public static function getInstance() : AbFileSystem {
        return AbFileSystem.instance;
    }

    private final logUtil : LogUtil = LogUtil.getInstance();
    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    public function isDirectoryOrFile(path : String) : Bool {
        final file : File = new File(path);
        return file.isDirectory() || file.isFile();
    }

    public function isDirectory(path : String) : Bool {
        return new File(path).isDirectory();
    }

    public function getFilesAsStringArrayForPath(currentDirPath : String) : haxe.ds.Vector<String> {
        final file : File = new File(currentDirPath);
        if (file.exists()) {
            return file.list();
        } else {
            return StringUtil.getInstance().getArrayInstance();
        }
    }

    public function readAsString(...args : Dynamic) : Dynamic {
        if (args.length == 1) {
            return this.readAsString_String(args[0]);
        }
        if (args.length == 2) {
            return this.readAsString_String_byteArray(args[0], args[1]);
        }
        throw new jre.lang.IllegalArgumentException("No matching overload: readAsString");
    }

    public function readAsString_String(fileName : String) : String {
        final bytes : haxe.ds.Vector<Int> = haxe.ds.Vector.fromArrayCopy([for (index in 0...1000000) 0]);
        return this.readAsString(fileName, bytes);
    }

    public function readAsString_String_byteArray(fileName : String, bytes : haxe.ds.Vector<Int>) : String {
        var closeable : Any = NullUtil.getInstance().NULL_OBJECT;
        try {
            final idFile : InputStream = new FileInputStream(fileName);
            closeable = idFile;
            final size : Int = idFile.read(bytes);
            if (size > 0) {
                return haxe.io.Bytes.ofData(bytes, 0, size).toString();
            }
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "readAsString", e);
        }
        // Java finally: Haxe has no finally so this always runs after the try
        {
            this.close(closeable);
        }
        return StringUtil.getInstance().EMPTY_STRING;
    }

    public function close(closeable : Any) : Bool {
        try {
            if (closeable != null) {
                final inputStream : InputStream = ((cast closeable : InputStream));
                inputStream.close();
            }
            return true;
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.CLOSE, e);
            return false;
        }
    }

    // throws Exception
    public static function main(args : haxe.ds.Vector<String>) : Void {
        final isDirectory : Bool = AbFileSystem.getInstance().isDirectory("c:");
        trace("isDirectory: " + isDirectory);
    }

    public function new() {
    }
}

