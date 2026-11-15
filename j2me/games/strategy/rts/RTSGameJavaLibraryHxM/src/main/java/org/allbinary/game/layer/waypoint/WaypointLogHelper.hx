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
package org.allbinary.game.layer.waypoint;

import org.allbinary.game.layer.PathFindingLayerInterface;
import org.allbinary.game.layer.WaypointBehaviorBase;
import org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer;
import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition;
import org.allbinary.util.BasicArrayList;

class WaypointLogHelper {
    private static final instance : WaypointLogHelper = new WaypointLogHelper();
    public static function getInstance() : WaypointLogHelper {
        return WaypointLogHelper.instance;
    }

    public function onWaypointEvent(associatedAdvancedRTSGameLayer : PathFindingLayerInterface, advancedRTSGameLayer : PathFindingLayerInterface) : Void {
    }

    public function addWaypointFromBuilding(associatedAdvancedRTSGameLayer : PathFindingLayerInterface, advancedRTSGameLayer : PathFindingLayerInterface) : Void {
    }

    public function addWaypointFromBuildingList(associatedAdvancedRTSGameLayer : PathFindingLayerInterface, advancedRTSGameLayer : PathFindingLayerInterface, list : BasicArrayList) : Void {
    }

    public function insertWaypoint(associatedAdvancedRTSGameLayer : PathFindingLayerInterface, index : Int, rtsLayer : CollidableDestroyableDamageableLayer, waypointName : String) : Void {
    }

    public function insertWaypointList(associatedAdvancedRTSGameLayer : PathFindingLayerInterface, index : Int, rtsLayer : CollidableDestroyableDamageableLayer, waypointName : String, list : BasicArrayList) : Void {
    }

    public function setRandomGeographicMapCellHistoryList(associatedAdvancedRTSGameLayer : PathFindingLayerInterface, pathsList : BasicArrayList) : Void {
    }

    public function moveAwayFromBuilding(associatedAdvancedRTSGameLayer : PathFindingLayerInterface) : Void {
    }

    public function needToMove(associatedAdvancedRTSGameLayer : PathFindingLayerInterface, unitWaypointBehavior : WaypointBehaviorBase) : Void {
    }

    public function setRandomGeographicMapCellHistory(associatedAdvancedRTSGameLayer : PathFindingLayerInterface) : Void {
    }

    public function setCurrentPathGeographicMapCellPosition(associatedAdvancedRTSGameLayer : PathFindingLayerInterface, existingCurrentPathGeographicMapCellPosition : GeographicMapCellPosition, currentPathGeographicMapCellPosition : GeographicMapCellPosition) : Void {
    }

    public function setNextUnvisitedPathGeographicMapCellPosition(associatedAdvancedRTSGameLayer : PathFindingLayerInterface, existingNextUnvisitedPathGeographicMapCellPosition : GeographicMapCellPosition, nextUnvisitedPathGeographicMapCellPosition : GeographicMapCellPosition) : Void {
    }

    public function new() {
    }
}

