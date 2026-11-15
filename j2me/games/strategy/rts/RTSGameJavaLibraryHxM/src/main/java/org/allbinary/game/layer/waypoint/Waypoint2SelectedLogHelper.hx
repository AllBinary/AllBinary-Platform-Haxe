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
import org.allbinary.string.CommonSeps;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.math.PositionStrings;
import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition;
import org.allbinary.util.BasicArrayList;

class Waypoint2SelectedLogHelper extends Waypoint2LogHelper {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instanceC : Waypoint2SelectedLogHelper = new Waypoint2SelectedLogHelper();
    public static function getInstance() : Waypoint2LogHelper {
        return Waypoint2SelectedLogHelper.instanceC;
    }

    private final commonSeps : CommonSeps = CommonSeps.getInstance();
    private final positionStrings : PositionStrings = PositionStrings.getInstance();
    private final stringUtil : StringUtil = StringUtil.getInstance();
    private final ENEMY_POSSIBLE_TARGET : String = " Enemy Possible Target: ";
    private final CLOSE_RANGE : String = "closeRange: ";
    private final SENSOR_RANGE : String = " sensorRange: ";
    private final ONLY_TARGETS : String = " Only Targets: ";
    private final SHORTER_THAN_CURRENT_TARGET_DISTANCE : String = " isShorterThanCurrentTargetDistance: ";
    private final CURRENT_TARGET_DESTROYED : String = " isCurrentTargetDestroyed: ";
    private final CURRENT_TARGET_NOT_AVAILABLE : String = " isCurrentTargetNotAvailable: ";
    private final PROCESS_POSSIBLE_TARGET : String = "selected: processPossibleTarget1";
    public override function initRange(associatedAdvancedRTSGameLayer : PathFindingLayerInterface, closeRange : Int, sensorRange : Int) : Void {
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(associatedAdvancedRTSGameLayer.getName());
        stringBuffer.append(this.CLOSE_RANGE);
        stringBuffer.appendint(closeRange);
        stringBuffer.append(this.SENSOR_RANGE);
        stringBuffer.appendint(sensorRange);
        this.logUtil.putF(stringBuffer.toString(), this, "selected: initRange");
    }

    public override function processPossibleTarget(associatedAdvancedRTSGameLayer : PathFindingLayerInterface, waypointBehaviorBase : WaypointBehaviorBase, layerInterface : PathFindingLayerInterface, anotherTargetDistance : Int, isShorterThanCurrentTargetDistance : Bool, isCurrentTargetDestroyed : Bool) : Void {
        if (waypointBehaviorBase.isWaypointListEmptyOrOnlyTargets() && waypointBehaviorBase.isInSensorRange((cast layerInterface : CollidableDestroyableDamageableLayer), anotherTargetDistance)) {
            final stringBuffer : StringMaker = new StringMaker();
            stringBuffer.append(associatedAdvancedRTSGameLayer.getName());
            stringBuffer.append(this.ONLY_TARGETS);
            stringBuffer.appendboolean(waypointBehaviorBase.isWaypointListEmptyOrOnlyTargets());
            stringBuffer.append(this.SHORTER_THAN_CURRENT_TARGET_DISTANCE);
            stringBuffer.appendboolean(isShorterThanCurrentTargetDistance);
            stringBuffer.append(this.CURRENT_TARGET_DESTROYED);
            stringBuffer.appendboolean(isCurrentTargetDestroyed);
            stringBuffer.append(this.CURRENT_TARGET_NOT_AVAILABLE);
            stringBuffer.appendboolean((waypointBehaviorBase.getCurrentTargetLayerInterface() == null));
            this.logUtil.putF(stringBuffer.toString(), this, this.PROCESS_POSSIBLE_TARGET);
        }
    }

    public override function processSetTarget(associatedAdvancedRTSGameLayer : PathFindingLayerInterface, waypointBehaviorBase : WaypointBehaviorBase, layerInterface : PathFindingLayerInterface, anotherTargetDistance : Int) : Void {
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(associatedAdvancedRTSGameLayer.getName());
        stringBuffer.append(this.commonSeps.SPACE);
        stringBuffer.append(waypointBehaviorBase.getCurrentTargetingStateString());
        stringBuffer.append(this.ENEMY_POSSIBLE_TARGET);
        stringBuffer.append(layerInterface.getName());
        stringBuffer.append(" anotherTargetDistance: ");
        stringBuffer.appendint(anotherTargetDistance);
        this.logUtil.putF(stringBuffer.toString(), this, "selected: processPossibleTarget2");
    }

