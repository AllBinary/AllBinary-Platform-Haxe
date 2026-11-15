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
package org.allbinary.logic.io.file.filter;

//import java.io.File;
//import java.io.FileFilter;
import org.allbinary.logic.io.file.AbFile;
import org.allbinary.logic.io.file.FileWrapperUtil;
import org.allbinary.logic.util.visitor.VisitorInterface;

class VisitorFileFilter implements FileFilter {
    private var booleanVisitorInterface : VisitorInterface;
    public function new(booleanVisitorInterface : VisitorInterface) {
        this.booleanVisitorInterface = booleanVisitorInterface;
    }

    public function accept(file : File) : Bool {
        var abFile : AbFile = FileWrapperUtil.wrapFile(file);
        var isFileAcceptable : Bool = ((cast this.booleanVisitorInterface.visit(abFile) : Null<Bool>));
        return isFileAcceptable || file.isDirectory();
    }

    public function accept(file : AbFile) : Bool {
        var isFileAcceptable : Bool = ((cast this.booleanVisitorInterface.visit(file) : Null<Bool>));
        return isFileAcceptable || file.isDirectory();
    }

}

