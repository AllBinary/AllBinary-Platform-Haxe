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

import org.allbinary.logic.io.file.AbFile;
import org.allbinary.logic.util.visitor.VisitorInterface;

class DirectoryBooleanFileVisitor implements VisitorInterface {
    public function new() {
    }

    public function visit(...args : Dynamic) : Dynamic {
        if (args.length == 1) {
            return this.visit_Any(args[0]);
        }
        if (args.length == 1) {
            return this.visit_AbFile(args[0]);
        }
        throw new jre.lang.IllegalArgumentException("No matching overload: visit");
    }

    public function visit_Any(anyType : Any) : Any {
        return (cast this.visit((cast anyType : AbFile)) : Any);
    }

    public function visit_AbFile(file : AbFile) : Null<Bool> {
        if (file.isDirectory()) {
            return true;
        }
        return false;
    }

}

