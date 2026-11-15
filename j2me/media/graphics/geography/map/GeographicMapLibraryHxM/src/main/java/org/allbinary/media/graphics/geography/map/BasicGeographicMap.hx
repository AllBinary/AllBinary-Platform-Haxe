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

import org.allbinary.game.layer.AllBinaryTiledLayer;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.layer.Layer;
import org.allbinary.logic.math.MathUtil;
import org.allbinary.util.BasicArrayList;

class BasicGeographicMap extends SimpleGeographicMap implements GeographicMapInterface {
    public static final NULL_BASIC_GEOGRAPHIC_MAP_ARRAY : haxe.ds.Vector<BasicGeographicMap> = haxe.ds.Vector.fromArrayCopy([for (index in 0...0) null]);
    private final mathUtil : MathUtil = MathUtil.getInstance();
    private final geographicMapCellPositionFactory : BasicGeographicMapCellPositionFactory;
    private final geographicMapCellPositionFactoryInterface : GeographicMapCellPositionFactoryInterface;
    private final geographicMapCellTypeFactory : GeographicMapCellTypeFactory;
    public function new(id : Null<Int>, name : String, cellTypeIdToGeographicMapCellType : haxe.ds.Vector<Int>, tiledLayer : AllBinaryTiledLayer, foregroundBasicColor : BasicColor, backgroundBasicColor : BasicColor, geographicMapCellPositionFactoryInterface : GeographicMapCellPositionFactoryInterface, geographicMapCellPositionBaseFactory : GeographicMapCellPositionBaseFactory, geographicMapCellTypeFactory : GeographicMapCellTypeFactory) {
        super(id, name, cellTypeIdToGeographicMapCellType, tiledLayer, foregroundBasicColor, backgroundBasicColor);
        this.geographicMapCellPositionFactoryInterface = geographicMapCellPositionFactoryInterface;
        this.geographicMapCellPositionFactory = geographicMapCellPositionBaseFactory.getInstance(this);
        this.geographicMapCellTypeFactory = geographicMapCellTypeFactory;
    }

    // throws Exception
    public function getCellPosition(direction : Int, oldGeographicMapCellPosition : GeographicMapCellPosition) : GeographicMapCellPosition {
        switch (direction) {
            case switchValue if (switchValue == 0):
                return this.geographicMapCellPositionFactory.getAt(oldGeographicMapCellPosition.getColumn() - 1, oldGeographicMapCellPosition.getRow());
            case switchValue if (switchValue == 1):
                return this.geographicMapCellPositionFactory.getAt(oldGeographicMapCellPosition.getColumn() + 1, oldGeographicMapCellPosition.getRow());
            case switchValue if (switchValue == 2):
                return this.geographicMapCellPositionFactory.getAt(oldGeographicMapCellPosition.getColumn(), oldGeographicMapCellPosition.getRow() - 1);
            case switchValue if (switchValue == 3):
                return this.geographicMapCellPositionFactory.getAt(oldGeographicMapCellPosition.getColumn(), oldGeographicMapCellPosition.getRow() + 1);
            default:
                throw new haxe.Exception("Only Four Directions");
        }
    }

    // throws Exception
    public function getCellPositionNoThrow(direction : Int, oldGeographicMapCellPosition : GeographicMapCellPosition) : GeographicMapCellPosition {
        switch (direction) {
            case switchValue if (switchValue == 0):
                if (oldGeographicMapCellPosition.getColumn() - 1 >= 0) {
                    return this.geographicMapCellPositionFactory.getAt(oldGeographicMapCellPosition.getColumn() - 1, oldGeographicMapCellPosition.getRow());
                } else {
                    return SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION;
                }
            case switchValue if (switchValue == 1):
                if (oldGeographicMapCellPosition.getColumn() + 1 < this.getAllBinaryTiledLayer().getColumns()) {
                    return this.geographicMapCellPositionFactory.getAt(oldGeographicMapCellPosition.getColumn() + 1, oldGeographicMapCellPosition.getRow());
                } else {
                    return SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION;
                }
            case switchValue if (switchValue == 2):
                if (oldGeographicMapCellPosition.getRow() - 1 >= 0) {
                    return this.geographicMapCellPositionFactory.getAt(oldGeographicMapCellPosition.getColumn(), oldGeographicMapCellPosition.getRow() - 1);
                } else {
                    return SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION;
                }
            case switchValue if (switchValue == 3):
                if (oldGeographicMapCellPosition.getRow() + 1 < this.getAllBinaryTiledLayer().getRows()) {
                    return this.geographicMapCellPositionFactory.getAt(oldGeographicMapCellPosition.getColumn(), oldGeographicMapCellPosition.getRow() + 1);
                } else {
                    return SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION;
                }
            default:
                return SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION;
        }
    }

    // throws Exception
    public function isOfFourDirections(oldGeographicMapCellPosition : GeographicMapCellPosition, newGeographicMapCellPosition : GeographicMapCellPosition) : Bool {
        for (index in 0...4) {
            if (newGeographicMapCellPosition == this.getCellPositionNoThrow(index, oldGeographicMapCellPosition)) {
                return true;
            }
        }
        return false;
    }

