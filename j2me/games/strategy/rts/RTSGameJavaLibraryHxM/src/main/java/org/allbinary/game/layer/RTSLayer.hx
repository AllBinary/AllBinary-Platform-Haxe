/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2003 AllBinary 
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
package org.allbinary.game.layer;

//import javax.microedition.lcdui.Graphics;
import org.allbinary.game.input.form.RTSFormInput;
import org.allbinary.game.multiplayer.layer.MultiPlayerGameLayer;
import org.allbinary.animation.Animation;
import org.allbinary.animation.AnimationInterfaceFactoryInterface;
import org.allbinary.animation.IndexedAnimation;
import org.allbinary.animation.NullAnimationFactory;
import org.allbinary.animation.NullIndexedAnimationFactory;
import org.allbinary.animation.ProceduralAnimationInterfaceFactoryInterface;
import org.allbinary.animation.RotationAnimation;
import org.allbinary.animation.caption.CaptionAnimationHelperBase;
import org.allbinary.game.combat.destroy.DestroyedLayerProcessor;
import org.allbinary.game.health.Health;
import org.allbinary.game.identification.Group;
import org.allbinary.game.identification.GroupFactory;
import org.allbinary.game.input.GameInputInterface;
import org.allbinary.game.input.GameInputProcessor;
import org.allbinary.game.input.GameInputProcessorUtil;
import org.allbinary.game.input.GameKeyEventSourceInterface;
import org.allbinary.game.input.InputFactory;
import org.allbinary.game.input.form.NullRTSFormInputFactory;
import org.allbinary.game.layer.waypoint.Waypoint2LogHelper;
import org.allbinary.game.layer.waypoint.WaypointLogHelper;
import org.allbinary.game.layer.waypoint.WaypointRunnableLogHelper;
import org.allbinary.game.tick.TickableInterface;
import org.allbinary.game.tracking.TrackingEvent;
import org.allbinary.game.view.TileLayerPositionIntoViewPosition;
import org.allbinary.graphics.Rectangle;
import org.allbinary.graphics.RectangleFactory;
import org.allbinary.graphics.form.ScrollSelectionForm;
import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.layer.AllBinaryLayerManager;
import org.allbinary.media.graphics.geography.map.BasicGeographicMap;
import org.allbinary.time.TimeDelayHelper;
import org.allbinary.view.event.ViewPositionEventHandler;
import org.allbinary.game.multiplayer.layer.RemoteInfo;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.math.LayerDistanceUtil;
import org.allbinary.media.graphics.geography.map.GeographicMapCellHistory;
import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition;
import org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface;
import org.allbinary.util.ABHashtable;
import org.allbinary.util.BasicArrayList;
import org.allbinary.view.ViewPositionBase;

class RTSLayer extends MultiPlayerGameLayer implements TickableInterface implements GameInputInterface implements GameKeyEventSourceInterface implements RTSInterface implements PathFindingLayerInterface {
    // throws Exception
    public static function createSimulatedInstance(remoteInfo : RemoteInfo) : RTSLayer {
        final nullAnimationInterfaceFactoryInterface : AnimationInterfaceFactoryInterface = NullAnimationFactory.getFactoryInstance();
        final nullIndexedAnimationInterfaceFactoryInterface : AnimationInterfaceFactoryInterface = NullIndexedAnimationFactory.getFactoryInstance();
        return new RTSLayer(RemoteInfo.REMOTE_INFO, GroupFactory.getInstance().NULL_GROUP_ARRAY, StringUtil.getInstance().EMPTY_STRING, StringUtil.getInstance().EMPTY_STRING, Health.NULL_HEALTH, NullRTSFormInputFactory.getInstance(), nullAnimationInterfaceFactoryInterface, nullIndexedAnimationInterfaceFactoryInterface, nullAnimationInterfaceFactoryInterface, nullAnimationInterfaceFactoryInterface, nullIndexedAnimationInterfaceFactoryInterface, NullIndexedAnimationFactory.getFactoryInstance(), RectangleFactory.SINGLETON, 0, 0, new TileLayerPositionIntoViewPosition());
    }

