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
package org.allbinary.game.layer.waypoint;

import org.allbinary.game.layer.AllBinaryGameLayerManager;
import org.allbinary.game.layer.PathFindingLayerInterface;
import org.allbinary.game.layer.RTSLayerEvent;
import org.allbinary.game.layer.building.event.BuildingEventListenerInterface;
import org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer;
import org.allbinary.game.layer.unit.UnitWaypointBehavior;
import org.allbinary.game.media.graphics.geography.map.racetrack.PathFindingInfoFactory;
import org.allbinary.logic.communication.log.ForcedLogUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;
import org.allbinary.logic.util.event.AllBinaryEventObject;
import org.allbinary.logic.util.event.EventStrings;
import org.allbinary.media.audio.Sound;
import org.allbinary.media.graphics.geography.map.BasicGeographicMap;
import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition;
import org.allbinary.media.graphics.geography.map.GeographicMapCellTypeFactory;
import org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface;
import org.allbinary.media.graphics.geography.map.racetrack.CustomMapGenerator;
import org.allbinary.media.graphics.geography.map.racetrack.RaceTrackGeographicMap;
import org.allbinary.media.graphics.geography.pathfinding.MultipassState;
import org.allbinary.media.graphics.geography.pathfinding.PathFindingInfo;
import org.allbinary.media.graphics.geography.pathfinding.PathGenerator;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListUtil;

