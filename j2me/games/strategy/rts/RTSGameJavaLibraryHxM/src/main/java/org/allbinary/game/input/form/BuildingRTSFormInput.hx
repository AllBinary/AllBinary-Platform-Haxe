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
package org.allbinary.game.input.form;

import org.allbinary.game.input.RTSPlayerGameInput;
import org.allbinary.game.layer.DemoLockedWithCostLayerInterfaceFactoryInterface;
import org.allbinary.game.layer.GeographicMapCellPositionAreaBase;
import org.allbinary.game.layer.RTSGameStrings;
import org.allbinary.game.layer.RTSLayer;
import org.allbinary.game.layer.RTSPlayerLayerInterface;
import org.allbinary.game.layer.capital.Capital;
import org.allbinary.game.layer.item.LayerInterfaceFactoryImageItem;
import org.allbinary.graphics.form.item.ABCustomItem;
import org.allbinary.media.audio.BuildingSound;
import org.allbinary.util.BasicArrayList;
import org.allbinary.string.CommonStrings;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.java.bool.BooleanFactory;
import org.allbinary.logic.system.security.licensing.LockedFeatureNotificationUtil;
import org.allbinary.logic.system.security.licensing.LockedUtil;
import org.allbinary.game.identification.Group;
import org.allbinary.game.layer.AllBinaryGameLayerManager;
import org.allbinary.game.layer.hud.event.GameNotificationEvent;
import org.allbinary.game.layer.hud.event.GameNotificationEventHandler;
import org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer;
import org.allbinary.graphics.GPoint;
import org.allbinary.graphics.color.BasicColorFactory;
import org.allbinary.layer.AllBinaryLayerManager;
import org.allbinary.logic.math.SmallIntegerSingletonFactory;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.media.audio.ErrorSound;
import org.allbinary.media.graphics.geography.map.BasicGeographicMap;
import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition;
import org.allbinary.media.graphics.geography.map.GeographicMapCellType;
import org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface;
import org.allbinary.media.graphics.geography.map.SimpleGeographicMapCellPositionFactory;
import org.allbinary.media.graphics.geography.map.drop.DropCellPositionHistory;
import org.allbinary.media.graphics.geography.map.racetrack.RaceTrackGeographicMapCellTypeFactory;

class BuildingRTSFormInput extends RTSFormInput {
    private var isUnitProducer : Bool;
    private final buildOnPathGameNotificationEvent : GameNotificationEvent;
    private final spotTakenGameNotificationEvent : GameNotificationEvent;
    private final selectBuildSpotGameNotificationEvent : GameNotificationEvent;
    private final roadCollisionGameNotificationEvent : GameNotificationEvent;
    private final noMoneyGameNotificationEvent : GameNotificationEvent;
    private final buildingCollisionGameNotificationEvent : GameNotificationEvent;
    private final structureToCloseCollisionGameNotificationEvent : GameNotificationEvent;
    private final buildingGameNotificationEvent : GameNotificationEvent;
    private final mapEdgeGameNotificationEvent : GameNotificationEvent;
    private final dropCellPositionHistory : DropCellPositionHistory = DropCellPositionHistory.getInstance();
    public function new(groupInterface : haxe.ds.Vector<Group>, isUnitProducer : Bool) {
        super(groupInterface);
        this.isUnitProducer = isUnitProducer;
        final smallIntegerSingletonFactory : SmallIntegerSingletonFactory = SmallIntegerSingletonFactory.getInstance();
        final basicColorFactory : BasicColorFactory = BasicColorFactory.getInstance();
        this.buildOnPathGameNotificationEvent = new GameNotificationEvent(this, RTSGameStrings.getInstance().BUILD_ON_PATH, smallIntegerSingletonFactory.getAt(2), basicColorFactory.PINK, BooleanFactory.getInstance().FALSE);
        this.spotTakenGameNotificationEvent = new GameNotificationEvent(this, RTSGameStrings.getInstance().SPOT_TAKEN, smallIntegerSingletonFactory.getAt(2), basicColorFactory.PINK, BooleanFactory.getInstance().FALSE);
        this.selectBuildSpotGameNotificationEvent = new GameNotificationEvent(this, RTSGameStrings.getInstance().SELECT_BUILD_SPOT, smallIntegerSingletonFactory.getAt(2), basicColorFactory.PINK, BooleanFactory.getInstance().FALSE);
        this.roadCollisionGameNotificationEvent = new GameNotificationEvent(this, RTSGameStrings.getInstance().ROAD_COLLISION, smallIntegerSingletonFactory.getAt(2), basicColorFactory.PINK, BooleanFactory.getInstance().FALSE);
        this.noMoneyGameNotificationEvent = new GameNotificationEvent(this, RTSGameStrings.getInstance().NO_MONEY, smallIntegerSingletonFactory.getAt(2), basicColorFactory.PINK, BooleanFactory.getInstance().FALSE);
        this.buildingCollisionGameNotificationEvent = new GameNotificationEvent(this, RTSGameStrings.getInstance().BUILDING_COLLISION, smallIntegerSingletonFactory.getAt(2), basicColorFactory.PINK, BooleanFactory.getInstance().FALSE);
        this.structureToCloseCollisionGameNotificationEvent = new GameNotificationEvent(this, RTSGameStrings.getInstance().STRUCTURE_TO_CLOSE, smallIntegerSingletonFactory.getAt(2), basicColorFactory.PINK, BooleanFactory.getInstance().FALSE);
        this.buildingGameNotificationEvent = new GameNotificationEvent(this, RTSGameStrings.getInstance().BUILDING, smallIntegerSingletonFactory.getAt(2), basicColorFactory.PINK, BooleanFactory.getInstance().FALSE);
        this.mapEdgeGameNotificationEvent = new GameNotificationEvent(this, RTSGameStrings.getInstance().MAP_EDGE, smallIntegerSingletonFactory.getAt(2), basicColorFactory.PINK, BooleanFactory.getInstance().FALSE);
    }

