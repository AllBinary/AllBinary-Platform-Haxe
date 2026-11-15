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
package org.allbinary.game.input.form;

import org.allbinary.logic.string.StringMaker;
import org.allbinary.game.input.RTSPlayerGameInput;
import org.allbinary.game.layer.AdvancedRTSGameLayer;
import org.allbinary.game.layer.AdvancedRTSPlayerLayerInterface;
import org.allbinary.game.layer.RTSGameStrings;
import org.allbinary.game.layer.RTSLayer;
import org.allbinary.game.layer.RTSLayerEvent;
import org.allbinary.game.layer.RTSLayerUtil;
import org.allbinary.game.layer.RTSPlayerLayerInterface;
import org.allbinary.game.layer.capital.Capital;
import org.allbinary.game.layer.waypoint.WaypointCellPositionHistory;
import org.allbinary.game.layer.waypoint.WaypointLayer;
import org.allbinary.game.layer.waypoint.event.WaypointEventHandlerFactory;
import org.allbinary.graphics.form.item.ABCustomItem;
import org.allbinary.util.BasicArrayList;
import org.allbinary.logic.java.bool.BooleanFactory;
import org.allbinary.game.identification.Group;
import org.allbinary.game.layer.AllBinaryGameLayerManager;
import org.allbinary.game.layer.AllBinaryTiledLayer;
import org.allbinary.game.layer.GeographicMapCellPositionAreaBase;
import org.allbinary.game.layer.NullPathFindingLayer;
import org.allbinary.game.layer.NullRTSLayer;
import org.allbinary.game.layer.PathFindingLayerInterface;
import org.allbinary.game.layer.hud.event.GameNotificationEvent;
import org.allbinary.game.layer.hud.event.GameNotificationEventHandler;
import org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer;
import org.allbinary.graphics.GPoint;
import org.allbinary.graphics.color.BasicColorFactory;
import org.allbinary.layer.AllBinaryLayerManager;
import org.allbinary.layer.Layer;
import org.allbinary.logic.math.SmallIntegerSingletonFactory;
import org.allbinary.media.audio.ErrorSound;
import org.allbinary.media.graphics.geography.map.BasicGeographicMap;
import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition;
import org.allbinary.media.graphics.geography.map.GeographicMapCellType;
import org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface;
import org.allbinary.media.graphics.geography.map.drop.DropCellPositionHistory;
import org.allbinary.media.graphics.geography.map.racetrack.RaceTrackGeographicMapCellTypeFactory;

class WaypointRTSFormInput extends RTSFormInput {
    private final WAYPOINT_EVENT : RTSLayerEvent = new RTSLayerEvent(NullRTSLayer.NULL_RTS_LAYER);
    public final dragToSpotGameNotificationEvent : GameNotificationEvent;
    public final spotTakenGameNotificationEvent : GameNotificationEvent;
    public final buildingCollisionGameNotificationEvent : GameNotificationEvent;
    public final roadCollisionGameNotificationEvent : GameNotificationEvent;
    public final newWaypointGameNotificationEvent : GameNotificationEvent;
    public final noMoneyGameNotificationEvent : GameNotificationEvent;
    private var isPrimaryWaypointCreator : Bool;
    private var stickyAssociatedRtsLayer : PathFindingLayerInterface = NullPathFindingLayer.NULL_PATH_FINDING_LAYER;
    public function new(groupInterface : haxe.ds.Vector<Group>, isPrimaryWaypointCreator : Bool) {
        super(groupInterface);
        this.isPrimaryWaypointCreator = isPrimaryWaypointCreator;
        final smallIntegerSingletonFactory : SmallIntegerSingletonFactory = SmallIntegerSingletonFactory.getInstance();
        final basicColorFactory : BasicColorFactory = BasicColorFactory.getInstance();
        this.dragToSpotGameNotificationEvent = new GameNotificationEvent(this, RTSGameStrings.getInstance().DRAG_TO_SPOT, smallIntegerSingletonFactory.getAt(2), basicColorFactory.WHITE, BooleanFactory.getInstance().FALSE);
        this.spotTakenGameNotificationEvent = new GameNotificationEvent(this, RTSGameStrings.getInstance().SPOT_TAKEN, smallIntegerSingletonFactory.getAt(2), basicColorFactory.WHITE, BooleanFactory.getInstance().FALSE);
        this.buildingCollisionGameNotificationEvent = new GameNotificationEvent(this, RTSGameStrings.getInstance().BUILDING_COLLISION, smallIntegerSingletonFactory.getAt(2), basicColorFactory.WHITE, BooleanFactory.getInstance().FALSE);
        this.roadCollisionGameNotificationEvent = new GameNotificationEvent(this, RTSGameStrings.getInstance().ROAD_COLLISION, smallIntegerSingletonFactory.getAt(2), basicColorFactory.WHITE, BooleanFactory.getInstance().FALSE);
        this.newWaypointGameNotificationEvent = new GameNotificationEvent(this, RTSGameStrings.getInstance().NEW_WAYPOINT, smallIntegerSingletonFactory.getAt(2), basicColorFactory.WHITE, BooleanFactory.getInstance().FALSE);
        this.noMoneyGameNotificationEvent = new GameNotificationEvent(this, RTSGameStrings.getInstance().NO_MONEY, smallIntegerSingletonFactory.getAt(2), basicColorFactory.WHITE, BooleanFactory.getInstance().FALSE);
    }

