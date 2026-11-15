/*
 *
 * AllBinary Open License Version 1
 * Copyright (c) 2006 AllBinary
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

import org.allbinary.media.graphics.geography.map.BasicGeographicMap;
import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition;
import org.allbinary.media.graphics.geography.map.GeographicMapCellType;
import org.allbinary.media.graphics.geography.map.racetrack.RaceTrackGeographicMapCellType;

class PathFindingNodeCostInfoFactory extends PathFindingNodeCostInfoFactoryBase {
    public function new(max : Int) {
        super();
    }

    // throws Exception
    public override function create(geographicMapInterface : BasicGeographicMap, goingToGeographicMapCellPosition : GeographicMapCellPosition, geographicMapCellPosition : GeographicMapCellPosition, costFromStart : haxe.Int64, costToEnd : haxe.Int64) : Void {
    }

    // throws Exception
    public override function getTotalCost(geographicMapInterface : BasicGeographicMap, comingFromGeographicMapCellPosition : GeographicMapCellPosition, geographicMapCellPosition : GeographicMapCellPosition) : haxe.Int64 {
        final geographicMapCellType : GeographicMapCellType = geographicMapInterface.getCellTypeAt(comingFromGeographicMapCellPosition);
        final geographicMapCellType2 : GeographicMapCellType = geographicMapInterface.getCellTypeAt(geographicMapCellPosition);
        final raceTrackGeographicMapCellType : RaceTrackGeographicMapCellType = (cast geographicMapCellType : RaceTrackGeographicMapCellType);
        final raceTrackGeographicMapCellType2 : RaceTrackGeographicMapCellType = (cast geographicMapCellType2 : RaceTrackGeographicMapCellType);
        return haxe.Int64.ofInt(raceTrackGeographicMapCellType.getTravelCost()) + raceTrackGeographicMapCellType2.getTravelCost();
    }

}

