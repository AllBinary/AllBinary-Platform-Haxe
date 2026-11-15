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
package org.allbinary.game.layer;

//import javax.microedition.lcdui.Canvas;
import org.allbinary.animation.AnimationInterfaceFactoryInterface;
import org.allbinary.animation.NullAnimationFactory;
import org.allbinary.animation.NullIndexedAnimationFactory;
import org.allbinary.animation.ProceduralAnimationInterfaceFactoryInterface;
import org.allbinary.animation.transition.shake.ShakeAnimationListener;
import org.allbinary.direction.Direction;
import org.allbinary.direction.DirectionFactory;
import org.allbinary.game.GameTypeFactory;
import org.allbinary.game.combat.destroy.event.DestroyedEvent;
import org.allbinary.game.combat.destroy.event.DestroyedEventHandler;
import org.allbinary.game.combat.destroy.event.DestroyedEventListenerInterface;
import org.allbinary.game.health.Health;
import org.allbinary.game.identification.Group;
import org.allbinary.game.identification.GroupFactory;
import org.allbinary.game.input.event.GameKeyEventFactory;
import org.allbinary.game.input.form.NullRTSFormInputFactory;
import org.allbinary.game.input.form.RTSFormInput;
import org.allbinary.game.layer.building.event.BuildingEventHandler;
import org.allbinary.game.layer.unit.UnitLayer;
import org.allbinary.game.layer.waypoint.Waypoint2LogHelper;
import org.allbinary.game.layer.waypoint.Waypoint2SelectedLogHelper;
import org.allbinary.game.layer.waypoint.WaypointBase;
import org.allbinary.game.layer.waypoint.WaypointLogHelper;
import org.allbinary.game.layer.waypoint.WaypointRunnableLogHelper;
import org.allbinary.game.layer.waypoint.WaypointRunnableSelectedLogHelper;
import org.allbinary.game.layer.waypoint.WaypointSelectedLogHelper;
import org.allbinary.game.multiplayer.layer.RemoteInfo;
import org.allbinary.game.tick.NullTickable;
import org.allbinary.game.tick.TickableInterface;
import org.allbinary.game.view.TileLayerPositionIntoViewPosition;
import org.allbinary.graphics.Rectangle;
import org.allbinary.graphics.RectangleFactory;
import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.math.AngleInfo;
import org.allbinary.math.FrameUtil;
import org.allbinary.media.AllBinaryVibrationME;
import org.allbinary.media.graphics.geography.map.BasicGeographicMap;
import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition;
import org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface;
import org.allbinary.media.graphics.geography.map.GeographicMapDirectionUtil;
import org.allbinary.util.BasicArrayList;
import org.allbinary.view.ViewPositionBase;

class AdvancedRTSGameLayer extends RTSLayer implements DestroyedEventListenerInterface {
    // throws Exception
    public static function createSimulated() : AdvancedRTSGameLayer {
        final nullAnimationInterfaceFactoryInterface : AnimationInterfaceFactoryInterface = NullAnimationFactory.getFactoryInstance();
        final nullIndexedAnimationInterfaceFactoryInterface : AnimationInterfaceFactoryInterface = NullIndexedAnimationFactory.getFactoryInstance();
        return new AdvancedRTSGameLayer(RemoteInfo.REMOTE_INFO, NullPathFindingLayer.NULL_PATH_FINDING_LAYER, AdvancedRTSProperties.createPropertiesSimulated(), GroupFactory.getInstance().NULL_GROUP_ARRAY, StringUtil.getInstance().EMPTY_STRING, StringUtil.getInstance().EMPTY_STRING, Health.NULL_HEALTH, NullRTSFormInputFactory.getInstance(), nullAnimationInterfaceFactoryInterface, nullIndexedAnimationInterfaceFactoryInterface, nullAnimationInterfaceFactoryInterface, nullAnimationInterfaceFactoryInterface, nullIndexedAnimationInterfaceFactoryInterface, NullIndexedAnimationFactory.getFactoryInstance(), RectangleFactory.SINGLETON, 0, 0, new TileLayerPositionIntoViewPosition());
    }

