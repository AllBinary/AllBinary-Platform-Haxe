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
package org.allbinary.logic.io.file.directory;

//import java.io.FileFilter;
import org.allbinary.logic.io.file.AbFile;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.string.CommonSeps;
import org.allbinary.util.BasicArrayList;

class SubDirectory {
    private static final instance : SubDirectory = new SubDirectory();
    public static function getInstance() : SubDirectory {
        return SubDirectory.instance;
    }

    private final directory : Directory = Directory.getInstance();
    public function new() {
    }

    public function search(fileFilter : FileFilter, file : AbFile) : BasicArrayList {
        return this.directory.search(fileFilter, file, true);
    }

    public function search(file : AbFile) : BasicArrayList {
        return this.directory.search(file, true);
    }

    public function search(searchValue : String, file : AbFile) : BasicArrayList {
        return this.directory.search(searchValue, file, true);
    }

    public function search(level : Int, file : AbFile) : BasicArrayList {
        return this.directory.search(level, file, true);
    }

    public static function toString(files : BasicArrayList) : String {
        var stringBuffer : StringMaker = new StringMaker();
        final NEW_LINE : String = CommonSeps.getInstance().NEW_LINE;
        final size : Int = files.size();
        for (index in 0...size) {
            var file : AbFile = (cast files.get(index) : AbFile);
            stringBuffer.append(file.getPath());
            stringBuffer.append(NEW_LINE);
        }
        return stringBuffer.toString();
    }

}

