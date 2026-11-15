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

class PathFindingNodeCostInfoFactory extends PathFindingNodeCostInfoFactoryBase {
    private final pathFindingNodeCostInfoAdjacencyList : haxe.ds.Vector<haxe.ds.Vector<PathFindingNodeCostInfo>>;
    public function new(max : Int) {
        super();
        this.pathFindingNodeCostInfoAdjacencyList = haxe.ds.Vector.fromArrayCopy([for (index in 0...max) haxe.ds.Vector.fromArrayCopy([for (index2 in 0...max) null])]);
    }

    // throws Exception
    public override function create(geographicMapInterface : BasicGeographicMap, goingToGeographicMapCellPosition : GeographicMapCellPosition, geographicMapCellPosition : GeographicMapCellPosition, costFromStart : haxe.Int64, costToEnd : haxe.Int64) : Void {
        this.getInstance(goingToGeographicMapCellPosition, geographicMapCellPosition, costFromStart, costToEnd);
    }

    // throws Exception
    public function getInstance(goingToGeographicMapCellPosition : GeographicMapCellPosition, geographicMapCellPosition : GeographicMapCellPosition, costFromStart : haxe.Int64, costToEnd : haxe.Int64) : PathFindingNodeCostInfo {
        var pathFindingNodeCostInfo : PathFindingNodeCostInfo = this.getInstance(goingToGeographicMapCellPosition, geographicMapCellPosition);
        if (pathFindingNodeCostInfo == null) {
            pathFindingNodeCostInfo = new PathFindingNodeCostInfo(costFromStart, costToEnd);
            pathFindingNodeCostInfo.setCalculatedTotalCost();
            this.pathFindingNodeCostInfoAdjacencyList[geographicMapCellPosition.getId()][goingToGeographicMapCellPosition.getId()] = pathFindingNodeCostInfo;
        } else {
            pathFindingNodeCostInfo.setCostFromStart(costFromStart);
            pathFindingNodeCostInfo.setCostToEnd(costToEnd);
            pathFindingNodeCostInfo.setCalculatedTotalCost();
        }
        return pathFindingNodeCostInfo;
    }

    public function getInstance(goingToFromGeographicMapCellPosition : GeographicMapCellPosition, geographicMapCellPosition : GeographicMapCellPosition) : PathFindingNodeCostInfo {
        return this.pathFindingNodeCostInfoAdjacencyList[geographicMapCellPosition.getId()][goingToFromGeographicMapCellPosition.getId()];
    }

    public override function getTotalCost(geographicMapInterface : BasicGeographicMap, comingFromGeographicMapCellPosition : GeographicMapCellPosition, geographicMapCellPosition : GeographicMapCellPosition) : haxe.Int64 {
        return this.getInstance(comingFromGeographicMapCellPosition, geographicMapCellPosition).totalCostP;
    }

}