    public final debug : Bool = true;
    public final showMoreCaptionStates : Bool = this.debug;
    public final inputProcessorArray : haxe.ds.Vector<GameInputProcessor> = haxe.ds.Vector.fromArrayCopy([for (index in 0...InputFactory.getInstance().MAX) null]);
    public var rtsLayer2LogHelper : RTSLayer2LogHelper = RTSLayer2LogHelper.getInstance();
    public var waypointLogHelperP : WaypointLogHelper = WaypointLogHelper.getInstance();
    public var waypoint2LogHelperP : Waypoint2LogHelper = Waypoint2LogHelper.getInstance();
    public var waypointRunnableLogHelperP : WaypointRunnableLogHelper = WaypointRunnableLogHelper.getInstance();
    private final rtsFormInput : RTSFormInput;
    private var verticleBuildAnimationInterface : IndexedAnimation;
    public var rangeAnimation : Animation;
    public var initRangeAnimation : Animation;
    public var sensorRangeAnimation : Animation;
    public var initSensorRangeAnimation : Animation;
    public final baseAnimationInterface : Animation;
    private final buildFrameTimeHelper : TimeDelayHelper = new TimeDelayHelper(50);
    private final buildAnimationInterface : Animation;
    private var animationInterface : Animation;
    public final initAnimationInterface : IndexedAnimation;
    public var indexedButShouldBeRotationAnimationInterface : IndexedAnimation;
    public final emptyAnimationInterface : IndexedAnimation;
    public final destroyAnimationInterface : IndexedAnimation;
    public final fireTimeHelper : TimeDelayHelper = new TimeDelayHelper(700);
    private final rootName : String;
    public final hashtable : ABHashtable<Any, Any> = StdUtil.getInstance().createHashtable();
    private final BUILD_VALUE : Int = 63;
    public final geographicMapCellPositionAreaBase : GeographicMapCellPositionAreaBase;
    private var healthInterface : Health = Health.NULL_HEALTH;
    private static final id : Int = 0;
    private var level : Int = 1;
    private var maxLevel : Int = 1;
    private var hackVerticleBuild : Int = this.BUILD_VALUE;
    public var slightAngle : Int = 0;
    public static final MAIN_INDEX : Int = 0;
    public static final SECONDARY_INDEX : Int = 1;
    public var percentCompleteP : Int = 0;
    private var destroyed : Bool = false;
    private var selected : Bool = false;
    public function new(remoteInfo : RemoteInfo, groupInterface : haxe.ds.Vector<Group>, rootName : String, name : String, healthInterface : Health, rtsFormInput : RTSFormInput, animationInterfaceFactoryInterface : AnimationInterfaceFactoryInterface, emptyAnimationInterfaceFactoryInterface : AnimationInterfaceFactoryInterface, baseAnimationInterfaceFactoryInterface : AnimationInterfaceFactoryInterface, buildAnimationInterfaceFactoryInterface : AnimationInterfaceFactoryInterface, verticleBuildAnimationInterfaceFactoryInterface : AnimationInterfaceFactoryInterface, proceduralAnimationInterfaceFactoryInterface : ProceduralAnimationInterfaceFactoryInterface, rectangle : Rectangle, x : Int, y : Int, viewPosition : ViewPositionBase) {
        super(remoteInfo, groupInterface, name, rectangle, viewPosition);
        this.initInputProcessors();
        this.rootName = rootName;
        this.healthInterface = healthInterface;
        this.rtsFormInput = rtsFormInput;
        this.setPosition(x, y, this.z);
        this.verticleBuildAnimationInterface = (cast verticleBuildAnimationInterfaceFactoryInterface.getInstance(0) : IndexedAnimation);
        this.buildAnimationInterface = buildAnimationInterfaceFactoryInterface.getInstance(0);
        this.baseAnimationInterface = baseAnimationInterfaceFactoryInterface.getInstance(0);
        this.emptyAnimationInterface = (cast emptyAnimationInterfaceFactoryInterface.getInstance(0) : IndexedAnimation);
        this.indexedButShouldBeRotationAnimationInterface = (cast animationInterfaceFactoryInterface.getInstance(0) : IndexedAnimation);
        this.initAnimationInterface = this.indexedButShouldBeRotationAnimationInterface;
        this.destroyAnimationInterface = (cast proceduralAnimationInterfaceFactoryInterface.getInstanceAnimation(this.indexedButShouldBeRotationAnimationInterface) : IndexedAnimation);
        final animation : Animation = NullAnimationFactory.getFactoryInstance().getInstance(0);
        this.rangeAnimation = animation;
        this.initRangeAnimation = animation;
        this.sensorRangeAnimation = animation;
        this.initSensorRangeAnimation = animation;
        this.animationInterface = this.initAnimationInterface;
        this.geographicMapCellPositionAreaBase = new GeographicMapCellPositionArea(this);
    }

