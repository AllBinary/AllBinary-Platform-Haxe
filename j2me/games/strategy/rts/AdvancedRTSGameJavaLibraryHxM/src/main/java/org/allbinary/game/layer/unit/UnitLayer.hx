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

//import javax.microedition.lcdui.Canvas;
//import javax.microedition.lcdui.Graphics;
import org.allbinary.J2MEUtil;
import org.allbinary.ag.weapon.media.audio.ExplosionBasicSound;
import org.allbinary.animation.Animation;
import org.allbinary.animation.AnimationInterfaceFactoryInterface;
import org.allbinary.animation.FeaturedAnimationInterfaceFactoryInterfaceFactory;
import org.allbinary.animation.IndexedAnimation;
import org.allbinary.animation.NullAnimationFactory;
import org.allbinary.animation.NullIndexedAnimationFactory;
import org.allbinary.animation.ProceduralAnimationInterfaceFactoryInterface;
import org.allbinary.animation.RotationAnimation;
import org.allbinary.animation.caption.CaptionAnimationHelper;
import org.allbinary.animation.caption.CaptionAnimationHelperBase;
import org.allbinary.animation.vector.AdjustedCircleAnimation;
import org.allbinary.direction.Direction;
import org.allbinary.game.combat.damage.DamageFloaters;
import org.allbinary.game.combat.damage.PtsDamageFloaters;
import org.allbinary.game.combat.weapon.WeaponProperties;
import org.allbinary.game.configuration.feature.Features;
import org.allbinary.game.configuration.feature.GameFeatureFactory;
import org.allbinary.game.graphics.hud.BasicHudFactory;
import org.allbinary.game.health.Health;
import org.allbinary.game.health.HealthBar;
import org.allbinary.game.health.HealthBarTwodAnimation;
import org.allbinary.game.identification.Group;
import org.allbinary.game.identification.GroupCommonFactory;
import org.allbinary.game.input.event.GameKeyEvent;
import org.allbinary.game.input.event.GameKeyEventFactory;
import org.allbinary.game.input.event.GameKeyEventUtil;
import org.allbinary.game.input.form.VisibleCellPositionsSingleton;
import org.allbinary.game.input.form.WaypointRTSFormInput;
import org.allbinary.game.layer.AdvancedRTSGameLayer;
import org.allbinary.game.layer.AdvancedRTSProperties;
import org.allbinary.game.layer.AllBinaryGameLayerManager;
import org.allbinary.game.layer.AllBinaryTiledLayer;
import org.allbinary.game.layer.CaptionResources;
import org.allbinary.game.layer.LinePathRelativeAnimation;
import org.allbinary.game.layer.PathAnimation;
import org.allbinary.game.layer.PathFindingLayerInterface;
import org.allbinary.game.layer.RTSLayer2LogHelper;
import org.allbinary.game.layer.RTSLayer2SelectedLogHelper;
import org.allbinary.game.layer.RTSLayerEvent;
import org.allbinary.game.layer.RTSLayerHudPaintable;
import org.allbinary.game.layer.RTSLayerLogHelper;
import org.allbinary.game.layer.RTSLayerSelectedLogHelper;
import org.allbinary.game.layer.RTSPlayerLayerInterface;
import org.allbinary.game.layer.SelectionHudPaintable;
import org.allbinary.game.layer.SensorActionFactory;
import org.allbinary.game.layer.SteeringVisitor;
import org.allbinary.game.layer.TiledLayerUtil;
import org.allbinary.game.layer.VehicleFrictionProperties;
import org.allbinary.game.layer.VehicleProperties;
import org.allbinary.game.layer.WaypointBehaviorBase;
import org.allbinary.game.layer.building.BuildingLayer;
import org.allbinary.game.layer.building.event.BuildingEventHandler;
import org.allbinary.game.layer.building.event.BuildingEventListenerInterface;
import org.allbinary.game.layer.capital.event.CapitalEvent;
import org.allbinary.game.layer.capital.event.CapitalEventHandlerFactory;
import org.allbinary.game.layer.geographic.map.LayerPartialCellPositionsUtil;
import org.allbinary.game.layer.special.SpecialDownGameInputProcessor;
import org.allbinary.game.layer.special.SpecialFireGameInputProcessor;
import org.allbinary.game.layer.special.SpecialLeftGameInputProcessor;
import org.allbinary.game.layer.special.SpecialRightGameInputProcessor;
import org.allbinary.game.layer.special.SpecialUpGameInputProcessor;
import org.allbinary.game.layer.waypoint.MultipassNoCacheWaypoint;
import org.allbinary.game.layer.waypoint.NoCacheWaypoint;
import org.allbinary.game.layer.waypoint.WaypointBase;
import org.allbinary.game.layer.waypoint.event.WaypointEventHandlerFactory;
import org.allbinary.game.multiplayer.layer.RemoteInfo;
import org.allbinary.game.part.weapon.BasicWeaponPart;
import org.allbinary.game.part.weapon.SalvoInterface;
import org.allbinary.game.physics.velocity.VelocityProperties;
import org.allbinary.game.tracking.TrackingEvent;
import org.allbinary.game.tracking.TrackingEventHandler;
import org.allbinary.game.tracking.TrackingEventListenerInterface;
import org.allbinary.graphics.CellPositionFactory;
import org.allbinary.graphics.GPoint;
import org.allbinary.graphics.Rectangle;
import org.allbinary.graphics.color.BasicColorFactory;
import org.allbinary.graphics.paint.NullPaintable;
import org.allbinary.graphics.paint.Paintable;
import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.layer.AllBinaryLayerManager;
import org.allbinary.layer.Layer;
import org.allbinary.layer.LayerInterfaceFactoryInterface;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.math.BasicDecimal;
import org.allbinary.logic.math.SmallIntegerSingletonFactory;
import org.allbinary.math.AngleFactory;
import org.allbinary.math.AngleInfo;
import org.allbinary.math.FrameUtil;
import org.allbinary.math.LayerDistanceUtil;
import org.allbinary.math.NamedAngle;
import org.allbinary.media.audio.AttackSound;
import org.allbinary.media.audio.SecondaryPlayerQueueFactory;
import org.allbinary.media.audio.Sound;
import org.allbinary.media.graphics.geography.map.BasicGeographicMap;
import org.allbinary.media.graphics.geography.map.BasicGeographicMapCellPositionFactory;
import org.allbinary.media.graphics.geography.map.GeographicMapCellHistory;
import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition;
import org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface;
import org.allbinary.media.graphics.geography.map.SimpleGeographicMapCellPositionFactory;
import org.allbinary.media.graphics.geography.map.drop.DropCellPositionHistory;
import org.allbinary.media.graphics.geography.map.racetrack.RaceTrackGeographicMap;
import org.allbinary.string.CommonPhoneStrings;
import org.allbinary.util.ABHashtable;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.util.BasicArrayListS;
import org.allbinary.view.ViewPositionBase;

