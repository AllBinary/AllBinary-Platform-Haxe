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
package views.generic.inventory;

import org.allbinary.logic.string.StringMaker;

class InventorySearchLoopInfo {
    public var lastPage : Int = -1;
    public var currentPage : Int = -1;
    public var numberOfResultsOnCurrentPage : Int = 0;
    public var numberOfResults : Int = 0;
    private final CURRENT : String = "current: ";
    private final NUM : String = " num: ";
    private final LAST : String = " last: ";
    public function toString() : String {
        var stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(this.CURRENT);
        stringBuffer.appendint(this.currentPage);
        stringBuffer.append(this.NUM);
        stringBuffer.appendint(this.numberOfResults);
        stringBuffer.append(this.LAST);
        stringBuffer.appendint(this.lastPage);
        return stringBuffer.toString();
    }

    public function new() {
    }
}

