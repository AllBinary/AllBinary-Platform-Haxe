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

import jre.io.FileFilter;
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

    public function search(...args : Dynamic) : Dynamic {
        if (args.length == 2 && Std.isOfType(args[0], FileFilter) && Std.isOfType(args[0], AbFile)) {
            return this.search_FileFilter_AbFile(args[0], args[1]);
        }
        if (args.length == 1) {
            return this.search_AbFile(args[0]);
        }
        if (args.length == 2 && Std.isOfType(args[0], String) && Std.isOfType(args[0], AbFile)) {
            return this.search_String_AbFile(args[0], args[1]);
        }
        if (args.length == 2) {
            return this.search_int_AbFile(args[0], args[1]);
        }
        throw new jre.lang.IllegalArgumentException("No matching overload: search");
    }

    public function search_FileFilter_AbFile(fileFilter : FileFilter, file : AbFile) : BasicArrayList {
        return this.directory.search(fileFilter, file, true);
    }

    public function search_AbFile(file : AbFile) : BasicArrayList {
        return this.directory.search(file, true);
    }

    public function search_String_AbFile(searchValue : String, file : AbFile) : BasicArrayList {
        return this.directory.search(searchValue, file, true);
    }

    public function search_int_AbFile(level : Int, file : AbFile) : BasicArrayList {
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
        return Std.string(stringBuffer);
    }

}

