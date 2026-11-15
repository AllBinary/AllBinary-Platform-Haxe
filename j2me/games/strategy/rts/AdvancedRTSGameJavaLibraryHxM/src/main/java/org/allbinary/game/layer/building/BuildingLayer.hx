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
package org.allbinary.game.layer.building;

//import javax.microedition.lcdui.Graphics;
import org.allbinary.ag.weapon.media.audio.ExplosionBasicSound;
import org.allbinary.animation.NullAnimationFactory;
import org.allbinary.animation.NullIndexedAnimationFactory;
import org.allbinary.game.identification.GroupFactory;
import org.allbinary.game.input.form.NullRTSFormInputFactory;
import org.allbinary.game.input.form.RTSFormInput;
import org.allbinary.game.input.form.VisibleCellPositionsSingleton;
import org.allbinary.game.layer.AdvancedRTSGameLayer;
import org.allbinary.game.layer.AdvancedRTSPlayerLayerInterface;
import org.allbinary.game.layer.AdvancedRTSProperties;
import org.allbinary.game.layer.CollidableRTSBehavior;
import org.allbinary.game.layer.RTSLayerUtil;
import org.allbinary.game.layer.RTSPlayerLayerInterface;
import org.allbinary.game.layer.SelectionHudPaintable;
import org.allbinary.game.layer.waypoint.Waypoint;
import org.allbinary.game.view.TileLayerPositionIntoViewPosition;
import org.allbinary.graphics.RectangleFactory;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.animation.AnimationInterfaceFactoryInterface;
import org.allbinary.animation.ProceduralAnimationInterfaceFactoryInterface;
import org.allbinary.animation.RotationAnimationInterfaceCompositeInterface;
import org.allbinary.direction.Direction;
import org.allbinary.direction.DirectionFactory;
import org.allbinary.game.combat.damage.DamageFloaters;
import org.allbinary.game.health.Health;
import org.allbinary.game.identification.Group;
import org.allbinary.game.layer.GeographicMapCellPositionAreaBase;
import org.allbinary.game.layer.NullPathFindingLayer;
import org.allbinary.game.tracking.TrackingEvent;
import org.allbinary.game.tracking.TrackingEventHandler;
import org.allbinary.game.tracking.TrackingEventListenerInterface;
import org.allbinary.graphics.Rectangle;
import org.allbinary.graphics.paint.Paintable;
import org.allbinary.layer.AllBinaryLayerManager;
import org.allbinary.media.audio.SecondaryPlayerQueueFactory;
import org.allbinary.media.audio.SelectSound;
import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition;
import org.allbinary.media.graphics.geography.map.GeographicMapDirectionUtil;
import org.allbinary.media.graphics.geography.map.drop.DropCellPositionHistory;
import org.allbinary.time.TimeDelayHelper;
import org.allbinary.util.BasicArrayListS;
import org.allbinary.game.multiplayer.layer.RemoteInfo;
import org.allbinary.util.ABHashtable;

class BuildingLayer extends AdvancedRTSGameLayer implements RotationAnimationInterfaceCompositeInterface implements TrackingEventListenerInterface {
    // throws Exception
    public static function createSimulated() : BuildingLayer {
        final nullAnimationInterfaceFactoryInterface : AnimationInterfaceFactoryInterface = NullAnimationFactory.getFactoryInstance();
        final nullIndexedAnimationInterfaceFactoryInterface : AnimationInterfaceFactoryInterface = NullIndexedAnimationFactory.getFactoryInstance();
        return new BuildingLayer(RemoteInfo.REMOTE_INFO, SimulatedBuildingPropertiesFactory.getInstance(), AdvancedRTSProperties.createPropertiesSimulated(), GroupFactory.getInstance().NULL_GROUP_ARRAY, StringUtil.getInstance().EMPTY_STRING, StringUtil.getInstance().EMPTY_STRING, Health.NULL_HEALTH, NullRTSFormInputFactory.getInstance(), nullAnimationInterfaceFactoryInterface, nullIndexedAnimationInterfaceFactoryInterface, nullAnimationInterfaceFactoryInterface, nullAnimationInterfaceFactoryInterface, nullIndexedAnimationInterfaceFactoryInterface, NullIndexedAnimationFactory.getFactoryInstance(), RectangleFactory.SINGLETON, 0, 0);
    }

