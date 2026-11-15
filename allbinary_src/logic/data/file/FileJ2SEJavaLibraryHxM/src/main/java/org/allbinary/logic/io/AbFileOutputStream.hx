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

import jre.io.FileNotFoundException;
import jre.io.FileOutputStream;
import org.allbinary.logic.io.file.AbFile;
import org.allbinary.logic.io.file.AbFileNativeUtil;

class AbFileOutputStream extends FileOutputStream {
    // throws FileNotFoundException
    public static function createFromAbFile(file : AbFile) : AbFileOutputStream {
        return new AbFileOutputStream(file.getPath(), false);
    }

    // throws FileNotFoundException
    public static function createFromAbFileAppend(file : AbFile, append : Bool) : AbFileOutputStream {
        return new AbFileOutputStream(file.getPath(), append);
    }

    // throws FileNotFoundException
    public static function createFromFilePath(name : String) : AbFileOutputStream {
        return new AbFileOutputStream(name, false);
    }

    // throws FileNotFoundException
    public static function createFromFilePathAppend(name : String, append : Bool) : AbFileOutputStream {
        return new AbFileOutputStream(name, append);
    }

    public function new(name : String, append : Bool) {
        super(name, append);
    }

}