class UnitLayer extends AdvancedRTSGameLayer implements BuildingEventListenerInterface implements TrackingEventListenerInterface {
    private final basicColorFactory : BasicColorFactory = BasicColorFactory.getInstance();
    private final groupCommonFactory : GroupCommonFactory = GroupCommonFactory.getInstance();
    private final layerPartialCellPositionsUtil : LayerPartialCellPositionsUtil = LayerPartialCellPositionsUtil.getInstance();
    private final layerDistanceUtil : LayerDistanceUtil = LayerDistanceUtil.getInstance();
    private final angleFactory : AngleFactory = AngleFactory.getInstance();
    private final cellPositionFactory : CellPositionFactory = CellPositionFactory.getInstance();
    private final maxResourceLoad : Int;
    private final vehicleProperties : VehicleProperties;
    public var accelerationBasicDecimal : BasicDecimal = new BasicDecimal(1600);
    public var decelerationBasicDecimal : BasicDecimal = new BasicDecimal(-1000);
    private final trackingEvent : TrackingEvent;
    private final damageFloaters : DamageFloaters = null;
    private final damageFloatersPaintableInterface : Paintable = null;
    private final healthBar : Paintable = null;
    private final moveSoundInterface : Sound;
    private final initResourceAnimation : RotationAnimation;
    private var resourceAnimation : IndexedAnimation = (cast NullIndexedAnimationFactory.getFactoryInstance().getInstance(0) : IndexedAnimation);
    private final initPathAnimation : PathAnimation;
    private var pathAnimation : Animation = NullAnimationFactory.getFactoryInstance().getInstance(0);
    private final captionAnimationHelper : CaptionAnimationHelperBase = new CaptionAnimationHelper(FeaturedAnimationInterfaceFactoryInterfaceFactory.getInstance().get(CaptionResources.getInstance().RESOURCE).getInstance(0), -23, -25, 6, 0);
    private final decalAnimation : RotationAnimation;
    private final waypointLayerInterfaceFactoryInterface : LayerInterfaceFactoryInterface;
    private static final partialPositionList : BasicArrayList = new BasicArrayListS(4);
    private var resourceLoad : Int = 0;
    private var weaponRange : Int = 0;
    public var rtsLogHelper : RTSLayerLogHelper = RTSLayerLogHelper.getInstance();
    public var rotationAnimationInterfaceP : RotationAnimation;
    private var movementAngle : NamedAngle = this.angleFactory.NOT_ANGLE;
    private var steeringInsideGeographicMapCellPosition : GeographicMapCellPosition = SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION;
    public function new(remoteInfo : RemoteInfo, parentLayer : PathFindingLayerInterface, advancedRTSProperties : AdvancedRTSProperties, groupInterface : haxe.ds.Vector<Group>, rootName : String, name : String, vehicleProperties : VehicleProperties, healthInterface : Health, maxResourceLoad : Null<Int>, moveSoundInterface : Sound, waypointLayerInterfaceFactoryInterface : LayerInterfaceFactoryInterface, animationInterfaceFactoryInterface : AnimationInterfaceFactoryInterface, emptyAnimationInterfaceFactoryInterface : AnimationInterfaceFactoryInterface, baseAnimationInterfaceFactoryInterface : AnimationInterfaceFactoryInterface, buildAnimationInterfaceFactoryInterface : AnimationInterfaceFactoryInterface, verticleBuildAnimationInterfaceFactoryInterface : AnimationInterfaceFactoryInterface, decalAnimationInterfaceFactoryInterface : AnimationInterfaceFactoryInterface, resourceAnimationInterfaceFactoryInterface : AnimationInterfaceFactoryInterface, proceduralAnimationInterfaceFactoryInterface : ProceduralAnimationInterfaceFactoryInterface, rectangle : Rectangle, direction : Direction, x : Int, y : Int, z : Int, viewPosition : ViewPositionBase) {
        super(remoteInfo, parentLayer, advancedRTSProperties, groupInterface, rootName, name, healthInterface, new WaypointRTSFormInput(groupInterface, true), animationInterfaceFactoryInterface, emptyAnimationInterfaceFactoryInterface, baseAnimationInterfaceFactoryInterface, buildAnimationInterfaceFactoryInterface, verticleBuildAnimationInterfaceFactoryInterface, proceduralAnimationInterfaceFactoryInterface, rectangle, x, y, viewPosition);
        this.setCollidableInferface(new CollidableUnitBehavior(true));
        this.waypointLayerInterfaceFactoryInterface = waypointLayerInterfaceFactoryInterface;
        this.maxResourceLoad = Std.int(maxResourceLoad);
        this.moveSoundInterface = moveSoundInterface;
        if (Features.getInstance().isFeature(GameFeatureFactory.getInstance().DAMAGE_FLOATERS)) {
            this.damageFloaters = new PtsDamageFloaters(this);
            this.damageFloatersPaintableInterface = this.damageFloaters;
        } else {
            this.damageFloatersPaintableInterface = NullPaintable.getInstance();
            this.damageFloaters = new DamageFloaters();
        }
        if (Features.getInstance().isFeature(GameFeatureFactory.getInstance().HEALTH_BARS)) {
            this.healthBar = new HealthBar(this, this.getHealthInterface(), new HealthBarTwodAnimation((cast this : AllBinaryLayer), BasicHudFactory.getInstance().BOTTOMLEFT), -1);
        } else {
            this.healthBar = NullPaintable.getInstance();
        }
        this.decalAnimation = (cast decalAnimationInterfaceFactoryInterface.getInstance(0) : RotationAnimation);
        this.initResourceAnimation = (cast resourceAnimationInterfaceFactoryInterface.getInstance(0) : RotationAnimation);
        this.initResourceAnimation.setFrameByDirection(direction);
        this.decalAnimation.setFrameByDirection(direction);
        this.rotationAnimationInterfaceP = (cast this.indexedButShouldBeRotationAnimationInterface : RotationAnimation);
        this.rotationAnimationInterfaceP.setFrameByDirection(direction);
        this.setMaxLevel(12);
        this.vehicleProperties = vehicleProperties;
        this.trackingEvent = new TrackingEvent(this);
        this.initPathAnimation = new PathAnimation(this, LinePathRelativeAnimation.getInstance());
    }

