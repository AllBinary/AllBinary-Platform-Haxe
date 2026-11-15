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

import org.allbinary.J2MEUtil;
import org.allbinary.game.configuration.feature.Features;
import org.allbinary.game.layer.SteeringVisitor;
import org.allbinary.game.layer.AdvancedRTSGameLayer;
import org.allbinary.game.layer.MultipassWaypointPathRunnable;
import org.allbinary.game.layer.RTSLayer;
import org.allbinary.game.layer.WaypointPathRunnable;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.string.CommonStrings;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.game.layer.PathFindingLayerInterface;
import org.allbinary.game.layer.WaypointPathRunnableBase;
import org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer;
import org.allbinary.game.layer.waypoint.WaypointBase;
import org.allbinary.game.tracking.TrackingEventHandler;
import org.allbinary.graphics.GPoint;
import org.allbinary.graphics.color.BasicColorFactory;
import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.layer.AllBinaryLayerManager;
import org.allbinary.logic.NullUtil;
import org.allbinary.logic.java.bool.BooleanFactory;
import org.allbinary.math.LayerDistanceUtil;
import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition;
import org.allbinary.media.graphics.geography.map.SimpleGeographicMapCellPositionFactory;
import org.allbinary.thread.PathFindingThreadPool;
import org.allbinary.thread.ThreadPool;
import org.allbinary.time.TimeDelayHelper;

class UnitWaypointBehavior2 extends UnitWaypointBehavior {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final unitWaypointStrings : UnitWaypointStrings = UnitWaypointStrings.getInstance();
    private final basicColorFactory : BasicColorFactory = BasicColorFactory.getInstance();
    private final layerDistanceUtil : LayerDistanceUtil = LayerDistanceUtil.getInstance();
    private final pathFindingThreadPool : ThreadPool = PathFindingThreadPool.getInstance();
    private final progressTimeDelayHelper : TimeDelayHelper;
    private final wanderPathsList : BasicArrayList;
    private final waypointPathRunnable : WaypointPathRunnableBase;
    private var sensorRange : Int = 0;
    private var closeRange : Int = 0;
    private var nextUnvisitedPathGeographicMapCellPosition : GeographicMapCellPosition = SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION;
    private var afterNextUnvisitedPathGeographicMapCellPosition : GeographicMapCellPosition = SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION;
    private var waitingOnTargetPath : Bool = false;
    private var waitingOnWaypointPath : Bool = false;
    private var targetWithoutCachedPathLayerInterface : CollidableDestroyableDamageableLayer = CollidableDestroyableDamageableLayer.getNullInstance();
    public function new(ownerAdvancedRTSGameLayer : UnitLayer, fakeWaypoint : AdvancedRTSGameLayer) {
        super(ownerAdvancedRTSGameLayer, fakeWaypoint);
        this.progressTimeDelayHelper = new TimeDelayHelper(5000);
        this.wanderPathsList = new BasicArrayListD();
        final features : Features = Features.getInstance();
        this.waypointPathRunnable = (J2MEUtil.isHTML() ? new MultipassWaypointPathRunnable() : new WaypointPathRunnable());
    }

    public override function initRange(weaponRange : Int) : Void {
        super.initRange(weaponRange);
        this.closeRange = weaponRange;
        this.sensorRange = weaponRange * 4;
        this.associatedAdvancedRTSGameLayer.waypoint2LogHelperP.initRange(this.associatedAdvancedRTSGameLayer, this.closeRange, this.sensorRange);
    }

    public override function getNextUnvisitedPathGeographicMapCellPosition() : GeographicMapCellPosition {
        return this.nextUnvisitedPathGeographicMapCellPosition;
    }

    public override function isRunning() : Bool {
        if (this.waypointPathRunnable.isRunning()) {
            return true;
        } else {
            return false;
        }
    }

