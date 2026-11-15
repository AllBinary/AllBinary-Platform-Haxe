/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2002 AllBinary 
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

//import java.io.File;
//import java.io.FileFilter;
import org.allbinary.logic.util.visitor.VisitorInterface;

class DirectoryFileVisitor implements VisitorInterface implements FileFilter {
    public function new() {
    }

    public function accept(arg0 : java.io.File) : Bool {
        return ((cast this.visit((cast arg0 : Any)) : Null<Bool>));
    }

    public function visit(anyType : Any) : Any {
        var file : File = (cast anyType : File);
        var index : Int = 1;
        var aFile : File = file.getParentFile();
        while (((aFile = aFile.getParentFile())) != null) {
            index++;
        }
        if (file.isDirectory() && index < 5) {
            return true;
        }
        return false;
    }

}