    // throws Exception
    public override function setAllBinaryGameLayerManager(allBinaryGameLayerManager : AllBinaryGameLayerManager) : Void {
        super.setAllBinaryGameLayerManager(allBinaryGameLayerManager);
        this.initPathAnimation.setAllBinaryGameLayerManager(allBinaryGameLayerManager);
    }

    // throws Exception
    public override function updateWaypointBehavior(geographicMapInterface : BasicGeographicMap) : Void {
        final hashtable : ABHashtable<Any, Any> = StdUtil.getInstance().createHashtable();
        hashtable.put(this.groupCommonFactory.ID, this.getGroupInterface());
        hashtable.put(Layer.ID, this);
        hashtable.put(AllBinaryGameLayerManager.ID, this.allBinaryGameLayerManagerP);
        this.setWaypointBehavior(new UnitWaypointBehavior2(this, (cast this.waypointLayerInterfaceFactoryInterface.getNextInstance(hashtable, this.x, this.y, this.z) : AdvancedRTSGameLayer)));
        final features : Features = Features.getInstance();
        final waypoint : WaypointBase = (J2MEUtil.isHTML() ? new MultipassNoCacheWaypoint(this, AttackSound.getInstance()) : new NoCacheWaypoint(this, AttackSound.getInstance()));
        this.getWaypointBehavior().setWaypoint(waypoint);
        super.updateWaypointBehavior(geographicMapInterface);
        this.initRangeHack();
    }

    // throws Exception
    public override function construct(rtsPlayerLayerInterface : RTSPlayerLayerInterface) : Void {
        super.construct(rtsPlayerLayerInterface);
        TrackingEventHandler.getInstance().addListenerInterface(this);
        WaypointEventHandlerFactory.getInstance(this.getGroupInterface()[0]).addListenerInterface(this.getUnitWaypointBehavior());
        BuildingEventHandler.getInstance().addListenerInterface(this);
        this.getUnitWaypointBehavior().setCurrentPathGeographicMapCellPosition(this.getCurrentGeographicMapCellPosition());
        this.updateSensorGeographicMapCellPositionList();
        this.getUnitWaypointBehavior().setLastPathGeographicMapCellPosition(this.getUnitWaypointBehavior().getCurrentPathGeographicMapCellPosition());
    }