    // throws Exception
    public override function setAllBinaryGameLayerManager(allBinaryGameLayerManager : AllBinaryGameLayerManager) : Void {
        super.setAllBinaryGameLayerManager(allBinaryGameLayerManager);
        final geographicMapCompositeInterface : GeographicMapCompositeInterface = (cast allBinaryGameLayerManager : GeographicMapCompositeInterface);
        final geographicMapInterface : BasicGeographicMap = geographicMapCompositeInterface.getGeographicMapInterface()[0];
        this.buildOnPathGameNotificationEvent.setBasicColorP(geographicMapInterface.getForegroundBasicColor());
        this.spotTakenGameNotificationEvent.setBasicColorP(geographicMapInterface.getForegroundBasicColor());
        this.selectBuildSpotGameNotificationEvent.setBasicColorP(geographicMapInterface.getForegroundBasicColor());
        this.roadCollisionGameNotificationEvent.setBasicColorP(geographicMapInterface.getForegroundBasicColor());
        this.noMoneyGameNotificationEvent.setBasicColorP(geographicMapInterface.getForegroundBasicColor());
        this.buildingCollisionGameNotificationEvent.setBasicColorP(geographicMapInterface.getForegroundBasicColor());
        this.structureToCloseCollisionGameNotificationEvent.setBasicColorP(geographicMapInterface.getForegroundBasicColor());
        this.buildingGameNotificationEvent.setBasicColorP(geographicMapInterface.getForegroundBasicColor());
        this.mapEdgeGameNotificationEvent.setBasicColorP(geographicMapInterface.getForegroundBasicColor());
    }

    // throws Exception
    public override function processGameSpecific(associatedRtsLayer : CollidableDestroyableDamageableLayer, rtsPlayerLayerInterface : RTSPlayerLayerInterface, layerManager : AllBinaryLayerManager, item : ABCustomItem, itemIndex : Int) : Void {
        super.process(layerManager);
        this.buildFromMotionInput(rtsPlayerLayerInterface, layerManager, item, itemIndex);
    }

    public function isPositionBlocked() : Bool {
        return this.dropCellPositionHistory.isCellPositionWithDrop(this.getSelectedGeographicCellPosition());
    }

    private function isDemoLocked(item : ABCustomItem) : Bool {
        final factoryItem : LayerInterfaceFactoryImageItem = (cast item : LayerInterfaceFactoryImageItem);
        final layerInterfaceFactoryInterface : DemoLockedWithCostLayerInterfaceFactoryInterface = (cast factoryItem.getLayerInterfaceFactoryInterface() : DemoLockedWithCostLayerInterfaceFactoryInterface);
        if (LockedUtil.getInstance().isLocked() && layerInterfaceFactoryInterface.isDemoLocked()) {
            return true;
        } else {
            return false;
        }
    }