    // throws Exception
    public override function getCellPositionAtXY(x : Int, y : Int) : GeographicMapCellPosition {
        final allBinaryTiledLayer : AllBinaryTiledLayer = this.getAllBinaryTiledLayer();
        final i_column : Int = this.mathUtil.abs(x / allBinaryTiledLayer.getCellHeight());
        final i_row : Int = this.mathUtil.abs(y / allBinaryTiledLayer.getCellWidth());
        return this.geographicMapCellPositionFactory.getAt(i_column, i_row);
    }

    public override function getCellPositionAtXYNoThrow(x : Int, y : Int) : GeographicMapCellPosition {
        final allBinaryTiledLayer : AllBinaryTiledLayer = this.getAllBinaryTiledLayer();
        final i_column : Int = this.mathUtil.abs(x / allBinaryTiledLayer.getCellHeight());
        final i_row : Int = this.mathUtil.abs(y / allBinaryTiledLayer.getCellWidth());
        if (allBinaryTiledLayer.getColumns() > i_column && allBinaryTiledLayer.getRows() > i_row) {
            try {
                return this.geographicMapCellPositionFactory.getAt(i_column, i_row);
            } catch (e : haxe.Exception) {
                return SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION;
            }
        } else {
            return SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION;
        }
    }

    // throws Exception
    public function isOnMap(geographicMapCellPosition : GeographicMapCellPosition) : Bool {
        final allBinaryTiledLayer : AllBinaryTiledLayer = this.getAllBinaryTiledLayer();
        final i_column : Int = geographicMapCellPosition.getColumn();
        final i_row : Int = geographicMapCellPosition.getRow();
        if (allBinaryTiledLayer.getColumns() > i_column && allBinaryTiledLayer.getRows() > i_row) {
            return true;
        } else {
            return false;
        }
    }

    // throws Exception
    public function getCellPositionAtNoThrow(x : Int, y : Int, x2 : Int, y2 : Int, geographicMapCellPositionList : BasicArrayList) : BasicArrayList {
        geographicMapCellPositionList.clear();
        final allBinaryTiledLayer : AllBinaryTiledLayer = this.getAllBinaryTiledLayer();
        final i_columnMin : Int = this.mathUtil.abs(x / allBinaryTiledLayer.getCellHeight());
        final i_rowMin : Int = this.mathUtil.abs(y / allBinaryTiledLayer.getCellWidth());
        final i_columnMax : Int = this.mathUtil.abs(x2 / allBinaryTiledLayer.getCellHeight()) + 1;
        final i_rowMax : Int = this.mathUtil.abs(y2 / allBinaryTiledLayer.getCellWidth()) + 1;
        for (columnIndex in i_columnMin...i_columnMax) {
            for (rowIndex in i_rowMin...i_rowMax) {
                if (allBinaryTiledLayer.getColumns() > columnIndex && allBinaryTiledLayer.getRows() > rowIndex) {
                    geographicMapCellPositionList.add(this.geographicMapCellPositionFactory.getAt(columnIndex, rowIndex));
                }
            }
        }
        return geographicMapCellPositionList;
    }

    // throws Exception
    public override function getCellPositionsAt(layer : Layer, currentCellPositionArray : haxe.ds.Vector<haxe.ds.Vector<GeographicMapCellPosition>>, cellPositionArray : haxe.ds.Vector<haxe.ds.Vector<GeographicMapCellPosition>>) : Bool {
        var hasChanged : Bool = false;
        final size : Int = cellPositionArray.length;
        final size2 : Int = cellPositionArray[0].length;
        final xPortion : Int = layer.getXP() / (size - 1);
        final yPortion : Int = layer.getYP() / (size - 1);
        for (index in 0...size) {
            for (index2 in 0...size2) {
                final x : Int = xPortion * index;
                final y : Int = yPortion * index;
                cellPositionArray[index][index2] = this.getCellPositionAtXY(x, y);
                if (currentCellPositionArray[index][index2] != cellPositionArray[index][index2]) {
                    hasChanged = true;
                }
            }
        }
        return hasChanged;
    }

    // throws Exception
    public override function getCellTypeAtXY(x : Int, y : Int) : GeographicMapCellType {
        var cellPosition : GeographicMapCellPosition = this.getCellPositionAtXY(x, y);
        return this.getCellTypeAt(cellPosition);
    }

    public override function getGeographicMapCellPositionFactory() : BasicGeographicMapCellPositionFactory {
        return this.geographicMapCellPositionFactory;
    }

    public override function getGeographicMapCellPositionFactoryInterface() : GeographicMapCellPositionFactoryInterface {
        return this.geographicMapCellPositionFactoryInterface;
    }

    public function getGeographicMapCellTypeFactory() : GeographicMapCellTypeFactory {
        return this.geographicMapCellTypeFactory;
    }

}

