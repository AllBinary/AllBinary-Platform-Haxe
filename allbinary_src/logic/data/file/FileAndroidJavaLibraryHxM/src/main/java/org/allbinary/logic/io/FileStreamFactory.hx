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

import android.content.Context;
import org.allbinary.data.resource.ResourceUtil;
import org.allbinary.logic.NullUtil;

class FileStreamFactory {
    private static var SINGLETON : Any = NullUtil.getInstance().NULL_OBJECT;
    public static function getInstance() : FileStreamFactory {
        if (FileStreamFactory.SINGLETON == NullUtil.getInstance().NULL_OBJECT) {
            FileStreamFactory.SINGLETON = new FileStreamFactory(ResourceUtil.getInstance().getContext());
        }
        return (cast FileStreamFactory.SINGLETON : FileStreamFactory);
    }

    private var context : Any;
    public function new(context : Context) {
        this.context = context;
    }

    // throws Exception
    public function getFileInputStreamInstance(path : String, fileName : String) : AbFileInputStream {
        return new AbFileInputStream(this.getContext().openFileInput(fileName));
    }

    // throws Exception
    public function getFileOutputStreamInstance(path : String, fileName : String) : AbFileOutputStream {
        final context : Context = this.getContext();
        context.deleteFile(fileName);
        return new AbFileOutputStream(context.openFileOutput(fileName, 0));
    }

    // throws Exception
    public function delete(path : String, fileName : String) : Void {
        this.getContext().deleteFile(fileName);
    }

    private function getContext() : Context {
        return (cast this.context : Context);
    }

}

