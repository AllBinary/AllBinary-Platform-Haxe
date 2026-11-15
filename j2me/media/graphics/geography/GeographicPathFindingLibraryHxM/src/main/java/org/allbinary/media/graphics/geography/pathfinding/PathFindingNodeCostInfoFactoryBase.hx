/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2022 AllBinary 
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

class PathFindingNodeCostInfoFactoryBase implements PathFindingNodeCostInfoFactoryBaseInterface {
    public static final NULL_PATH_FINDING_NODE_COST_INFO_FACTORY_BASE : PathFindingNodeCostInfoFactoryBase = new PathFindingNodeCostInfoFactoryBase();
    // throws Exception
    public function create(geographicMapInterface : BasicGeographicMap, comingFromGeographicMapCellPosition : GeographicMapCellPosition, geographicMapCellPosition : GeographicMapCellPosition, costFromStart : haxe.Int64, costToEnd : haxe.Int64) : Void {
        throw new haxe.Exception();
    }

    // throws Exception
    public function getTotalCost(geographicMapInterface : BasicGeographicMap, comingFromGeographicMapCellPosition : GeographicMapCellPosition, geographicMapCellPosition : GeographicMapCellPosition) : haxe.Int64 {
        throw new haxe.Exception();
    }

    public function new() {
    }
}

