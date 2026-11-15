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
package org.allbinary.media.graphics.geography.pathfinding;

//import java.util.HashSet;
//import java.util.PriorityQueue;
import org.allbinary.game.layer.AllBinaryTiledLayer;
import org.allbinary.logic.NullUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.math.MathUtil;
import org.allbinary.string.CommonStrings;
import org.allbinary.media.graphics.geography.map.BasicGeographicMap;
import org.allbinary.media.graphics.geography.map.BasicGeographicMapCellPositionFactory;
import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition;
import org.allbinary.media.graphics.geography.map.GeographicMapCellType;
import org.allbinary.media.graphics.geography.map.racetrack.RaceTrackGeographicMapCellType;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.util.BasicArrayListUtil;

class PathFinder extends GeographicPathFinderBase {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final basicArrayListUtil : BasicArrayListUtil = BasicArrayListUtil.getInstance();
    private final mathUtil : MathUtil = MathUtil.getInstance();
    private final openPriorityQueue : PriorityQueue<PathFindingNodeCost> = new PriorityQueue<PathFindingNodeCost>();
    private final closedSet : HashSet<PathFindingNodeCost> = new HashSet<PathFindingNodeCost>();
    private var geographicMapInterface : Any = NullUtil.getInstance().NULL_OBJECT;
    private var costArray : haxe.ds.Vector<haxe.ds.Vector<PathFindingNodeCost>> = PathFindingNodeCost.NULL_PATH_FINDING_NODE_COST_ARRAY_ARRAY;
    // throws Exception
    public function init(geographicMapInterface : BasicGeographicMap) : Void {
        this.geographicMapInterface = geographicMapInterface;
        final tiledLayer : AllBinaryTiledLayer = geographicMapInterface.getAllBinaryTiledLayer();
        this.costArray = haxe.ds.Vector.fromArrayCopy([for (index in 0...tiledLayer.getColumns()) haxe.ds.Vector.fromArrayCopy([for (index2 in 0...tiledLayer.getRows()) null])]);
        final basicGeographicMapCellPositionFactory : BasicGeographicMapCellPositionFactory = geographicMapInterface.getGeographicMapCellPositionFactory();
        var node : PathFindingNodeCost = null;
        final sizeX : Int = this.costArray.length;
        final sizeY : Int = this.costArray[0].length;
        for (column in 0...sizeX) {
            for (row in 0...sizeY) {
                final geographicMapCellType : GeographicMapCellType = geographicMapInterface.getCellTypeAt(basicGeographicMapCellPositionFactory.getAt(column, row));
                final raceTrackGeographicMapCellType : RaceTrackGeographicMapCellType = (cast geographicMapCellType : RaceTrackGeographicMapCellType);
                node = new PathFindingNodeCost(NullUtil.getInstance().NULL_OBJECT, basicGeographicMapCellPositionFactory.getAt(column, row), new PathFindingNodeCostInfo(haxe.Int64.ofInt(raceTrackGeographicMapCellType.getTravelCost()), haxe.Int64.ofInt(-1)));
                this.costArray[column][row] = node;
            }
        }
    }

