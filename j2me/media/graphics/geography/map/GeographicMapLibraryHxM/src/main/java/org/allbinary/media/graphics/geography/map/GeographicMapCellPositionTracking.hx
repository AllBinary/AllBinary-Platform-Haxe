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

import org.allbinary.game.displayable.canvas.AllBinaryGameCanvasInterface;
import org.allbinary.layer.AllBinaryLayer;

class GeographicMapCellPositionTracking {
    private var currentGeographicMapCellPosition : GeographicMapCellPosition = SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION;
    private var previousGeographicMapCellPosition : GeographicMapCellPosition = SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION;
    private var newGeographicMapCellPosition : GeographicMapCellPosition = SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION;
    private var currentCellType : GeographicMapCellType = GeographicMapCellType.NULL_GEOGRAPHIC_MAP_CELL_TYPE;
    public function new() {
    }

    // throws Exception
    public function getCurrentOverCellType(geographicMap : BasicGeographicMap) : GeographicMapCellType {
        final geographicMapCellPosition : GeographicMapCellPosition = this.currentGeographicMapCellPosition;
        if (geographicMapCellPosition != this.previousGeographicMapCellPosition) {
            this.currentCellType = geographicMap.getCellTypeAt(geographicMapCellPosition);
        }
        return this.currentCellType;
    }

    // throws Exception
    public function updateStart(gameCanvasInterface : AllBinaryGameCanvasInterface, layer : AllBinaryLayer) : Bool {
        if (gameCanvasInterface != SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION) {
            final geographicMapCompositeInterface : GeographicMapCompositeInterface = (cast gameCanvasInterface.getLayerManager() : GeographicMapCompositeInterface);
            final geographicMapInterface : BasicGeographicMap = geographicMapCompositeInterface.getGeographicMapInterface()[0];
            this.newGeographicMapCellPosition = geographicMapInterface.getCellPositionAtXY(layer.getXP() + layer.getHalfWidth(), layer.getYP() + layer.getHalfHeight());
            if (this.newGeographicMapCellPosition != this.currentGeographicMapCellPosition) {
                this.currentGeographicMapCellPosition = this.newGeographicMapCellPosition;
                return true;
            }
        }
        return false;
    }

    public function updateEnd() : Bool {
        if (this.currentGeographicMapCellPosition != this.previousGeographicMapCellPosition) {
            this.previousGeographicMapCellPosition = this.currentGeographicMapCellPosition;
            return true;
        }
        return false;
    }

    public function getPreviousGeographicMapCellPosition() : GeographicMapCellPosition {
        return this.previousGeographicMapCellPosition;
    }

    public function getCurrentGeographicMapCellPosition() : GeographicMapCellPosition {
        return this.currentGeographicMapCellPosition;
    }

}

