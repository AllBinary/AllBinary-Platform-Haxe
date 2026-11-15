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

import org.allbinary.game.layer.AllBinaryGameLayerManager;
import org.allbinary.game.layer.PathFindingLayerInterface;
import org.allbinary.logic.communication.log.ForcedLogUtil;
import org.allbinary.logic.util.event.AllBinaryEventObject;
import org.allbinary.logic.util.event.EventListenerInterface;
import org.allbinary.logic.util.event.EventStrings;
import org.allbinary.media.audio.NoSound;
import org.allbinary.media.audio.Sound;
import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition;
import org.allbinary.media.graphics.geography.pathfinding.MultipassState;
import org.allbinary.media.graphics.geography.pathfinding.PathFindingInfo;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class WaypointBase implements EventListenerInterface {
    public static var NULL_WAYPOINT_BASE : WaypointBase = new WaypointBase(NoSound.getInstance());
    private final connectedWaypointList : BasicArrayList = new BasicArrayListD();
    private final sound : Sound;
    public var allBinaryGameLayerManagerP : AllBinaryGameLayerManager = AllBinaryGameLayerManager.getNullInstance();
    public function new(sound : Sound) {
        this.sound = sound;
    }

    public function getSound() : Sound {
        return this.sound;
    }

    // throws Exception
    public function setAllBinaryGameLayerManager(allBinaryGameLayerManager : AllBinaryGameLayerManager) : Void {
        this.allBinaryGameLayerManagerP = allBinaryGameLayerManager;
    }

    public function getConnectedWaypointList() : BasicArrayList {
        return this.connectedWaypointList;
    }

    public function onEvent(eventObject : AllBinaryEventObject) : Void {
        ForcedLogUtil.log(EventStrings.getInstance().PERFORMANCE_MESSAGE, this);
    }

    // throws Exception
    public function getPathFindingInfo(geographicMapCellPosition : GeographicMapCellPosition) : PathFindingInfo {
        throw new haxe.Exception();
    }

    // throws Exception
    public function getPathsList(geographicMapCellPosition : GeographicMapCellPosition, pathFindingInfo : PathFindingInfo, multipassState : MultipassState) : BasicArrayList {
        throw new haxe.Exception();
    }

    // throws Exception
    public function getPathsListRunnable(geographicMapCellPosition : GeographicMapCellPosition) : BasicArrayList {
        throw new haxe.Exception();
    }

    // throws Exception
    public function getPathsListFromCacheOnly(geographicMapCellPosition : GeographicMapCellPosition) : BasicArrayList {
        throw new haxe.Exception();
    }

    // throws Exception
    public function visit(unitLayer : PathFindingLayerInterface) : Void {
    }

    public function reset() : Void {
    }

    public function getType() : Int {
        return 0;
    }

}

