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

//import java.io.InputStream;
import org.allbinary.logic.NullUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.string.CommonStrings;

//HTMLForJ2ME
class AbFileSystem {
    private static final instance : AbFileSystem = new AbFileSystem();
    public static function getInstance() : AbFileSystem {
        return AbFileSystem.instance;
    }

    private final logUtil : LogUtil = LogUtil.getInstance();
    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    public function isDirectoryOrFile(path : String) : Bool {
        return false;
    }

    public function isDirectory(path : String) : Bool {
        return false;
    }

    public function getFilesAsStringArrayForPath(currentDirPath : String) : haxe.ds.Vector<String> {
        return StringUtil.getInstance().getArrayInstance();
    }

    public function readAsString(fileName : String) : String {
        final bytes : haxe.ds.Vector<Int> = haxe.ds.Vector.fromArrayCopy([for (index in 0...1000000) 0]);
        return this.readAsString(fileName, bytes);
    }

    public function readAsString(fileName : String, bytes : haxe.ds.Vector<Int>) : String {
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

    public function new() {
    }
}

