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
package org.allbinary.graphics;

import org.allbinary.graph.V;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.string.CommonSeps;

class CellPosition extends V {
    private final id : Int;
    private final column : Int;
    private final row : Int;
    public function new(column : Int, row : Int, columns : Int, rows : Int) {
        super();
        this.column = column;
        this.row = row;
        this.id = (row * columns) + column;
    }

    public function getColumn() : Int {
        return this.column;
    }

    public function getRow() : Int {
        return this.row;
    }

    public function toString() : String {
        return CellPosition.toStringColRow(this.getColumn(), this.getRow());
    }

    public static function toStringCellPosition(basicGeographicMapCellPosition : CellPosition) : String {
        return CellPosition.toStringColRow(basicGeographicMapCellPosition.getColumn(), basicGeographicMapCellPosition.getRow());
    }

    public static function toStringColRow(i_column : Int, i_row : Int) : String {
        var stringBuffer : StringMaker = new StringMaker();
        var commonSeps : CommonSeps = CommonSeps.getInstance();
        stringBuffer.append(commonSeps.PARENTHESIS_OPEN);
        stringBuffer.appendint(i_column);
        stringBuffer.append(commonSeps.COMMA);
        stringBuffer.appendint(i_row);
        stringBuffer.append(commonSeps.PARENTHESIS_CLOSE);
        return stringBuffer.toString();
    }

    public override function getId() : Int {
        return this.id;
    }

}

