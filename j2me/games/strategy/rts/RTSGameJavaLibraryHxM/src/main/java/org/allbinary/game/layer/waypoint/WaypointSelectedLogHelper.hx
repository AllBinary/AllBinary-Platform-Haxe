/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2022 AllBinary 
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
package org.allbinary.game.layer.waypoint;

import org.allbinary.game.layer.PathFindingLayerInterface;
import org.allbinary.game.layer.WaypointBehaviorBase;
import org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonLabels;
import org.allbinary.string.CommonSeps;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition;
import org.allbinary.util.BasicArrayList;

class WaypointSelectedLogHelper extends WaypointLogHelper {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instanceC : WaypointSelectedLogHelper = new WaypointSelectedLogHelper();
    public static function getInstance() : WaypointSelectedLogHelper {
        return WaypointSelectedLogHelper.instanceC;
    }

    private final commonSeps : CommonSeps = CommonSeps.getInstance();
    private final stringUtil : StringUtil = StringUtil.getInstance();
    public override function onWaypointEvent(associatedAdvancedRTSGameLayer : PathFindingLayerInterface, advancedRTSGameLayer : PathFindingLayerInterface) : Void {
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(associatedAdvancedRTSGameLayer.getName());
        stringBuffer.append(" onWaypointEvent: ");
        stringBuffer.append(advancedRTSGameLayer.getName());
        if (advancedRTSGameLayer.getParentLayer() != null) {
            stringBuffer.append(" With Parent: ");
            stringBuffer.append(advancedRTSGameLayer.getParentLayer().getName());
        }
        this.logUtil.putF(stringBuffer.toString(), this, "onWaypointEvent");
    }

    public override function addWaypointFromBuilding(associatedAdvancedRTSGameLayer : PathFindingLayerInterface, advancedRTSGameLayer : PathFindingLayerInterface) : Void {
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(associatedAdvancedRTSGameLayer.getName());
        stringBuffer.append(" Adding Waypoint: ");
        stringBuffer.append(advancedRTSGameLayer.getName());
        if (advancedRTSGameLayer.getParentLayer() != null) {
            stringBuffer.append(" With Parent: ");
            stringBuffer.append(advancedRTSGameLayer.getParentLayer().getName());
        }
        this.logUtil.putF(stringBuffer.toString(), this, "selected: onWaypointEvent");
    }

    public override function addWaypointFromBuildingList(associatedAdvancedRTSGameLayer : PathFindingLayerInterface, advancedRTSGameLayer : PathFindingLayerInterface, list : BasicArrayList) : Void {
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(associatedAdvancedRTSGameLayer.getName());
        stringBuffer.append(" Waypoints: ");
        stringBuffer.append(this.stringUtil.toString(list));
        this.logUtil.putF(stringBuffer.toString(), this, "selected: onWaypointEvent");
    }

    public override function insertWaypoint(associatedAdvancedRTSGameLayer : PathFindingLayerInterface, index : Int, rtsLayer : CollidableDestroyableDamageableLayer, waypointName : String) : Void {
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(associatedAdvancedRTSGameLayer.getName());
        stringBuffer.append(this.commonSeps.SPACE);
        stringBuffer.append(waypointName);
        stringBuffer.append(" Insert: ");
        stringBuffer.append(rtsLayer.getName());
        stringBuffer.append(" for Waypoint: ");
        this.logUtil.putF(stringBuffer.toString(), this, "selected: insertWaypoint");
    }

    public override function insertWaypointList(associatedAdvancedRTSGameLayer : PathFindingLayerInterface, index : Int, rtsLayer : CollidableDestroyableDamageableLayer, waypointName : String, list : BasicArrayList) : Void {
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(associatedAdvancedRTSGameLayer.getName());
        stringBuffer.append(this.commonSeps.SPACE);
        stringBuffer.append(waypointName);
        stringBuffer.append(" Insert: ");
        stringBuffer.append(rtsLayer.getName());
        stringBuffer.append(" Waypoints: ");
        stringBuffer.append(this.stringUtil.toString(list));
        this.logUtil.putF(stringBuffer.toString(), this, "selected: insertWaypoint");
    }

    public override function setRandomGeographicMapCellHistoryList(associatedAdvancedRTSGameLayer : PathFindingLayerInterface, pathsList : BasicArrayList) : Void {
        final size : Int = pathsList.size();
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(associatedAdvancedRTSGameLayer.getName());
        stringBuffer.append(this.commonSeps.SPACE);
        stringBuffer.append(CommonLabels.getInstance().START);
        stringBuffer.appendint(size);
        stringBuffer.append(" -> ");
        stringBuffer.append(this.stringUtil.toString(pathsList));
        this.logUtil.putF(stringBuffer.toString(), this, "selected: setRandomGeographicMapCellHistory");
    }

    public override function moveAwayFromBuilding(associatedAdvancedRTSGameLayer : PathFindingLayerInterface) : Void {
        this.logUtil.putF(new StringMaker().append(associatedAdvancedRTSGameLayer.getName()).append(" Trying to move away from building").toString(), this, "selected: moveAwayFromBuilding");
    }

    public override function needToMove(associatedAdvancedRTSGameLayer : PathFindingLayerInterface, unitWaypointBehavior : WaypointBehaviorBase) : Void {
        this.logUtil.putF(new StringMaker().append(associatedAdvancedRTSGameLayer.getName()).append(unitWaypointBehavior.getMovementLogicAsString()).toString(), this, "needToMove");
    }

    public override function setRandomGeographicMapCellHistory(associatedAdvancedRTSGameLayer : PathFindingLayerInterface) : Void {
        this.logUtil.putF(new StringMaker().append(associatedAdvancedRTSGameLayer.getName()).append(" pathsList is null").toString(), this, "setRandomGeographicMapCellHistory");
    }

    public override function setCurrentPathGeographicMapCellPosition(associatedAdvancedRTSGameLayer : PathFindingLayerInterface, existingCurrentPathGeographicMapCellPosition : GeographicMapCellPosition, currentPathGeographicMapCellPosition : GeographicMapCellPosition) : Void {
        if (existingCurrentPathGeographicMapCellPosition == null) {
            this.logUtil.putF(new StringMaker().append(associatedAdvancedRTSGameLayer.getName()).append(" currentPathGeographicMapCellPosition: ").append(this.stringUtil.toString(currentPathGeographicMapCellPosition)).toString(), this, "setCurrentPathGeographicMapCellPosition");
        }
    }

    public override function setNextUnvisitedPathGeographicMapCellPosition(associatedAdvancedRTSGameLayer : PathFindingLayerInterface, existingNextUnvisitedPathGeographicMapCellPosition : GeographicMapCellPosition, nextUnvisitedPathGeographicMapCellPosition : GeographicMapCellPosition) : Void {
        if (existingNextUnvisitedPathGeographicMapCellPosition != nextUnvisitedPathGeographicMapCellPosition) {
            this.logUtil.putF(new StringMaker().append(associatedAdvancedRTSGameLayer.getName()).append(" nextUnvisitedPathGeographicMapCellPosition: ").append(this.stringUtil.toString(nextUnvisitedPathGeographicMapCellPosition)).toString(), this, "setNextUnvisitedPathGeographicMapCellPosition");
        }
    }

    public function new() {
        super();
    }
}

