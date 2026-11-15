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
import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition;
import org.allbinary.media.graphics.geography.map.SimpleGeographicMapCellPositionFactory;

class LayerPartialCellPositionsUtil {
    private static final instance : LayerPartialCellPositionsUtil = new LayerPartialCellPositionsUtil();
    // throws Exception
    public function getAll(geographicMapInterface : BasicGeographicMap, layerInterface : AllBinaryLayer, reusableList : BasicArrayList) : BasicArrayList {
        reusableList.clear();
        var topLeftGeographicMapCellPosition : GeographicMapCellPosition = geographicMapInterface.getCellPositionAtXYNoThrow(layerInterface.getXP(), layerInterface.getYP());
        var topRightGeographicMapCellPosition : GeographicMapCellPosition = geographicMapInterface.getCellPositionAtXYNoThrow(layerInterface.getXP() + layerInterface.getWidth(), layerInterface.getYP());
        var bottomLeftGeographicMapCellPosition : GeographicMapCellPosition = geographicMapInterface.getCellPositionAtXYNoThrow(layerInterface.getXP(), layerInterface.getYP() + layerInterface.getHeight());
        var bottomRightGeographicMapCellPosition : GeographicMapCellPosition = geographicMapInterface.getCellPositionAtXYNoThrow(layerInterface.getXP() + layerInterface.getWidth(), layerInterface.getYP() + layerInterface.getHeight());
        if (topLeftGeographicMapCellPosition != SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION) {
            reusableList.add(topLeftGeographicMapCellPosition);
        }
        if (topRightGeographicMapCellPosition != SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION && topLeftGeographicMapCellPosition != topRightGeographicMapCellPosition) {
            reusableList.add(topRightGeographicMapCellPosition);
        }
        if (bottomLeftGeographicMapCellPosition != SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION && !reusableList.contains(bottomLeftGeographicMapCellPosition)) {
            reusableList.add(bottomLeftGeographicMapCellPosition);
        }
        if (bottomRightGeographicMapCellPosition != SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION && !reusableList.contains(bottomRightGeographicMapCellPosition)) {
            reusableList.add(bottomRightGeographicMapCellPosition);
        }
        return reusableList;
    }

    // throws Exception
    public function getAllDXY(geographicMapInterface : BasicGeographicMap, layerInterface : AllBinaryLayer, dx : Int, dy : Int, reusableList : BasicArrayList) : BasicArrayList {
        reusableList.clear();
        var topLeftGeographicMapCellPosition : GeographicMapCellPosition = geographicMapInterface.getCellPositionAtXYNoThrow(layerInterface.getXP() + dx, layerInterface.getYP() + dy);
        var topRightGeographicMapCellPosition : GeographicMapCellPosition = geographicMapInterface.getCellPositionAtXYNoThrow(layerInterface.getXP() + layerInterface.getWidth() + dx, layerInterface.getYP() + dy);
        var bottomLeftGeographicMapCellPosition : GeographicMapCellPosition = geographicMapInterface.getCellPositionAtXYNoThrow(layerInterface.getXP() + dx, layerInterface.getYP() + layerInterface.getHeight() + dy);
        var bottomRightGeographicMapCellPosition : GeographicMapCellPosition = geographicMapInterface.getCellPositionAtXYNoThrow(layerInterface.getXP() + layerInterface.getWidth() + dx, layerInterface.getYP() + layerInterface.getHeight() + dy);
        if (topLeftGeographicMapCellPosition != SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION) {
            reusableList.add(topLeftGeographicMapCellPosition);
        }
        if (topRightGeographicMapCellPosition != SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION && topLeftGeographicMapCellPosition != topRightGeographicMapCellPosition) {
            reusableList.add(topRightGeographicMapCellPosition);
        }
        if (bottomLeftGeographicMapCellPosition != SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION && !reusableList.contains(bottomLeftGeographicMapCellPosition)) {
            reusableList.add(bottomLeftGeographicMapCellPosition);
        }
        if (bottomRightGeographicMapCellPosition != SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION && !reusableList.contains(bottomRightGeographicMapCellPosition)) {
            reusableList.add(bottomRightGeographicMapCellPosition);
        }
        return reusableList;
    }

    public static function getInstance() : LayerPartialCellPositionsUtil {
        return LayerPartialCellPositionsUtil.instance;
    }

    public function new() {
    }
}

