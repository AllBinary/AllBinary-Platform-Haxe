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

import org.allbinary.logic.io.path.AbPathData;
import org.allbinary.logic.string.StringValidationUtil;

//Used to correct user input for paths
class FilePathUtil {
    public function new() {
    }

    public static function adjust(path : String) : String {
        final abPathData : AbPathData = AbPathData.getInstance();
        final stringValidationUtil : StringValidationUtil = StringValidationUtil.getInstance();
        final filePathData : FilePathData = FilePathData.getInstance();
        if (stringValidationUtil.isEmpty(path)) {
            return filePathData.PATH_START;
        }
        path = StringTools.replace(path, jre.lang.JavaString.text(abPathData.SEPARATORCHAR), jre.lang.JavaString.text(filePathData.SEPARATORCHAR));
        return path;
    }

}

