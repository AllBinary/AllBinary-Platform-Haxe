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
package org.allbinary.game.layer.unit;

import org.allbinary.game.input.form.PrimaryWaypointHelper;
import org.allbinary.game.layer.AdvancedRTSGameLayer;
import org.allbinary.game.layer.RTSLayerEvent;
import org.allbinary.game.layer.SensorAction;
import org.allbinary.game.layer.SensorActionFactory;
import org.allbinary.game.layer.WaypointBehaviorBase;
import org.allbinary.game.layer.building.BuildingLayer;
import org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer;
import org.allbinary.game.layer.waypoint.event.WaypointEventListenerInterface;
import org.allbinary.graphics.color.BasicColorFactory;
import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.logic.communication.log.ForcedLogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.util.event.AllBinaryEventObject;
import org.allbinary.logic.util.event.EventStrings;
import org.allbinary.media.graphics.geography.map.GeographicMapCellHistory;
import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition;
import org.allbinary.media.graphics.geography.map.SimpleGeographicMapCellPositionFactory;
import org.allbinary.string.CommonSeps;
import org.allbinary.time.TimeDelayHelper;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.util.BasicArrayListUtil;

class UnitWaypointBehavior extends WaypointBehaviorBase implements WaypointEventListenerInterface {
    private static final PATHING : String = "Pathing";
    public var commonSeps : CommonSeps = CommonSeps.getInstance();
    private var longWeaponRange : Int = 0;
    private var sensorAction : SensorAction = SensorActionFactory.getInstance().ATTACK;
    private final completeTimeDelayHelper : TimeDelayHelper;
    public final currentGeographicMapCellHistoryP : GeographicMapCellHistory;
    private var lastPathGeographicMapCellPosition : GeographicMapCellPosition = SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION;
    private var currentPathGeographicMapCellPosition : GeographicMapCellPosition = SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION;
    private final FAKE_WAYPOINT_LAYER : CollidableDestroyableDamageableLayer;
    public final targetList : BasicArrayList;
    private final possibleTargetList : BasicArrayList;
    public final associatedAdvancedRTSGameLayer : UnitLayer;
    private var moving : Bool = false;
    private var movingFromStopped : Bool = false;
    public var waypointPathsListP : BasicArrayList = BasicArrayListUtil.getInstance().getImmutableInstance();
    private var currentTargetDistance : Int = Integer.MAX_VALUE;
    public var currentTargetLayerInterfaceP : CollidableDestroyableDamageableLayer = CollidableDestroyableDamageableLayer.getNullInstance();
    private var trackingWaypoint : Bool = false;
    public function new(associatedAdvancedRTSGameLayer : UnitLayer, fakeWaypoint : CollidableDestroyableDamageableLayer) {
        super();
        this.associatedAdvancedRTSGameLayer = associatedAdvancedRTSGameLayer;
        this.completeTimeDelayHelper = new TimeDelayHelper(30000);
        this.targetList = new BasicArrayListD();
        this.possibleTargetList = new BasicArrayListD();
        this.setWaypointPathsList(BasicArrayListUtil.getInstance().getImmutableInstance());
        this.currentGeographicMapCellHistoryP = new GeographicMapCellHistory();
        this.FAKE_WAYPOINT_LAYER = fakeWaypoint;
    }

    public function initRange(weaponRange : Int) : Void {
        this.longWeaponRange = Std.int(weaponRange / 2);
    }

    public override function onEvent(eventObject : AllBinaryEventObject) : Void {
        ForcedLogUtil.log(EventStrings.getInstance().PERFORMANCE_MESSAGE, this);
    }

    // throws Exception
    public override function onWaypointEvent(event : RTSLayerEvent) : Void {
        final advancedRTSGameLayer : AdvancedRTSGameLayer = (cast event.getRtsLayer() : AdvancedRTSGameLayer);
        this.associatedAdvancedRTSGameLayer.waypointLogHelperP.onWaypointEvent(this.associatedAdvancedRTSGameLayer, advancedRTSGameLayer);
        if (this.associatedAdvancedRTSGameLayer.isSelected()) {
            this.addWaypointFromUser(advancedRTSGameLayer);
        } else if (advancedRTSGameLayer.shouldAddWaypointFromBuilding()) {
            this.addWaypointFromBuilding(advancedRTSGameLayer);
        }
    }

    // throws Exception
    public function addWaypointFromUser(advancedRTSGameLayer : AdvancedRTSGameLayer) : Void {
    }