    private final sensorGeographicMapCellPositionList : BasicArrayList = new BasicArrayListD();
    // throws Exception
    public function updateSensorGeographicMapCellPositionList() : Void {
        if (VisibleCellPositionsSingleton.getInstance().shouldProcess()) {
            final currentGeographicMapCellPosition : GeographicMapCellPosition = this.getCurrentGeographicMapCellPosition();
            this.sensorGeographicMapCellPositionList.clear();
            this.sensorGeographicMapCellPositionList.add(currentGeographicMapCellPosition);
            final sensorRange : Int = this.weaponRange * UnitLayer.SENSOR_RANGE_MULTIPLIER;
            final geographicMapCompositeInterface : GeographicMapCompositeInterface = (cast this.allBinaryGameLayerManagerP : GeographicMapCompositeInterface);
            final geographicMapInterface : BasicGeographicMap = geographicMapCompositeInterface.getGeographicMapInterface()[0];
            final tiledLayer : AllBinaryTiledLayer = geographicMapInterface.getAllBinaryTiledLayer();
            final totalCells : Int = (sensorRange / tiledLayer.getCellHeight()) / 2;
            final geographicMapCellPositionFactory : BasicGeographicMapCellPositionFactory = geographicMapInterface.getGeographicMapCellPositionFactory();
            final column : Int = currentGeographicMapCellPosition.getColumn();
            final row : Int = currentGeographicMapCellPosition.getRow();
            var lastColumn : Int = column + totalCells;
            var lastRow : Int = row + totalCells;
            if (lastColumn > tiledLayer.getColumns()) {
                lastColumn = tiledLayer.getColumns();
            }
            if (lastRow > tiledLayer.getRows()) {
                lastRow = tiledLayer.getRows();
            }
            var firstColumn : Int = column - totalCells;
            var firstRow : Int = row - totalCells;
            if (firstColumn < 0) {
                firstColumn = 0;
            }
            if (firstRow < 0) {
                firstRow = 0;
            }
            {
                var index : Int = lastColumn - 1;
                while (index >= firstColumn) {
                {
                    var index2 : Int = lastRow - 1;
                    while (index2 >= firstRow) {
                    final geographicMapCellPosition : GeographicMapCellPosition = geographicMapCellPositionFactory.getAt(index, index2);
                    if (!this.sensorGeographicMapCellPositionList.contains(geographicMapCellPosition)) {
                        this.sensorGeographicMapCellPositionList.add(geographicMapCellPosition);
                    }
                        index2--;
                    }
                }
                    index--;
                }
            }
        }
    }

    public function getSensorGeographicMapCellPositionList() : BasicArrayList {
        return this.sensorGeographicMapCellPositionList;
    }

    public override function select() : Void {
        this.pathAnimation = this.initPathAnimation;
        super.select();
    }

    public override function deselect() : Void {
        this.pathAnimation = NullAnimationFactory.getFactoryInstance().getInstance(0);
        super.deselect();
    }

    public override function setSelected(selected : Bool) : Void {
        super.setSelected(selected);
        if (selected) {
            if (this.debug) {
                this.rtsLogHelper = RTSLayerSelectedLogHelper.getInstance();
            }
            this.rtsLayer2LogHelper = RTSLayer2SelectedLogHelper.getInstance();
        } else {
            if (this.debug) {
                this.rtsLogHelper = RTSLayerLogHelper.getInstance();
            }
            this.rtsLayer2LogHelper = RTSLayer2LogHelper.getInstance();
        }
    }

    // throws Exception
    public override function setClosestGeographicMapCellHistory(pathsList : BasicArrayList) : Void {
        this.rtsLogHelper.setClosestGeographicMapCellHistory(this, pathsList);
        var closestIndex : Int = -1;
        var shortestDistance : Int = Integer.MAX_VALUE;
        var currentDistance : Int = Integer.MAX_VALUE;
        {
            var index : Int = pathsList.size() - 1;
            while (index >= 0) {
            final geographicMapCellPositionBasicArrayList : BasicArrayList = (cast pathsList.get(index) : BasicArrayList);
            final geographicMapCellPosition : GeographicMapCellPosition = (cast geographicMapCellPositionBasicArrayList.get(geographicMapCellPositionBasicArrayList.size() - 1) : GeographicMapCellPosition);
            currentDistance = this.layerDistanceUtil.getDistanceAt(this, geographicMapCellPosition.getMidPoint());
            if (currentDistance < shortestDistance) {
                shortestDistance = currentDistance;
                closestIndex = index;
            }
                index--;
            }
        }
        if (closestIndex >= 0) {
            final geographicMapCellPositionBasicArrayList : BasicArrayList = (cast pathsList.get(closestIndex) : BasicArrayList);
            final geographicMapCellPosition : GeographicMapCellPosition = (cast geographicMapCellPositionBasicArrayList.get(0) : GeographicMapCellPosition);
            this.teleportTo(geographicMapCellPosition);
        }
    }

    // throws Exception
    public override function init(geographicMapCellHistory : GeographicMapCellHistory, geographicMapCellPositionBasicArrayList : BasicArrayList) : Void {
        geographicMapCellHistory.trackAll(geographicMapCellPositionBasicArrayList);
    }

