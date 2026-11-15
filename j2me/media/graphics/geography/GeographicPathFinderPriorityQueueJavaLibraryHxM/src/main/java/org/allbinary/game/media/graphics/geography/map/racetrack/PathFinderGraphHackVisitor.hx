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

import org.allbinary.util.BasicArrayList;
import org.allbinary.media.graphics.geography.map.BasicGeographicMap;

//1.4.2
class PathFinderGraphHackVisitor extends BasePathFinderGraphVisitor {
    public function new(geographicMapInterface : BasicGeographicMap, edgeMinimum : Int, minPathWeight : Int, maxPathWeight : Int) {
        super(geographicMapInterface, edgeMinimum, minPathWeight, maxPathWeight);
    }

    // throws Exception
    public override function visit(graph : Any, startPathFindingNodeList : BasicArrayList, endPathFindingNodeList : BasicArrayList) : Void {
        this.fixStart(graph, startPathFindingNodeList);
        this.fixEnd(graph, endPathFindingNodeList);
        this.fixOverPassEdges(graph);
    }

    // throws Exception
    private function fixStart(graph : Any, startPathFindingNodeList : BasicArrayList) : Void {
    }

    // throws Exception
    private function fixEnd(graph : Any, endPathFindingNodeList : BasicArrayList) : Void {
    }

    // throws Exception
    private function fixOverPassEdges(graph : Any) : Void {
    }

    // throws Exception
    public override function fixPath(startPathFindingNodeList : BasicArrayList, endPathFindingNodeList : BasicArrayList, pathList : BasicArrayList) : Void {
    }

    // throws Exception
    private function removeOverPassEdges(pathList : BasicArrayList) : Void {
    }

    public override function isValid(graphPath : Any) : Bool {
        return false;
    }

}

