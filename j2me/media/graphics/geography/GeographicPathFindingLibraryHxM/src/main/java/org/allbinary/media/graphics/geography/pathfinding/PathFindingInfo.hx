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

import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListUtil;

class PathFindingInfo implements PathFindingInfoInterface {
    public static final NULL_PATH_FINDING_INFO : PathFindingInfo = new PathFindingInfo(PathFindingNodeCostInfoFactoryBase.NULL_PATH_FINDING_NODE_COST_INFO_FACTORY_BASE, BasicArrayListUtil.getInstance().getImmutableInstance(), BasicArrayListUtil.getInstance().getImmutableInstance());
    private var pathFinder : GeographicPathFinderBase = GeographicPathFinderBase.NULL_GEOGRAPHIC_PATH_FINDER_BASE;
    private final startPathFindingNodeList : BasicArrayList;
    private final endPathFindingNodeList : BasicArrayList;
    private final pathFindingNodeCostInfoFactoryInterface : PathFindingNodeCostInfoFactoryBase;
    public function new(pathFindingNodeCostInfoFactoryInterface : PathFindingNodeCostInfoFactoryBase, startPathFindingNodeList : BasicArrayList, endPathFindingNodeList : BasicArrayList) {
        this.pathFindingNodeCostInfoFactoryInterface = pathFindingNodeCostInfoFactoryInterface;
        this.startPathFindingNodeList = startPathFindingNodeList;
        this.endPathFindingNodeList = endPathFindingNodeList;
    }

    public function getStartPathFindingNodeList() : BasicArrayList {
        return this.startPathFindingNodeList;
    }

    public function getEndPathFindingNodeList() : BasicArrayList {
        return this.endPathFindingNodeList;
    }

    public function getPathFinder() : GeographicPathFinderBase {
        return this.pathFinder;
    }

    public function addStartPathFindingNode(startPathFindingNode : PathFindingNode) : Void {
        this.startPathFindingNodeList.add(startPathFindingNode);
    }

    public function addEndPathFindingNode(endPathFindingNode : PathFindingNode) : Void {
        this.endPathFindingNodeList.add(endPathFindingNode);
    }

    public function setPathFinder(pathFinder : GeographicPathFinderBase) : Void {
        this.pathFinder = pathFinder;
    }

    public function getPathFindingNodeCostInfoFactoryInterface() : PathFindingNodeCostInfoFactoryBase {
        return this.pathFindingNodeCostInfoFactoryInterface;
    }

}

