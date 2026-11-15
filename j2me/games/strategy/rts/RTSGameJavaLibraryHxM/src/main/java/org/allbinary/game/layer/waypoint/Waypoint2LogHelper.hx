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
import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition;
import org.allbinary.util.BasicArrayList;

class Waypoint2LogHelper {
    private static final instance : Waypoint2LogHelper = new Waypoint2LogHelper();
    public static function getInstance() : Waypoint2LogHelper {
        return Waypoint2LogHelper.instance;
    }

    public function initRange(associatedAdvancedRTSGameLayer : PathFindingLayerInterface, closeRange : Int, sensorRange : Int) : Void {
    }

    public function processPossibleTarget(associatedAdvancedRTSGameLayer : PathFindingLayerInterface, unitWaypointBehavior2 : WaypointBehaviorBase, layerInterface : PathFindingLayerInterface, anotherTargetDistance : Int, isShorterThanCurrentTargetDistance : Bool, isCurrentTargetDestroyed : Bool) : Void {
    }

    public function processSetTarget(associatedAdvancedRTSGameLayer : PathFindingLayerInterface, unitWaypointBehavior2 : WaypointBehaviorBase, layerInterface : PathFindingLayerInterface, anotherTargetDistance : Int) : Void {
    }

    public function processPossibleTargetCloser(associatedAdvancedRTSGameLayer : PathFindingLayerInterface, unitWaypointBehavior2 : WaypointBehaviorBase, layerInterface : PathFindingLayerInterface, anotherTargetDistance : Int) : Void {
    }

    public function setTarget(associatedAdvancedRTSGameLayer : PathFindingLayerInterface, unitWaypointBehavior2 : WaypointBehaviorBase, layerInterface : PathFindingLayerInterface, anotherTargetDistance : Int) : Void {
    }

    public function setTargetPath(associatedAdvancedRTSGameLayer : PathFindingLayerInterface) : Void {
    }

    public function setTargetPathIgnoreNewPath(associatedAdvancedRTSGameLayer : PathFindingLayerInterface, unitWaypointBehavior2 : WaypointBehaviorBase) : Void {
    }

    public function processWaypoint(associatedAdvancedRTSGameLayer : PathFindingLayerInterface, unitWaypointBehavior2 : WaypointBehaviorBase, targetLayer : PathFindingLayerInterface, size : Int) : Void {
    }

    public function processWaypointTracked(associatedAdvancedRTSGameLayer : PathFindingLayerInterface, unitWaypointBehavior2 : WaypointBehaviorBase) : Void {
    }

    public function processWaypointTrackedVisit(associatedAdvancedRTSGameLayer : PathFindingLayerInterface, geographicMapCellPosition : GeographicMapCellPosition) : Void {
    }

    public function processWaypointTrackedWithoutProgress(associatedAdvancedRTSGameLayer : PathFindingLayerInterface, reason : String) : Void {
    }

    public function wander(associatedAdvancedRTSGameLayer : PathFindingLayerInterface) : Void {
    }

    public function targetDestroyed(associatedAdvancedRTSGameLayer : PathFindingLayerInterface) : Void {
    }

    public function processTargeting(associatedAdvancedRTSGameLayer : PathFindingLayerInterface, dx : Int, dy : Int) : Void {
    }

    public function processTargetingNonWayPoint(associatedAdvancedRTSGameLayer : PathFindingLayerInterface, dx : Int, dy : Int) : Void {
    }

    public function removeWaypoint(associatedAdvancedRTSGameLayer : PathFindingLayerInterface, unitWaypointBehavior2 : WaypointBehaviorBase, waypointLayer : PathFindingLayerInterface, reason : String) : Void {
    }

    public function removeWaypointList(associatedAdvancedRTSGameLayer : PathFindingLayerInterface, unitWaypointBehavior2 : WaypointBehaviorBase, list : BasicArrayList) : Void {
    }

    public function removeWaypointClear(associatedAdvancedRTSGameLayer : PathFindingLayerInterface) : Void {
    }

    public function clearTarget(associatedAdvancedRTSGameLayer : PathFindingLayerInterface) : Void {
    }

    public function addWaypointFromUser(associatedAdvancedRTSGameLayer : PathFindingLayerInterface, advancedRTSGameLayer : PathFindingLayerInterface) : Void {
    }

    public function targetMovedSoRetarget(associatedAdvancedRTSGameLayer : PathFindingLayerInterface) : Void {
    }

    public function new() {
    }
}

