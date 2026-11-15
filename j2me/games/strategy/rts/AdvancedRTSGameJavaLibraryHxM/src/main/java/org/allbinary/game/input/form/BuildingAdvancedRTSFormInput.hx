/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2002 AllBinary 
 *  
 * By agreeing to this license you and any business entity you represent are 
 * legally bound to the AllBinary Open License Version 1 legal agreement. 
 *  
 * You may obtain the AllBinary Open License Version 1 legal agreement from 
 * AllBinary or the root directory of AllBinary's AllBinary Platform repository. 
 *  
 * Created By: Travis Berthelot  
 */
// Generated Code Do Not Modify
package org.allbinary.game.input.form;

import org.allbinary.game.layer.AdvancedPlayerOwnedRTSLayers;
import org.allbinary.game.layer.AdvancedRTSPlayerLayerInterface;
import org.allbinary.game.layer.RTSLayer;
import org.allbinary.game.layer.RTSLayerEvent;
import org.allbinary.game.layer.RTSPlayerLayerInterface;
import org.allbinary.game.layer.building.event.BuildingEventHandler;
import org.allbinary.game.layer.building.event.LocalPlayerBuildingEventHandler;
import org.allbinary.game.layer.waypoint.WaypointCellPositionHistory;
import org.allbinary.logic.java.bool.BooleanFactory;
import org.allbinary.game.identification.Group;
import org.allbinary.game.layer.AllBinaryGameLayerManager;
import org.allbinary.game.layer.NullPathFindingLayer;
import org.allbinary.game.layer.hud.event.GameNotificationEvent;
import org.allbinary.game.layer.hud.event.GameNotificationEventHandler;
import org.allbinary.graphics.color.BasicColorFactory;
import org.allbinary.layer.AllBinaryLayerManager;
import org.allbinary.logic.math.SmallIntegerSingletonFactory;
import org.allbinary.media.audio.ErrorSound;
import org.allbinary.media.graphics.geography.map.BasicGeographicMap;
import org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface;
import org.allbinary.media.graphics.geography.map.drop.DropCellPositionHistory;

class BuildingAdvancedRTSFormInput extends BuildingRTSFormInput {
    public final atLeastOneHouseGameNotificationEvent : GameNotificationEvent;
    public function new(groupInterface : haxe.ds.Vector<Group>, isUnitProducer : Bool) {
        super(groupInterface, isUnitProducer);
        final basicColorFactory : BasicColorFactory = BasicColorFactory.getInstance();
        this.atLeastOneHouseGameNotificationEvent = new GameNotificationEvent(this, "Build At Least One House First", SmallIntegerSingletonFactory.getInstance().getAt(2), basicColorFactory.WHITE, BooleanFactory.getInstance().FALSE);
    }

    // throws Exception
    public override function setAllBinaryGameLayerManager(allBinaryGameLayerManager : AllBinaryGameLayerManager) : Void {
        super.setAllBinaryGameLayerManager(allBinaryGameLayerManager);
        final geographicMapCompositeInterface : GeographicMapCompositeInterface = (cast allBinaryGameLayerManager : GeographicMapCompositeInterface);
        final geographicMapInterface : BasicGeographicMap = geographicMapCompositeInterface.getGeographicMapInterface()[0];
        this.atLeastOneHouseGameNotificationEvent.setBasicColorP(geographicMapInterface.getForegroundBasicColor());
    }

    public override function isPositionBlocked() : Bool {
        if (DropCellPositionHistory.getInstance().isCellPositionWithDrop(this.getSelectedGeographicCellPosition()) || WaypointCellPositionHistory.getInstance().isCellPositionWithDrop(this.getSelectedGeographicCellPosition())) {
            return true;
        } else {
            return false;
        }
    }

    // throws Exception
    public override function isBuildAttemptValid(rtsPlayerLayerInterface : RTSPlayerLayerInterface, layerInterface : RTSLayer) : Bool {
        var advancedRTSPlayerLayerInterface : AdvancedRTSPlayerLayerInterface = (cast rtsPlayerLayerInterface : AdvancedRTSPlayerLayerInterface);
        var advancedPlayerOwnedRTSLayers : AdvancedPlayerOwnedRTSLayers = advancedRTSPlayerLayerInterface.getAdvancedPlayerOwnedRTSLayers();
        var totalHouses : Int = advancedPlayerOwnedRTSLayers.getHouseList().size();
        if (totalHouses < 1 && layerInterface.getName().indexOf(" House") < 0) {
            rtsPlayerLayerInterface.add(ErrorSound.getInstance());
            if (!rtsPlayerLayerInterface.implmentsArtificialIntelligenceCompositeInterface()) {
                GameNotificationEventHandler.getInstance().fireEvent(this.atLeastOneHouseGameNotificationEvent);
            }
            return false;
        }
        return super.isBuildAttemptValid(rtsPlayerLayerInterface, layerInterface);
    }

    private final BUILD_BUILDING_RTS_LAYER_EVENT : RTSLayerEvent = new RTSLayerEvent(NullPathFindingLayer.NULL_PATH_FINDING_LAYER);
    // throws Exception
    public override function add(rtsPlayerLayerInterface : RTSPlayerLayerInterface, layerManager : AllBinaryLayerManager, layerInterface : RTSLayer) : Void {
        this.BUILD_BUILDING_RTS_LAYER_EVENT.setRtsLayer(layerInterface);
        BuildingEventHandler.getInstance().fireEvent(this.BUILD_BUILDING_RTS_LAYER_EVENT);
        if (((cast rtsPlayerLayerInterface : AdvancedRTSPlayerLayerInterface)).isLocalPlayer()) {
            LocalPlayerBuildingEventHandler.getInstance().fireEvent(this.BUILD_BUILDING_RTS_LAYER_EVENT);
        }
        super.add(rtsPlayerLayerInterface, layerManager, layerInterface);
    }

}

