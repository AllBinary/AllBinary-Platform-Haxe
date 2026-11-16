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
package org.allbinary.logic.io.file.visitor;

import org.allbinary.logic.io.file.AbFile;
import org.allbinary.util.BasicArrayList;

class ExcludeFileExtensionsBooleanFileVisitor extends BooleanFileVisitor {
    public function new(filterStringBasicArrayList : BasicArrayList) {
        super(filterStringBasicArrayList);
    }

    public override function visit(...args : Dynamic) : Dynamic {
        if (args.length == 1) {
            return this.visit_AbFile(args[0]);
        }
        if (args.length == 2) {
            return this.visit_AbFile_String(args[0], args[1]);
        }
        return super.visit(...args);
    }

    public override function visit_AbFile(file : AbFile) : Null<Bool> {
        if (this.getFilterStringBasicArrayList().size() == 0) {
            return true;
        }
        return super.visit(file);
    }

    public override function visit_AbFile_String(file : AbFile, fileNameString : String) : Null<Bool> {
        var fileNameAndExtension : String = file.getPath();
        if (fileNameAndExtension.length > fileNameString.length) {
            var startIndex : Int = fileNameAndExtension.length - fileNameString.length;
            var fileName : String = fileNameAndExtension.substring(startIndex);
            if (Reflect.compare(fileName, fileNameString) == 0) {
                return false;
            }
        }
        return true;
    }

}

