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

import org.allbinary.logic.NullUtil;
import org.allbinary.logic.io.file.AbFile;
import org.allbinary.logic.io.path.AbPath;

class FileStreamFactory {
    private static var SINGLETON : Any = NullUtil.getInstance().NULL_OBJECT;
    public static function getInstance() : FileStreamFactory {
        if (FileStreamFactory.SINGLETON == NullUtil.getInstance().NULL_OBJECT) {
            FileStreamFactory.SINGLETON = new FileStreamFactory();
        }
        return (cast FileStreamFactory.SINGLETON : FileStreamFactory);
    }

    public function new() {
    }

    // throws Exception
    public function getFileInputStreamInstance(path : String, fileName : String) : AbFileInputStream {
        final FILEABPATH : AbPath = new AbPath(path, fileName);
        final file : AbFile = AbFile.createAbFileFromAbPath(FILEABPATH);
        return new AbFileInputStream(file);
    }

    // throws Exception
    public function getFileOutputStreamInstance(path : String, fileName : String) : AbFileOutputStream {
        final FILEABPATH : AbPath = new AbPath(path, fileName);
        final file : AbFile = AbFile.createAbFileFromAbPath(FILEABPATH);
        if (file.exists()) {
            file.delete();
            file.createNewFile();
        }
        return AbFileOutputStream.createFromAbFile(file);
    }

    // throws Exception
    public function delete(path : String, fileName : String) : Void {
        final FILEABPATH : AbPath = new AbPath(path, fileName);
        final file : AbFile = AbFile.createAbFileFromAbPath(FILEABPATH);
        file.delete();
    }

}

