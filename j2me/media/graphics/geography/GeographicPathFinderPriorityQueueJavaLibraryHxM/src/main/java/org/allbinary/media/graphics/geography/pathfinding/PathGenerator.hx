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

import org.allbinary.media.graphics.geography.map.BasicGeographicMap;
import org.allbinary.media.graphics.geography.map.GeographicMapCellHistory;
import org.allbinary.util.BasicArrayList;

class PathGenerator implements PathGeneratorInterface {
    private static final SINGLETON : PathGenerator = new PathGenerator();
    public static function getInstance() : PathGenerator {
        return PathGenerator.SINGLETON;
    }

    public function new() {
    }

    // throws Exception
    public function init(geographicMapInterface : Any, totalPaths : Int) : Void {
    }

    // throws Exception
    public function getInstanceNoCache(geographicMapInterface : BasicGeographicMap, pathFindingInfo : PathFindingInfo, totalPaths : Int) : BasicArrayList {
        final geographicMapCellPositionBasicArrayList : BasicArrayList = this.create(geographicMapInterface, pathFindingInfo, totalPaths);
        return geographicMapCellPositionBasicArrayList;
    }

    // throws Exception
    public function createList(geographicMapInterface : BasicGeographicMap, geographicMapCellHistory : GeographicMapCellHistory, pathFindingInfo : PathFindingInfo, totalPaths : Int) : BasicArrayList {
        throw new haxe.Exception();
    }

    // throws Exception
    private function create(geographicMapInterface : BasicGeographicMap, pathFindingInfo : PathFindingInfo, totalPaths : Int) : BasicArrayList {
        final startPathFindingNodeList : BasicArrayList = pathFindingInfo.getStartPathFindingNodeList();
        final endPathFindingNodeList : BasicArrayList = pathFindingInfo.getEndPathFindingNodeList();
        final geographicPathFinderInterface : GeographicPathFinderBase = pathFindingInfo.getPathFinder();
        final geographicMapCellPositionBasicArrayList : BasicArrayList = geographicPathFinderInterface.searchTotalPath(startPathFindingNodeList, endPathFindingNodeList, totalPaths);
        return geographicMapCellPositionBasicArrayList;
    }

    // throws Exception
    public function createN(geographicMapInterface : BasicGeographicMap, pathFindingInfo : PathFindingInfo, totalPaths : Int, multipassState : MultipassState) : BasicArrayList {
        final startPathFindingNodeList : BasicArrayList = pathFindingInfo.getStartPathFindingNodeList();
        final endPathFindingNodeList : BasicArrayList = pathFindingInfo.getEndPathFindingNodeList();
        final geographicPathFinderInterface : GeographicPathFinderBase = pathFindingInfo.getPathFinder();
        final geographicMapCellPositionBasicArrayList : BasicArrayList = geographicPathFinderInterface.searchTotalPathN(startPathFindingNodeList, endPathFindingNodeList, totalPaths, multipassState);
        return geographicMapCellPositionBasicArrayList;
    }

    // throws Exception
    private function isValid(pathList : BasicArrayList, geographicMapCellHistory : GeographicMapCellHistory) : Bool {
        throw new haxe.Exception();
    }

}