class MultipassNoCacheWaypoint extends WaypointBase implements BuildingEventListenerInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final ownerLayer : PathFindingLayerInterface;
    public function new(ownerLayer : PathFindingLayerInterface, sound : Sound) {
        super(sound);
        this.ownerLayer = ownerLayer;
    }

    // throws Exception
    public override function setAllBinaryGameLayerManager(allBinaryGameLayerManager : AllBinaryGameLayerManager) : Void {
        super.setAllBinaryGameLayerManager(allBinaryGameLayerManager);
    }

    public function releaseCachedPaths() : Void {
    }

    // throws Exception
    public override function getPathFindingInfo(geographicMapCellPosition : GeographicMapCellPosition) : PathFindingInfo {
        final startGeographicMapCellPosition : GeographicMapCellPosition = geographicMapCellPosition;
        final endGeographicMapCellPosition : GeographicMapCellPosition = this.getEndGeographicMapCellPosition(startGeographicMapCellPosition);
        if (endGeographicMapCellPosition == null) {
            return PathFindingInfo.NULL_PATH_FINDING_INFO;
        }
        if (startGeographicMapCellPosition == endGeographicMapCellPosition) {
            if (this.ownerLayer.shouldHandleStartSameAsEnd()) {
                return PathFindingInfo.NULL_PATH_FINDING_INFO;
            } else {
                throw new haxe.Exception("Start should not be End: " + endGeographicMapCellPosition);
            }
        }
        final geographicMapCompositeInterface : GeographicMapCompositeInterface = (cast this.allBinaryGameLayerManagerP : GeographicMapCompositeInterface);
        final geographicMapInterface : BasicGeographicMap = geographicMapCompositeInterface.getGeographicMapInterface()[0];
        final raceTrackGeographicMap : RaceTrackGeographicMap = (cast geographicMapInterface : RaceTrackGeographicMap);
        final raceTrackGeographicMapCellTypeFactory : GeographicMapCellTypeFactory = raceTrackGeographicMap.getGeographicMapCellTypeFactory();
        final customMapGenerator : CustomMapGenerator = (cast raceTrackGeographicMap.getCustomMapGenerator() : CustomMapGenerator);
        customMapGenerator.copyMapIntoCustomMap();
        final customMapArray : haxe.ds.Vector<haxe.ds.Vector<Int>> = customMapGenerator.getCustomMapArray();
        customMapArray[startGeographicMapCellPosition.getRow()][startGeographicMapCellPosition.getColumn()] = raceTrackGeographicMapCellTypeFactory.getStartType();
        customMapArray[endGeographicMapCellPosition.getRow()][endGeographicMapCellPosition.getColumn()] = raceTrackGeographicMapCellTypeFactory.getEndType();
        final pathFindingInfo : PathFindingInfo = PathFindingInfoFactory.getInstance().getInstancePathFindingInfo(raceTrackGeographicMap, customMapArray);
        return pathFindingInfo;
    }

    // throws Exception
    public override function getPathsList(geographicMapCellPosition : GeographicMapCellPosition, pathFindingInfo : PathFindingInfo, multipassState : MultipassState) : BasicArrayList {
        try {
            if (pathFindingInfo == null) {
                this.logUtil.putF("pathFindingInfo: " + pathFindingInfo, this, "getPathsList");
                return BasicArrayListUtil.getInstance().getImmutableInstance();
            }
            final geographicMapCompositeInterface : GeographicMapCompositeInterface = (cast this.allBinaryGameLayerManagerP : GeographicMapCompositeInterface);
            final geographicMapInterface : BasicGeographicMap = geographicMapCompositeInterface.getGeographicMapInterface()[0];
            final list : BasicArrayList = PathGenerator.getInstance().createN(geographicMapInterface, pathFindingInfo, 2, multipassState);
            if (list != null && list != BasicArrayListUtil.getInstance().getImmutableInstance()) {
                if (list.size() < 1) {
                    throw new haxe.Exception("Path may have been cleared by clearing caching");
                }
                return list;
            }
            return BasicArrayListUtil.getInstance().getImmutableInstance();
        } catch (e : haxe.Exception) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            this.logUtil.put(commonStrings.EXCEPTION, this, "getPathsList", e);
            return BasicArrayListUtil.getInstance().getImmutableInstance();
        }
    }

    // throws Exception
    public function getEndGeographicMapCellPosition(startGeographicMapCellPosition : GeographicMapCellPosition) : GeographicMapCellPosition {
        final endList : BasicArrayList = this.ownerLayer.getEndGeographicMapCellPositionList();
        var endGeographicMapCellPosition : GeographicMapCellPosition = (cast BasicArrayListUtil.getInstance().getRandom(endList) : GeographicMapCellPosition);
        if (startGeographicMapCellPosition == endGeographicMapCellPosition) {
            {
                var index : Int = endList.size() - 1;
                while (index >= 0) {
                endGeographicMapCellPosition = (cast endList.get(index) : GeographicMapCellPosition);
                if (startGeographicMapCellPosition != endGeographicMapCellPosition) {
                    break;
                }
                    index--;
                }
            }
        }
        return endGeographicMapCellPosition;
    }

    public override function onEvent(eventObject : AllBinaryEventObject) : Void {
        ForcedLogUtil.log(EventStrings.getInstance().PERFORMANCE_MESSAGE, this);
    }

    // throws Exception
    public override function onBuildingEvent(event : RTSLayerEvent) : Void {
    }

    public override function reset() : Void {
        this.getConnectedWaypointList().clear();
    }

    // throws Exception
    public override function visit(unitLayer : PathFindingLayerInterface) : Void {
        if (unitLayer.getGroupInterface()[0] != this.ownerLayer.getGroupInterface()[0]) {
            return;
        }
        final size : Int = this.getConnectedWaypointList().size();
        if (size > 0) {
            final unitWaypointBehavior : UnitWaypointBehavior = (cast unitLayer.getWaypointBehavior() : UnitWaypointBehavior);
            while (this.getConnectedWaypointList().size() > 0) {
                final rtsLayer : CollidableDestroyableDamageableLayer = (cast this.getConnectedWaypointList().get(0) : CollidableDestroyableDamageableLayer);
                if (rtsLayer.isDestroyed()) {
                    this.getConnectedWaypointList().remove(rtsLayer);
                } else {
                    unitLayer.handleCost(this.ownerLayer);
                    unitWaypointBehavior.insertWaypoint(0, rtsLayer);
                    break;
                }
            }
        }
    }

}