    // throws Exception
    public function buildFromMotionInput(rtsPlayerLayerInterface : RTSPlayerLayerInterface, layerManager : AllBinaryLayerManager, item : ABCustomItem, itemIndex : Int) : Void {
        final commonStrings : CommonStrings = CommonStrings.getInstance();
        this.logUtil.putF(commonStrings.START, this, "buildFromMotionInput");
        if (layerManager == null) {
            throw new haxe.Exception();
        }
        final geographicMapCompositeInterface : GeographicMapCompositeInterface = (cast layerManager : GeographicMapCompositeInterface);
        final geographicMapInterface : BasicGeographicMap = geographicMapCompositeInterface.getGeographicMapInterface()[0];
        if (this.isDemoLocked(item)) {
            rtsPlayerLayerInterface.add(ErrorSound.getInstance());
            LockedFeatureNotificationUtil.getInstance().fireWithColor(geographicMapInterface.getForegroundBasicColor());
            return;
        }
        final geographicMapCellPosition : GeographicMapCellPosition = this.getSelectedGeographicCellPosition();
        if (geographicMapCellPosition != SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION) {
            if (!this.isPositionBlocked()) {
                final geographicMapCellType : GeographicMapCellType = geographicMapInterface.getCellTypeAt(geographicMapCellPosition);
                final raceTrackGeographicMapCellTypeFactory : RaceTrackGeographicMapCellTypeFactory = (cast geographicMapInterface.getGeographicMapCellTypeFactory() : RaceTrackGeographicMapCellTypeFactory);
                if (!raceTrackGeographicMapCellTypeFactory.isPath(geographicMapCellType)) {
                    if (this.newUnconstructedRTSLayerInterfaceArray[itemIndex] == CollidableDestroyableDamageableLayer.getNullInstance()) {
                        this.newUnconstructedRTSLayerInterfaceArray[itemIndex] = this.getInstance(layerManager, item, geographicMapCellPosition);
                    } else {
                        final rtsLayer : RTSLayer = (cast this.newUnconstructedRTSLayerInterfaceArray[itemIndex] : RTSLayer);
                        final cellPoint : GPoint = geographicMapCellPosition.getPoint();
                        rtsLayer.setPosition(cellPoint.getX(), cellPoint.getY(), cellPoint.getZ());
                        rtsLayer.geographicMapCellPositionAreaBase.update(geographicMapInterface);
                    }
                    final rtsLayer : RTSLayer = (cast this.newUnconstructedRTSLayerInterfaceArray[itemIndex] : RTSLayer);
                    this.attemptBuild(rtsPlayerLayerInterface, layerManager, rtsLayer, itemIndex);
                } else {
                    rtsPlayerLayerInterface.add(ErrorSound.getInstance());
                    if (!rtsPlayerLayerInterface.implmentsArtificialIntelligenceCompositeInterface()) {
                        GameNotificationEventHandler.getInstance().fireEvent(this.buildOnPathGameNotificationEvent);
                    }
                }
            } else {
                rtsPlayerLayerInterface.add(ErrorSound.getInstance());
                if (!rtsPlayerLayerInterface.implmentsArtificialIntelligenceCompositeInterface()) {
                    GameNotificationEventHandler.getInstance().fireEvent(this.spotTakenGameNotificationEvent);
                }
            }
        } else {
            rtsPlayerLayerInterface.add(ErrorSound.getInstance());
            if (!rtsPlayerLayerInterface.implmentsArtificialIntelligenceCompositeInterface()) {
                GameNotificationEventHandler.getInstance().fireEvent(this.selectBuildSpotGameNotificationEvent);
            }
        }
    }

