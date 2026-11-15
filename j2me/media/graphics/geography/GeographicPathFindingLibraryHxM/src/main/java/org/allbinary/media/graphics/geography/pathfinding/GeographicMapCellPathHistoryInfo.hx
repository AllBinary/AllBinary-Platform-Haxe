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
package org.allbinary.media.graphics.geography.pathfinding;

import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition;
import org.allbinary.media.graphics.geography.map.SimpleGeographicMapCellPositionFactory;

class GeographicMapCellPathHistoryInfo {
    private var previousGeographicMapCellPosition : GeographicMapCellPosition = SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION;
    private var previousOnPathGeographicMapCellPosition : GeographicMapCellPosition = SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION;
    private var nextUnvisitedOnPathGeographicMapCellPosition : GeographicMapCellPosition = SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION;
    private var nextOnPathGeographicMapCellPosition : GeographicMapCellPosition = SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION;
    private var nextChosenOnPathGeographicMapCellPosition : GeographicMapCellPosition = SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION;
    public function getPreviousGeographicMapCellPosition() : GeographicMapCellPosition {
        return this.previousGeographicMapCellPosition;
    }

    public function setPreviousGeographicMapCellPosition(previousGeographicMapCellPosition : GeographicMapCellPosition) : Void {
        this.previousGeographicMapCellPosition = previousGeographicMapCellPosition;
    }

    public function getPreviousOnPathGeographicMapCellPosition() : GeographicMapCellPosition {
        return this.previousOnPathGeographicMapCellPosition;
    }

    public function setPreviousOnPathGeographicMapCellPosition(previousOnPathGeographicMapCellPosition : GeographicMapCellPosition) : Void {
        this.previousOnPathGeographicMapCellPosition = previousOnPathGeographicMapCellPosition;
    }

    public function getNextUnvisitedOnPathGeographicMapCellPosition() : GeographicMapCellPosition {
        return this.nextUnvisitedOnPathGeographicMapCellPosition;
    }

    public function setNextUnvisitedOnPathGeographicMapCellPosition(nextUnvisitedOnPathGeographicMapCellPosition : GeographicMapCellPosition) : Void {
        this.nextUnvisitedOnPathGeographicMapCellPosition = nextUnvisitedOnPathGeographicMapCellPosition;
    }

    public function getNextOnPathGeographicMapCellPosition() : GeographicMapCellPosition {
        return this.nextOnPathGeographicMapCellPosition;
    }

    public function setNextOnPathGeographicMapCellPosition(nextOnPathGeographicMapCellPosition : GeographicMapCellPosition) : Void {
        this.nextOnPathGeographicMapCellPosition = nextOnPathGeographicMapCellPosition;
    }

    public function getNextChosenOnPathGeographicMapCellPosition() : GeographicMapCellPosition {
        return this.nextChosenOnPathGeographicMapCellPosition;
    }

    public function setNextChosenOnPathGeographicMapCellPosition(nextChosenOnPathGeographicMapCellPosition : GeographicMapCellPosition) : Void {
        this.nextChosenOnPathGeographicMapCellPosition = nextChosenOnPathGeographicMapCellPosition;
    }

    public function new() {
    }
}

