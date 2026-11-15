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

import org.allbinary.logic.io.file.AbFile;

class DataOutputStreamFactory {
    private static final instance : DataOutputStreamFactory = new DataOutputStreamFactory();
    public static function getInstance() : DataOutputStreamFactory {
        return DataOutputStreamFactory.instance;
    }

    // throws Exception
    public function getInstanceForAbFile(file : AbFile) : AbDataOutputStream {
        var idFileOutputStream : AbFileOutputStream = AbFileOutputStream.createFromAbFile(file);
        var idOutData : AbDataOutputStream = new AbDataOutputStream(idFileOutputStream);
        return idOutData;
    }

    // throws Exception
    public function getInstance(filePath : String, fileName : String) : AbDataOutputStream {
        var fileStreamFactory : FileStreamFactory = FileStreamFactory.getInstance();
        var fileOutputStream : AbFileOutputStream = fileStreamFactory.getFileOutputStreamInstance(filePath, fileName);
        var idOutData : AbDataOutputStream = new AbDataOutputStream(fileOutputStream);
        return idOutData;
    }

    public function new() {
    }
}

