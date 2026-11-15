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

import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition;

interface PathFindingNodeCostInfoFactoryInterface extends PathFindingNodeCostInfoFactoryBaseInterface {
    // throws Exception
    function getInstance(comingFromGeographicMapCellPosition : GeographicMapCellPosition, geographicMapCellPosition : GeographicMapCellPosition, costFromStart : haxe.Int64, costToEnd : haxe.Int64) : PathFindingNodeCostInfo;

    function getInstance(comingFromGeographicMapCellPosition : GeographicMapCellPosition, geographicMapCellPosition : GeographicMapCellPosition) : PathFindingNodeCostInfo;

    function getTotalCost(comingFromGeographicMapCellPosition : GeographicMapCellPosition, geographicMapCellPosition : GeographicMapCellPosition) : haxe.Int64;

}