    // throws Exception
    public override function processTick(allBinaryLayerManager : AllBinaryLayerManager) : Void {
        if (this.waypointPathRunnable.isRunning()) {
            if (this.waypointPathsListP != UnitWaypointBehavior2.runningWaypointPathList) {
                this.waypointPathRunnable.setRunning(false);
                if (this.waitingOnTargetPath) {
                    this.setTargetPath();
                } else if (this.waitingOnWaypointPath) {
                    this.setWaypointPath((cast this.waypointPathRunnable.getTargetLayer() : AdvancedRTSGameLayer));
                } else {
                    throw new haxe.Exception("Should not happen");
                }
            } else {
                return;
            }
        }
        this.processTargetList();
        if (!this.waypointPathRunnable.isRunning()) {
            this.processWaypoint();
        } else {
            return;
        }
        if (!this.waypointPathRunnable.isRunning()) {
            this.processTargeting();
        } else {
            return;
        }
        if (!this.waypointPathRunnable.isRunning()) {
            this.teleportIfNoProgress();
        } else {
            return;
        }
    }

    // throws Exception
    private function onEnemyMovement(layerInterface : AdvancedRTSGameLayer) : Void {
        final anotherTargetDistance : Int = this.layerDistanceUtil.getDistance(this.associatedAdvancedRTSGameLayer, layerInterface);
        if (layerInterface == this.currentTargetLayerInterfaceP) {
            this.setCurrentTargetDistance(anotherTargetDistance);
        } else {
            this.processPossibleTarget(layerInterface, anotherTargetDistance);
        }
    }

    // throws Exception
    private function processPossibleTarget(layerInterface : AdvancedRTSGameLayer, anotherTargetDistance : Int) : Void {
        var isShorterThanCurrentTargetDistance : Bool = this.getCurrentTargetDistance() > anotherTargetDistance;
        var isCurrentTargetDestroyed : Bool = this.currentTargetLayerInterfaceP != CollidableDestroyableDamageableLayer.getNullInstance() && this.currentTargetLayerInterfaceP.isDestroyed();
        this.associatedAdvancedRTSGameLayer.waypoint2LogHelperP.processPossibleTarget(this.associatedAdvancedRTSGameLayer, this, layerInterface, anotherTargetDistance, isShorterThanCurrentTargetDistance, isCurrentTargetDestroyed);
        if (this.isWaypointListEmptyOrOnlyTargets() && this.isInSensorRange(layerInterface, anotherTargetDistance) && (isShorterThanCurrentTargetDistance || isCurrentTargetDestroyed)) {
            this.associatedAdvancedRTSGameLayer.waypoint2LogHelperP.processSetTarget(this.associatedAdvancedRTSGameLayer, this, layerInterface, anotherTargetDistance);
            this.setTarget(layerInterface, anotherTargetDistance);
        } else if (this.isCloseRange(layerInterface, anotherTargetDistance) && (isShorterThanCurrentTargetDistance || isCurrentTargetDestroyed)) {
            this.associatedAdvancedRTSGameLayer.waypoint2LogHelperP.processPossibleTargetCloser(this.associatedAdvancedRTSGameLayer, this, layerInterface, anotherTargetDistance);
            this.setTarget(layerInterface, anotherTargetDistance);
        }
    }

    // throws Exception
    private function teleportIfNoProgress() : Void {
        if (this.isTrackingWaypoint() || this.associatedAdvancedRTSGameLayer.getParentLayer().isDestroyed()) {
            if (this.progressTimeDelayHelper.isTimeTNT() && this.nextUnvisitedPathGeographicMapCellPosition != SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION) {
                this.associatedAdvancedRTSGameLayer.teleportTo(this.nextUnvisitedPathGeographicMapCellPosition);
            }
            if (this.getCompleteTimeDelayHelper().isTimeTNT()) {
                final geographicMapCellPosition : GeographicMapCellPosition = (cast this.currentGeographicMapCellHistoryP.getTracked().get(this.currentGeographicMapCellHistoryP.getSize() - 1) : GeographicMapCellPosition);
                this.associatedAdvancedRTSGameLayer.teleportTo(geographicMapCellPosition);
            }
        }
    }

