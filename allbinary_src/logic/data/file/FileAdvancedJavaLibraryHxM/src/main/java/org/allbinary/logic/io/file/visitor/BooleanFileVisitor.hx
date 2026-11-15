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

import org.allbinary.logic.communication.log.PreLogUtil;
import org.allbinary.logic.io.file.AbFile;
import org.allbinary.logic.util.visitor.VisitorInterface;
import org.allbinary.string.CommonStrings;
import org.allbinary.util.BasicArrayList;

class BooleanFileVisitor implements VisitorInterface {
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    private var filterStringBasicArrayList : BasicArrayList = null;
    public function new(filterStringBasicArrayList : BasicArrayList) {
        this.setFilterStringBasicArrayList(filterStringBasicArrayList);
        PreLogUtil.put("Filter BasicArrayList: " + Std.string(this.getFilterStringBasicArrayList()), this, this.commonStrings.CONSTRUCTOR);
    }

    public function visit(...args : Dynamic) : Dynamic {
        if (args.length == 1) {
            return this.visit_Any(args[0]);
        }
        if (args.length == 1) {
            return this.visit_AbFile(args[0]);
        }
        if (args.length == 2) {
            return this.visit_AbFile_String(args[0], args[1]);
        }
        throw new jre.lang.IllegalArgumentException("No matching overload: visit");
    }

    public function visit_Any(anyType : Any) : Any {
        return (cast this.visit((cast anyType : AbFile)) : Any);
    }

    public function visit_AbFile(file : AbFile) : Null<Bool> {
        final list : BasicArrayList = this.getFilterStringBasicArrayList();
        final size : Int = list.size();
        var nextFileFilterString : String = null;
        for (index in 0...size) {
            nextFileFilterString = (cast list.get(index) : String);
            if (this.visit(file, nextFileFilterString)) {
                return true;
            }
        }
        return false;
    }

    public function getFilterStringBasicArrayList() : BasicArrayList {
        return this.filterStringBasicArrayList;
    }

    public function setFilterStringBasicArrayList(filterStringBasicArrayList : BasicArrayList) : Void {
        this.filterStringBasicArrayList = filterStringBasicArrayList;
    }

    public function visit_AbFile_String(file : AbFile, fileNameString : String) : Null<Bool> {
        return false;
    }

}

