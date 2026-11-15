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

import org.allbinary.string.CommonStrings;
import org.allbinary.logic.communication.log.PreLogUtil;
import org.allbinary.game.layer.AllBinaryTiledLayer;
import org.allbinary.media.graphics.geography.map.BasicGeographicMap;
import org.allbinary.media.graphics.geography.map.BasicGeographicMapCellPositionFactory;
import org.allbinary.media.graphics.geography.map.BasicGeographicMapUtil;
import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition;
import org.allbinary.media.graphics.geography.map.GeographicMapCellType;
import org.allbinary.media.graphics.geography.map.GeographicMapCellTypeFactory;
import org.allbinary.media.graphics.geography.map.racetrack.BasePathFindingInfoFactory;
import org.allbinary.media.graphics.geography.map.racetrack.RaceTrackGeographicMapCellType;
import org.allbinary.media.graphics.geography.map.racetrack.RaceTrackRoadsGeographicMapCellHistoryFactory;
import org.allbinary.media.graphics.geography.pathfinding.PathFindingNodeCostInfoFactoryBase;
import org.allbinary.media.graphics.geography.pathfinding.BasicGeographicMapGraph;
import org.allbinary.media.graphics.geography.pathfinding.BasicGeographicMapPathFinder;
import org.allbinary.media.graphics.geography.pathfinding.PathFinderGraphVisitorFactoryBase;
import org.allbinary.media.graphics.geography.pathfinding.PathFindingInfo;
import org.allbinary.media.graphics.geography.pathfinding.PathFindingNodeCostInfoFactory;
import org.allbinary.util.BasicArrayListS;

class PathFindingInfoFactory extends BasePathFindingInfoFactory {
    private static var instance : PathFindingInfoFactory = null;
    public static function getInstance() : PathFindingInfoFactory {
        return PathFindingInfoFactory.instance;
    }

    public static function initMax(max : Int) : Void {
        PathFindingInfoFactory.instance = new PathFindingInfoFactory(new SimplePathFinderGraphVisitorFactory(1, 1, Integer.MAX_VALUE), max);
    }

    private final MAX_DIRECTIONS : Int = 4;
    private final pathFindingInfo : PathFindingInfo;
    private final basicGeographicMapGraph : BasicGeographicMapGraph;
    private final basicGeographicMapPathFinder : BasicGeographicMapPathFinder;
    private final pathFinderGraphVisitorFactoryInterface : PathFinderGraphVisitorFactoryBase;
    public function new(pathFinderGraphVisitorFactoryInterface : PathFinderGraphVisitorFactoryBase, max : Int) {
        super();
        final commonStrings : CommonStrings = CommonStrings.getInstance();
        PreLogUtil.put("Using Dynamic Path Finding", this, commonStrings.GET_INSTANCE);
        this.basicGeographicMapPathFinder = new BasicGeographicMapPathFinder(max);
        this.pathFindingInfo = new PathFindingInfo(new PathFindingNodeCostInfoFactory(max), new BasicArrayListS(1), new BasicArrayListS(1));
        this.basicGeographicMapGraph = new BasicGeographicMapGraph((cast this.pathFindingInfo.getPathFindingNodeCostInfoFactoryInterface() : PathFindingNodeCostInfoFactory));
        this.pathFinderGraphVisitorFactoryInterface = pathFinderGraphVisitorFactoryInterface;
    }

    // throws Exception
    public override function getInstancePathFindingInfo(geographicMapInterface : BasicGeographicMap, mapArray : haxe.ds.Vector<haxe.ds.Vector<Int>>) : PathFindingInfo {
        final pathFindingInfo : PathFindingInfo = new PathFindingInfo(this.pathFindingInfo.getPathFindingNodeCostInfoFactoryInterface(), new BasicArrayListS(1), new BasicArrayListS(1));
        RaceTrackRoadsGeographicMapCellHistoryFactory.getInstance().init();
        this.init(geographicMapInterface, pathFindingInfo, mapArray);
        this.basicGeographicMapPathFinder.init(geographicMapInterface, this.basicGeographicMapGraph, this.pathFinderGraphVisitorFactoryInterface.getInstance(geographicMapInterface));
        pathFindingInfo.setPathFinder(this.basicGeographicMapPathFinder);
        return pathFindingInfo;
    }

    // throws Exception
    public function init(geographicMapInterface : BasicGeographicMap, pathFindingInfo : PathFindingInfo, mapArray : haxe.ds.Vector<haxe.ds.Vector<Int>>) : Void {
        super.init(geographicMapInterface, pathFindingInfo, mapArray);
        this.buildPathFindingNodes(geographicMapInterface, pathFindingInfo, mapArray);
    }

    // throws Exception
    private function buildPathFindingNodesForCellPosition(geographicMapInterface : BasicGeographicMap, pathFindingInfo : PathFindingInfo, mapArray : haxe.ds.Vector<haxe.ds.Vector<Int>>, cellPosition : GeographicMapCellPosition) : Void {
        final geographicMapCellPositionFactory : BasicGeographicMapCellPositionFactory = geographicMapInterface.getGeographicMapCellPositionFactory();
        final cellTypeId : Int = mapArray[cellPosition.getRow()][cellPosition.getColumn()];
        final geographicMapCellType : GeographicMapCellType = GeographicMapCellTypeFactory.getInstance().get(geographicMapInterface.getCellTypeFromMapCellTypeInt(cellTypeId));
        final raceTrackGeographicMapCellType : RaceTrackGeographicMapCellType = (cast geographicMapCellType : RaceTrackGeographicMapCellType);
        final allBinaryTiledLayer : AllBinaryTiledLayer = geographicMapInterface.getAllBinaryTiledLayer();
        final pathFindingNodeCostInfoFactoryInterface : PathFindingNodeCostInfoFactoryBase = pathFindingInfo.getPathFindingNodeCostInfoFactoryInterface();
        final basicGeographicMapUtil : BasicGeographicMapUtil = BasicGeographicMapUtil.getInstance();
        var row : Int = 0;
        var column : Int = 0;
        var goingToGeographicMapCellPosition : GeographicMapCellPosition = null;
        var costFromStart : Int = 0;
        var costToEnd : Int = 0;
        for (index in 0...this.MAX_DIRECTIONS) {
            row = basicGeographicMapUtil.getBorderingRow(index, cellPosition);
            column = basicGeographicMapUtil.getBorderingColumn(index, cellPosition);
            if (row < allBinaryTiledLayer.getRows() && column < allBinaryTiledLayer.getColumns() && row >= 0 && column >= 0) {
                goingToGeographicMapCellPosition = geographicMapCellPositionFactory.getAt(column, row);
                costFromStart = raceTrackGeographicMapCellType.getTravelCost();
                costToEnd = costFromStart;
                pathFindingNodeCostInfoFactoryInterface.create(geographicMapInterface, goingToGeographicMapCellPosition, cellPosition, costFromStart, costToEnd);
            }
        }
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