    // throws Exception
    private function setTarget(layerInterface : AdvancedRTSGameLayer, anotherTargetDistance : Int) : Void {
        this.associatedAdvancedRTSGameLayer.waypoint2LogHelperP.setTarget(this.associatedAdvancedRTSGameLayer, this, layerInterface, anotherTargetDistance);
        this.associatedAdvancedRTSGameLayer.getCaptionAnimationHelper().update(this.unitWaypointStrings.TARGET, BasicColorFactory.getInstance().GREEN);
        this.associatedAdvancedRTSGameLayer.setLoad(0);
        this.setCurrentTargetDistance(anotherTargetDistance);
        this.setCurrentTargetLayerInterface(layerInterface);
        this.setTrackingWaypoint(false);
        this.targetList.clear();
        if (!this.isCloseRange(layerInterface, anotherTargetDistance) && this.canInsertWaypoint(0, this.currentTargetLayerInterfaceP)) {
            final geographicMapCellPosition : GeographicMapCellPosition = this.associatedAdvancedRTSGameLayer.getCurrentGeographicMapCellPosition();
            final pathFindingLayerInterface : PathFindingLayerInterface = ((cast this.currentTargetLayerInterfaceP : PathFindingLayerInterface));
            final waypoint : WaypointBase = pathFindingLayerInterface.getWaypointBehavior().getWaypoint();
            final list : BasicArrayList = waypoint.getPathsListFromCacheOnly(geographicMapCellPosition);
            this.setWaypointPathsList(list);
            if (this.waypointPathsListP == null) {
                this.targetWithoutCachedPathLayerInterface = this.currentTargetLayerInterfaceP;
            } else if (this.waypointPathsListP.size() != 0) {
                this.setTargetPath();
            }
        }
    }

    // throws Exception
    private function setTargetPath() : Void {
        if (this.currentTargetLayerInterfaceP != CollidableDestroyableDamageableLayer.getNullInstance()) {
            if (this.currentTargetLayerInterfaceP.isDestroyed()) {
                this.associatedAdvancedRTSGameLayer.waypoint2LogHelperP.setTargetPath(this.associatedAdvancedRTSGameLayer);
                this.associatedAdvancedRTSGameLayer.getCaptionAnimationHelper().update(this.unitWaypointStrings.KILL, this.basicColorFactory.ORANGE);
                this.clearTarget();
                return;
            }
            if (this.currentTargetLayerInterfaceP == this.waypointPathRunnable.getTargetLayer()) {
                this.associatedAdvancedRTSGameLayer.waypoint2LogHelperP.setTargetPathIgnoreNewPath(this.associatedAdvancedRTSGameLayer, this);
                this.insertWaypoint(0, this.currentTargetLayerInterfaceP);
                this.setRandomGeographicMapCellHistory(this.waypointPathsListP);
            }
        }
    }

    // throws Exception
    public override function setGeographicMapCellHistoryPath(geographicMapCellPositionBasicArrayList : BasicArrayList) : Void {
        this.setCurrentPathGeographicMapCellPosition(SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION);
        this.nextUnvisitedPathGeographicMapCellPosition = SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION;
        super.setGeographicMapCellHistoryPath(geographicMapCellPositionBasicArrayList);
    }