    // throws Exception
    public override function setAllBinaryGameLayerManager(allBinaryGameLayerManager : AllBinaryGameLayerManager) : Void {
        super.setAllBinaryGameLayerManager(allBinaryGameLayerManager);
        final geographicMapCompositeInterface : GeographicMapCompositeInterface = (cast allBinaryGameLayerManager : GeographicMapCompositeInterface);
        final geographicMapInterface : BasicGeographicMap = geographicMapCompositeInterface.getGeographicMapInterface()[0];
        this.dragToSpotGameNotificationEvent.setBasicColorP(geographicMapInterface.getForegroundBasicColor());
        this.spotTakenGameNotificationEvent.setBasicColorP(geographicMapInterface.getForegroundBasicColor());
        this.buildingCollisionGameNotificationEvent.setBasicColorP(geographicMapInterface.getForegroundBasicColor());
        this.roadCollisionGameNotificationEvent.setBasicColorP(geographicMapInterface.getForegroundBasicColor());
        this.newWaypointGameNotificationEvent.setBasicColorP(geographicMapInterface.getForegroundBasicColor());
        this.noMoneyGameNotificationEvent.setBasicColorP(geographicMapInterface.getForegroundBasicColor());
    }

    // throws Exception
    public override function processAtPoint(associatedRtsLayer : CollidableDestroyableDamageableLayer, rtsPlayerLayerInterface : RTSPlayerLayerInterface, layerManager : AllBinaryLayerManager, point : GPoint) : Void {
        super.process(layerManager);
        if (this.isStickyItemSelected() || associatedRtsLayer == CollidableDestroyableDamageableLayer.getNullInstance()) {
            if (this.isStickyItemSelected() && associatedRtsLayer == CollidableDestroyableDamageableLayer.getNullInstance()) {
                final geographicMapCompositeInterface : GeographicMapCompositeInterface = (cast layerManager : GeographicMapCompositeInterface);
                final geographicMapInterface : BasicGeographicMap = geographicMapCompositeInterface.getGeographicMapInterface()[0];
                final allBinaryTiledLayer : AllBinaryTiledLayer = geographicMapInterface.getAllBinaryTiledLayer();
                var x : Int = point.getX() + allBinaryTiledLayer.getXP();
                var y : Int = point.getY() + allBinaryTiledLayer.getYP();
                final geographicMapCellPosition : GeographicMapCellPosition = geographicMapInterface.getCellPositionAtXY(x, y);
                this.processCellPosition(rtsPlayerLayerInterface, layerManager, geographicMapCellPosition);
            } else {
                if (!rtsPlayerLayerInterface.implmentsArtificialIntelligenceCompositeInterface()) {
                    GameNotificationEventHandler.getInstance().fireEvent(this.dragToSpotGameNotificationEvent);
                }
            }
        } else {
            if (!rtsPlayerLayerInterface.implmentsArtificialIntelligenceCompositeInterface()) {
                GameNotificationEventHandler.getInstance().fireEvent(this.spotTakenGameNotificationEvent);
            }
        }
    }