    public override function processPossibleTargetCloser(associatedAdvancedRTSGameLayer : PathFindingLayerInterface, waypointBehaviorBase : WaypointBehaviorBase, layerInterface : PathFindingLayerInterface, anotherTargetDistance : Int) : Void {
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(associatedAdvancedRTSGameLayer.getName());
        stringBuffer.append(this.commonSeps.SPACE);
        stringBuffer.append(waypointBehaviorBase.getCurrentTargetingStateString());
        stringBuffer.append(this.ENEMY_POSSIBLE_TARGET);
        stringBuffer.append(layerInterface.getName());
        stringBuffer.append(" anotherTargetDistance: ");
        stringBuffer.appendint(anotherTargetDistance);
        this.logUtil.putF(stringBuffer.toString(), this, "selected: processPossibleTarget3");
    }

    public override function setTarget(associatedAdvancedRTSGameLayer : PathFindingLayerInterface, waypointBehaviorBase : WaypointBehaviorBase, layerInterface : PathFindingLayerInterface, anotherTargetDistance : Int) : Void {
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(associatedAdvancedRTSGameLayer.getName());
        stringBuffer.append(this.commonSeps.SPACE);
        stringBuffer.append(waypointBehaviorBase.getName());
        stringBuffer.append(" targeting: ");
        stringBuffer.append(layerInterface.getName());
        stringBuffer.append(" at: ");
        stringBuffer.appendint(anotherTargetDistance);
        stringBuffer.append(" instead of: ");
        stringBuffer.append(waypointBehaviorBase.getCurrentTargetingStateString());
        this.logUtil.putF(stringBuffer.toString(), this, "selected: setTarget");
    }

    public override function setTargetPath(associatedAdvancedRTSGameLayer : PathFindingLayerInterface) : Void {
        this.logUtil.putF("Target Destroyed", this, "selected: setTargetPath");
    }

    public override function setTargetPathIgnoreNewPath(associatedAdvancedRTSGameLayer : PathFindingLayerInterface, waypointBehaviorBase : WaypointBehaviorBase) : Void {
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(associatedAdvancedRTSGameLayer.getName());
        stringBuffer.append(" Set Path To Target: ");
        stringBuffer.append(waypointBehaviorBase.getCurrentTargetLayerInterface().getName());
        stringBuffer.append(this.commonSeps.SPACE);
        stringBuffer.append(this.stringUtil.toString(waypointBehaviorBase.getCurrentTargetLayerInterface()));
        this.logUtil.putF(stringBuffer.toString(), this, "selected: setTargetPath");
    }

    public override function processWaypoint(associatedAdvancedRTSGameLayer : PathFindingLayerInterface, waypointBehaviorBase : WaypointBehaviorBase, targetLayer : PathFindingLayerInterface, size : Int) : Void {
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(associatedAdvancedRTSGameLayer.getName());
        stringBuffer.append(" Size: ");
        stringBuffer.appendint(size);
        stringBuffer.append(" Waypoint: ");
        stringBuffer.append(targetLayer.getName());
        stringBuffer.append(" Target: ");
        stringBuffer.append(this.stringUtil.toString(waypointBehaviorBase.getCurrentTargetLayerInterface()));
        stringBuffer.append(" isTrackingWaypoint: ");
        stringBuffer.appendboolean(waypointBehaviorBase.isTrackingWaypoint());
        stringBuffer.append(" WaypointOverridesAttacking: ");
        stringBuffer.appendboolean(waypointBehaviorBase.isWaypointOverridesAttacking());
        this.logUtil.putF(stringBuffer.toString(), this, "selected: processWaypoint");
    }

    public override function processWaypointTracked(associatedAdvancedRTSGameLayer : PathFindingLayerInterface, waypointBehaviorBase : WaypointBehaviorBase) : Void {
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(associatedAdvancedRTSGameLayer.getName());
        stringBuffer.append(" currentPathGeographicMapCellPosition: ");
        stringBuffer.append(this.stringUtil.toString(waypointBehaviorBase.getCurrentPathGeographicMapCellPosition()));
        stringBuffer.append(" nextUnvisitedPathGeographicMapCellPosition: ");
        stringBuffer.append(this.stringUtil.toString(waypointBehaviorBase.getNextUnvisitedPathGeographicMapCellPosition()));
        stringBuffer.append(" Tracked: ");
        stringBuffer.append(this.stringUtil.toString(waypointBehaviorBase.getCurrentGeographicMapCellHistory().getTracked()));
        this.logUtil.putF(stringBuffer.toString(), this, "selected: processWaypoint");
    }

    public override function processWaypointTrackedVisit(associatedAdvancedRTSGameLayer : PathFindingLayerInterface, geographicMapCellPosition : GeographicMapCellPosition) : Void {
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(associatedAdvancedRTSGameLayer.getName());
        stringBuffer.append(" Visited: ");
        stringBuffer.append(this.stringUtil.toString(geographicMapCellPosition));
        this.logUtil.putF(stringBuffer.toString(), this, "selected: processWaypoint");
    }

