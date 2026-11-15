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
package org.allbinary.logic.communication.http.file.upload;

import org.allbinary.logic.io.file.AbFile;
import org.allbinary.logic.io.path.AbPath;

class HttpFilePermissionsUtil {
    private static final instance : HttpFilePermissionsUtil = new HttpFilePermissionsUtil();
    public static function getInstance() : HttpFilePermissionsUtil {
        return HttpFilePermissionsUtil.instance;
    }

    // throws Exception
    public function create(path : AbPath) : Void {
        var file : AbFile = AbFile.createAbFileFromAbPath(path);
        if (!file.isFile()) {
            file.createNewFile();
        }
    }

    public function new() {
    }
}