    // throws Exception
    private function processCellPosition(rtsPlayerLayerInterface : RTSPlayerLayerInterface, layerManager : AllBinaryLayerManager, geographicMapCellPosition : GeographicMapCellPosition) : Void {
        var itemIndex : Int = this.getSelectedStickyItemIndex();
        if (this.newUnconstructedRTSLayerInterfaceArray[itemIndex] == CollidableDestroyableDamageableLayer.getNullInstance()) {
            this.newUnconstructedRTSLayerInterfaceArray[itemIndex] = this.getInstance(layerManager, this.getSelectedStickyItem(), geographicMapCellPosition);
        } else {
            final cellPoint : GPoint = geographicMapCellPosition.getPoint();
            final rtsLayer : RTSLayer = (cast this.newUnconstructedRTSLayerInterfaceArray[itemIndex] : RTSLayer);
            rtsLayer.setPosition(cellPoint.getX(), cellPoint.getY(), rtsLayer.getZP());
            final geographicMapCompositeInterface : GeographicMapCompositeInterface = (cast rtsLayer.allBinaryGameLayerManagerP : GeographicMapCompositeInterface);
            final geographicMapInterface : BasicGeographicMap = geographicMapCompositeInterface.getGeographicMapInterface()[0];
            rtsLayer.geographicMapCellPositionAreaBase.update(geographicMapInterface);
        }
        this.attemptBuild(rtsPlayerLayerInterface, layerManager, (cast this.newUnconstructedRTSLayerInterfaceArray[itemIndex] : RTSLayer), itemIndex);
    }

    // throws Exception
    public override function processStickyGameSpecific(associatedRtsLayer : CollidableDestroyableDamageableLayer, rtsPlayerLayerInterface : RTSPlayerLayerInterface, layerManager : AllBinaryLayerManager, item : ABCustomItem, index : Int) : Void {
        this.logUtil.putF("Set Sticking Item: " + item, this, "processSticky");
        this.setSelectedStickyItem(item);
        this.setSelectedStickyItemIndex(index);
        this.setStickyItemSelected(true);
        this.stickyAssociatedRtsLayer = (cast associatedRtsLayer : RTSLayer);
        this.getHashtable().put(Layer.ID, associatedRtsLayer);
    }