    // throws Exception
    private function processWaypoint() : Void {
        final size : Int = this.targetList.size();
        if (size > 0) {
            final targetLayer : AdvancedRTSGameLayer = (cast this.targetList.get(0) : AdvancedRTSGameLayer);
            this.associatedAdvancedRTSGameLayer.waypoint2LogHelperP.processWaypoint(this.associatedAdvancedRTSGameLayer, this, targetLayer, size);
            if (targetLayer.isDestroyed()) {
                this.associatedAdvancedRTSGameLayer.getCaptionAnimationHelper().update(this.unitWaypointStrings.WAYPOINT_DESTROYED_SHORT, this.basicColorFactory.YELLOW);
                this.removeWaypoint(targetLayer, this.unitWaypointStrings.WAYPOINT_DESTROYED);
            } else {
                final geographicMapCellPosition : GeographicMapCellPosition = this.associatedAdvancedRTSGameLayer.getCurrentGeographicMapCellPosition();
                if (this.isTrackingWaypoint()) {
                    this.associatedAdvancedRTSGameLayer.waypoint2LogHelperP.processWaypointTracked(this.associatedAdvancedRTSGameLayer, this);
                    if (this.visitIfAtMidPoint(geographicMapCellPosition)) {
                        this.associatedAdvancedRTSGameLayer.waypoint2LogHelperP.processWaypointTrackedVisit(this.associatedAdvancedRTSGameLayer, geographicMapCellPosition);
                    }
                    if (this.currentGeographicMapCellHistoryP.isAllVisited2() && this.currentTargetLayerInterfaceP != CollidableDestroyableDamageableLayer.getNullInstance()) {
                        final oldWaypointLayer : AdvancedRTSGameLayer = (cast this.currentTargetLayerInterfaceP : AdvancedRTSGameLayer);
                        oldWaypointLayer.getWaypointBehavior().getWaypoint().visit(this.associatedAdvancedRTSGameLayer);
                        this.associatedAdvancedRTSGameLayer.getCaptionAnimationHelper().update(this.unitWaypointStrings.ALL_VISITED_SHORT, this.basicColorFactory.GREEN);
                        this.removeWaypoint((cast this.currentTargetLayerInterfaceP : AdvancedRTSGameLayer), this.unitWaypointStrings.ALL_VISITED);
                    }
                } else if (this.currentTargetLayerInterfaceP == null || this.waypointOverridesAttacking) {
                    final list : BasicArrayList = targetLayer.getWaypointBehavior().getWaypoint().getPathsListFromCacheOnly(geographicMapCellPosition);
                    this.setWaypointPathsList(list);
                    if (this.waypointPathsListP == null) {
                        this.waitingOnWaypointPath = true;
                        this.associatedAdvancedRTSGameLayer.getCaptionAnimationHelper().update(this.unitWaypointStrings.THINKING, this.basicColorFactory.GREEN);
                        this.runWaypointPathTask(targetLayer);
                        return;
                    }
                    this.setWaypointPath(targetLayer);
                }
            }
        }
    }

    // throws Exception
    private function wander() : Void {
        if (this.currentGeographicMapCellHistoryP.isAllVisited2()) {
            this.associatedAdvancedRTSGameLayer.waypoint2LogHelperP.wander(this.associatedAdvancedRTSGameLayer);
            this.associatedAdvancedRTSGameLayer.getCaptionAnimationHelper().update(this.unitWaypointStrings.WANDERING, this.basicColorFactory.RED);
            this.wanderPathsList.clear();
            this.wanderPathsList.add(this.associatedAdvancedRTSGameLayer.getSurroundingGeographicMapCellPositionList());
            this.setRandomGeographicMapCellHistory(this.wanderPathsList);
        }
        this.visitIfAtMidPoint(this.getCurrentPathGeographicMapCellPosition());
        this.updateCurrentPathGeographicMapCellPosition();
        this.associatedAdvancedRTSGameLayer.trackTo(this.unitWaypointStrings.NEXT_PATH_NODE);
    }

    private function visitIfAtMidPoint(geographicMapCellPosition : GeographicMapCellPosition) : Bool {
        final unitLayer : UnitLayer = this.associatedAdvancedRTSGameLayer;
        if (geographicMapCellPosition != SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION && this.nextUnvisitedPathGeographicMapCellPosition == geographicMapCellPosition) {
            final point : GPoint = geographicMapCellPosition.getMidPoint();
            final afterNextPoint : GPoint = this.afterNextUnvisitedPathGeographicMapCellPosition.getMidPoint();
            var beyondMidPoint : Bool = true;
            if (geographicMapCellPosition.getColumn() == this.afterNextUnvisitedPathGeographicMapCellPosition.getColumn()) {
            } else if (point.getX() < afterNextPoint.getX()) {
                if (unitLayer.getXP() + unitLayer.getHalfWidth() < point.getX()) {
                    beyondMidPoint = false;
                }
            } else {
                if (unitLayer.getXP() + unitLayer.getHalfWidth() > point.getX()) {
                    beyondMidPoint = false;
                }
            }
            if (geographicMapCellPosition.getRow() == this.afterNextUnvisitedPathGeographicMapCellPosition.getRow()) {
            } else if (point.getY() < afterNextPoint.getY()) {
                if (unitLayer.getYP() + unitLayer.getHalfHeight() < point.getY()) {
                    beyondMidPoint = false;
                }
            } else {
                if (unitLayer.getYP() + unitLayer.getHalfHeight() > point.getY()) {
                    beyondMidPoint = false;
                }
            }
            if (beyondMidPoint) {
                return this.currentGeographicMapCellHistoryP.visit(geographicMapCellPosition);
            }
        }
        return false;
    }

