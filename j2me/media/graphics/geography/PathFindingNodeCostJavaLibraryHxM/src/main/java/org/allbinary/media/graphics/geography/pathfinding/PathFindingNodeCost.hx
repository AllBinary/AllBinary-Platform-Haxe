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
package org.allbinary.media.graphics.geography.pathfinding;

import org.allbinary.logic.string.StringMaker;
import org.allbinary.string.CommonSeps;
import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition;
import org.allbinary.string.CommonLabels;

class PathFindingNodeCost extends PathFindingNode implements Comparable<PathFindingNodeCost> {
    public static final NULL_PATH_FINDING_NODE_COST_ARRAY_ARRAY : haxe.ds.Vector<haxe.ds.Vector<PathFindingNodeCost>> = haxe.ds.Vector.fromArrayCopy([for (index in 0...0) haxe.ds.Vector.fromArrayCopy([for (index2 in 0...0) null])]);
    private final commonSeps : CommonSeps = CommonSeps.getInstance();
    public var pathFindingNodeCostInfoP : PathFindingNodeCostInfo;
    public function new(parent : Any, geographicMapCellPosition : GeographicMapCellPosition, pathFindingNodeCostInfo : PathFindingNodeCostInfo) {
        super(parent, geographicMapCellPosition);
        this.pathFindingNodeCostInfoP = pathFindingNodeCostInfo;
        if (this.geographicMapCellPosition == null) {
            throw new haxe.Exception("No GeographicMapCellPosition");
        }
        if (this.getPathFindingNodeCostInfo() == null) {
            throw new haxe.Exception("No PathFindingNodeCostInfo");
        }
    }

    public function getPathFindingNodeCostInfo() : PathFindingNodeCostInfo {
        return this.pathFindingNodeCostInfoP;
    }

    public function setPathFindingNodeCostInfo(pathFindingNodeCostInfo : PathFindingNodeCostInfo) : Void {
        this.pathFindingNodeCostInfoP = pathFindingNodeCostInfo;
    }

    public override function compareTo(pathFindingNodeCost : PathFindingNodeCost) : Int {
        return this.pathFindingNodeCostInfoP.compareTo(pathFindingNodeCost.pathFindingNodeCostInfoP);
    }

    public function toString() : String {
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(Type.getClassName(Type.getClass(this)));
        stringBuffer.append(CommonLabels.getInstance().COLON_SEP);
        stringBuffer.append(this.getPathFindingNodeCostInfo().toString());
        stringBuffer.append(" Path: ");
        stringBuffer.append(this.geographicMapCellPosition.toString());
        var pathFindingNode : PathFindingNode = (cast this.parent : PathFindingNode);
        while (pathFindingNode != null) {
            stringBuffer.append(pathFindingNode.geographicMapCellPosition.toString());
            stringBuffer.append(this.commonSeps.SPACE);
            pathFindingNode = (cast pathFindingNode.parent : PathFindingNode);
        }
        return stringBuffer.toString();
    }

}

