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

import org.allbinary.animation.caption.CaptionAnimationHelperBase;
import org.allbinary.game.layer.WaypointBehaviorBase;
import org.allbinary.game.tracking.TrackingEvent;
import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.media.graphics.geography.map.GeographicMapCellHistory;
import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition;
import org.allbinary.util.BasicArrayList;

interface WaypointLayerInterface {
    // throws Exception
    function init(geographicMapCellHistory : GeographicMapCellHistory, geographicMapCellPositionBasicArrayList : BasicArrayList) : Void;

    function getMoveOutOfBuildAreaPath(geographicMapCellPosition : GeographicMapCellPosition) : BasicArrayList;

    // throws Exception
    function setClosestGeographicMapCellHistory(pathsList : BasicArrayList) : Void;

    function teleportTo(geographicMapCellPosition : GeographicMapCellPosition) : Void;

    // throws Exception
    function setLoad(resource : Int) : Void;

    // throws Exception
    function getSurroundingGeographicMapCellPositionList() : BasicArrayList;

    function isSelected() : Bool;

    function shouldAddWaypointFromBuilding() : Bool;

    function isShowMoreCaptionStates() : Bool;

    // throws Exception
    function trackTo(reason : String) : Void;

    // throws Exception
    function trackToDXY(dx : Int, dy : Int) : Void;

    // throws Exception
    function buildingChase(allbinaryLayer : AllBinaryLayer, cellPosition : GeographicMapCellPosition) : Bool;

    function getTrackingEvent() : TrackingEvent;

    function allStop() : Void;

    function isWaypointListEmptyOrOnlyTargets() : Bool;

    // throws Exception
    function getCurrentGeographicMapCellPosition() : GeographicMapCellPosition;

    // throws Exception
    function getTopLeftGeographicMapCellPosition() : GeographicMapCellPosition;

    function getCaptionAnimationHelper() : CaptionAnimationHelperBase;

    function getWaypointBehavior() : WaypointBehaviorBase;

    function getWaypointLogHelper() : WaypointLogHelper;

    function getWaypoint2LogHelper() : Waypoint2LogHelper;

    function getWaypointRunnableLogHelper() : WaypointRunnableLogHelper;

}

