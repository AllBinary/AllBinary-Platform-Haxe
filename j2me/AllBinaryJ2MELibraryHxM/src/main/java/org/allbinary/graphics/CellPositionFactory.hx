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

import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.string.CommonStrings;

class CellPositionFactory {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static var SINGLETON : CellPositionFactory = new CellPositionFactory();
    public final NONE : CellPosition = new CellPosition(-1, -1, -1, -1);
    private var cellPositionArray : haxe.ds.Vector<haxe.ds.Vector<CellPosition>> = haxe.ds.Vector.fromArrayCopy([for (index in 0...0) haxe.ds.Vector.fromArrayCopy([for (index2 in 0...0) null])]);
    private var columns : Int = 0;
    private var rows : Int = 0;
    public static function getInstance() : CellPositionFactory {
        return CellPositionFactory.SINGLETON;
    }

    public function new() {
    }

    public function init(columns : Int, rows : Int) : Void {
        final commonStrings : CommonStrings = CommonStrings.getInstance();
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append("Init: columns: ");
        stringBuffer.appendint(columns);
        stringBuffer.append(" rows: ");
        stringBuffer.appendint(rows);
        this.logUtil.putF(Std.string(stringBuffer), this, commonStrings.INIT);
        this.cellPositionArray = haxe.ds.Vector.fromArrayCopy([for (index in 0...columns) haxe.ds.Vector.fromArrayCopy([for (index2 in 0...rows) null])]);
        this.columns = columns;
        this.rows = rows;
        for (column in 0...columns) {
            for (row in 0...rows) {
                this.createInstance(column, row);
            }
        }
    }

    public function getInstanceColRow(i_column : Int, i_row : Int) : CellPosition {
        try {
            return this.cellPositionArray[i_column][i_row];
        } catch (e : haxe.Exception) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            this.logUtil.put(Std.string(new StringMaker().append("columns: ").appendint(this.getColumns()).append(" rows: ").appendint(this.getRows()).append(" col: ").appendint(i_column).append(" row: ").appendint(i_row)), this, commonStrings.GET_INSTANCE, e);
            return this.NONE;
        }
    }

    public function createInstance(i_column : Int, i_row : Int) : CellPosition {
        var cellPositionCanBeNull : CellPosition = this.cellPositionArray[i_column][i_row];
        if (cellPositionCanBeNull == null) {
            cellPositionCanBeNull = new CellPosition(i_column, i_row, this.columns, this.rows);
            this.cellPositionArray[i_column][i_row] = cellPositionCanBeNull;
        }
        return cellPositionCanBeNull;
    }

    public function getColumns() : Int {
        return this.columns;
    }

    public function getRows() : Int {
        return this.rows;
    }

}