    public final shakeListener : ShakeAnimationListener;
    public final vibration : AllBinaryVibrationME;
    public final duration : Int;
    private var parentLayer : PathFindingLayerInterface = NullPathFindingLayer.NULL_PATH_FINDING_LAYER;
    public var waypointBehaviorBase : TickableInterface = NullTickable.getInstance();
    public function new(remoteInfo : RemoteInfo, parentLayer : PathFindingLayerInterface, advancedRTSProperties : AdvancedRTSProperties, groupInterface : haxe.ds.Vector<Group>, rootName : String, name : String, healthInterface : Health, rtsFormInput : RTSFormInput, animationInterfaceFactoryInterface : AnimationInterfaceFactoryInterface, emptyAnimationInterfaceFactoryInterface : AnimationInterfaceFactoryInterface, baseAnimationInterfaceFactoryInterface : AnimationInterfaceFactoryInterface, buildAnimationInterfaceFactoryInterface : AnimationInterfaceFactoryInterface, verticleBuildAnimationInterfaceFactoryInterface : AnimationInterfaceFactoryInterface, proceduralAnimationInterfaceFactoryInterface : ProceduralAnimationInterfaceFactoryInterface, rectangle : Rectangle, x : Int, y : Int, viewPosition : ViewPositionBase) {
        super(remoteInfo, groupInterface, rootName, name, healthInterface, rtsFormInput, animationInterfaceFactoryInterface, emptyAnimationInterfaceFactoryInterface, baseAnimationInterfaceFactoryInterface, buildAnimationInterfaceFactoryInterface, verticleBuildAnimationInterfaceFactoryInterface, proceduralAnimationInterfaceFactoryInterface, rectangle, x, y, viewPosition);
        this.setVisible(false);
        this.setWaypointBehavior(new WaypointBehaviorBase());
        this.shakeListener = advancedRTSProperties.shakeListener;
        this.vibration = advancedRTSProperties.vibration;
        this.duration = advancedRTSProperties.duration;
        this.setParentLayer(parentLayer);
    }

    // throws Exception
    public override function updateWaypointBehavior(geographicMapInterface : BasicGeographicMap) : Void {
        super.updateWaypointBehavior(geographicMapInterface);
        this.getWaypointBehavior().getWaypoint().setAllBinaryGameLayerManager(this.allBinaryGameLayerManagerP);
    }

    public function initVisibility(rtsPlayerLayerInterface : RTSPlayerLayerInterface) : Void {
        var advancedRTSPlayerLayerInterface : AdvancedRTSPlayerLayerInterface = (cast rtsPlayerLayerInterface : AdvancedRTSPlayerLayerInterface);
        if (advancedRTSPlayerLayerInterface.isLocalPlayer() || advancedRTSPlayerLayerInterface.getGameType() == GameTypeFactory.getInstance().BOT) {
            this.setVisible(true);
        } else {
            this.setVisible(false);
        }
    }

    // throws Exception
    public override function construct(rtsPlayerLayerInterface : RTSPlayerLayerInterface) : Void {
        super.construct(rtsPlayerLayerInterface);
        this.initVisibility(rtsPlayerLayerInterface);
        BuildingEventHandler.getInstance().addListenerInterface(this.getWaypointBehavior().getWaypoint());
    }

    // throws Exception
    public override function setDestroyed(destroyed : Bool) : Void {
        super.setDestroyed(destroyed);
        if (this.isDestroyed()) {
            BuildingEventHandler.getInstance().removeListener(this.getWaypointBehavior().getWaypoint());
            BuildingEventHandler.getInstance().removeListener(this);
            DestroyedEventHandler.getInstance().addListener(this);
            RTSLayerUtil.getInstance().destroyAndClear(this.getWaypointBehavior().getOwnedWaypointList());
        }
    }

    public override function getParentLayer() : PathFindingLayerInterface {
        return this.parentLayer;
    }

    public function setParentLayer(parentLayer : PathFindingLayerInterface) : Void {
        this.parentLayer = parentLayer;
    }

    public override function getWaypointBehavior() : WaypointBehaviorBase {
        return (cast this.waypointBehaviorBase : WaypointBehaviorBase);
    }

    public function setWaypointBehavior(unitWaypointHelper : WaypointBehaviorBase) : Void {
        this.waypointBehaviorBase = unitWaypointHelper;
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
        if (this.parentLayer != NullPathFindingLayer.NULL_PATH_FINDING_LAYER) {
            final parentAdvancedRTSGameLayer : AdvancedRTSGameLayer = (cast this.parentLayer : AdvancedRTSGameLayer);
            if (parentAdvancedRTSGameLayer.getType() != UnitLayer.getStaticType()) {
                return true;
            }
        }
        return false;
    }

    public override function isWaypointListEmptyOrOnlyTargets() : Bool {
        if (this.getType() != UnitLayer.getStaticType()) {
            return true;
        }
        return false;
    }

