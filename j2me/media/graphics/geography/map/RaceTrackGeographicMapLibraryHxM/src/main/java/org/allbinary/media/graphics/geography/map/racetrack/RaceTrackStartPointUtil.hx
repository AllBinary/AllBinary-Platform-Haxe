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

import org.allbinary.util.BasicArrayList;
import org.allbinary.graphics.GPoint;
import org.allbinary.graphics.PointFactory;
import org.allbinary.media.graphics.geography.map.BasicGeographicMap;
import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition;
import org.allbinary.media.graphics.geography.pathfinding.PathFindingInfo;
import org.allbinary.media.graphics.geography.pathfinding.PathFindingNode;

class RaceTrackStartPointUtil {
    // throws Exception
    public static function get(geographicMapInterface : BasicGeographicMap, pathFindingInfo : PathFindingInfo, index : Int) : GPoint {
        final list : BasicArrayList = pathFindingInfo.getStartPathFindingNodeList();
        final startPathFindingNode : PathFindingNode = (cast list.get(index) : PathFindingNode);
        final geographicMapCellPosition : GeographicMapCellPosition = startPathFindingNode.geographicMapCellPosition;
        final point : GPoint = geographicMapCellPosition.getPoint();
        return PointFactory.getInstance().createXY(point.getX(), point.getY() + geographicMapInterface.getAllBinaryTiledLayer().getHalfCellHeight());
    }

    public function new() {
    }
}

