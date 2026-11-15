/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2003 AllBinary 
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
package org.allbinary.game.layer;

import org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer;
import org.allbinary.game.layer.waypoint.WaypointBase;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.game.tick.TickableInterface;
import org.allbinary.layer.AllBinaryLayerManager;
import org.allbinary.media.graphics.geography.map.GeographicMapCellHistory;
import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition;
import org.allbinary.util.BasicArrayListS;

class WaypointBehaviorBase implements TickableInterface {
    private final ownedWaypointList : BasicArrayList;
    public var waypointOverridesAttacking : Bool = true;
    private var waypoint : WaypointBase = WaypointBase.NULL_WAYPOINT_BASE;
    public function new() {
        this.ownedWaypointList = new BasicArrayListS(1);
    }

    public function getName() : String {
        return Type.getClassName(Type.getClass(this));
    }

    public function isRunning() : Bool {
        return false;
    }

    // throws Exception
    public function processTick(allBinaryLayerManager : AllBinaryLayerManager) : Void {
    }

    public function getOwnedWaypointList() : BasicArrayList {
        return this.ownedWaypointList;
    }

    public function getWaypoint() : WaypointBase {
        return this.waypoint;
    }

    public function setWaypoint(waypoint : WaypointBase) : Void {
        this.waypoint = waypoint;
    }

    public function getSteeringVisitorList() : BasicArrayList {
        return this.steeringVisitorList;
    }

    public function getMovementLogicAsString() : String {
        throw new haxe.Exception();
    }

    public function isWaypointListEmptyOrOnlyTargets() : Bool {
        throw new haxe.Exception();
    }

    public function isInSensorRange(layerInterface : CollidableDestroyableDamageableLayer, targetDistance : Int) : Bool {
        throw new haxe.Exception();
    }

    public function getCurrentTargetLayerInterface() : CollidableDestroyableDamageableLayer {
        throw new haxe.Exception();
    }

    public function getCurrentTargetingStateString() : String {
        throw new haxe.Exception();
    }

    public function isTrackingWaypoint() : Bool {
        throw new haxe.Exception();
    }

    public function getCurrentPathGeographicMapCellPosition() : GeographicMapCellPosition {
        throw new haxe.Exception();
    }

    public function getCurrentGeographicMapCellHistory() : GeographicMapCellHistory {
        throw new haxe.Exception();
    }

    public function isWaypointOverridesAttacking() : Bool {
        return this.waypointOverridesAttacking;
    }

    public function getNextUnvisitedPathGeographicMapCellPosition() : GeographicMapCellPosition {
        throw new haxe.Exception();
    }

    public function needToMove() : Bool {
        throw new haxe.Exception();
    }

    public function setWaypointPathsList(waypointPathsList : BasicArrayList) : Void {
        throw new haxe.Exception();
    }

    public function getWaypointPathsList() : BasicArrayList {
        throw new haxe.Exception();
    }

    // throws Exception
    public function setTarget(layerInterface : PathFindingLayerInterface) : Void {
        throw new haxe.Exception();
    }

    // throws Exception
    public function setTargetWithDistance(layerInterface : PathFindingLayerInterface, anotherTargetDistance : Int) : Void {
        throw new haxe.Exception();
    }

    // throws Exception
    public function clearTarget() : Void {
        throw new haxe.Exception();
    }

    // throws Exception
    public function updatePathOnTargetMove(reason : String) : Void {
    }

    private final steeringVisitorList : BasicArrayList = new BasicArrayListD();
}

