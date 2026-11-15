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

import org.jgrapht.GraphPath;
import org.jgrapht.graph.DefaultWeightedEdge;
import org.jgrapht.graph.SimpleWeightedGraph;
import org.allbinary.util.BasicArrayList;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.game.layer.AllBinaryTiledLayer;
import org.allbinary.graphics.CellPosition;
import org.allbinary.media.graphics.geography.map.BasicGeographicMap;
import org.allbinary.media.graphics.geography.map.BasicGeographicMapCellPositionFactory;
import org.allbinary.media.graphics.geography.map.BasicGeographicMapUtil;
import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition;
import org.allbinary.media.graphics.geography.map.racetrack.RaceTrackGeographicMap;
import org.allbinary.media.graphics.geography.pathfinding.PathFindingNode;

class PathFinderGraphHackVisitor<V, E> extends BasePathFinderGraphVisitor<V, E> {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public function new(geographicMapInterface : BasicGeographicMap, edgeMinimum : Int, minPathWeight : Int, maxPathWeight : Int) {
        super(geographicMapInterface, edgeMinimum, minPathWeight, maxPathWeight);
    }

    // throws Exception
    public function visit(graph : SimpleWeightedGraph, startPathFindingNodeList : BasicArrayList, endPathFindingNodeList : BasicArrayList) : Void {
        this.fixStart(graph, startPathFindingNodeList);
        this.fixEnd(graph, endPathFindingNodeList);
        this.fixOverPassEdges(graph);
    }

    // throws Exception
    private function fixStart(graph : SimpleWeightedGraph<CellPosition, DefaultWeightedEdge>, startPathFindingNodeList : BasicArrayList) : Void {
        var geographicMapCellPositionFactory : BasicGeographicMapCellPositionFactory = this.geographicMapInterface.getGeographicMapCellPositionFactory();
        var tiledLayer : AllBinaryTiledLayer = this.geographicMapInterface.getAllBinaryTiledLayer();
        {
            var index : Int = startPathFindingNodeList.size() - 1;
            while (index >= 0) {
            var startPathFindingNode : PathFindingNode = (cast startPathFindingNodeList.get(index) : PathFindingNode);
            var geographicMapCellPosition : GeographicMapCellPosition = startPathFindingNode.geographicMapCellPosition;
            var column : Int = geographicMapCellPosition.getColumn();
            var row : Int = geographicMapCellPosition.getRow();
            var nextRow : Int = row + 1;
            if (tiledLayer.isOnTileLayer(column, nextRow)) {
                var geographicMapCellPositionNeighbor : GeographicMapCellPosition = geographicMapCellPositionFactory.getAt(column, nextRow);
                graph.removeEdge(geographicMapCellPosition, geographicMapCellPositionNeighbor);
            }
                index--;
            }
        }
    }

    // throws Exception
    private function fixEnd(graph : SimpleWeightedGraph<CellPosition, DefaultWeightedEdge>, endPathFindingNodeList : BasicArrayList) : Void {
        var geographicMapCellPositionFactory : BasicGeographicMapCellPositionFactory = this.geographicMapInterface.getGeographicMapCellPositionFactory();
        var tiledLayer : AllBinaryTiledLayer = this.geographicMapInterface.getAllBinaryTiledLayer();
        {
            var index : Int = endPathFindingNodeList.size() - 1;
            while (index >= 0) {
            var endPathFindingNode : PathFindingNode = (cast endPathFindingNodeList.get(index) : PathFindingNode);
            var geographicMapCellPosition : GeographicMapCellPosition = endPathFindingNode.geographicMapCellPosition;
            graph.addVertex(geographicMapCellPosition);
            var column : Int = geographicMapCellPosition.getColumn();
            var row : Int = geographicMapCellPosition.getRow();
            var nextRow : Int = row + 1;
            if (tiledLayer.isOnTileLayer(column, nextRow)) {
                var geographicMapCellPositionNeighbor : GeographicMapCellPosition = geographicMapCellPositionFactory.getAt(column, nextRow);
                graph.addEdge(geographicMapCellPosition, geographicMapCellPositionNeighbor);
            }
                index--;
            }
        }
    }