    private var buildingLevelCost : Int = 0;
    private var productivity : Int = 0;
    private var efficiency : Int;
    private var efficiencyPerLevel : Int;
    private final trackingEvent : TrackingEvent;
    private final damageFloaters : DamageFloaters;
    private final damageFloatersPaintableInterface : Paintable;
    private final healthBar : Paintable;
    private final pathsHashtable : ABHashtable<Any, Any>;
    public function new(remoteInfo : RemoteInfo, buildingPropertiesFactory : BuildingPropertiesFactory, advancedRTSProperties : AdvancedRTSProperties, groupInterface : haxe.ds.Vector<Group>, rootName : String, name : String, healthInterface : Health, rtsFormInput : RTSFormInput, animationInterfaceFactoryInterface : AnimationInterfaceFactoryInterface, emptyAnimationInterfaceFactoryInterface : AnimationInterfaceFactoryInterface, baseAnimationInterfaceFactoryInterface : AnimationInterfaceFactoryInterface, buildAnimationInterfaceFactoryInterface : AnimationInterfaceFactoryInterface, verticleBuildAnimationInterfaceFactoryInterface : AnimationInterfaceFactoryInterface, proceduralAnimationInterfaceFactoryInterface : ProceduralAnimationInterfaceFactoryInterface, rectangle : Rectangle, x : Int, y : Int) {
        super(remoteInfo, NullPathFindingLayer.NULL_PATH_FINDING_LAYER, advancedRTSProperties, groupInterface, rootName, name, healthInterface, rtsFormInput, animationInterfaceFactoryInterface, emptyAnimationInterfaceFactoryInterface, baseAnimationInterfaceFactoryInterface, buildAnimationInterfaceFactoryInterface, verticleBuildAnimationInterfaceFactoryInterface, proceduralAnimationInterfaceFactoryInterface, rectangle, x, y, new TileLayerPositionIntoViewPosition());
        this.setCollidableInferface(new CollidableRTSBehavior(true));
        this.getWaypointBehavior().setWaypoint(new Waypoint(this, SelectSound.getInstance()));
        this.damageFloaters = buildingPropertiesFactory.getDamageFloaters(this);
        this.damageFloatersPaintableInterface = buildingPropertiesFactory.damageFloatersPaintableInterface;
        this.healthBar = buildingPropertiesFactory.getHealthBar(this);
        this.pathsHashtable = buildingPropertiesFactory.getHashtable();
        this.setMaxLevel(30);
        this.setProductivity(1);
        this.setEfficiency(this.calculateEfficiency());
        this.efficiencyPerLevel = buildingPropertiesFactory.getEfficiencyPerLevel(this);
        this.efficiency = this.efficiencyPerLevel;
        this.generateMoveOutOfBuildAreaPaths();
        this.trackingEvent = buildingPropertiesFactory.getTrackingEvent(this);
    }

    public var local : Bool = false;
    public override function initVisibility(rtsPlayerLayerInterface : RTSPlayerLayerInterface) : Void {
        final advancedRTSPlayerLayerInterface : AdvancedRTSPlayerLayerInterface = (cast rtsPlayerLayerInterface : AdvancedRTSPlayerLayerInterface);
        if (advancedRTSPlayerLayerInterface.isLocalPlayer()) {
            this.local = true;
            this.addVisibility();
        } else {
            this.local = false;
        }
        super.initVisibility(rtsPlayerLayerInterface);
    }

    // throws Exception
    public override function construct(rtsPlayerLayerInterface : RTSPlayerLayerInterface) : Void {
        super.construct(rtsPlayerLayerInterface);
        TrackingEventHandler.getInstance().addListenerInterface(this);
    }

