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

import org.allbinary.logic.string.StringUtil;
import org.allbinary.media.graphics.geography.map.BasicGeographicMap;
import org.allbinary.media.graphics.geography.pathfinding.PathFinderGraphVisitorBase;
import org.allbinary.media.graphics.geography.pathfinding.PathFindingNode;
import org.allbinary.util.BasicArrayList;

//1.4.2
class BasePathFinderGraphVisitor extends PathFinderGraphVisitorBase {
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
    public override function visit(graph : Any, startPathFindingNodeList : BasicArrayList, endPathFindingNodeList : BasicArrayList) : Void {
    }

    // throws Exception
    public override function fixPath(startPathFindingNodeList : BasicArrayList, endPathFindingNodeList : BasicArrayList, pathList : BasicArrayList) : Void {
        var startPathFindingNode : PathFindingNode = null;
        {
            var index : Int = startPathFindingNodeList.size() - 1;
            while (index >= 0) {
            startPathFindingNode = (cast startPathFindingNodeList.get(index) : PathFindingNode);
            pathList.remove(startPathFindingNode.geographicMapCellPosition);
            pathList.addAt(0, startPathFindingNode.geographicMapCellPosition);
                index--;
            }
        }
    }

    public override function isValid(graphPath : Any) : Bool {
        return false;
    }

    public override function getInvalidReason(graphPath : Any) : String {
        return StringUtil.getInstance().EMPTY_STRING;
    }

}

