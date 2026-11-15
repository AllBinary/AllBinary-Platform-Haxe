/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2025 AllBinary 
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

import org.allbinary.animation.caption.CaptionAnimationHelperBase;
import org.allbinary.game.identification.Group;
import org.allbinary.game.layer.waypoint.Waypoint2LogHelper;
import org.allbinary.game.layer.waypoint.WaypointLogHelper;
import org.allbinary.game.layer.waypoint.WaypointRunnableLogHelper;
import org.allbinary.game.tracking.TrackingEvent;
import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.media.graphics.geography.map.GeographicMapCellHistory;
import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition;
import org.allbinary.util.BasicArrayList;

class NullPathFindingLayer implements PathFindingLayerInterface {
    public static final NULL_PATH_FINDING_LAYER : NullPathFindingLayer = new NullPathFindingLayer();
    public function getName() : String {
        throw new haxe.Exception();
    }

    // throws Exception
    public function getEndGeographicMapCellPositionList() : BasicArrayList {
        throw new haxe.Exception();
    }

    public function shouldHandleStartSameAsEnd() : Bool {
        throw new haxe.Exception();
    }

    public function getGeographicMapCellPositionArea() : GeographicMapCellPositionAreaBase {
        throw new haxe.Exception();
    }

    public function getHudPaintable() : SelectionHudPaintable {
        throw new haxe.Exception();
    }

    // throws Exception
    public function handleCost(ownerLayer : PathFindingLayerInterface) : Void {
        throw new haxe.Exception();
    }

    public function getParentLayer() : PathFindingLayerInterface {
        throw new haxe.Exception();
    }

    public function getRTSLayer2LogHelper() : RTSLayer2LogHelper {
        throw new haxe.Exception();
    }

    // throws Exception
    public function setTarget(targetGameLayer : PathFindingLayerInterface) : Void {
        throw new haxe.Exception();
    }

    // throws Exception
    public function init(geographicMapCellHistory : GeographicMapCellHistory, geographicMapCellPositionBasicArrayList : BasicArrayList) : Void {
        throw new haxe.Exception();
    }

    public function getMoveOutOfBuildAreaPath(geographicMapCellPosition : GeographicMapCellPosition) : BasicArrayList {
        throw new haxe.Exception();
    }

    // throws Exception
    public function setClosestGeographicMapCellHistory(pathsList : BasicArrayList) : Void {
        throw new haxe.Exception();
    }

    public function teleportTo(geographicMapCellPosition : GeographicMapCellPosition) : Void {
        throw new haxe.Exception();
    }

    // throws Exception
    public function setLoad(resource : Int) : Void {
        throw new haxe.Exception();
    }

    // throws Exception
    public function getSurroundingGeographicMapCellPositionList() : BasicArrayList {
        throw new haxe.Exception();
    }

    public function isSelected() : Bool {
        throw new haxe.Exception();
    }

    public function shouldAddWaypointFromBuilding() : Bool {
        throw new haxe.Exception();
    }

    public function isShowMoreCaptionStates() : Bool {
        throw new haxe.Exception();
    }

    // throws Exception
    public function trackTo(reason : String) : Void {
        throw new haxe.Exception();
    }

    // throws Exception
    public function trackToDXY(dx : Int, dy : Int) : Void {
        throw new haxe.Exception();
    }

    // throws Exception
    public function buildingChase(allbinaryLayer : AllBinaryLayer, cellPosition : GeographicMapCellPosition) : Bool {
        throw new haxe.Exception();
    }

    public function getTrackingEvent() : TrackingEvent {
        throw new haxe.Exception();
    }

    public function allStop() : Void {
        throw new haxe.Exception();
    }

    public function isWaypointListEmptyOrOnlyTargets() : Bool {
        throw new haxe.Exception();
    }

    // throws Exception
    public function getCurrentGeographicMapCellPosition() : GeographicMapCellPosition {
        throw new haxe.Exception();
    }

    // throws Exception
    public function getTopLeftGeographicMapCellPosition() : GeographicMapCellPosition {
        throw new haxe.Exception();
    }

    public function getCaptionAnimationHelper() : CaptionAnimationHelperBase {
        throw new haxe.Exception();
    }

    public function getWaypointBehavior() : WaypointBehaviorBase {
        throw new haxe.Exception();
    }

    public function getWaypointLogHelper() : WaypointLogHelper {
        throw new haxe.Exception();
    }

    public function getWaypoint2LogHelper() : Waypoint2LogHelper {
        throw new haxe.Exception();
    }

    public function getWaypointRunnableLogHelper() : WaypointRunnableLogHelper {
        throw new haxe.Exception();
    }

    public function getGroupInterface() : haxe.ds.Vector<Group> {
        throw new haxe.Exception();
    }

    // throws Exception
    public function isDestroyed() : Bool {
        throw new haxe.Exception();
    }

    public function getSourceId() : Int {
        throw new haxe.Exception();
    }

    public function new() {
    }
}