    // throws Exception
    private function addWaypointFromBuilding(advancedRTSGameLayer : AdvancedRTSGameLayer) : Void {
        if (advancedRTSGameLayer == PrimaryWaypointHelper.getInstance().getWaypointLayer() || advancedRTSGameLayer.getParentLayer() == this.associatedAdvancedRTSGameLayer.getParentLayer()) {
            if (!this.targetList.contains(advancedRTSGameLayer)) {
                this.associatedAdvancedRTSGameLayer.waypointLogHelperP.addWaypointFromBuilding(this.associatedAdvancedRTSGameLayer, advancedRTSGameLayer);
                if (advancedRTSGameLayer.isDestroyed()) {
                    throw new haxe.Exception("Trying to add a dead: " + advancedRTSGameLayer);
                }
                this.targetList.add(advancedRTSGameLayer);
                this.associatedAdvancedRTSGameLayer.waypointLogHelperP.addWaypointFromBuildingList(this.associatedAdvancedRTSGameLayer, advancedRTSGameLayer, this.targetList);
            }
        }
    }

    public override function isWaypointListEmptyOrOnlyTargets() : Bool {
        return false;
    }

    // throws Exception
    public function insertWaypoint(index : Int, rtsLayer : CollidableDestroyableDamageableLayer) : Bool {
        if (this.canInsertWaypoint(index, rtsLayer)) {
            this.associatedAdvancedRTSGameLayer.waypointLogHelperP.insertWaypoint(this.associatedAdvancedRTSGameLayer, index, rtsLayer, this.getName());
            if (rtsLayer.isDestroyed()) {
                throw new haxe.Exception("Trying to add a dead: " + rtsLayer);
            }
            this.targetList.addAt(index, rtsLayer);
            this.associatedAdvancedRTSGameLayer.waypointLogHelperP.insertWaypointList(this.associatedAdvancedRTSGameLayer, index, rtsLayer, this.getName(), this.targetList);
            return true;
        }
        return false;
    }

    public function move() : Void {
        if (this.isMoving()) {
            this.setMovingFromStopped(false);
        } else {
            this.setMovingFromStopped(true);
        }
        this.setMoving(false);
    }

    // throws Exception
    public function setRandomGeographicMapCellHistory(pathsList : BasicArrayList) : Void {
        final size : Int = pathsList.size();
        this.associatedAdvancedRTSGameLayer.waypointLogHelperP.setRandomGeographicMapCellHistoryList(this.associatedAdvancedRTSGameLayer, pathsList);
        if (size > 0) {
            final geographicMapCellPositionBasicArrayList : BasicArrayList = (cast BasicArrayListUtil.getInstance().getRandom(pathsList) : BasicArrayList);
            this.setGeographicMapCellHistoryPath(geographicMapCellPositionBasicArrayList);
        }
    }

    // throws Exception
    public function setGeographicMapCellHistoryPath(geographicMapCellPositionBasicArrayList : BasicArrayList) : Void {
        this.lastPathGeographicMapCellPosition = SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION;
        if (this.associatedAdvancedRTSGameLayer.showMoreCaptionStates) {
            this.associatedAdvancedRTSGameLayer.getCaptionAnimationHelper().update(UnitWaypointBehavior.PATHING, BasicColorFactory.getInstance().GREEN);
        }
        this.currentGeographicMapCellHistoryP.init();
        this.associatedAdvancedRTSGameLayer.init(this.currentGeographicMapCellHistoryP, geographicMapCellPositionBasicArrayList);
        this.setTrackingWaypoint(true);
        this.getCompleteTimeDelayHelper().setStartTimeTNT();
    }

    public function canInsertWaypoint(index : Int, rtsLayer : CollidableDestroyableDamageableLayer) : Bool {
        if (this.targetList.size() > 4) {
        } else if (this.targetList.contains(rtsLayer)) {
        } else {
            return true;
        }
        return false;
    }

    // throws Exception
    public function addBuildingChase(allbinaryLayer : AllBinaryLayer, cellPosition : GeographicMapCellPosition) : Void {
    }

    // throws Exception
    public function moveAwayFromBuilding(buildingLayer : BuildingLayer) : Void {
        final geographicMapCellPosition : GeographicMapCellPosition = this.associatedAdvancedRTSGameLayer.getCurrentGeographicMapCellPosition();
        final list : BasicArrayList = buildingLayer.geographicMapCellPositionAreaBase.getOccupyingGeographicMapCellPositionList();
        if (list.contains(geographicMapCellPosition)) {
            if (this.insertWaypoint(0, this.FAKE_WAYPOINT_LAYER)) {
                this.associatedAdvancedRTSGameLayer.waypointLogHelperP.moveAwayFromBuilding(this.associatedAdvancedRTSGameLayer);
                this.setCurrentTargetLayerInterface((cast this.FAKE_WAYPOINT_LAYER : CollidableDestroyableDamageableLayer));
                final pathsList : BasicArrayList = buildingLayer.getMoveOutOfBuildAreaPath(geographicMapCellPosition);
                this.associatedAdvancedRTSGameLayer.setClosestGeographicMapCellHistory(pathsList);
            }
        }
    }