    // throws Exception
    public override function setAllBinaryGameLayerManager(allBinaryGameLayerManager : AllBinaryGameLayerManager) : Void {
        super.setAllBinaryGameLayerManager(allBinaryGameLayerManager);
        final geographicMapCompositeInterface : GeographicMapCompositeInterface = (cast this.allBinaryGameLayerManagerP : GeographicMapCompositeInterface);
        final geographicMapInterface : BasicGeographicMap = geographicMapCompositeInterface.getGeographicMapInterface()[0];
        final tiledLayer : AllBinaryTiledLayer = geographicMapInterface.getAllBinaryTiledLayer();
        final viewPosition2 : TileLayerPositionIntoViewPosition = (cast this.getViewPosition() : TileLayerPositionIntoViewPosition);
        viewPosition2.setTiledLayer(tiledLayer);
        this.updateWaypointBehavior(geographicMapInterface);
    }

    // throws Exception
    public function updateWaypointBehavior(geographicMapInterface : BasicGeographicMap) : Void {
        this.geographicMapCellPositionAreaBase.update(geographicMapInterface);
    }

    // throws Exception
    public function construct(rtsPlayerLayerInterface : RTSPlayerLayerInterface) : Void {
        ViewPositionEventHandler.getInstance().addListener((cast this : AllBinaryLayer));
        this.animationInterface = this.buildAnimationInterface;
        this.hackVerticleBuild = 0;
    }

    public function select() : Void {
        this.rangeAnimation = this.initRangeAnimation;
        this.sensorRangeAnimation = this.initSensorRangeAnimation;
        this.setSelected(true);
    }

    public function deselect() : Void {
        final animation : Animation = NullAnimationFactory.getFactoryInstance().getInstance(0);
        this.rangeAnimation = animation;
        this.sensorRangeAnimation = animation;
        this.setSelected(false);
    }

    public function setSelected(selected : Bool) : Void {
        this.selected = selected;
    }

    public override function isSelected() : Bool {
        return this.selected;
    }

    public override function getPercentComplete() : Int {
        return this.percentCompleteP;
    }

    public function getScrollSelectionForm() : ScrollSelectionForm {
        return ScrollSelectionForm.getNullScrollSelectionForm();
    }

    public override function initInputProcessors() : Void {
        GameInputProcessorUtil.init(this.inputProcessorArray);
    }

    // throws Exception
    public function processBuiltTick(allBinaryLayerManager : AllBinaryLayerManager) : Void {
        this.animationInterface = this.indexedButShouldBeRotationAnimationInterface;
    }