    public override function searchTotalPath(startPathFindingNodeList : BasicArrayList, endPathFindingNodeList : BasicArrayList, totalPaths : Int) : BasicArrayList {
        try {
            return this.search((cast startPathFindingNodeList.get(0) : PathFindingNode), (cast endPathFindingNodeList.get(0) : PathFindingNode));
        } catch (e : haxe.Exception) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            this.logUtil.put(commonStrings.EXCEPTION, this, "search", e);
            return this.basicArrayListUtil.getImmutableInstance();
        }
    }

    // throws Exception
    public override function searchTotalPathN(startPathFindingNodeList : BasicArrayList, endPathFindingNodeList : BasicArrayList, totalPaths : Int, multipassState : MultipassState) : BasicArrayList {
        if (multipassState.step == 0) {
            multipassState.step++;
        } else if (multipassState.step == 1) {
            this.searchStart((cast startPathFindingNodeList.get(0) : PathFindingNode), (cast endPathFindingNodeList.get(0) : PathFindingNode), multipassState);
        } else if (multipassState.step == 2) {
            return this.searchN((cast startPathFindingNodeList.get(0) : PathFindingNode), (cast endPathFindingNodeList.get(0) : PathFindingNode), multipassState);
        }
        return this.basicArrayListUtil.getImmutableInstance();
    }

    // throws Exception
    public function search(startPathFindingNode : PathFindingNode, endPathFindingNode : PathFindingNode) : BasicArrayList {
        final list : BasicArrayList = this.findPath(startPathFindingNode.geographicMapCellPosition, endPathFindingNode.geographicMapCellPosition);
        final pathList : BasicArrayList = new BasicArrayListD();
        pathList.add(list);
        return pathList;
    }

    // throws Exception
    public function searchStart(startPathFindingNode : PathFindingNode, endPathFindingNode : PathFindingNode, multipassState : MultipassState) : Void {
        this.findPathStart(startPathFindingNode.geographicMapCellPosition, endPathFindingNode.geographicMapCellPosition, multipassState);
    }

    // throws Exception
    public function searchN(startPathFindingNode : PathFindingNode, endPathFindingNode : PathFindingNode, multipassState : MultipassState) : BasicArrayList {
        final list : BasicArrayList = this.findPathEnd(startPathFindingNode.geographicMapCellPosition, endPathFindingNode.geographicMapCellPosition, multipassState);
        if (list == null) {
            return this.basicArrayListUtil.getImmutableInstance();
        }
        final pathList : BasicArrayList = new BasicArrayListD();
        pathList.add(list);
        multipassState.iteration = 0;
        multipassState.step = 0;
        return pathList;
    }

    // throws Exception
    public function findPath(start : GeographicMapCellPosition, target : GeographicMapCellPosition) : BasicArrayList {
        this.openPriorityQueue.clear();
        this.closedSet.clear();
        var discoveryCalculation : haxe.Int64 = haxe.Int64.ofInt(0);
        var node : PathFindingNodeCost = null;
        final targetColumn : Int = target.getColumn();
        final targetRow : Int = target.getRow();
        final sizeX : Int = this.costArray.length;
        final sizeY : Int = this.costArray[0].length;
        for (column in 0...sizeX) {
            for (row in 0...sizeY) {
                discoveryCalculation = haxe.Int64.ofInt(this.mathUtil.abs(column - targetColumn)) + this.mathUtil.abs(row - targetRow);
                node = this.costArray[column][row];
                node.pathFindingNodeCostInfoP.totalCostP = 0;
                node.pathFindingNodeCostInfoP.costToEndP = discoveryCalculation;
            }
        }
        final startNode : PathFindingNodeCost = this.costArray[start.getColumn()][start.getRow()];
        this.openPriorityQueue.add(startNode);
        final geographicMapInterface : BasicGeographicMap = (cast this.geographicMapInterface : BasicGeographicMap);
        final basicGeographicMapCellPositionFactory : BasicGeographicMapCellPositionFactory = geographicMapInterface.getGeographicMapCellPositionFactory();
        final allBinaryTiledLayer : AllBinaryTiledLayer = geographicMapInterface.getAllBinaryTiledLayer();
        final targetNode : PathFindingNodeCost = this.costArray[target.getColumn()][target.getRow()];
        var current : PathFindingNodeCost = null;
        do {
            current = this.openPriorityQueue.poll();
            this.closedSet.add(current);
            if (current.equals(targetNode)) {
                return this.extractPath(start, current);
            }
            var neighbor : PathFindingNodeCost = null;
            var neighborInfo : PathFindingNodeCostInfo = null;
            var calculatedCost : haxe.Int64 = haxe.Int64.ofInt(0);
            for (column in current.geographicMapCellPosition.getColumn() - 1...current.geographicMapCellPosition.getColumn() + 2) {
                for (row in current.geographicMapCellPosition.getRow() - 1...current.geographicMapCellPosition.getRow() + 2) {
                    if (column > 0 && row > 0 && column < allBinaryTiledLayer.getColumns() && row < allBinaryTiledLayer.getRows() && geographicMapInterface.isOnMap(basicGeographicMapCellPositionFactory.getAt(column, row))) {
                        neighbor = this.costArray[column][row];
                        if (this.closedSet.contains(neighbor)) {
                            continue;
                        }
                        neighborInfo = neighbor.pathFindingNodeCostInfoP;
                        calculatedCost = neighborInfo.costToEndP + neighborInfo.costFromStartP + current.pathFindingNodeCostInfoP.totalCostP;
                        if (calculatedCost < neighborInfo.totalCostP || !this.openPriorityQueue.contains(neighbor)) {
                            neighborInfo.totalCostP = calculatedCost;
                            neighbor.parent = current;
                            if (!this.openPriorityQueue.contains(neighbor)) {
                                if (geographicMapInterface.isOfFourDirections(current.geographicMapCellPosition, neighbor.geographicMapCellPosition)) {
                                    this.openPriorityQueue.add(neighbor);
                                }
                            }
                        }
                    }
                }
            }
        } while (!this.openPriorityQueue.isEmpty());
        throw new haxe.Exception();
    }

    // throws Exception
    public function findPathStart(start : GeographicMapCellPosition, target : GeographicMapCellPosition, multipassState : MultipassState) : Void {
        this.openPriorityQueue.clear();
        this.closedSet.clear();
        var discoveryCalculation : haxe.Int64 = haxe.Int64.ofInt(0);
        var node : PathFindingNodeCost = null;
        final targetColumn : Int = target.getColumn();
        final targetRow : Int = target.getRow();
        final sizeX : Int = this.costArray.length;
        final sizeY : Int = this.costArray[0].length;
        for (column in 0...sizeX) {
            for (row in 0...sizeY) {
                discoveryCalculation = haxe.Int64.ofInt(this.mathUtil.abs(column - targetColumn)) + this.mathUtil.abs(row - targetRow);
                node = this.costArray[column][row];
                node.pathFindingNodeCostInfoP.totalCostP = 0;
                node.pathFindingNodeCostInfoP.costToEndP = discoveryCalculation;
            }
        }
        final startNode : PathFindingNodeCost = this.costArray[start.getColumn()][start.getRow()];
        this.openPriorityQueue.add(startNode);
        multipassState.step++;
    }

    // throws Exception
    public function findPathEnd(start : GeographicMapCellPosition, target : GeographicMapCellPosition, multipassState : MultipassState) : BasicArrayList {
        final geographicMapInterface : BasicGeographicMap = (cast this.geographicMapInterface : BasicGeographicMap);
        final basicGeographicMapCellPositionFactory : BasicGeographicMapCellPositionFactory = geographicMapInterface.getGeographicMapCellPositionFactory();
        final allBinaryTiledLayer : AllBinaryTiledLayer = geographicMapInterface.getAllBinaryTiledLayer();
        final targetNode : PathFindingNodeCost = this.costArray[target.getColumn()][target.getRow()];
        var current : PathFindingNodeCost = null;
        var total : Int = 0;
        do {
            current = this.openPriorityQueue.poll();
            this.closedSet.add(current);
            if (current.equals(targetNode)) {
                return this.extractPath(start, current);
            }
            var neighbor : PathFindingNodeCost = null;
            var neighborInfo : PathFindingNodeCostInfo = null;
            var calculatedCost : haxe.Int64 = haxe.Int64.ofInt(0);
            for (column in current.geographicMapCellPosition.getColumn() - 1...current.geographicMapCellPosition.getColumn() + 2) {
                for (row in current.geographicMapCellPosition.getRow() - 1...current.geographicMapCellPosition.getRow() + 2) {
                    if (column > 0 && row > 0 && column < allBinaryTiledLayer.getColumns() && row < allBinaryTiledLayer.getRows() && geographicMapInterface.isOnMap(basicGeographicMapCellPositionFactory.getAt(column, row))) {
                        neighbor = this.costArray[column][row];
                        if (this.closedSet.contains(neighbor)) {
                            continue;
                        }
                        neighborInfo = neighbor.pathFindingNodeCostInfoP;
                        calculatedCost = neighborInfo.costToEndP + neighborInfo.costFromStartP + current.pathFindingNodeCostInfoP.totalCostP;
                        if (calculatedCost < neighborInfo.totalCostP || !this.openPriorityQueue.contains(neighbor)) {
                            neighborInfo.totalCostP = calculatedCost;
                            neighbor.parent = current;
                            if (!this.openPriorityQueue.contains(neighbor)) {
                                if (geographicMapInterface.isOfFourDirections(current.geographicMapCellPosition, neighbor.geographicMapCellPosition)) {
                                    this.openPriorityQueue.add(neighbor);
                                }
                            }
                        }
                    }
                }
            }
            total++;
            if (total > 10) {
                return this.basicArrayListUtil.getImmutableInstance();
            }
        } while (!this.openPriorityQueue.isEmpty());
        throw new haxe.Exception();
    }

    private function extractPath(start : GeographicMapCellPosition, current : PathFindingNodeCost) : BasicArrayList {
        final path : BasicArrayList = new BasicArrayListD();
        while (current.parent != NullUtil.getInstance().NULL_OBJECT) {
            path.add(current.geographicMapCellPosition);
            current = (cast current.parent : PathFindingNodeCost);
        }
        path.add(start);
        this.basicArrayListUtil.reverse(path);
        return path;
    }

    public function new() {
        super();
    }
}

