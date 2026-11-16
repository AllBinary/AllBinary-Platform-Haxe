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
    private var includesString : String;
    public function new(...args : Dynamic) {
        if (args.length == 1) {
            final filterStringBasicArrayList : BasicArrayList = args[0];
            super(filterStringBasicArrayList);
            this._newDirectoryOrIncludeFileExtensionBooleanFileVisitor0(filterStringBasicArrayList);
        }
        else if (args.length == 2) {
            final filterStringBasicArrayList : BasicArrayList = args[0];
            final includesString : String = args[1];
            super(filterStringBasicArrayList);
            this._newDirectoryOrIncludeFileExtensionBooleanFileVisitor1(filterStringBasicArrayList, includesString);
        }
    }

    private function _newDirectoryOrIncludeFileExtensionBooleanFileVisitor0(filterStringBasicArrayList : BasicArrayList) : Void {
        this.includesString = null;
    }

    private function _newDirectoryOrIncludeFileExtensionBooleanFileVisitor1(filterStringBasicArrayList : BasicArrayList, includesString : String) : Void {
        this.includesString = includesString;
    }

    public override function visit_AbFile(file : AbFile) : Null<Bool> {
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

