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
package org.allbinary.media.graphics.geography.map;

import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.game.layer.AllBinaryTiledLayer;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.string.CommonSeps;

class BasicGeographicMapCellPositionFactory {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final geographicMapCellPositionArray : haxe.ds.Vector<haxe.ds.Vector<GeographicMapCellPosition>>;
    public final geographicMapInterface : BasicGeographicMap;
    public final geographicMapCellPositionFactoryInterface : GeographicMapCellPositionFactoryInterface;
    private final columns : Int;
    private final rows : Int;
    private final tiledLayer : AllBinaryTiledLayer;
    public function new(geographicMapInterface : BasicGeographicMap) {
        this.geographicMapInterface = geographicMapInterface;
        this.geographicMapCellPositionFactoryInterface = this.geographicMapInterface.getGeographicMapCellPositionFactoryInterface();
        this.tiledLayer = this.geographicMapInterface.getAllBinaryTiledLayer();
        this.columns = this.tiledLayer.getColumns();
        this.rows = this.tiledLayer.getRows();
        this.geographicMapCellPositionArray = haxe.ds.Vector.fromArrayCopy([for (index in 0...this.rows) haxe.ds.Vector.fromArrayCopy([for (index2 in 0...this.columns) null])]);
        this.init();
    }

    // throws Exception
    private function init() : Void {
        final tiledLayer : AllBinaryTiledLayer = this.tiledLayer;
        final columns : Int = this.getColumns();
        final rows : Int = this.getRows();
        final width : Int = tiledLayer.getCellWidth();
        final height : Int = tiledLayer.getCellHeight();
        for (column in 0...columns) {
            for (row in 0...rows) {
                this.createInstance(column, row, width, height);
            }
        }
    }

    // throws Exception
    public function visit(geographicMapCelPositionFactoryInitVisitorInterface : GeographicMapCellPositionFactoryInitVisitorInterface) : Void {
        final tiledLayer : AllBinaryTiledLayer = this.tiledLayer;
        final columns : Int = this.getColumns();
        final rows : Int = this.getRows();
        try {
            var cellPosition : GeographicMapCellPosition = null;
            for (column in 0...columns) {
                for (row in 0...rows) {
                    cellPosition = this.getAt(column, row);
                    geographicMapCelPositionFactoryInitVisitorInterface.visit(tiledLayer, cellPosition);
                }
            }
        } catch (e : haxe.Exception) {
            final commonSeps : CommonSeps = CommonSeps.getInstance();
            this.logUtil.put(new StringMaker().append(commonSeps.BRACKET_OPEN).appendint(rows).append(commonSeps.BRACKET_CLOSE).append(commonSeps.BRACKET_OPEN).appendint(columns).append(commonSeps.BRACKET_CLOSE).toString(), this, "visit", e);
            throw e;
        }
    }

    // throws Exception
    public function getAt(i_column : Int, i_row : Int) : GeographicMapCellPosition {
        return this.geographicMapCellPositionArray[i_row][i_column];
    }

    // throws Exception
    public function getInstance(anotherMapGeographicMapCellPosition : GeographicMapCellPosition) : GeographicMapCellPosition {
        return this.getAt(anotherMapGeographicMapCellPosition.getColumn(), anotherMapGeographicMapCellPosition.getRow());
    }

    // throws Exception
    public function createInstance(i_column : Int, i_row : Int, width : Int, height : Int) : GeographicMapCellPosition {
        var cellPositionCanBeNull : Any = this.geographicMapCellPositionArray[i_row][i_column];
        if (cellPositionCanBeNull == null) {
            cellPositionCanBeNull = this.geographicMapCellPositionFactoryInterface.getInstance(this.geographicMapInterface, i_column, i_row, this.columns, this.rows, width, height);
            this.geographicMapCellPositionArray[i_row][i_column] = (cast cellPositionCanBeNull : GeographicMapCellPosition);
        }
        return (cast cellPositionCanBeNull : GeographicMapCellPosition);
    }

    public function getColumns() : Int {
        return this.columns;
    }

    public function getRows() : Int {
        return this.rows;
    }

}

