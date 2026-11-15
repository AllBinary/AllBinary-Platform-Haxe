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

//import java.io.BufferedReader;
//import java.io.BufferedWriter;
//import java.io.FileReader;
//import java.io.FileWriter;
import org.allbinary.logic.io.file.AbFile;
import org.allbinary.logic.io.file.AbFileNativeUtil;
import org.allbinary.logic.string.StringUtil;

class BufferedIOUtil {
    // throws Exception
    public static function copy(backupFile : AbFile, backupFileBak : AbFile) : Void {
        var line : String = StringUtil.getInstance().EMPTY_STRING;
        final tmpOut : BufferedWriter = new BufferedWriter(new FileWriter(AbFileNativeUtil.get(backupFileBak)));
        final tmpIn : BufferedReader = new BufferedReader(new FileReader(AbFileNativeUtil.get(backupFile)));
        while (true) {
            line = tmpIn.readLine();
            if (line == null) {
                break;
            }
            tmpOut.write(line, 0, line.length);
            tmpOut.newLine();
        }
        tmpOut.flush();
    }

    public function new() {
    }
}

