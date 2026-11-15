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
package org.allbinary.game.layer.geographic.map;

import org.allbinary.util.BasicArrayList;
import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.media.graphics.geography.map.BasicGeographicMap;
import org.allbinary.media.graphics.geography.map.CellPositionsUtil;
import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition;

class LayerCoveringCellPositionsUtil {
    private static final instance : LayerCoveringCellPositionsUtil = new LayerCoveringCellPositionsUtil();
    public static function getInstance() : LayerCoveringCellPositionsUtil {
        return LayerCoveringCellPositionsUtil.instance;
    }

    private final cellPositionsUtil : CellPositionsUtil = CellPositionsUtil.getInstance();
    // throws Exception
    public function getAllXY(geographicMapInterface : BasicGeographicMap, layerInterface : AllBinaryLayer, x : Int, y : Int, reusableList : BasicArrayList) : BasicArrayList {
        final topLeftGeographicMapCellPosition : GeographicMapCellPosition = geographicMapInterface.getCellPositionAtXY(x, y);
        return this.getAll(geographicMapInterface, topLeftGeographicMapCellPosition, layerInterface, reusableList);
    }

    // throws Exception
    public function getAll(geographicMapInterface : BasicGeographicMap, topLeftGeographicMapCellPosition : GeographicMapCellPosition, layerInterface : AllBinaryLayer, reusableList : BasicArrayList) : BasicArrayList {
        reusableList.clear();
        var columns : Int = layerInterface.getWidth() / geographicMapInterface.getAllBinaryTiledLayer().getCellWidth();
        var rows : Int = layerInterface.getHeight() / geographicMapInterface.getAllBinaryTiledLayer().getCellHeight();
        if (columns == 0) {
            columns = 1;
        }
        if (rows == 0) {
            rows = 1;
        }
        return this.cellPositionsUtil.getAll(geographicMapInterface, topLeftGeographicMapCellPosition, columns, rows, reusableList);
    }

    public function new() {
    }
}

