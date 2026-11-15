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
import org.jgrapht.graph.SimpleWeightedGraph;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.media.graphics.geography.map.BasicGeographicMap;
import org.allbinary.media.graphics.geography.pathfinding.PathFinderGraphVisitorBase;
import org.allbinary.media.graphics.geography.pathfinding.PathFindingNode;
import org.allbinary.util.BasicArrayList;

class BasePathFinderGraphVisitor<V, E> extends PathFinderGraphVisitorBase {
    public var geographicMapInterface : BasicGeographicMap;
    public final edgeMinimum : Int;
    public final minPathWeight : Int;
    public final maxPathWeight : Int;
    public function new(geographicMapInterface : BasicGeographicMap, edgeMinimum : Int, minPathWeight : Int, maxPathWeight : Int) {
        super();
        this.geographicMapInterface = geographicMapInterface;
        this.edgeMinimum = edgeMinimum;
        this.minPathWeight = minPathWeight;
        this.maxPathWeight = maxPathWeight;
    }

    // throws Exception
    public function visit(graph : SimpleWeightedGraph, startPathFindingNodeList : BasicArrayList, endPathFindingNodeList : BasicArrayList) : Void {
    }

    // throws Exception
    public function fixPath(startPathFindingNodeList : BasicArrayList, endPathFindingNodeList : BasicArrayList, pathList : BasicArrayList) : Void {
        {
            var index : Int = startPathFindingNodeList.size() - 1;
            while (index >= 0) {
            var startPathFindingNode : PathFindingNode = (cast startPathFindingNodeList.get(index) : PathFindingNode);
            pathList.remove(startPathFindingNode.geographicMapCellPosition);
            pathList.addAt(0, startPathFindingNode.geographicMapCellPosition);
                index--;
            }
        }
    }

    public function isValid(graphPath : GraphPath) : Bool {
        if (graphPath.getEdgeList().size() > this.edgeMinimum && graphPath.getWeight() < this.maxPathWeight && graphPath.getWeight() > this.minPathWeight) {
            return true;
        } else {
            return false;
        }
    }

    public function getInvalidReason(graphPath : GraphPath) : String {
        final stringBuffer : StringMaker = new StringMaker();
        if (graphPath.getEdgeList().size() < this.edgeMinimum) {
            stringBuffer.append("Ignoring Small: " + graphPath.getEdgeList().size());
        }
        if (graphPath.getWeight() <= this.minPathWeight) {
            stringBuffer.append(" Low Weighted Path: " + graphPath.getWeight());
        }
        if (graphPath.getWeight() >= this.maxPathWeight) {
            stringBuffer.append(" To High Weighted Path: " + graphPath.getWeight());
        }
        return stringBuffer.toString();
    }

}

