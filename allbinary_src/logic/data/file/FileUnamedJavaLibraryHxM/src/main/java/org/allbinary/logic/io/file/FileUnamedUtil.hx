/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2025 AllBinary 
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

import org.allbinary.string.CommonSeps;

class FileUnamedUtil {
    private static final instance : FileUnamedUtil = new FileUnamedUtil();
    public static function getInstance() : FileUnamedUtil {
        return FileUnamedUtil.instance;
    }

    private final commonSeps : CommonSeps = CommonSeps.getInstance();
    public function process(string : String) : String {
        var simplifiedString : String = string.toLowerCase();
        simplifiedString = StringTools.replace(simplifiedString, this.commonSeps.SPACE, this.commonSeps.UNDERSCORE);
        simplifiedString = StringTools.replace(simplifiedString, this.commonSeps.DASH, this.commonSeps.UNDERSCORE);
        return simplifiedString;
    }

    public function new() {
    }
}