    // throws Exception
    private function fixOverPassEdges(graph : SimpleWeightedGraph<CellPosition, DefaultWeightedEdge>) : Void {
        var geographicMapCellPositionFactory : BasicGeographicMapCellPositionFactory = this.geographicMapInterface.getGeographicMapCellPositionFactory();
        var raceTrackGeographicMap : RaceTrackGeographicMap = (cast this.geographicMapInterface : RaceTrackGeographicMap);
        var CellPositionArray : haxe.ds.Vector<CellPosition> = raceTrackGeographicMap.getRaceTrackData().getOverPassGeographicMapCellPositionArray();
        {
            var index : Int = CellPositionArray.length - 1;
            while (index >= 0) {
            var overPassGeographicMapCellPosition : CellPosition = CellPositionArray[index];
            this.logUtil.putF("Fixing Over Pass: " + overPassGeographicMapCellPosition.getColumn() + ", " + overPassGeographicMapCellPosition.getRow(), this, "fixOverPassEdges");
            var underPassGeographicMapCellPosition : GeographicMapCellPosition = geographicMapCellPositionFactory.getAt(overPassGeographicMapCellPosition.getColumn(), overPassGeographicMapCellPosition.getRow());
            var rightUnderPassGeographicMapCellPosition : GeographicMapCellPosition = geographicMapCellPositionFactory.getAt(overPassGeographicMapCellPosition.getColumn() + 1, overPassGeographicMapCellPosition.getRow());
            var leftUnderPassGeographicMapCellPosition : GeographicMapCellPosition = geographicMapCellPositionFactory.getAt(overPassGeographicMapCellPosition.getColumn() - 1, overPassGeographicMapCellPosition.getRow());
            graph.removeEdge(underPassGeographicMapCellPosition, rightUnderPassGeographicMapCellPosition);
            graph.removeEdge(underPassGeographicMapCellPosition, leftUnderPassGeographicMapCellPosition);
            graph.addVertex(overPassGeographicMapCellPosition);
            graph.addEdge(overPassGeographicMapCellPosition, rightUnderPassGeographicMapCellPosition);
            graph.addEdge(overPassGeographicMapCellPosition, leftUnderPassGeographicMapCellPosition);
                index--;
            }
        }
    }

    // throws Exception
    public function fixPath(startPathFindingNodeList : BasicArrayList, endPathFindingNodeList : BasicArrayList, pathList : BasicArrayList) : Void {
        {
            var index : Int = startPathFindingNodeList.size() - 1;
            while (index >= 0) {
            var endPathFindingNode : PathFindingNode = (cast endPathFindingNodeList.get(index) : PathFindingNode);
            var startPathFindingNode : PathFindingNode = (cast startPathFindingNodeList.get(index) : PathFindingNode);
            if (BasicGeographicMapUtil.getInstance().isSameCellPosition(startPathFindingNode.geographicMapCellPosition, endPathFindingNode.geographicMapCellPosition)) {
                if (pathList.remove(endPathFindingNode.geographicMapCellPosition)) {
                    pathList.remove(startPathFindingNode.geographicMapCellPosition);
                    pathList.addAt(0, startPathFindingNode.geographicMapCellPosition);
                }
            }
                index--;
            }
        }
        this.removeOverPassEdges(pathList);
    }

    // throws Exception
    private function removeOverPassEdges(pathList : BasicArrayList) : Void {
        var geographicMapCellPositionFactory : BasicGeographicMapCellPositionFactory = this.geographicMapInterface.getGeographicMapCellPositionFactory();
        var raceTrackGeographicMap : RaceTrackGeographicMap = (cast this.geographicMapInterface : RaceTrackGeographicMap);
        var CellPositionArray : haxe.ds.Vector<CellPosition> = raceTrackGeographicMap.getRaceTrackData().getOverPassGeographicMapCellPositionArray();
        {
            var index : Int = CellPositionArray.length - 1;
            while (index >= 0) {
            var overPassGeographicMapCellPosition : CellPosition = CellPositionArray[index];
            var underPassGeographicMapCellPosition : GeographicMapCellPosition = geographicMapCellPositionFactory.getAt(overPassGeographicMapCellPosition.getColumn(), overPassGeographicMapCellPosition.getRow());
            var indexOf : Int = pathList.indexOf(overPassGeographicMapCellPosition);
            if (indexOf != -1) {
                pathList.set(indexOf, underPassGeographicMapCellPosition);
            }
                index--;
            }
        }
    }

    public function isValid(graphPath : GraphPath) : Bool {
        if (graphPath.getEdgeList().size() > edgeMinimum && graphPath.getWeight() < maxPathWeight && graphPath.getWeight() > minPathWeight) {
            return true;
        } else {
            return false;
        }
    }

}