    public override function processTick(allBinaryLayerManager : AllBinaryLayerManager) : Void {
        try {
            if (this.isCompleted()) {
                this.processBuiltTick(allBinaryLayerManager);
            } else {
                this.build();
            }
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "processTick", e);
        }
    }

    // throws Exception
    public override function processInput(layerManager : AllBinaryLayerManager) : Void {
    }

    public function reload() : Void {
    }

    public function onMovement(trackingEvent : TrackingEvent) : Void {
    }

    // throws Exception
    public function onMovementFound(trackingEvent : TrackingEvent) : Void {
    }

    public override function paint(graphics : Graphics) : Void {
        super.paintFirst(graphics);
        final viewPosition : ViewPositionBase = this.getViewPosition();
        final viewX : Int = viewPosition.getX();
        final viewY : Int = viewPosition.getY();
        this.getAnimationInterface().paintXY(graphics, viewX, viewY);
    }

    // throws Exception
    public override function damage(damage : Int, damageType : Int) : Void {
    }

    public override function getSourceId() : Int {
        return RTSLayer.id;
    }

    private final rtsLayerUtil : RTSLayerUtil = RTSLayerUtil.getInstance();
    public override function downgrade() : Void {
        this.rtsLayerUtil.downgrade(this);
    }

    public override function upgrade() : Void {
        this.rtsLayerUtil.upgrade(this);
    }

    public override function isCompleted() : Bool {
        if (this.hackVerticleBuild < this.BUILD_VALUE) {
            return false;
        } else {
            return true;
        }
    }

    // throws Exception
    private function build() : Void {
        if (this.buildFrameTimeHelper.isTimeTNT()) {
            this.animationInterface = this.buildAnimationInterface;
            this.verticleBuildAnimationInterface.nextFrame();
            this.hackVerticleBuild++;
        }
        this.percentCompleteP = Std.int(100 * this.hackVerticleBuild / this.BUILD_VALUE);
        this.getHudPaintable().updateInfo();
    }

    public override function isSelfUpgradeable() : Bool {
        return true;
    }

    public override function getCost() : Int {
        return this.rtsLayerUtil.getCost(this);
    }

    public override function getDowngradeCost() : Int {
        return this.rtsLayerUtil.getDowngradeCost(this);
    }

    public override function getUpgradeCost() : Int {
        return this.rtsLayerUtil.getUpgradeCost(this);
    }

    public override function isUpgradeable() : Bool {
        if (this.getLevel() < this.getMaxLevel()) {
            return true;
        } else {
            return false;
        }
    }

    public override function isDowngradeable() : Bool {
        if (this.getLevel() > 1) {
            return true;
        } else {
            return false;
        }
    }

    public override function getLevel() : Int {
        return this.level;
    }

    public function setLevel(level : Int) : Void {
        this.level = level;
    }

    public function getVerticleBuildAnimationInterface() : Animation {
        return this.verticleBuildAnimationInterface;
    }

    public function getAnimationInterface() : Animation {
        return this.animationInterface;
    }

    public function setAnimationInterface(animationInterface : Animation) : Void {
        this.animationInterface = animationInterface;
    }

    private final layerDistanceUtil : LayerDistanceUtil = LayerDistanceUtil.getInstance();
    // throws Exception
    public override function setTarget(targetGameLayer : PathFindingLayerInterface) : Void {
        final anotherTargetDistance : Int = this.layerDistanceUtil.getDistance((cast this : AllBinaryLayer), (cast targetGameLayer : AllBinaryLayer));
        final waypointBehaviorBase : WaypointBehaviorBase = this.getWaypointBehavior();
        waypointBehaviorBase.setTargetWithDistance((cast targetGameLayer : PathFindingLayerInterface), anotherTargetDistance);
    }

    public function createHudPaintable() : SelectionHudPaintable {
        throw new haxe.Exception();
    }

    public override function getHudPaintable() : SelectionHudPaintable {
        throw new haxe.Exception();
    }

    public override function getMaxLevel() : Int {
        return this.maxLevel;
    }

    public function setMaxLevel(maxLevel : Int) : Void {
        this.maxLevel = maxLevel;
    }

    public function getHealthInterface() : Health {
        return this.healthInterface;
    }

    public function setHealthInterface(healthInterface : Health) : Void {
        this.healthInterface = healthInterface;
    }

    public function getRTSFormInput() : RTSFormInput {
        return this.rtsFormInput;
    }

    // throws Exception
    public override function isDestroyed() : Bool {
        return this.destroyed;
    }

    // throws Exception
    public function setDestroyed(destroyed : Bool) : Void {
        this.destroyed = destroyed;
        if (this.isDestroyed()) {
            DestroyedLayerProcessor.getInstance().add(this);
            ViewPositionEventHandler.getInstance().removeListener(this);
        }
    }

    public override function getEndGeographicMapCellPositionList() : BasicArrayList {
        return this.geographicMapCellPositionAreaBase.getOccupyingGeographicMapCellPositionList();
    }

    public override function getGeographicMapCellPositionArea() : GeographicMapCellPositionAreaBase {
        return this.geographicMapCellPositionAreaBase;
    }

    public override function shouldHandleStartSameAsEnd() : Bool {
        return true;
    }

    // throws Exception
    public override function handleCost(ownerLayer : PathFindingLayerInterface) : Void {
    }

    public override function getWaypointBehavior() : WaypointBehaviorBase {
        throw new haxe.Exception();
    }

    public override function getParentLayer() : PathFindingLayerInterface {
        throw new haxe.Exception();
    }

    public override function getRTSLayer2LogHelper() : RTSLayer2LogHelper {
        return this.rtsLayer2LogHelper;
    }

    public override function getWaypointLogHelper() : WaypointLogHelper {
        return this.waypointLogHelperP;
    }

    public override function getWaypoint2LogHelper() : Waypoint2LogHelper {
        return this.waypoint2LogHelperP;
    }

    public override function getWaypointRunnableLogHelper() : WaypointRunnableLogHelper {
        return this.waypointRunnableLogHelperP;
    }

    public override function shouldAddWaypointFromBuilding() : Bool {
        return false;
    }

    public override function getCaptionAnimationHelper() : CaptionAnimationHelperBase {
        throw new haxe.Exception();
    }

    public override function isShowMoreCaptionStates() : Bool {
        return this.showMoreCaptionStates;
    }

    // throws Exception
    public override function init(geographicMapCellHistory : GeographicMapCellHistory, geographicMapCellPositionBasicArrayList : BasicArrayList) : Void {
    }

    // throws Exception
    public override function getCurrentGeographicMapCellPosition() : GeographicMapCellPosition {
        throw new haxe.Exception();
    }

    // throws Exception
    public override function getTopLeftGeographicMapCellPosition() : GeographicMapCellPosition {
        throw new haxe.Exception();
    }

    public override function getMoveOutOfBuildAreaPath(geographicMapCellPosition : GeographicMapCellPosition) : BasicArrayList {
        throw new haxe.Exception();
    }

    // throws Exception
    public override function setClosestGeographicMapCellHistory(pathsList : BasicArrayList) : Void {
    }

    public override function teleportTo(geographicMapCellPosition : GeographicMapCellPosition) : Void {
    }

    // throws Exception
    public override function setLoad(resource : Int) : Void {
    }

    // throws Exception
    public override function getSurroundingGeographicMapCellPositionList() : BasicArrayList {
        throw new haxe.Exception();
    }

    // throws Exception
    public override function trackTo(reason : String) : Void {
    }

    // throws Exception
    public override function trackToDXY(dx : Int, dy : Int) : Void {
    }

    public override function isWaypointListEmptyOrOnlyTargets() : Bool {
        return false;
    }

    public override function getTrackingEvent() : TrackingEvent {
        throw new haxe.Exception();
    }

    // throws Exception
    public override function buildingChase(allbinaryLayer : AllBinaryLayer, cellPosition : GeographicMapCellPosition) : Bool {
        return false;
    }

    public override function allStop() : Void {
    }

    public static function getMinStaticType() : Int {
        return 1;
    }

    public static function getMaxStaticType() : Int {
        return 4;
    }

    public static function isRTSLayer(layerInterface : AllBinaryLayer) : Bool {
        if (layerInterface.getType() >= RTSLayer.getMinStaticType() && layerInterface.getType() <= RTSLayer.getMaxStaticType()) {
            return true;
        }
        return false;
    }

    public override function implmentsTickableInterface() : Bool {
        return true;
    }

    public override function implmentsGameInputInterface() : Bool {
        return true;
    }

    public function getRootName() : String {
        return this.rootName;
    }

    public function getRotationAnimationInterface() : RotationAnimation {
        return (cast this.indexedButShouldBeRotationAnimationInterface : RotationAnimation);
    }

    public function setFrame(index : Int) : Void {
        this.getRotationAnimationInterface().setFrame(index);
    }

    public function setRotationAnimationInterface(rotationAnimationInterface : RotationAnimation) : Void {
        this.indexedButShouldBeRotationAnimationInterface = rotationAnimationInterface;
    }

}

