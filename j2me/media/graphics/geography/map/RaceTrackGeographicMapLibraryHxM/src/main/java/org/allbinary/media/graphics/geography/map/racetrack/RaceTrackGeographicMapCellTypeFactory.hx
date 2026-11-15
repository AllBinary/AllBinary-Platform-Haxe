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
package org.allbinary.media.graphics.geography.map.racetrack;

import org.allbinary.media.graphics.geography.map.GeographicMapCellType;
import org.allbinary.media.graphics.geography.map.GeographicMapCellTypeFactory;

class RaceTrackGeographicMapCellTypeFactory extends GeographicMapCellTypeFactory {
    private static final instanceC : RaceTrackGeographicMapCellTypeFactory = new RaceTrackGeographicMapCellTypeFactory();
    public static function getInstance() : RaceTrackGeographicMapCellTypeFactory {
        return RaceTrackGeographicMapCellTypeFactory.instanceC;
    }

    public var EMPTY_CELL_TYPE : GeographicMapCellType = new GeographicMapCellType(0, -1);
    public var EASY_CELL_TYPE : GeographicMapCellType = this.EMPTY_CELL_TYPE;
    public final BOTTOM_LEFT_TURN_ROAD_CELL_TYPE : RaceTrackGeographicMapCellType;
    public final BOTTOM_RIGHT_TURN_ROAD_CELL_TYPE : RaceTrackGeographicMapCellType;
    public final TOP_LEFT_TURN_ROAD_CELL_TYPE : RaceTrackGeographicMapCellType;
    public final TOP_RIGHT_TURN_ROAD_CELL_TYPE : RaceTrackGeographicMapCellType;
    public final HORIZONTAL_STRAIGHT_ROAD_CELL_TYPE : RaceTrackGeographicMapCellType;
    public final VERTICAL_STRAIGHT_ROAD_CELL_TYPE : RaceTrackGeographicMapCellType;
    public final START_LINE_ROAD_CELL_TYPE : RaceTrackGeographicMapCellType;
    public final DEFAULT_FINISH_LINE_ROAD_CELL_TYPE : RaceTrackGeographicMapCellType;
    public var FINISH_LINE_ROAD_CELL_TYPE : GeographicMapCellType = GeographicMapCellType.NULL_GEOGRAPHIC_MAP_CELL_TYPE;
    public function new() {
        super();
        final raceTrackGeographicMapCellTypes : RaceTrackGeographicMapCellTypes = RaceTrackGeographicMapCellTypes.getInstance();
        this.BOTTOM_LEFT_TURN_ROAD_CELL_TYPE = raceTrackGeographicMapCellTypes.BOTTOM_LEFT_TURN_ROAD_CELL_TYPE;
        this.BOTTOM_RIGHT_TURN_ROAD_CELL_TYPE = raceTrackGeographicMapCellTypes.BOTTOM_RIGHT_TURN_ROAD_CELL_TYPE;
        this.TOP_LEFT_TURN_ROAD_CELL_TYPE = raceTrackGeographicMapCellTypes.TOP_LEFT_TURN_ROAD_CELL_TYPE;
        this.TOP_RIGHT_TURN_ROAD_CELL_TYPE = raceTrackGeographicMapCellTypes.TOP_RIGHT_TURN_ROAD_CELL_TYPE;
        this.HORIZONTAL_STRAIGHT_ROAD_CELL_TYPE = raceTrackGeographicMapCellTypes.HORIZONTAL_STRAIGHT_ROAD_CELL_TYPE;
        this.VERTICAL_STRAIGHT_ROAD_CELL_TYPE = raceTrackGeographicMapCellTypes.VERTICAL_STRAIGHT_ROAD_CELL_TYPE;
        this.START_LINE_ROAD_CELL_TYPE = raceTrackGeographicMapCellTypes.START_LINE_ROAD_CELL_TYPE;
        this.DEFAULT_FINISH_LINE_ROAD_CELL_TYPE = raceTrackGeographicMapCellTypes.DEFAULT_FINISH_LINE_ROAD_CELL_TYPE;
    }

    public override function getStartType() : Int {
        return this.START_LINE_ROAD_CELL_TYPE.getType();
    }

    public override function getEndType() : Int {
        return this.FINISH_LINE_ROAD_CELL_TYPE.getType();
    }

    public override function getEmptyType() : Int {
        return this.EMPTY_CELL_TYPE.getType();
    }

    public override function isPath(cellType : GeographicMapCellType) : Bool {
        if (cellType != this.EMPTY_CELL_TYPE && cellType != this.EASY_CELL_TYPE) {
            return true;
        }
        return false;
    }

}

