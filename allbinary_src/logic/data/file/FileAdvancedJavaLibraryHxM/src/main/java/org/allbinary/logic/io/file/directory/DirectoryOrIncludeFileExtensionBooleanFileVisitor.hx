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
import org.allbinary.logic.io.file.visitor.IncludeFileExtensionsBooleanFileVisitor;
import org.allbinary.util.BasicArrayList;

class DirectoryOrIncludeFileExtensionBooleanFileVisitor extends IncludeFileExtensionsBooleanFileVisitor {
    private final includesString : String;
    public function new(filterStringBasicArrayList : BasicArrayList) {
        super(filterStringBasicArrayList);
        this.includesString = null;
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(filterStringBasicArrayList : BasicArrayList, includesString : String) {
        super(filterStringBasicArrayList);
        this.includesString = includesString;
    }

    public override function visit(file : AbFile) : Null<Bool> {
        if (file.isDirectory()) {
            return true;
        }
        if (this.includesString == null || file.getAbsolutePath().indexOf(this.includesString) >= 0) {
            return super.visit(file);
        } else {
            return false;
        }
    }

}

