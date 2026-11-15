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

//import java.io.FileNotFoundException;
import android.content.Context;
import org.allbinary.data.resource.ResourceUtil;

class FileFactory {
    private static final SINGLETON : FileFactory = new FileFactory(ResourceUtil.getInstance().getContext());
    private var context : Context;
    public function new(context : Context) {
        this.context = context;
    }

    public static function getInstance() : FileFactory {
        return FileFactory.SINGLETON;
    }

    // throws Exception
    public function isFile(path : String) : Bool {
        try {
            this.context.openFileInput(path);
            return true;
        } catch (e : FileNotFoundException) {
            return false;
        }
    }

    public function getContext() : Context {
        return this.context;
    }

    // throws Exception
    public function getFile(filePath : String) : AbFile {
        return AbFile.createAbFileFromRawPath(filePath);
    }

    // throws Exception
    public function getInstance(file : AbFile, childFilePath : String) : AbFile {
        return AbFile.createAbFileWithChild(file, childFilePath);
    }

}