    public override function onMovement(trackingEvent : TrackingEvent) : Void {
        try {
            final layerInterface : AdvancedRTSGameLayer = (cast trackingEvent.getLayerInterface() : AdvancedRTSGameLayer);
            if (layerInterface.getGroupInterface()[0] != this.getGroupInterface()[0]) {
                layerInterface.onMovementFound(this.trackingEvent);
            }
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "onMovement", e);
        }
    }

    public final timeDelayHelper : TimeDelayHelper = new TimeDelayHelper(3000);
    // throws Exception
    public override function processBuiltTick(allBinaryLayerManager : AllBinaryLayerManager) : Void {
        if (this.getHealthInterface().isDamaged()) {
            this.setAnimationInterface(this.destroyAnimationInterface);
        }
        if (!this.getHealthInterface().isAlive()) {
            if (this.isReadyForExplosion()) {
                final currentFrame : Int = this.destroyAnimationInterface.getFrame();
                final size : Int = this.destroyAnimationInterface.getSize() - 1;
                if (currentFrame == size && !this.timeDelayHelper.isTimeTNT()) {
                    if (!this.getHealthInterface().isAlive()) {
                        this.setDestroyed(true);
                    }
                } else {
                    this.destroyAnimationInterface.nextFrame();
                }
            } else {
                this.setAnimationInterface(this.destroyAnimationInterface);
                SecondaryPlayerQueueFactory.getInstance().add(ExplosionBasicSound.getInstance());
                this.shakeListener.onSmallShakeEvent();
                this.vibration.vibrate(this.duration, 0, 0);
                this.timeDelayHelper.setStartTimeTNT();
                this.setReadyForExplosion(true);
            }
        } else {
            super.processBuiltTick(allBinaryLayerManager);
        }
        this.indexedButShouldBeRotationAnimationInterface.nextFrame();
    }

    private function calculateEfficiency() : Int {
        return this.efficiencyPerLevel;
    }

    public override function getCost() : Int {
        final total : haxe.Int64 = RTSLayerUtil.getInstance().getCostExponential(haxe.Int64.ofInt((this.getLevel() * this.getBuildingLevelCost())));
        return haxe.Int64.toInt(total);
    }

    public override function getDowngradeCost() : Int {
        final downgradeCost : haxe.Int64 = RTSLayerUtil.getInstance().getCostExponential(haxe.Int64.ofInt(((this.getLevel() - 1) * this.getBuildingLevelCost())));
        this.logUtil.putF("Cost: " + downgradeCost, this, "getDowngradeCost");
        return Std.int(haxe.Int64.toInt(downgradeCost) * 9 / 10);
    }

    public override function getUpgradeCost() : Int {
        final upgradeCost : haxe.Int64 = RTSLayerUtil.getInstance().getCostExponential(haxe.Int64.ofInt(((this.getLevel() + 1) * this.getBuildingLevelCost())));
        return haxe.Int64.toInt(upgradeCost);
    }

    public override function downgrade() : Void {
        super.downgrade();
        this.setProductivity(this.getProductivity() - 1);
        this.setEfficiency(this.getEfficiency() - this.calculateEfficiency());
        this.getHealthInterface().setMaxHealth(this.getHealthInterface().getMaxHealth() - ((this.getLevel() + 1) * 100));
    }

    public override function upgrade() : Void {
        super.upgrade();
        this.setProductivity(this.getProductivity() + 1);
        this.setEfficiency(this.getEfficiency() + this.calculateEfficiency());
        this.getHealthInterface().setMaxHealth(this.getHealthInterface().getMaxHealth() + (this.getLevel() * 100));
    }

    private function getBuildingLevelCost() : Int {
        return this.buildingLevelCost;
    }

    public function setBuildingLevelCost(buildingLevelCost : Int) : Void {
        this.buildingLevelCost = buildingLevelCost;
    }

    public function getProductivity() : Int {
        return this.productivity;
    }

    public function setProductivity(productivity : Int) : Void {
        this.productivity = productivity;
    }

    public function getEfficiency() : Int {
        return this.efficiency;
    }

    public function setEfficiency(efficiency : Int) : Void {
        this.efficiency = efficiency;
    }

    // throws Exception
    private function generateMoveOutOfBuildAreaPaths() : Void {
        final occupyList : BasicArrayList = this.geographicMapCellPositionAreaBase.getOccupyingGeographicMapCellPositionList();
        final surroundList : BasicArrayList = this.geographicMapCellPositionAreaBase.getSurroundingGeographicMapCellPositionList();
        final NO_DIRECTION : Direction = DirectionFactory.getInstance().NO_DIRECTION;
        final geographicMapDirectionUtil : GeographicMapDirectionUtil = GeographicMapDirectionUtil.getInstance();
        var pathsList : BasicArrayList = null;
        var occupyGeographicMapCellPosition : GeographicMapCellPosition = null;
        var surroundGeographicMapCellPosition : GeographicMapCellPosition = null;
        var list : BasicArrayList = null;
        {
            var index2 : Int = occupyList.size() - 1;
            while (index2 >= 0) {
            pathsList = new BasicArrayListD();
            occupyGeographicMapCellPosition = (cast occupyList.get(index2) : GeographicMapCellPosition);
            {
                var index : Int = surroundList.size() - 1;
                while (index >= 0) {
                surroundGeographicMapCellPosition = (cast surroundList.get(index) : GeographicMapCellPosition);
                if (geographicMapDirectionUtil.getEightDirectionFromCellPositionToAdjacentCellPosition(surroundGeographicMapCellPosition, occupyGeographicMapCellPosition) != NO_DIRECTION) {
                    list = new BasicArrayListS(1);
                    list.add(surroundGeographicMapCellPosition);
                    pathsList.add(list);
                }
                    index--;
                }
            }
            this.pathsHashtable.put(occupyGeographicMapCellPosition, pathsList);
                index2--;
            }
        }
    }

    public override function getMoveOutOfBuildAreaPath(geographicMapCellPosition : GeographicMapCellPosition) : BasicArrayList {
        final pathsList : BasicArrayList = (cast this.pathsHashtable.get(geographicMapCellPosition) : BasicArrayList);
        return pathsList;
    }

    public override function getEndGeographicMapCellPositionList() : BasicArrayList {
        return this.geographicMapCellPositionAreaBase.getSurroundingGeographicMapCellPositionList();
    }

    public override function shouldHandleStartSameAsEnd() : Bool {
        return false;
    }

    public override function paint(graphics : Graphics) : Void {
        if (this.isVisible()) {
            super.paint(graphics);
            this.damageFloatersPaintableInterface.paint(graphics);
            this.healthBar.paint(graphics);
        }
    }

    // throws Exception
    public override function damage(damage : Int, damageType : Int) : Void {
        super.damage(damage, damageType);
        this.damageFloaters.add(damage);
        if (damage > 0) {
            this.getHealthInterface().damage(damage);
        }
    }

    // throws Exception
    public override function getDamage(damageType : Int) : Int {
        return 0;
    }

    public function addVisibility() : Void {
        final geographicMapCellPositionArea : GeographicMapCellPositionAreaBase = this.geographicMapCellPositionAreaBase;
        final occupyList : BasicArrayList = geographicMapCellPositionArea.getOccupyingGeographicMapCellPositionList();
        VisibleCellPositionsSingleton.getInstance().addStationaryCellPositions(occupyList);
        final surroundList : BasicArrayList = geographicMapCellPositionArea.getSurroundingGeographicMapCellPositionList();
        VisibleCellPositionsSingleton.getInstance().addStationaryCellPositions(surroundList);
    }

    public function removeVisibility() : Void {
        final occupyList : BasicArrayList = this.geographicMapCellPositionAreaBase.getOccupyingGeographicMapCellPositionList();
        VisibleCellPositionsSingleton.getInstance().removeStationaryCellPositions(occupyList);
        final surroundList : BasicArrayList = this.geographicMapCellPositionAreaBase.getSurroundingGeographicMapCellPositionList();
        VisibleCellPositionsSingleton.getInstance().removeStationaryCellPositions(surroundList);
    }

    // throws Exception
    public override function setDestroyed(destroyed : Bool) : Void {
        super.setDestroyed(destroyed);
        if (this.isDestroyed()) {
            DropCellPositionHistory.getInstance().removeAll(this);
            TrackingEventHandler.getInstance().removeListener(this);
            if (this.local) {
                this.removeVisibility();
            }
            if (!this.getHealthInterface().isAlive()) {
                final damage : Int = this.getHealthInterface().getMaxHealth();
                if (damage > 10) {
                    SecondaryPlayerQueueFactory.getInstance().add(ExplosionBasicSound.getInstance());
                    if (damage < 100) {
                        this.shakeListener.onSmallShakeEvent();
                        this.vibration.vibrate(this.duration, 0, 0);
                    } else if (damage < 1000) {
                        this.shakeListener.onMediumShakeEvent();
                        this.vibration.vibrate(this.duration * 2, 0, 0);
                    } else if (damage < 3000) {
                        this.shakeListener.onLargeShakeEvent();
                        this.vibration.vibrate(this.duration * 4, 0, 0);
                    }
                }
            }
        }
    }

    public override function createHudPaintable() : SelectionHudPaintable {
        final buildingInfoHudPaintable : BuildingInfoHudPaintable = BuildingInfoHudPaintable.getInstance();
        buildingInfoHudPaintable.setBasicColorP(this.allBinaryGameLayerManagerP.getForegroundBasicColor());
        buildingInfoHudPaintable.setRtsLayer(this);
        return buildingInfoHudPaintable;
    }

    public override function getHudPaintable() : SelectionHudPaintable {
        final buildingInfoHudPaintable : BuildingInfoHudPaintable = BuildingInfoHudPaintable.getInstance();
        return buildingInfoHudPaintable;
    }

    public override function getType() : Int {
        return BuildingLayer.getStaticType();
    }

    public static function getStaticType() : Int {
        return 2;
    }

}

