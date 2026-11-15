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

import org.allbinary.util.BasicArrayList;
import org.allbinary.game.layer.AllBinaryTiledLayer;
import org.allbinary.util.BasicArrayListS;

class CellPositionsUtil {
    private static final instance : CellPositionsUtil = new CellPositionsUtil();
    public static function getInstance() : CellPositionsUtil {
        return CellPositionsUtil.instance;
    }

    // throws Exception
    public function getAll(geographicMapInterface : BasicGeographicMap, topRightGeographicMapCellPosition : GeographicMapCellPosition, columns : Int, rows : Int, reusableList : BasicArrayList) : BasicArrayList {
        reusableList.clear();
        final geographicMapCellPositionFactory : BasicGeographicMapCellPositionFactory = geographicMapInterface.getGeographicMapCellPositionFactory();
        final lastColumn : Int = topRightGeographicMapCellPosition.getColumn() + columns;
        final lastRow : Int = topRightGeographicMapCellPosition.getRow() + rows;
        if ((columns > 1 && lastColumn > geographicMapInterface.getAllBinaryTiledLayer().getColumns()) || (rows > 1 && lastRow > geographicMapInterface.getAllBinaryTiledLayer().getRows())) {
            return reusableList;
        }
        for (rowIndex in 0...rows) {
            for (columnIndex in 0...columns) {
                var geographicMapCellPosition : GeographicMapCellPosition = geographicMapCellPositionFactory.getAt(topRightGeographicMapCellPosition.getColumn() + columnIndex, topRightGeographicMapCellPosition.getRow() + rowIndex);
                reusableList.add(geographicMapCellPosition);
            }
        }
        return reusableList;
    }

    private final reusableSingleThreadedSurroundingList : BasicArrayList = new BasicArrayListS(8);
    // throws Exception
    public function getAllSurrounding(geographicMapInterface : BasicGeographicMap, occupyList : BasicArrayList, reusableList : BasicArrayList) : BasicArrayList {
        reusableList.clear();
        {
            var index : Int = occupyList.size() - 1;
            while (index >= 0) {
            final layerGeographicMapCellPosition : GeographicMapCellPosition = (cast occupyList.get(index) : GeographicMapCellPosition);
            final surroundingGeographicMapCellPositionList : BasicArrayList = this.getAllSurroundingAt(geographicMapInterface, layerGeographicMapCellPosition, this.reusableSingleThreadedSurroundingList);
            {
                var index2 : Int = surroundingGeographicMapCellPositionList.size() - 1;
                while (index2 >= 0) {
                final geographicMapCellPosition : GeographicMapCellPosition = (cast surroundingGeographicMapCellPositionList.get(index2) : GeographicMapCellPosition);
                if (!reusableList.contains(geographicMapCellPosition) && !occupyList.contains(geographicMapCellPosition)) {
                    reusableList.add(geographicMapCellPosition);
                }
                    index2--;
                }
            }
                index--;
            }
        }
        return reusableList;
    }

    private final surroundArray : haxe.ds.Vector<haxe.ds.Vector<Int>> = haxe.ds.Vector.fromArrayCopy([haxe.ds.Vector.fromArrayCopy([-1, -1]), haxe.ds.Vector.fromArrayCopy([0, -1]), haxe.ds.Vector.fromArrayCopy([1, -1]), haxe.ds.Vector.fromArrayCopy([-1, 1]), haxe.ds.Vector.fromArrayCopy([0, 1]), haxe.ds.Vector.fromArrayCopy([1, 1]), haxe.ds.Vector.fromArrayCopy([1, 0]), haxe.ds.Vector.fromArrayCopy([-1, 0])]);
    // throws Exception
    public function getAllSurroundingAt(geographicMapInterface : BasicGeographicMap, layerGeographicMapCellPosition : GeographicMapCellPosition, reusableSurroundingList : BasicArrayList) : BasicArrayList {
        reusableSurroundingList.clear();
        final geographicMapCellPositionFactory : BasicGeographicMapCellPositionFactory = geographicMapInterface.getGeographicMapCellPositionFactory();
        var tiledLayer : AllBinaryTiledLayer = geographicMapInterface.getAllBinaryTiledLayer();
        var row : Int = 0;
        var column : Int = 0;
        for (index in 0...8) {
            column = layerGeographicMapCellPosition.getColumn() + this.surroundArray[index][0];
            row = layerGeographicMapCellPosition.getRow() + this.surroundArray[index][1];
            if (tiledLayer.isOnTileLayer(column, row)) {
                final geographicMapCellPosition : GeographicMapCellPosition = geographicMapCellPositionFactory.getAt(column, row);
                reusableSurroundingList.add(geographicMapCellPosition);
            }
        }
        return reusableSurroundingList;
    }

    public function new() {
    }
}