    // throws Exception
    public function attemptBuild(rtsPlayerLayerInterface : RTSPlayerLayerInterface, layerManager : AllBinaryLayerManager, layerInterface : RTSLayer, itemIndex : Int) : Bool {
        this.logUtil.putF(new StringMaker().append("Layer: ").append(StringUtil.getInstance().toString(layerInterface)).toString(), this, "attemptBuild");
        final geographicMapCellPositionArea : GeographicMapCellPositionAreaBase = layerInterface.geographicMapCellPositionAreaBase;
        final occupyList : BasicArrayList = geographicMapCellPositionArea.getOccupyingGeographicMapCellPositionList();
        if (!this.isBuildAttemptValid(rtsPlayerLayerInterface, layerInterface)) {
            return false;
        }
        var geographicMapCellType : GeographicMapCellType = null;
        {
            var index : Int = occupyList.size() - 1;
            while (index >= 0) {
            final geographicMapCompositeInterface : GeographicMapCompositeInterface = (cast layerManager : GeographicMapCompositeInterface);
            final geographicMapInterface : BasicGeographicMap = geographicMapCompositeInterface.getGeographicMapInterface()[0];
            geographicMapCellType = geographicMapInterface.getCellTypeAt((cast occupyList.get(index) : GeographicMapCellPosition));
            final raceTrackGeographicMapCellTypeFactory : RaceTrackGeographicMapCellTypeFactory = (cast geographicMapInterface.getGeographicMapCellTypeFactory() : RaceTrackGeographicMapCellTypeFactory);
            if (raceTrackGeographicMapCellTypeFactory.isPath(geographicMapCellType)) {
                rtsPlayerLayerInterface.add(ErrorSound.getInstance());
                if (!rtsPlayerLayerInterface.implmentsArtificialIntelligenceCompositeInterface()) {
                    GameNotificationEventHandler.getInstance().fireEvent(this.roadCollisionGameNotificationEvent);
                }
                return false;
            }
                index--;
            }
        }
        final cost : Int = layerInterface.getCost();
        final capital : Capital = rtsPlayerLayerInterface.getCapital();
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
            this.add(rtsPlayerLayerInterface, layerManager, layerInterface);
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
    public function isBuildAttemptValid(rtsPlayerLayerInterface : RTSPlayerLayerInterface, layerInterface : RTSLayer) : Bool {
        final geographicMapCellPositionArea : GeographicMapCellPositionAreaBase = layerInterface.geographicMapCellPositionAreaBase;
        final occupyList : BasicArrayList = geographicMapCellPositionArea.getOccupyingGeographicMapCellPositionList();
        if (this.dropCellPositionHistory.anyCellPositionWithDrop(occupyList)) {
            rtsPlayerLayerInterface.add(ErrorSound.getInstance());
            if (!rtsPlayerLayerInterface.implmentsArtificialIntelligenceCompositeInterface()) {
                GameNotificationEventHandler.getInstance().fireEvent(this.buildingCollisionGameNotificationEvent);
            }
            return false;
        }
        if (this.isUnitProducer && this.dropCellPositionHistory.anyCellPositionWithDrop(geographicMapCellPositionArea.getSurroundingGeographicMapCellPositionList())) {
            rtsPlayerLayerInterface.add(ErrorSound.getInstance());
            if (!rtsPlayerLayerInterface.implmentsArtificialIntelligenceCompositeInterface()) {
                GameNotificationEventHandler.getInstance().fireEvent(this.structureToCloseCollisionGameNotificationEvent);
            }
            return false;
        } else {
            if (this.isSurroundingCellsOffMap(layerInterface)) {
                rtsPlayerLayerInterface.add(ErrorSound.getInstance());
                if (!rtsPlayerLayerInterface.implmentsArtificialIntelligenceCompositeInterface()) {
                    GameNotificationEventHandler.getInstance().fireEvent(this.mapEdgeGameNotificationEvent);
                }
                return false;
            }
        }
        return true;
    }

    // throws Exception
    public function add(rtsPlayerLayerInterface : RTSPlayerLayerInterface, layerManager : AllBinaryLayerManager, layerInterface : RTSLayer) : Void {
        final geographicMapCellPositionArea : GeographicMapCellPositionAreaBase = layerInterface.geographicMapCellPositionAreaBase;
        final occupyList : BasicArrayList = geographicMapCellPositionArea.getOccupyingGeographicMapCellPositionList();
        this.dropCellPositionHistory.addAll(occupyList, layerInterface);
        final rtsPlayerGameInput : RTSPlayerGameInput = (cast rtsPlayerLayerInterface.getPlayerGameInput() : RTSPlayerGameInput);
        rtsPlayerGameInput.setSelectedRTSLayer(layerInterface, this.getSelectedGeographicCellPosition());
        layerManager.append(layerInterface);
        rtsPlayerLayerInterface.add(BuildingSound.getInstance());
        if (!rtsPlayerLayerInterface.implmentsArtificialIntelligenceCompositeInterface()) {
            GameNotificationEventHandler.getInstance().fireEvent(this.buildingGameNotificationEvent);
        }
    }

    private function isSurroundingCellsOffMap(layerInterface : RTSLayer) : Bool {
        var geographicMapCellPositionArea : GeographicMapCellPositionAreaBase = layerInterface.geographicMapCellPositionAreaBase;
        var occupyList : BasicArrayList = geographicMapCellPositionArea.getOccupyingGeographicMapCellPositionList();
        var surroundList : BasicArrayList = geographicMapCellPositionArea.getSurroundingGeographicMapCellPositionList();
        var occupySize : Int = occupyList.size();
        var surroundSize : Int = surroundList.size();
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append("occupySize: ");
        stringBuffer.appendint(occupySize);
        stringBuffer.append(" surroundSize: ");
        stringBuffer.appendint(surroundSize);
        stringBuffer.append(" surroundList: ");
        stringBuffer.append(StringUtil.getInstance().toString(surroundList));
        this.logUtil.putF(stringBuffer.toString(), this, "isSurroundingCellsOffMap");
        var isSurroundOffMap : Bool = false;
        if (occupySize == 1 && surroundSize != 8) {
            isSurroundOffMap = true;
        } else if (occupySize == 4 && surroundSize != 12) {
            isSurroundOffMap = true;
        }
        if (occupySize == 0 || isSurroundOffMap) {
            return true;
        } else {
            return false;
        }
    }

}