    private final repeatedToLong : TimeDelayHelper = new TimeDelayHelper(22000);
    public override function needToMove() : Bool {
        this.associatedAdvancedRTSGameLayer.waypointLogHelperP.needToMove(this.associatedAdvancedRTSGameLayer, this);
        if (this.isTrackingWaypoint() || this.sensorAction == SensorActionFactory.getInstance().EVADE || (this.currentTargetLayerInterfaceP != CollidableDestroyableDamageableLayer.getNullInstance() && this.getCurrentTargetDistance() >= this.longWeaponRange + this.currentTargetLayerInterfaceP.getHalfHeight())) {
            this.repeatedToLong.setStartTimeTNT();
            return true;
        }
        if (this.repeatedToLong.isTimeTNT()) {
            final message : String = "Repeating too long: " + this.getMovementLogicAsString();
            ForcedLogUtil.log(message, this.associatedAdvancedRTSGameLayer);
        }
        return false;
    }

    public override function getMovementLogicAsString() : String {
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append("isTrackingWaypoint: ");
        stringBuffer.appendboolean(this.isTrackingWaypoint());
        stringBuffer.append(" sensorAction: ");
        stringBuffer.append(this.sensorAction.name);
        stringBuffer.append(" getCurrentTargetLayerInterface: ");
        stringBuffer.append(StringUtil.getInstance().toString(this.currentTargetLayerInterfaceP));
        if (this.currentTargetLayerInterfaceP != CollidableDestroyableDamageableLayer.getNullInstance()) {
            stringBuffer.append(" Target Range: ");
            stringBuffer.appendint(this.getCurrentTargetDistance());
            stringBuffer.append(" >= ");
            stringBuffer.appendint(Std.int(this.longWeaponRange + this.currentTargetLayerInterfaceP.getHalfHeight()));
        }
        return stringBuffer.toString();
    }

    public function isMovingFromStopped() : Bool {
        return this.movingFromStopped;
    }

    public function setMovingFromStopped(movingFromStopped : Bool) : Void {
        this.movingFromStopped = movingFromStopped;
    }

    public override function setWaypointPathsList(waypointPathsList : BasicArrayList) : Void {
        this.waypointPathsListP = waypointPathsList;
    }

    public override function getWaypointPathsList() : BasicArrayList {
        return this.waypointPathsListP;
    }

    public function isMoving() : Bool {
        return this.moving;
    }

    public function setMoving(moving : Bool) : Void {
        this.moving = moving;
    }

    public override function isTrackingWaypoint() : Bool {
        return this.trackingWaypoint;
    }

    public function getPossibleTargetList() : BasicArrayList {
        return this.possibleTargetList;
    }

    public function setLastPathGeographicMapCellPosition(lastPathGeographicMapCellPosition : GeographicMapCellPosition) : Void {
        this.lastPathGeographicMapCellPosition = lastPathGeographicMapCellPosition;
    }

    public function getLastPathGeographicMapCellPosition() : GeographicMapCellPosition {
        return this.lastPathGeographicMapCellPosition;
    }

    public function setCurrentPathGeographicMapCellPosition(currentPathGeographicMapCellPosition : GeographicMapCellPosition) : Void {
        this.currentPathGeographicMapCellPosition = currentPathGeographicMapCellPosition;
    }

    public override function getCurrentPathGeographicMapCellPosition() : GeographicMapCellPosition {
        return this.currentPathGeographicMapCellPosition;
    }

    public function setSensorAction(sensorAction : SensorAction) : Void {
        this.sensorAction = sensorAction;
    }

    public function getSensorAction() : SensorAction {
        return this.sensorAction;
    }

    public function setCurrentTargetLayerInterface(currentTargetLayerInterface : CollidableDestroyableDamageableLayer) : Void {
        this.currentTargetLayerInterfaceP = currentTargetLayerInterface;
    }

    public override function getCurrentTargetLayerInterface() : CollidableDestroyableDamageableLayer {
        return this.currentTargetLayerInterfaceP;
    }

    public function setCurrentTargetDistance(currentTargetDistance : Int) : Void {
        this.currentTargetDistance = currentTargetDistance;
    }

    public function getCurrentTargetDistance() : Int {
        return this.currentTargetDistance;
    }

    public function getCompleteTimeDelayHelper() : TimeDelayHelper {
        return this.completeTimeDelayHelper;
    }

    public override function getCurrentGeographicMapCellHistory() : GeographicMapCellHistory {
        return this.currentGeographicMapCellHistoryP;
    }

    public function setTrackingWaypoint(trackingWaypoint : Bool) : Void {
        this.trackingWaypoint = trackingWaypoint;
    }

}

