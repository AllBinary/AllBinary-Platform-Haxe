/*
 *
 * AllBinary Open License Version 1
 * Copyright (c) 2011 AllBinary
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
package org.allbinary.game.media.graphics.geography.map.racetrack;

import org.allbinary.game.layer.AllBinaryTiledLayer;
import org.allbinary.media.graphics.geography.map.BasicGeographicMap;
import org.allbinary.media.graphics.geography.map.BasicGeographicMapCellPositionFactory;
import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition;
import org.allbinary.media.graphics.geography.map.racetrack.BasePathFindingInfoFactory;
import org.allbinary.media.graphics.geography.map.racetrack.RaceTrackRoadsGeographicMapCellHistoryFactory;
import org.allbinary.media.graphics.geography.pathfinding.PathFinder;
import org.allbinary.media.graphics.geography.pathfinding.PathFindingInfo;
import org.allbinary.media.graphics.geography.pathfinding.PathFindingNodeCostInfoFactory;
import org.allbinary.util.BasicArrayListS;

//1.4.2
class PathFindingInfoFactory extends BasePathFindingInfoFactory {
    private static final instance : PathFindingInfoFactory = new PathFindingInfoFactory();
    public static function getInstance() : PathFindingInfoFactory {
        return PathFindingInfoFactory.instance;
    }

    private static var MAX : Int = 32768;
    public static function initMax(max : Int) : Void {
        PathFindingInfoFactory.MAX = max;
    }

    private final pathFindingInfo : PathFindingInfo;
    private final pathFinder : PathFinder;
    public function new() {
        super();
        this.pathFindingInfo = new PathFindingInfo(new PathFindingNodeCostInfoFactory(PathFindingInfoFactory.MAX), new BasicArrayListS(1), new BasicArrayListS(1));
        this.pathFinder = new PathFinder();
    }

    // throws Exception
    public override function getInstancePathFindingInfo(geographicMapInterface : BasicGeographicMap, mapArray : haxe.ds.Vector<haxe.ds.Vector<Int>>) : PathFindingInfo {
        final pathFindingInfo : PathFindingInfo = new PathFindingInfo(this.pathFindingInfo.getPathFindingNodeCostInfoFactoryInterface(), new BasicArrayListS(1), new BasicArrayListS(1));
        RaceTrackRoadsGeographicMapCellHistoryFactory.getInstance().init();
        this.init(geographicMapInterface, pathFindingInfo, mapArray);
        this.pathFinder.init(geographicMapInterface);
        pathFindingInfo.setPathFinder(this.pathFinder);
        return pathFindingInfo;
    }

    // throws Exception
    public override function init(geographicMapInterface : BasicGeographicMap, pathFindingInfo : PathFindingInfo, mapArray : haxe.ds.Vector<haxe.ds.Vector<Int>>) : Void {
        super.init(geographicMapInterface, pathFindingInfo, mapArray);
        this.buildPathFindingNodes(geographicMapInterface, pathFindingInfo, mapArray);
    }

    // throws Exception
    private function buildPathFindingNodesForCellPosition(geographicMapInterface : BasicGeographicMap, pathFindingInfo : PathFindingInfo, mapArray : haxe.ds.Vector<haxe.ds.Vector<Int>>, cellPosition : GeographicMapCellPosition) : Void {
    }

    // throws Exception
    private function buildPathFindingNodes(geographicMapInterface : BasicGeographicMap, pathFindingInfo : PathFindingInfo, mapArray : haxe.ds.Vector<haxe.ds.Vector<Int>>) : Void {
        final geographicMapCellPositionFactory : BasicGeographicMapCellPositionFactory = geographicMapInterface.getGeographicMapCellPositionFactory();
        final allBinaryTiledLayer : AllBinaryTiledLayer = geographicMapInterface.getAllBinaryTiledLayer();
        final totalColumns : Int = allBinaryTiledLayer.getColumns();
        final totalRows : Int = allBinaryTiledLayer.getRows();
        for (column in 0...totalColumns) {
            for (row in 0...totalRows) {
                this.buildPathFindingNodesForCellPosition(geographicMapInterface, pathFindingInfo, mapArray, geographicMapCellPositionFactory.getAt(column, row));
            }
        }
    }

}