    public override function onMovement(trackingEvent : TrackingEvent) : Void {
        try {
            final layerInterface : AdvancedRTSGameLayer = (cast trackingEvent.getLayerInterface() : AdvancedRTSGameLayer);
            if (layerInterface.getGroupInterface()[0] != this.getGroupInterface()[0]) {
                this.getUnitWaypointBehavior().getPossibleTargetList().add(layerInterface);
                layerInterface.onMovementFound(this.getTrackingEvent());
            }
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "onMovement", e);
        }
    }

    // throws Exception
    public override function onMovementFound(trackingEvent : TrackingEvent) : Void {
        final layerInterface : AdvancedRTSGameLayer = (cast trackingEvent.getLayerInterface() : AdvancedRTSGameLayer);
        if (layerInterface.getGroupInterface()[0] != this.getGroupInterface()[0]) {
            this.getUnitWaypointBehavior().getPossibleTargetList().add(layerInterface);
        }
    }

    private static final SENSOR_RANGE_MULTIPLIER : Int = 6;
    public function initRangeHack() : Void {
        final basicWeaponPart : BasicWeaponPart = (cast this.getPartInterfaceArray()[0] : BasicWeaponPart);
        final weaponProperties : WeaponProperties = basicWeaponPart.getWeaponProperties();
        this.weaponRange = weaponProperties.getRange();
        this.initRangeAnimation = AdjustedCircleAnimation.createW(this.weaponRange, this.weaponRange, this.getWidth(), this.basicColorFactory.GREEN);
        final sensorRange : Int = this.weaponRange * UnitLayer.SENSOR_RANGE_MULTIPLIER;
        this.initSensorRangeAnimation = AdjustedCircleAnimation.createW(sensorRange, sensorRange, this.getWidth(), this.basicColorFactory.RED);
        this.getUnitWaypointBehavior().initRange(this.weaponRange);
        this.fireTimeHelper.delay = (Std.int(weaponProperties.getReloadTime()));
    }

    // throws Exception
    public override function processBuiltTick(allBinaryLayerManager : AllBinaryLayerManager) : Void {
        if (!this.getHealthInterface().isAlive()) {
            if (this.isReadyForExplosion()) {
                final currentFrame : Int = this.destroyAnimationInterface.getFrame();
                final size : Int = this.destroyAnimationInterface.getSize() - 1;
                if (currentFrame == size) {
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
                this.setReadyForExplosion(true);
            }
        } else {
            super.processBuiltTick(allBinaryLayerManager);
        }
        this.captionAnimationHelper.tick();
        this.getUnitWaypointBehavior().processTick(allBinaryLayerManager);
    }

    public override function teleportTo(geographicMapCellPosition : GeographicMapCellPosition) : Void {
        final point : GPoint = geographicMapCellPosition.getMidPoint();
        this.setPosition(point.getX() - this.getHalfWidth(), point.getY() - this.getHalfHeight(), this.z);
    }

    // throws Exception
    public override function getCurrentGeographicMapCellPosition() : GeographicMapCellPosition {
        final geographicMapCompositeInterface : GeographicMapCompositeInterface = (cast this.allBinaryGameLayerManagerP : GeographicMapCompositeInterface);
        final geographicMapInterface : BasicGeographicMap = geographicMapCompositeInterface.getGeographicMapInterface()[0];
        final geographicMapCellPosition : GeographicMapCellPosition = geographicMapInterface.getCellPositionAtXY(this.x + this.getHalfWidth(), this.y + this.getHalfHeight());
        final raceTrackGeographicMap : RaceTrackGeographicMap = (cast geographicMapInterface : RaceTrackGeographicMap);
        if (!raceTrackGeographicMap.isValid(geographicMapCellPosition)) {
            throw new haxe.Exception("Position is not really on the map: " + geographicMapCellPosition);
        }
        return geographicMapCellPosition;
    }

    // throws Exception
    public override function fire(layerManager : AllBinaryLayerManager, gameKeyEvent : GameKeyEvent) : Void {
        if (this.fireTimeHelper.isTimeTNT()) {
            this.fireAll(layerManager);
        } else {
            this.reload();
        }
    }

    // throws Exception
    public override function left() : Void {
        this.initResourceAnimation.previousRotation();
        this.decalAnimation.previousRotation();
        this.rotationAnimationInterfaceP.previousRotation();
    }

    // throws Exception
    public override function right() : Void {
        this.initResourceAnimation.nextRotation();
        this.decalAnimation.nextRotation();
        this.rotationAnimationInterfaceP.nextRotation();
    }

    public override function down() : Void {
        final velocityProperties : VelocityProperties = this.getVehicleProperties().getVelocityProperties();
        if (!velocityProperties.isOverXYMaxForwardVelocity()) {
            this.accelerate(this.decelerationBasicDecimal);
        }
    }

    public override function up() : Void {
        final velocityProperties : VelocityProperties = this.getVehicleProperties().getVelocityProperties();
        if (!velocityProperties.isOverXYMaxForwardVelocity()) {
            this.accelerate(this.accelerationBasicDecimal);
        }
    }

    public override function initInputProcessors() : Void {
        this.inputProcessorArray[Canvas.RIGHT] = new SpecialRightGameInputProcessor(this);
        this.inputProcessorArray[Canvas.LEFT] = new SpecialLeftGameInputProcessor(this);
        this.inputProcessorArray[Canvas.KEY_NUM0] = new SpecialFireGameInputProcessor(this);
        this.inputProcessorArray[Canvas.KEY_POUND] = this.inputProcessorArray[Canvas.KEY_NUM0];
        this.inputProcessorArray[Canvas.DOWN] = new SpecialDownGameInputProcessor(this);
        this.inputProcessorArray[Canvas.UP] = new SpecialUpGameInputProcessor(this);
        super.initInputProcessors();
    }

    // throws Exception
    public override function processInput(layerManager : AllBinaryLayerManager) : Void {
        final list : BasicArrayList = this.getGameKeyEventList();
        final size : Int = list.size();
        for (index in 0...size) {
            var anyType : Any = list.get(index);
            var key : Int = GameKeyEventUtil.getKey(anyType);
            this.inputProcessorArray[key].processEvent(layerManager, GameKeyEvent.NONE);
        }
        list.clear();
        this.groundFriction();
        this.move();
    }

    public function accelerate(accelerate : BasicDecimal) : Void {
        this.getVehicleProperties().getVelocityProperties().addVelocityi(accelerate.getUnscaled(), Std.int(this.rotationAnimationInterfaceP.getAngleInfoP().getAngle()), 90);
    }

    // throws Exception
    public function fireAll(layerManager : AllBinaryLayerManager) : Void {
        final angleInfo : AngleInfo = this.rotationAnimationInterfaceP.getAngleInfoP();
        final angle : Int = Std.int((angleInfo.getAngle() + this.slightAngle));
        this.hashtable.put(SmallIntegerSingletonFactory.getInstance().getAt(1), SmallIntegerSingletonFactory.getInstance().getAt(Std.int(AngleFactory.getInstance().getAt(angle).getValue())));
        final salvoInterface : SalvoInterface = (cast this.getPartInterfaceArray()[0] : SalvoInterface);
        salvoInterface.process(layerManager, angle, 90);
    }

    public override function downgrade() : Void {
        if (this.getLevel() > 1) {
            super.downgrade();
        }
    }

    public override function upgrade() : Void {
        super.upgrade();
        this.initRangeHack();
    }

    public function groundFriction() : Void {
        final vehicleFrictionProperties : VehicleFrictionProperties = this.getVehicleProperties().getVehicleFrictionProperties();
        this.getVehicleProperties().getVehicleFrictionProperties().friction(this.getVehicleProperties().getVelocityProperties(), vehicleFrictionProperties.getTireFrictionNominator());
    }

    // throws Exception
    public override function trackTo(reason : String) : Void {
        final waypointBehaviorBase : WaypointBehaviorBase = (cast this.waypointBehaviorBase : WaypointBehaviorBase);
        final nextUnvisitedPathGeographicMapCellPosition : GeographicMapCellPosition = waypointBehaviorBase.getNextUnvisitedPathGeographicMapCellPosition();
        final point : GPoint = nextUnvisitedPathGeographicMapCellPosition.getMidPoint();
        final dx : Int = (this.getXP() + this.getHalfWidth()) - point.getX();
        final dy : Int = (this.getYP() + this.getHalfHeight()) - point.getY();
        this.rtsLogHelper.trackTo(this, nextUnvisitedPathGeographicMapCellPosition, dx, dy, reason);
        this.trackToDXY(dx, dy);
    }

    // throws Exception
    public override function trackToDXY(dx : Int, dy : Int) : Void {
        final angleOfTarget : Int = 0;
        this.trackToDXYTargetAngle(dx, dy, angleOfTarget);
    }

    // throws Exception
    private function turnTo(dx : Int, dy : Int, targetAngle : Int) : Bool {
        final waypointBehaviorBase : WaypointBehaviorBase = (cast this.waypointBehaviorBase : WaypointBehaviorBase);
        final nextUnvisitedPathGeographicMapCellPosition : GeographicMapCellPosition = waypointBehaviorBase.getNextUnvisitedPathGeographicMapCellPosition();
        var evading : Bool = false;
        if (this.getUnitWaypointBehavior().getSensorAction() == SensorActionFactory.getInstance().EVADE) {
            this.rtsLogHelper.evade(this);
            evading = true;
            targetAngle += 180;
        }
        final angleInfo : AngleInfo = this.rotationAnimationInterfaceP.getAngleInfoP();
        final angle : Int = FrameUtil.getInstance().adjustAngleToFrameAngle(angleInfo.getAngle() - 270);
        this.rtsLogHelper.turnTo(this, dx, dy, angleInfo, angle, this.movementAngle, evading, targetAngle);
        final gameKeyEventFactory : GameKeyEventFactory = GameKeyEventFactory.getInstance();
        if (dx == 0 && dy == 0) {
            this.rtsLogHelper.doneMoving(this);
            return true;
        } else if ((Std.int(this.movementAngle.getValue())) == angle) {
            if (dx > 0 && this.movementAngle == this.angleFactory.LEFT) {
                this.rtsLogHelper.movingLeft(this);
                return false;
            }
            if (dx < 0 && this.movementAngle == this.angleFactory.RIGHT) {
                this.rtsLogHelper.movingRight(this);
                return false;
            }
            if (dy > 0 && this.movementAngle == this.angleFactory.UP) {
                this.rtsLogHelper.movingUp(this);
                return false;
            }
            if (dy < 0 && this.movementAngle == this.angleFactory.DOWN) {
                this.rtsLogHelper.movingDown(this);
                return false;
            }
            this.rtsLogHelper.currentMoveEnded(this);
            if (this.movementAngle == this.angleFactory.LEFT || this.movementAngle == this.angleFactory.RIGHT) {
                this.handleDeltalY(dx, dy);
            } else if (this.movementAngle == this.angleFactory.UP || this.movementAngle == this.angleFactory.DOWN) {
                this.handleDeltalX(dx, dy);
            }
            return true;
        } else {
            if (nextUnvisitedPathGeographicMapCellPosition != SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION) {
                if (this.steeringInsideGeographicMapCellPosition != nextUnvisitedPathGeographicMapCellPosition) {
                    if (Math.abs(dx) > Math.abs(dy) && dy != 0) {
                        this.handleDeltalY(dx, dy);
                    } else if (dx != 0) {
                        this.handleDeltalX(dx, dy);
                    } else {
                        this.handleDeltalY(dx, dy);
                    }
                }
                var deltaAngle2 : Int = this.movementAngle.getValue() - angle;
                if (deltaAngle2 > 0) {
                    this.rtsLogHelper.rotateRight(this);
                    this.getGameKeyEventList().add(gameKeyEventFactory.getInstanceForKey(this, Canvas.RIGHT));
                } else {
                    this.rtsLogHelper.rotateLeft(this);
                    this.getGameKeyEventList().add(gameKeyEventFactory.getInstanceForKey(this, Canvas.LEFT));
                }
                return true;
            } else {
                this.rtsLogHelper.noRotation(this);
            }
            return false;
        }
    }

    private function handleDeltalX(dx : Int, dy : Int) : Void {
        final waypointBehaviorBase : WaypointBehaviorBase = (cast this.waypointBehaviorBase : WaypointBehaviorBase);
        final nextUnvisitedPathGeographicMapCellPosition : GeographicMapCellPosition = waypointBehaviorBase.getNextUnvisitedPathGeographicMapCellPosition();
        if (dx > 0) {
            this.movementAngle = this.angleFactory.LEFT;
            this.steeringInsideGeographicMapCellPosition = nextUnvisitedPathGeographicMapCellPosition;
        } else {
            this.movementAngle = this.angleFactory.RIGHT;
            this.steeringInsideGeographicMapCellPosition = nextUnvisitedPathGeographicMapCellPosition;
        }
        this.rtsLogHelper.handle(this, this.movementAngle);
    }

    private function handleDeltalY(dx : Int, dy : Int) : Void {
        final waypointBehaviorBase : WaypointBehaviorBase = (cast this.waypointBehaviorBase : WaypointBehaviorBase);
        final nextUnvisitedPathGeographicMapCellPosition : GeographicMapCellPosition = waypointBehaviorBase.getNextUnvisitedPathGeographicMapCellPosition();
        if (dy > 0) {
            this.movementAngle = this.angleFactory.UP;
            this.steeringInsideGeographicMapCellPosition = nextUnvisitedPathGeographicMapCellPosition;
        } else {
            this.movementAngle = this.angleFactory.DOWN;
            this.steeringInsideGeographicMapCellPosition = nextUnvisitedPathGeographicMapCellPosition;
        }
        this.rtsLogHelper.handle(this, this.movementAngle);
    }

    // throws Exception
    private function trackToDXYTargetAngle(dx : Int, dy : Int, targetAngle : Int) : Void {
        final list : BasicArrayList = this.getUnitWaypointBehavior().getSteeringVisitorList();
        if (list.size() > 0) {
            {
                var index : Int = list.size() - 1;
                while (index >= 0) {
                final steeringVisitor : SteeringVisitor = (cast list.get(index) : SteeringVisitor);
                final anyType : Any = steeringVisitor.visit(this);
                if (anyType == null) {
                    list.removeAt(index);
                }
                    index--;
                }
            }
            this.fireOrMove();
        } else if (!this.turnTo(dx, dy, targetAngle)) {
            this.fireOrMove();
        }
    }

    private static final MOVE : String = "Moving";
    // throws Exception
    public function fireOrMove() : Void {
        final gameKeyEventFactory : GameKeyEventFactory = GameKeyEventFactory.getInstance();
        if (this.getUnitWaypointBehavior().needToMove()) {
            this.rtsLayer2LogHelper.steeringUp(this);
            if (this.showMoreCaptionStates && !this.captionAnimationHelper.isShowing()) {
                this.captionAnimationHelper.update(UnitLayer.MOVE, this.basicColorFactory.GREEN);
            }
            this.getGameKeyEventList().add(gameKeyEventFactory.getInstanceForKey(this, Canvas.UP));
        } else {
            this.captionAnimationHelper.update(CommonPhoneStrings.getInstance().FIRE, this.basicColorFactory.RED);
            this.rtsLayer2LogHelper.steeringFireOrStop(this);
            this.allStop();
            this.getGameKeyEventList().add(gameKeyEventFactory.getInstanceForKey(this, Canvas.KEY_NUM0));
            TrackingEventHandler.getInstance().fireEvent(this.getTrackingEvent());
        }
    }

    public override function move() : Void {
        try {
            final velocityProperties : VelocityProperties = this.getVehicleProperties().getVelocityProperties();
            final velocityXScaled : haxe.Int64 = haxe.Int64.ofInt(velocityProperties.getVelocityXBasicDecimalP().getScaled());
            final velocityYScaled : haxe.Int64 = haxe.Int64.ofInt(velocityProperties.getVelocityYBasicDecimalP().getScaled());
            this.getUnitWaypointBehavior().move();
            if (velocityXScaled != haxe.Int64.ofInt(0) || velocityYScaled != haxe.Int64.ofInt(0)) {
                this.getUnitWaypointBehavior().setMoving(true);
                final geographicMapCompositeInterface : GeographicMapCompositeInterface = (cast this.allBinaryGameLayerManagerP : GeographicMapCompositeInterface);
                final geographicMapInterface : BasicGeographicMap = geographicMapCompositeInterface.getGeographicMapInterface()[0];
                this.layerPartialCellPositionsUtil.getAllDXY(geographicMapInterface, this, haxe.Int64.toInt(velocityXScaled), haxe.Int64.toInt(velocityYScaled), UnitLayer.getPartialpositionlist());
                final cellPosition : GeographicMapCellPosition = (cast DropCellPositionHistory.getInstance().getCellPositionWithDrop(UnitLayer.getPartialpositionlist()) : GeographicMapCellPosition);
                if (cellPosition == this.cellPositionFactory.NONE) {
                    final tiledLayer : AllBinaryTiledLayer = geographicMapInterface.getAllBinaryTiledLayer();
                    final tiledLayerUtil : TiledLayerUtil = TiledLayerUtil.getInstance();
                    var x : Int = this.x + haxe.Int64.toInt(velocityXScaled);
                    var y : Int = this.y + haxe.Int64.toInt(velocityYScaled);
                    x = tiledLayerUtil.keepOnMapX(tiledLayer, x, this.getWidth());
                    y = tiledLayerUtil.keepOnMapY(tiledLayer, y, this.getHeight());
                    this.setPosition(x, y, this.z);
                } else {
                    final allbinaryLayer : AllBinaryLayer = DropCellPositionHistory.getInstance().getLayerInterface(cellPosition);
                    this.getUnitWaypointBehavior().setMovingFromStopped(false);
                    this.getUnitWaypointBehavior().addBuildingChase(allbinaryLayer, cellPosition);
                }
            }
            if (this.getUnitWaypointBehavior().isMoving()) {
                TrackingEventHandler.getInstance().fireEvent(this.getTrackingEvent());
            } else {
                this.getUnitWaypointBehavior().setMovingFromStopped(false);
            }
            if (this.getUnitWaypointBehavior().isMovingFromStopped() && this.isVisible()) {
                SecondaryPlayerQueueFactory.getInstance().add(this.moveSoundInterface);
            }
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "move", e);
        }
    }

    public override function allStop() : Void {
        final velocityProperties : VelocityProperties = this.getVehicleProperties().getVelocityProperties();
        velocityProperties.getVelocityXBasicDecimalP().setint(0);
        velocityProperties.getVelocityYBasicDecimalP().setint(0);
    }

    public override function paint(graphics : Graphics) : Void {
        if (this.isVisible()) {
            super.paint(graphics);
            final viewPosition : ViewPositionBase = this.getViewPosition();
            var viewX : Int = viewPosition.getX();
            var viewY : Int = viewPosition.getY();
            this.decalAnimation.paintXY(graphics, viewX, viewY);
            this.rangeAnimation.paintXY(graphics, viewX, viewY);
            this.sensorRangeAnimation.paintXY(graphics, viewX, viewY);
            this.damageFloatersPaintableInterface.paint(graphics);
            this.healthBar.paint(graphics);
            this.captionAnimationHelper.paintXY(graphics, viewX, viewY);
            this.pathAnimation.paintXY(graphics, viewX, viewY);
            this.resourceAnimation.paintXY(graphics, viewX, viewY);
        }
    }

    // throws Exception
    public override function onBuildingEvent(event : RTSLayerEvent) : Void {
        var buildingLayer : BuildingLayer = (cast event.getRtsLayer() : BuildingLayer);
        this.getUnitWaypointBehavior().moveAwayFromBuilding(buildingLayer);
    }

    public function getVehicleProperties() : VehicleProperties {
        return this.vehicleProperties;
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

    // throws Exception
    public override function setDestroyed(destroyed : Bool) : Void {
        this.logUtil.putF(this.commonStrings.START, this, "setDestroyed");
        super.setDestroyed(destroyed);
        if (this.isDestroyed()) {
            WaypointEventHandlerFactory.getInstance(this.getGroupInterface()[0]).removeListener(this.getUnitWaypointBehavior());
            TrackingEventHandler.getInstance().removeListener(this);
            BuildingEventHandler.getInstance().removeListener(this);
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

    public function getLoad() : Int {
        return this.resourceLoad;
    }

    // throws Exception
    public function clearResourceAnimation() : Void {
        this.resourceAnimation = (cast NullIndexedAnimationFactory.getFactoryInstance().getInstance(0) : IndexedAnimation);
    }

    // throws Exception
    public override function setLoad(resource : Int) : Void {
        if (resource > 0) {
            this.resourceAnimation = this.initResourceAnimation;
        } else {
            this.clearResourceAnimation();
        }
        this.resourceLoad = resource;
    }

    public function addLoad(resource : Int) : Void {
        this.resourceLoad += resource;
    }

    private final CAPITAL_EVENT : CapitalEvent = new CapitalEvent(this);
    // throws Exception
    public override function handleCost(ownerLayer : PathFindingLayerInterface) : Void {
        if (this.getLoad() > 0) {
            this.CAPITAL_EVENT.setValue(this.getLoad());
            CapitalEventHandlerFactory.getInstance(ownerLayer.getGroupInterface()[0]).fireEvent(this.CAPITAL_EVENT);
            this.setLoad(0);
        }
    }

    public override function createHudPaintable() : SelectionHudPaintable {
        final rtsLayerHudPaintable : RTSLayerHudPaintable = RTSLayerHudPaintable.getInstance();
        rtsLayerHudPaintable.setBasicColorP(this.allBinaryGameLayerManagerP.getForegroundBasicColor());
        rtsLayerHudPaintable.setRtsLayer(this);
        return rtsLayerHudPaintable;
    }

    public override function getHudPaintable() : SelectionHudPaintable {
        final rtsLayerHudPaintable : RTSLayerHudPaintable = RTSLayerHudPaintable.getInstance();
        return rtsLayerHudPaintable;
    }

    public override function getType() : Int {
        return UnitLayer.getStaticType();
    }

    public static function getStaticType() : Int {
        return 1;
    }

    public function getUnitWaypointBehavior() : UnitWaypointBehavior {
        return (cast this.getWaypointBehavior() : UnitWaypointBehavior);
    }

    public override function getTrackingEvent() : TrackingEvent {
        return this.trackingEvent;
    }

    public override function getCaptionAnimationHelper() : CaptionAnimationHelperBase {
        return this.captionAnimationHelper;
    }

    public override function isSelfUpgradeable() : Bool {
        return false;
    }

    public function getMaxResourceLoad() : Int {
        return this.maxResourceLoad;
    }

    public static function getPartialpositionlist() : BasicArrayList {
        return UnitLayer.partialPositionList;
    }

}

