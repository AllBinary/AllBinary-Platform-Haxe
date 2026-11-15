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
import org.allbinary.game.layer.AllBinaryTiledLayer;
import org.allbinary.game.layer.PathFindingLayerInterface;
import org.allbinary.game.layer.RTSLayerEvent;
import org.allbinary.game.layer.building.event.BuildingEventListenerInterface;
import org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer;
import org.allbinary.game.layer.unit.UnitWaypointBehavior;
import org.allbinary.game.media.graphics.geography.map.racetrack.PathFindingInfoFactory;
import org.allbinary.logic.communication.log.ForcedLogUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.util.event.AllBinaryEventObject;
import org.allbinary.logic.util.event.EventStrings;
import org.allbinary.media.audio.Sound;
import org.allbinary.media.graphics.geography.map.BasicGeographicMap;
import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition;
import org.allbinary.media.graphics.geography.map.GeographicMapCellTypeFactory;
import org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface;
import org.allbinary.media.graphics.geography.map.racetrack.CustomMapGenerator;
import org.allbinary.media.graphics.geography.map.racetrack.RaceTrackGeographicMap;
import org.allbinary.media.graphics.geography.pathfinding.BasicGeographicMapExtractedPathsCacheFactory;
import org.allbinary.media.graphics.geography.pathfinding.PathFindingInfo;
import org.allbinary.media.graphics.geography.pathfinding.PathGenerator;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListUtil;

class Waypoint extends WaypointBase implements BuildingEventListenerInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final basicArrayListUtil : BasicArrayListUtil = BasicArrayListUtil.getInstance();
    public final ownerLayer : PathFindingLayerInterface;
    private var endList : BasicArrayList = this.basicArrayListUtil.getImmutableInstance();
    private var paths : haxe.ds.Vector<haxe.ds.Vector<BasicArrayList>> = this.basicArrayListUtil.NULL_ARRAY_OF_ARRAY;
    public function new(ownerLayer : PathFindingLayerInterface, sound : Sound) {
        super(sound);
        this.ownerLayer = ownerLayer;
    }

    // throws Exception
    public override function setAllBinaryGameLayerManager(allBinaryGameLayerManager : AllBinaryGameLayerManager) : Void {
        super.setAllBinaryGameLayerManager(allBinaryGameLayerManager);
        final geographicMapCompositeInterface : GeographicMapCompositeInterface = (cast allBinaryGameLayerManager : GeographicMapCompositeInterface);
        final geographicMapInterface : BasicGeographicMap = geographicMapCompositeInterface.getGeographicMapInterface()[0];
        final tiledLayer : AllBinaryTiledLayer = geographicMapInterface.getAllBinaryTiledLayer();
        if (this.paths != this.basicArrayListUtil.NULL_ARRAY_OF_ARRAY) {
            throw new haxe.Exception();
        }
        this.endList = this.ownerLayer.getEndGeographicMapCellPositionList();
        this.paths = haxe.ds.Vector.fromArrayCopy([for (index in 0...tiledLayer.getColumns()) haxe.ds.Vector.fromArrayCopy([for (index2 in 0...tiledLayer.getRows()) null])]);
        this.clearPaths();
    }

    public function releaseCachedPaths() : Void {
        {
            var columnIndex : Int = this.paths.length;
            while (--columnIndex >= 0) {
            {
                var rowIndex : Int = this.paths.length;
                while (--rowIndex >= 0) {
                final pathsList : BasicArrayList = this.paths[columnIndex][rowIndex];
                if (pathsList != this.basicArrayListUtil.getImmutableInstance()) {
                    BasicGeographicMapExtractedPathsCacheFactory.getInstance().release(pathsList);
                }
                }
            }
            }
        }
    }

    // throws Exception
    public override function getPathsListFromCacheOnly(geographicMapCellPosition : GeographicMapCellPosition) : BasicArrayList {
        return this.paths[geographicMapCellPosition.getColumn()][geographicMapCellPosition.getRow()];
    }

    // throws Exception
    public override function getPathsListRunnable(geographicMapCellPosition : GeographicMapCellPosition) : BasicArrayList {
        var pathsList : BasicArrayList = this.paths[geographicMapCellPosition.getColumn()][geographicMapCellPosition.getRow()];
        if (pathsList == this.basicArrayListUtil.getImmutableInstance()) {
            pathsList = this.createPaths(geographicMapCellPosition);
            this.paths[geographicMapCellPosition.getColumn()][geographicMapCellPosition.getRow()] = pathsList;
        }
        return pathsList;
    }

    public function getEndGeographicMapCellPosition(startGeographicMapCellPosition : GeographicMapCellPosition) : GeographicMapCellPosition {
        var endGeographicMapCellPosition : GeographicMapCellPosition = (cast this.basicArrayListUtil.getRandom(this.endList) : GeographicMapCellPosition);
        if (startGeographicMapCellPosition == endGeographicMapCellPosition) {
            {
                var index : Int = this.endList.size() - 1;
                while (index >= 0) {
                endGeographicMapCellPosition = (cast this.endList.get(index) : GeographicMapCellPosition);
                if (startGeographicMapCellPosition != endGeographicMapCellPosition) {
                    break;
                }
                    index--;
                }
            }
        }
        return endGeographicMapCellPosition;
    }

    // throws Exception
    private function createPaths(startGeographicMapCellPosition : GeographicMapCellPosition) : BasicArrayList {
        if (this.endList.size() == 0) {
            return this.basicArrayListUtil.getImmutableInstance();
        }
        final endGeographicMapCellPosition : GeographicMapCellPosition = this.getEndGeographicMapCellPosition(startGeographicMapCellPosition);
        if (endGeographicMapCellPosition == null) {
            return this.basicArrayListUtil.getImmutableInstance();
        }
        if (startGeographicMapCellPosition == endGeographicMapCellPosition) {
            if (this.ownerLayer.shouldHandleStartSameAsEnd()) {
                return this.basicArrayListUtil.getImmutableInstance();
            } else {
                throw new haxe.Exception("Start should not be End: " + this.endList.size());
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
        final list : BasicArrayList = PathGenerator.getInstance().getInstanceNoCache(geographicMapInterface, pathFindingInfo, 2);
        if (list.size() < 1) {
            throw new haxe.Exception("Path may have been cleared by clearing caching");
        }
        return list;
    }

    public override function onEvent(eventObject : AllBinaryEventObject) : Void {
        ForcedLogUtil.log(EventStrings.getInstance().PERFORMANCE_MESSAGE, this);
    }

    // throws Exception
    public override function onBuildingEvent(event : RTSLayerEvent) : Void {
        this.clearPaths();
    }

    private function clearPaths() : Void {
        {
            var columnIndex : Int = this.paths.length;
            while (--columnIndex >= 0) {
            {
                var rowIndex : Int = this.paths.length;
                while (--rowIndex >= 0) {
                this.paths[columnIndex][rowIndex] = this.basicArrayListUtil.getImmutableInstance();
                }
            }
            }
        }
    }

    public override function reset() : Void {
        this.getConnectedWaypointList().clear();
        this.releaseCachedPaths();
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