    // throws Exception
    public function attemptBuild(rtsPlayerLayerInterface : RTSPlayerLayerInterface, layerManager : AllBinaryLayerManager, layerInterface : RTSLayer, itemIndex : Int) : Bool {
        this.logUtil.putF("Layer: " + layerInterface, this, "attemptBuild");
        if (layerInterface == null) {
            this.logUtil.put("Layer was null", this, "attemptBuild", new haxe.Exception());
            return false;
        }
        var geographicMapCellPositionArea : GeographicMapCellPositionAreaBase = layerInterface.geographicMapCellPositionAreaBase;
        var list : BasicArrayList = geographicMapCellPositionArea.getOccupyingGeographicMapCellPositionList();
        if (DropCellPositionHistory.getInstance().anyCellPositionWithDrop(list) || WaypointCellPositionHistory.getInstance().anyCellPositionWithDrop(list)) {
            rtsPlayerLayerInterface.add(ErrorSound.getInstance());
            if (!rtsPlayerLayerInterface.implmentsArtificialIntelligenceCompositeInterface()) {
                GameNotificationEventHandler.getInstance().fireEvent(this.buildingCollisionGameNotificationEvent);
            }
            return false;
        }
        final geographicMapCompositeInterface : GeographicMapCompositeInterface = (cast layerManager : GeographicMapCompositeInterface);
        final geographicMapInterface : BasicGeographicMap = geographicMapCompositeInterface.getGeographicMapInterface()[0];
        final raceTrackGeographicMapCellTypeFactory : RaceTrackGeographicMapCellTypeFactory = (cast geographicMapInterface.getGeographicMapCellTypeFactory() : RaceTrackGeographicMapCellTypeFactory);
        var geographicMapCellType : GeographicMapCellType = null;
        {
            var index : Int = list.size();
            while (--index >= 0) {
            geographicMapCellType = geographicMapInterface.getCellTypeAt((cast list.get(index) : GeographicMapCellPosition));
            if (raceTrackGeographicMapCellTypeFactory.isPath(geographicMapCellType)) {
                rtsPlayerLayerInterface.add(ErrorSound.getInstance());
                if (!rtsPlayerLayerInterface.implmentsArtificialIntelligenceCompositeInterface()) {
                    GameNotificationEventHandler.getInstance().fireEvent(this.roadCollisionGameNotificationEvent);
                }
                return false;
            }
            }
        }
        var cost : Int = layerInterface.getCost();
        var capital : Capital = rtsPlayerLayerInterface.getCapital();
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append("Trying to Build: ");
        stringBuffer.append(layerInterface.getName());
        stringBuffer.append(" for: $");
        stringBuffer.appendint(cost);
        stringBuffer.append(" with ");
        stringBuffer.appendint(Std.int(capital.getTotalMoney()));
        this.logUtil.putF(stringBuffer.toString(), this, "attemptBuild");
        if (cost <= capital.getTotalMoney()) {
            layerInterface.construct(rtsPlayerLayerInterface);
            this.newUnconstructedRTSLayerInterfaceArray[itemIndex] = CollidableDestroyableDamageableLayer.getNullInstance();
            capital.removeMoney(cost);
            WaypointCellPositionHistory.getInstance().addList(list, layerInterface);
            final geographicMapCellPosition : GeographicMapCellPosition = geographicMapInterface.getCellPositionAtXY(layerInterface.getXP(), layerInterface.getYP());
            final waypointLayer : WaypointLayer = (cast layerInterface : WaypointLayer);
            this.addWayPoint(waypointLayer);
            final rtsPlayerGameInput : RTSPlayerGameInput = (cast rtsPlayerLayerInterface.getPlayerGameInput() : RTSPlayerGameInput);
            rtsPlayerGameInput.setSelectedRTSLayer(layerInterface, geographicMapCellPosition);
            final advancedRTSPlayerLayerInterface : AdvancedRTSPlayerLayerInterface = (cast rtsPlayerLayerInterface : AdvancedRTSPlayerLayerInterface);
            advancedRTSPlayerLayerInterface.getAdvancedPlayerOwnedRTSLayers().addWaypoint(layerInterface);
            layerManager.append(layerInterface);
            final waypointAvancedRTSGameLayer : AdvancedRTSGameLayer = (cast waypointLayer : AdvancedRTSGameLayer);
            rtsPlayerLayerInterface.add(waypointAvancedRTSGameLayer.getWaypointBehavior().getWaypoint().getSound());
            if (!rtsPlayerLayerInterface.implmentsArtificialIntelligenceCompositeInterface()) {
                GameNotificationEventHandler.getInstance().fireEvent(this.newWaypointGameNotificationEvent);
            }
            return true;
        } else {
            rtsPlayerLayerInterface.add(ErrorSound.getInstance());
            if (!rtsPlayerLayerInterface.implmentsArtificialIntelligenceCompositeInterface()) {
                GameNotificationEventHandler.getInstance().fireEvent(this.noMoneyGameNotificationEvent);
            }
            return false;
        }
    }

    // throws Exception
    private function addWayPoint(layerInterface : WaypointLayer) : Void {
        final stickyAssociatedAdvandedRtsLayer : AdvancedRTSGameLayer = (cast this.stickyAssociatedRtsLayer : AdvancedRTSGameLayer);
        final list : BasicArrayList = stickyAssociatedAdvandedRtsLayer.getWaypointBehavior().getOwnedWaypointList();
        RTSLayerUtil.getInstance().destroyAndClear(list);
        list.add(layerInterface);
        if (this.isPrimaryWaypointCreator) {
            PrimaryWaypointHelper.getInstance().setWaypointLayer(layerInterface);
        }
        this.WAYPOINT_EVENT.setRtsLayer(layerInterface);
        WaypointEventHandlerFactory.getInstance(layerInterface.getGroupInterface()[0]).fireEvent(this.WAYPOINT_EVENT);
    }

}

