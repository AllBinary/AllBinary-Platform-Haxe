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
package org.allbinary.input.motion.button;

import org.allbinary.graphics.displayable.DisplayInfoSingleton;
import org.allbinary.logic.string.StringMaker;

class TouchButtonLocationHelper {
    private final totalColumns : Int;
    private final totalRows : Int;
    private var columnsRemainder : Int;
    private var rowsRemainder : Int;
    private var columnsRemainderHalf : Int;
    private var rowsRemainderHalf : Int;
    public function new() {
        var buttonSize : Int = CommonButtons.getInstance().STANDARD_BUTTON_SIZE;
        var displayInfo : DisplayInfoSingleton = DisplayInfoSingleton.getInstance();
        this.totalColumns = Math.round(displayInfo.getLastWidth() / buttonSize);
        this.totalRows = Math.round(displayInfo.getLastHeight() / buttonSize);
        this.columnsRemainder = displayInfo.getLastWidth() % buttonSize;
        this.columnsRemainderHalf = (this.columnsRemainder >> 1);
        this.rowsRemainder = displayInfo.getLastHeight() % buttonSize;
        this.rowsRemainderHalf = (this.rowsRemainder >> 1);
    }

    public function getTotalColumns() : Int {
        return this.totalColumns;
    }

    public function getTotalRows() : Int {
        return this.totalRows;
    }

    public function getColumnsRemainder() : Int {
        return this.columnsRemainder;
    }

    public function getRowsRemainder() : Int {
        return this.rowsRemainder;
    }

    public function getColumnsRemainderHalf() : Int {
        return this.columnsRemainderHalf;
    }

    public function getRowsRemainderHalf() : Int {
        return this.rowsRemainderHalf;
    }

    public function toString() : String {
        var stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append("totalColumns: ");
        stringBuffer.appendint(this.totalColumns);
        stringBuffer.append(" totalRows: ");
        stringBuffer.appendint(this.totalRows);
        stringBuffer.append(" columnsRemainder: ");
        stringBuffer.appendint(this.columnsRemainder);
        stringBuffer.append(" rowsRemainder: ");
        stringBuffer.appendint(this.rowsRemainder);
        stringBuffer.append(" columnsRemainderHalf: ");
        stringBuffer.appendint(this.columnsRemainderHalf);
        stringBuffer.append(" rowsRemainderHalf: ");
        stringBuffer.appendint(this.rowsRemainderHalf);
        return Std.string(stringBuffer);
    }

}