    // throws Exception
    private function processTargetList() : Void {
        this.targetWithoutCachedPathLayerInterface = CollidableDestroyableDamageableLayer.getNullInstance();
        {
            var index : Int = this.getPossibleTargetList().size() - 1;
            while (index >= 0) {
            final layerInterface : AdvancedRTSGameLayer = (cast this.getPossibleTargetList().get(index) : AdvancedRTSGameLayer);
            if (layerInterface.isDestroyed()) {
                this.getPossibleTargetList().remove(layerInterface);
            } else {
                this.onEnemyMovement(layerInterface);
            }
                index--;
            }
        }
        if (this.targetWithoutCachedPathLayerInterface != CollidableDestroyableDamageableLayer.getNullInstance()) {
            this.waitingOnTargetPath = true;
            this.associatedAdvancedRTSGameLayer.getCaptionAnimationHelper().update(this.unitWaypointStrings.THINKING_ABOUT_TARGET, this.basicColorFactory.GREEN);
            this.runWaypointPathTask((cast this.currentTargetLayerInterfaceP : AdvancedRTSGameLayer));
        }
        this.getPossibleTargetList().clear();
    }

    // throws Exception
    private function processTargeting() : Void {
        if (this.currentTargetLayerInterfaceP != CollidableDestroyableDamageableLayer.getNullInstance() && (this.isInSensorRange(this.currentTargetLayerInterfaceP, this.getCurrentTargetDistance()) || this.isTrackingWaypoint())) {
            if (this.currentTargetLayerInterfaceP.isDestroyed()) {
                this.associatedAdvancedRTSGameLayer.waypoint2LogHelperP.targetDestroyed(this.associatedAdvancedRTSGameLayer);
                this.associatedAdvancedRTSGameLayer.getCaptionAnimationHelper().update(this.unitWaypointStrings.KILL, this.basicColorFactory.ORANGE);
                this.clearTarget();
                return;
            }
            var dx : Int = 0;
            var dy : Int = 0;
            if (this.isTrackingWaypoint()) {
                this.updateCurrentPathGeographicMapCellPosition();
                final point : GPoint = this.nextUnvisitedPathGeographicMapCellPosition.getMidPoint();
                dx = this.associatedAdvancedRTSGameLayer.getXP() + this.associatedAdvancedRTSGameLayer.getHalfWidth() - point.getX();
                dy = this.associatedAdvancedRTSGameLayer.getYP() + this.associatedAdvancedRTSGameLayer.getHalfHeight() - point.getY();
                this.associatedAdvancedRTSGameLayer.waypoint2LogHelperP.processTargeting(this.associatedAdvancedRTSGameLayer, dx, dy);
            } else {
                this.associatedAdvancedRTSGameLayer.waypoint2LogHelperP.processTargetingNonWayPoint(this.associatedAdvancedRTSGameLayer, dx, dy);
                dx = (this.associatedAdvancedRTSGameLayer.getXP() + this.associatedAdvancedRTSGameLayer.getHalfWidth()) - (this.currentTargetLayerInterfaceP.getXP() + this.currentTargetLayerInterfaceP.getHalfWidth());
                dy = (this.associatedAdvancedRTSGameLayer.getYP() + this.associatedAdvancedRTSGameLayer.getHalfHeight()) - (this.currentTargetLayerInterfaceP.getYP() + this.currentTargetLayerInterfaceP.getHalfHeight());
            }
            this.associatedAdvancedRTSGameLayer.trackToDXY(dx, dy);
        } else {
            if (this.associatedAdvancedRTSGameLayer.getParentLayer().isDestroyed()) {
                this.wander();
            } else {
                if (this.associatedAdvancedRTSGameLayer.showMoreCaptionStates) {
                    this.associatedAdvancedRTSGameLayer.getCaptionAnimationHelper().update(this.unitWaypointStrings.STOP, this.basicColorFactory.YELLOW);
                }
                this.associatedAdvancedRTSGameLayer.allStop();
            }
        }
    }

