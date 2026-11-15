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
package org.allbinary.logic.io.file;


class FileFactory {
    private static final instance : FileFactory = new FileFactory();
    public static function getInstance() : FileFactory {
        return FileFactory.instance;
    }

    // throws Exception
    public function getInstance(filePath : String) : AbFile {
        return AbFile.createAbFileFromRawPath(filePath);
    }

    // throws Exception
    public function getInstance(file : AbFile, childFilePath : String) : AbFile {
        return AbFile.createAbFileWithChild(file, childFilePath);
    }

    // throws Exception
    public function isFile(path : String) : Bool {
        var file : AbFile = AbFile.createAbFile(path);
        if (file.exists()) {
            return true;
        } else {
            return false;
        }
    }

    public function new() {
    }
}