    // throws Exception
    public override function buildingChase(allbinaryLayer : AllBinaryLayer, cellPosition : GeographicMapCellPosition) : Bool {
        final geographicMapCellPosition : GeographicMapCellPosition = this.getCurrentGeographicMapCellPosition();
        final buildingDirection : Direction = GeographicMapDirectionUtil.getInstance().getDirectionFromCellPositionToAdjacentCellPosition(geographicMapCellPosition, cellPosition);
        final angleInfo : AngleInfo = this.getRotationAnimationInterface().getAngleInfoP();
        final angle : Int = FrameUtil.getInstance().adjustAngleToFrameAngle(angleInfo.getAngle() + 90);
        final gameKeyEventFactory : GameKeyEventFactory = GameKeyEventFactory.getInstance();
        if (buildingDirection == DirectionFactory.getInstance().UP) {
            this.rtsLayer2LogHelper.buildingAbove(this);
            if (angle > 180 && angle < 360) {
                this.rtsLayer2LogHelper.buildingChaseLeft(this, angle);
                this.getGameKeyEventList().add(gameKeyEventFactory.getInstanceForKey(this, Canvas.LEFT));
                if (angle <= 190) {
                    return true;
                }
            } else {
                this.rtsLayer2LogHelper.buildingChaseRight(this, angle);
                this.getGameKeyEventList().add(gameKeyEventFactory.getInstanceForKey(this, Canvas.RIGHT));
                if (angle >= 170) {
                    return true;
                }
            }
        } else if (buildingDirection == DirectionFactory.getInstance().DOWN) {
            this.rtsLayer2LogHelper.buildingDown(this);
            if (angle > 180 && angle < 360) {
                this.rtsLayer2LogHelper.buildingChaseLeft(this, angle);
                this.getGameKeyEventList().add(gameKeyEventFactory.getInstanceForKey(this, Canvas.RIGHT));
                if (angle > 315) {
                    return true;
                }
            } else {
                this.rtsLayer2LogHelper.buildingChaseRight(this, angle);
                this.getGameKeyEventList().add(gameKeyEventFactory.getInstanceForKey(this, Canvas.LEFT));
                if (angle < 45) {
                    return true;
                }
            }
        } else if (buildingDirection == DirectionFactory.getInstance().LEFT) {
            this.rtsLayer2LogHelper.buildingLeft();
            if (angle > 90 && angle < 270) {
                this.rtsLayer2LogHelper.buildingChaseDown(this, angle);
                this.getGameKeyEventList().add(gameKeyEventFactory.getInstanceForKey(this, Canvas.LEFT));
                if (angle < 135) {
                    return true;
                }
            } else {
                this.rtsLayer2LogHelper.buildingChaseUp(this, angle);
                this.getGameKeyEventList().add(gameKeyEventFactory.getInstanceForKey(this, Canvas.RIGHT));
                if (angle > 45) {
                    return true;
                }
            }
        } else if (buildingDirection == DirectionFactory.getInstance().RIGHT) {
            this.rtsLayer2LogHelper.buildingRight();
            if (angle > 90 && angle < 270) {
                this.rtsLayer2LogHelper.buildingChaseDown(this, angle);
                this.getGameKeyEventList().add(gameKeyEventFactory.getInstanceForKey(this, Canvas.RIGHT));
                if (angle > 225) {
                    return true;
                }
            } else {
                this.rtsLayer2LogHelper.buildingChaseUp(this, angle);
                this.getGameKeyEventList().add(gameKeyEventFactory.getInstanceForKey(this, Canvas.LEFT));
                if (angle < 315 && angle > 180) {
                    return true;
                }
            }
        } else {
            return true;
        }
        return false;
    }

    // throws Exception
    public override function getSurroundingGeographicMapCellPositionList() : BasicArrayList {
        final geographicMapCompositeInterface : GeographicMapCompositeInterface = (cast this.allBinaryGameLayerManagerP : GeographicMapCompositeInterface);
        final geographicMapInterface : BasicGeographicMap = geographicMapCompositeInterface.getGeographicMapInterface()[0];
        this.geographicMapCellPositionAreaBase.update(geographicMapInterface);
        return this.geographicMapCellPositionAreaBase.getSurroundingGeographicMapCellPositionList();
    }

    public override function setSelected(selected : Bool) : Void {
        super.setSelected(selected);
        if (this.debug) {
            if (selected) {
                this.waypointLogHelperP = WaypointSelectedLogHelper.getInstance();
                this.waypoint2LogHelperP = Waypoint2SelectedLogHelper.getInstance();
                this.waypointRunnableLogHelperP = WaypointRunnableSelectedLogHelper.getInstance();
            } else {
                this.waypointLogHelperP = WaypointLogHelper.getInstance();
                this.waypoint2LogHelperP = Waypoint2LogHelper.getInstance();
                this.waypointRunnableLogHelperP = WaypointRunnableLogHelper.getInstance();
            }
        }
    }

    public override function onDestroyed(destroyedEvent : DestroyedEvent) : Void {
        try {
            var layerInterface : AllBinaryLayer = destroyedEvent.getLayerInterface();
            if (layerInterface == this) {
                DestroyedEventHandler.getInstance().removeListener(this);
                var waypoint : WaypointBase = (cast this.getWaypointBehavior().getWaypoint() : WaypointBase);
                waypoint.reset();
            }
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "onDestroyed", e);
        }
    }

}