    private function updateCurrentPathGeographicMapCellPosition() : Void {
        this.setLastPathGeographicMapCellPosition(this.getCurrentPathGeographicMapCellPosition());
        this.setCurrentPathGeographicMapCellPosition(this.nextUnvisitedPathGeographicMapCellPosition);
        this.nextUnvisitedPathGeographicMapCellPosition = this.currentGeographicMapCellHistoryP.getFirstUnvisited();
        this.afterNextUnvisitedPathGeographicMapCellPosition = this.currentGeographicMapCellHistoryP.getAfterIfNotLast(this.nextUnvisitedPathGeographicMapCellPosition);
        if (this.getCurrentPathGeographicMapCellPosition() != this.nextUnvisitedPathGeographicMapCellPosition) {
            this.progressTimeDelayHelper.setStartTimeTNT();
        }
    }

    // throws Exception
    private function setWaypointPath(waypointLayer : AdvancedRTSGameLayer) : Void {
        if (this.waypointPathsListP.size() != 0) {
            this.setCurrentTargetLayerInterface(waypointLayer);
            final MAX : Int = Integer.MAX_VALUE;
            this.setCurrentTargetDistance(MAX);
            this.setRandomGeographicMapCellHistory(this.waypointPathsListP);
        } else {
            waypointLayer.getWaypointBehavior().getWaypoint().visit(this.associatedAdvancedRTSGameLayer);
            this.associatedAdvancedRTSGameLayer.getCaptionAnimationHelper().update(this.unitWaypointStrings.ALREADY_THERE_SHORT, this.basicColorFactory.YELLOW);
            this.removeWaypoint(waypointLayer, this.unitWaypointStrings.ALREADY_THERE);
        }
    }

    private static final runningWaypointPathList : BasicArrayList = new BasicArrayListD();
    // throws Exception
    private function runWaypointPathTask(waypointLayer : AdvancedRTSGameLayer) : Void {
        this.setWaypointPathsList(UnitWaypointBehavior2.runningWaypointPathList);
        if (this.waypointPathRunnable.isRunning()) {
            throw new haxe.Exception("Should never be running here");
        }
        this.waypointPathRunnable.setRunning(true);
        this.waypointPathRunnable.setUnitLayer(this.associatedAdvancedRTSGameLayer);
        this.waypointPathRunnable.setTargetLayer(waypointLayer);
        this.pathFindingThreadPool.runTask(this.waypointPathRunnable);
    }

    // throws Exception
    private function removeWaypoint(waypointLayer : RTSLayer, reason : String) : Void {
        this.associatedAdvancedRTSGameLayer.waypoint2LogHelperP.removeWaypoint(this.associatedAdvancedRTSGameLayer, this, waypointLayer, reason);
        this.targetList.remove(waypointLayer);
        this.associatedAdvancedRTSGameLayer.waypoint2LogHelperP.removeWaypointList(this.associatedAdvancedRTSGameLayer, this, this.targetList);
        if (this.currentTargetLayerInterfaceP == waypointLayer) {
            this.associatedAdvancedRTSGameLayer.waypoint2LogHelperP.removeWaypointClear(this.associatedAdvancedRTSGameLayer);
            this.clearTarget();
        }
    }

    // throws Exception
    public override function clearTarget() : Void {
        this.associatedAdvancedRTSGameLayer.waypoint2LogHelperP.clearTarget(this.associatedAdvancedRTSGameLayer);
        this.setCurrentTargetLayerInterface(CollidableDestroyableDamageableLayer.getNullInstance());
        this.setTrackingWaypoint(false);
        final MAX : Int = Integer.MAX_VALUE;
        this.setCurrentTargetDistance(MAX);
        TrackingEventHandler.getInstance().fireEvent(this.associatedAdvancedRTSGameLayer.getTrackingEvent());
    }

    public override function isWaypointListEmptyOrOnlyTargets() : Bool {
        final list : BasicArrayList = this.targetList;
        if (list.size() == 0) {
            return true;
        }
        {
            var index : Int = list.size() - 1;
            while (index >= 0) {
            final layerInterface : AdvancedRTSGameLayer = (cast list.get(index) : AdvancedRTSGameLayer);
            if (layerInterface.isWaypointListEmptyOrOnlyTargets()) {
                return false;
            }
                index--;
            }
        }
        return true;
    }

