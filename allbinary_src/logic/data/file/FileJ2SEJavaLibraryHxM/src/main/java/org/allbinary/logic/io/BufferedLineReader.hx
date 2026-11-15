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
//import java.io.FileReader;
import org.allbinary.logic.io.file.AbFile;
import org.allbinary.logic.io.file.AbFileNativeUtil;

class BufferedLineReader {
    private final tmpIn : BufferedReader;
    public function new(file : AbFile) {
        this.tmpIn = new BufferedReader(new FileReader(AbFileNativeUtil.get(file)));
    }

    public function readUpToLines(readAheadIndex : haxe.Int64) : Void {
    }

    // throws Exception
    public function readLine() : String {
        return this.tmpIn.readLine();
    }

    public function getSize() : haxe.Int64 {
        return 0;
    }

    public function getCurrent() : Int {
        return 0;
    }

}