    public override function processWaypointTrackedWithoutProgress(associatedAdvancedRTSGameLayer : PathFindingLayerInterface, reason : String) : Void {
        this.logUtil.putF(new StringMaker().append(associatedAdvancedRTSGameLayer.getName()).append(reason).toString(), this, "turnTo");
    }

    public override function wander(associatedAdvancedRTSGameLayer : PathFindingLayerInterface) : Void {
        this.logUtil.putF(associatedAdvancedRTSGameLayer.getName(), this, "wander");
    }

    public override function targetDestroyed(associatedAdvancedRTSGameLayer : PathFindingLayerInterface) : Void {
        this.logUtil.putF(new StringMaker().append(associatedAdvancedRTSGameLayer.getName()).append(" Target Destroyed").toString(), this, "selected: processTargeting");
    }

    public override function processTargeting(associatedAdvancedRTSGameLayer : PathFindingLayerInterface, dx : Int, dy : Int) : Void {
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(associatedAdvancedRTSGameLayer.getName());
        stringBuffer.append(this.commonSeps.SPACE);
        stringBuffer.append(this.positionStrings.DX_LABEL);
        stringBuffer.appendint(dx);
        stringBuffer.append(this.commonSeps.SPACE);
        stringBuffer.append(this.positionStrings.DY_LABEL);
        stringBuffer.appendint(dy);
        this.logUtil.putF(stringBuffer.toString(), this, "selected: processTargeting");
    }

    public override function processTargetingNonWayPoint(associatedAdvancedRTSGameLayer : PathFindingLayerInterface, dx : Int, dy : Int) : Void {
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(associatedAdvancedRTSGameLayer.getName());
        stringBuffer.append(" Targeting Non Waypoint ");
        stringBuffer.append(this.positionStrings.DX_LABEL);
        stringBuffer.appendint(dx);
        stringBuffer.append(this.commonSeps.SPACE);
        stringBuffer.append(this.positionStrings.DY_LABEL);
        stringBuffer.appendint(dy);
        this.logUtil.putF(stringBuffer.toString(), this, "selected: processTargeting");
    }

    public override function removeWaypoint(associatedAdvancedRTSGameLayer : PathFindingLayerInterface, unitWaypointBehavior2 : WaypointBehaviorBase, waypointLayer : PathFindingLayerInterface, reason : String) : Void {
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(associatedAdvancedRTSGameLayer.getName());
        stringBuffer.append(this.commonSeps.SPACE);
        stringBuffer.append(unitWaypointBehavior2.getName());
        stringBuffer.append(" remove: ");
        stringBuffer.append(waypointLayer.getName());
        stringBuffer.append(" because: ");
        stringBuffer.append(reason);
        this.logUtil.putF(stringBuffer.toString(), this, "selected: removeWaypoint");
    }

    public override function removeWaypointList(associatedAdvancedRTSGameLayer : PathFindingLayerInterface, unitWaypointBehavior2 : WaypointBehaviorBase, list : BasicArrayList) : Void {
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(associatedAdvancedRTSGameLayer.getName());
        stringBuffer.append(this.commonSeps.SPACE);
        stringBuffer.append(unitWaypointBehavior2.getName());
        stringBuffer.append(" Waypoints: ");
        stringBuffer.append(this.stringUtil.toString(list));
        this.logUtil.putF(stringBuffer.toString(), this, "selected: removeWaypoint");
    }

    public override function removeWaypointClear(associatedAdvancedRTSGameLayer : PathFindingLayerInterface) : Void {
        this.logUtil.putF(new StringMaker().append(associatedAdvancedRTSGameLayer.getName()).append(" Clearing removed waypoint").toString(), this, "selected: removeWaypoint");
    }

    public override function clearTarget(associatedAdvancedRTSGameLayer : PathFindingLayerInterface) : Void {
        this.logUtil.putF(new StringMaker().append(associatedAdvancedRTSGameLayer.getName()).append(" Cleared Target").toString(), this, "selected: clearTarget");
    }

    public override function addWaypointFromUser(associatedAdvancedRTSGameLayer : PathFindingLayerInterface, advancedRTSGameLayer : PathFindingLayerInterface) : Void {
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(associatedAdvancedRTSGameLayer.getName());
        stringBuffer.append(" Adding Waypoint to Selected: ");
        stringBuffer.append(advancedRTSGameLayer.getName());
        if (advancedRTSGameLayer.getParentLayer() != null) {
            stringBuffer.append(" With Parent: ");
            stringBuffer.append(advancedRTSGameLayer.getParentLayer().getName());
        }
        this.logUtil.putF(stringBuffer.toString(), this, "selected: onWaypointEvent");
    }

    public override function targetMovedSoRetarget(associatedAdvancedRTSGameLayer : PathFindingLayerInterface) : Void {
        this.logUtil.putF(new StringMaker().append(associatedAdvancedRTSGameLayer.getName()).append(" - target moved so retargeting").toString(), this, "turnTo");
    }

    public function new() {
        super();
    }
}

