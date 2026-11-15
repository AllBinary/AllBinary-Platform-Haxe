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
import org.allbinary.string.CommonLabels;

class PathFindingNodeCostInfo implements Comparable<PathFindingNodeCostInfo> {
    private final pathFindingNodeCostInfoData : PathFindingNodeCostInfoData = PathFindingNodeCostInfoData.getInstance();
    public var costFromStartP : haxe.Int64;
    public var costToEndP : haxe.Int64;
    public var totalCostP : haxe.Int64 = haxe.Int64.ofInt(0);
    public function new(costFromStart : haxe.Int64, costToGoal : haxe.Int64) {
        this.costFromStartP = costFromStart;
        this.costToEndP = costToGoal;
        this.setCalculatedTotalCost();
    }

    public function setCostToEnd(costToEnd : haxe.Int64) : Void {
        this.costToEndP = costToEnd;
    }

    public function setTotalCost(totalCost : haxe.Int64) : Void {
        this.totalCostP = totalCost;
    }

    // throws Exception
    public function setCalculatedTotalCost() : Void {
        this.totalCostP = this.costFromStartP + this.costToEndP;
        if (this.totalCostP > this.pathFindingNodeCostInfoData.MAX_NODE_COST) {
            throw new haxe.Exception("Max Cost Exceeded");
        }
    }

    public function setCostFromStart(cost : haxe.Int64) : Void {
        this.costFromStartP = cost;
    }

    public function addCostFromStart(cost : haxe.Int64) : Void {
        this.costFromStartP += cost;
    }

    public function compareTo(pathFindingNodeCostInfo : PathFindingNodeCostInfo) : Int {
        return java.lang.Long.compare(this.totalCostP, pathFindingNodeCostInfo.totalCostP);
    }

    public function toString() : String {
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(Type.getClassName(Type.getClass(this)));
        stringBuffer.append(CommonLabels.getInstance().COLON_SEP);
        stringBuffer.append("CostFromStart: ");
        stringBuffer.appendlong(this.costFromStartP);
        stringBuffer.append(" CostToEnd: ");
        stringBuffer.appendlong(this.costToEndP);
        stringBuffer.append(" TotalCost: ");
        stringBuffer.appendlong(this.totalCostP);
        return stringBuffer.toString();
    }

}