    private function isCloseRange(layerInterface : AdvancedRTSGameLayer, targetDistance : Int) : Bool {
        return targetDistance < this.closeRange + layerInterface.getHalfHeight();
    }

    public override function isInSensorRange(layerInterface : CollidableDestroyableDamageableLayer, targetDistance : Int) : Bool {
        return targetDistance < this.sensorRange + layerInterface.getHalfHeight();
    }

    private static final TARGET_DISTANCE : String = "Target Distance";
    private static final TARGET_LAYER : String = "Target Layer";
    public override function getCurrentTargetingStateString() : String {
        final stringBuffer : StringMaker = new StringMaker();
        if (this.currentTargetLayerInterfaceP != CollidableDestroyableDamageableLayer.getNullInstance()) {
            stringBuffer.append(UnitWaypointBehavior2.TARGET_LAYER);
            stringBuffer.append(this.commonSeps.SPACE);
            stringBuffer.append(this.currentTargetLayerInterfaceP.getName());
            stringBuffer.append(" with ");
            stringBuffer.append(UnitWaypointBehavior2.TARGET_DISTANCE);
            stringBuffer.append(this.commonSeps.SPACE);
            stringBuffer.appendint(Std.int(this.getCurrentTargetDistance()));
        }
        return stringBuffer.toString();
    }

    // throws Exception
    public override function addWaypointFromUser(advancedRTSGameLayer : AdvancedRTSGameLayer) : Void {
        if (advancedRTSGameLayer.isDestroyed()) {
            throw new haxe.Exception("Trying to add a dead: " + advancedRTSGameLayer);
        }
        this.associatedAdvancedRTSGameLayer.waypoint2LogHelperP.addWaypointFromUser(this.associatedAdvancedRTSGameLayer, advancedRTSGameLayer);
        this.targetList.clear();
        this.targetList.add(advancedRTSGameLayer);
        this.clearTarget();
    }

    // Java inner class: Haxe does not nest classes so move this to its own module
    class BuildingSteeringVisitor extends SteeringVisitor {
        private final positionList : BasicArrayList = new BasicArrayListD();
        public override function visit(anyType : Any) : Any {
            final logUtil : LogUtil = LogUtil.getInstance();
            try {
                if (this.getList().size() > 0) {
                    final allbinaryLayer : AllBinaryLayer = (cast this.getList().get(0) : AllBinaryLayer);
                    final cellPosition : GeographicMapCellPosition = (cast this.getPositionList().get(0) : GeographicMapCellPosition);
                    final clear : Bool = this.buildingChase(allbinaryLayer, cellPosition);
                    if (clear) {
                        this.getList().clear();
                        this.positionList.clear();
                        return NullUtil.getInstance().NULL_OBJECT;
                    }
                    return BooleanFactory.getInstance().FALSE;
                }
                return NullUtil.getInstance().NULL_OBJECT;
            } catch (e : haxe.Exception) {
                final commonStrings : CommonStrings = CommonStrings.getInstance();
                logUtil.put(commonStrings.EXCEPTION, this, "visit", e);
                return NullUtil.getInstance().NULL_OBJECT;
            }
        }

        public function getPositionList() : BasicArrayList {
            return this.positionList;
        }

        public function new() {
            super();
        }
    }
    private final buildingSteeringVisitor : BuildingSteeringVisitor = new BuildingSteeringVisitor();
    // throws Exception
    public override function addBuildingChase(allbinaryLayer : AllBinaryLayer, cellPosition : GeographicMapCellPosition) : Void {
        if (!this.buildingSteeringVisitor.getList().contains(allbinaryLayer)) {
            this.buildingSteeringVisitor.getList().add(allbinaryLayer);
            this.buildingSteeringVisitor.getPositionList().add(cellPosition);
        }
        if (!this.getSteeringVisitorList().contains(this.buildingSteeringVisitor)) {
            this.getSteeringVisitorList().add(this.buildingSteeringVisitor);
        }
    }

    // throws Exception
    private function buildingChase(allbinaryLayer : AllBinaryLayer, cellPosition : GeographicMapCellPosition) : Bool {
        return this.associatedAdvancedRTSGameLayer.buildingChase(allbinaryLayer, cellPosition);
    }

}

