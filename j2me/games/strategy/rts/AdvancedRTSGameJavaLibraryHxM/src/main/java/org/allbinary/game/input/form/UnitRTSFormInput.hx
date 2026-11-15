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

import org.allbinary.graphics.form.item.ABCustomItem;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.game.layer.AdvancedPlayerOwnedRTSLayers;
import org.allbinary.game.layer.AdvancedRTSGameLayer;
import org.allbinary.game.layer.AdvancedRTSPlayerLayerInterface;
import org.allbinary.game.layer.RTSGameStrings;
import org.allbinary.game.layer.RTSLayer;
import org.allbinary.game.layer.RTSPlayerLayerInterface;
import org.allbinary.game.layer.capital.Capital;
import org.allbinary.game.layer.unit.UnitLayer;
import org.allbinary.game.layer.waypoint.WorkWaypoint;
import org.allbinary.media.audio.BuildingSound;
import org.allbinary.logic.java.bool.BooleanFactory;
import org.allbinary.game.identification.Group;
import org.allbinary.game.layer.AllBinaryGameLayerManager;
import org.allbinary.game.layer.GeographicMapCellPositionAreaBase;
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
import org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface;

class UnitRTSFormInput extends RTSFormInput {
    public static final DECAL_ID : Null<Int> = SmallIntegerSingletonFactory.getInstance().getAt(23);
    public final noMoneyGameNotificationEvent : GameNotificationEvent;
    public final newUnitGameNotificationEvent : GameNotificationEvent;
    public function new(groupInterface : haxe.ds.Vector<Group>) {
        super(groupInterface);
        final smallIntegerSingletonFactory : SmallIntegerSingletonFactory = SmallIntegerSingletonFactory.getInstance();
        final basicColorFactory : BasicColorFactory = BasicColorFactory.getInstance();
        this.noMoneyGameNotificationEvent = new GameNotificationEvent(this, RTSGameStrings.getInstance().NO_MONEY, smallIntegerSingletonFactory.getAt(2), basicColorFactory.WHITE, BooleanFactory.getInstance().FALSE);
        this.newUnitGameNotificationEvent = new GameNotificationEvent(this, RTSGameStrings.getInstance().NEW_UNIT, smallIntegerSingletonFactory.getAt(2), basicColorFactory.WHITE, BooleanFactory.getInstance().FALSE);
        this.getHashtable().put(WorkWaypoint.ID, smallIntegerSingletonFactory.getAt(50));
    }

    // throws Exception
    public override function setAllBinaryGameLayerManager(allBinaryGameLayerManager : AllBinaryGameLayerManager) : Void {
        super.setAllBinaryGameLayerManager(allBinaryGameLayerManager);
        final geographicMapCompositeInterface : GeographicMapCompositeInterface = (cast allBinaryGameLayerManager : GeographicMapCompositeInterface);
        final geographicMapInterface : BasicGeographicMap = geographicMapCompositeInterface.getGeographicMapInterface()[0];
        this.noMoneyGameNotificationEvent.setBasicColorP(geographicMapInterface.getForegroundBasicColor());
        this.newUnitGameNotificationEvent.setBasicColorP(geographicMapInterface.getForegroundBasicColor());
    }

    // throws Exception
    public override function processGameSpecific(associatedRtsLayer : CollidableDestroyableDamageableLayer, rtsPlayerLayerInterface : RTSPlayerLayerInterface, layerManager : AllBinaryLayerManager, item : ABCustomItem, itemIndex : Int) : Void {
        super.process(layerManager);
        final associatedRtsLayer2 : RTSLayer = (cast associatedRtsLayer : RTSLayer);
        final geographicMapCellPositionArea : GeographicMapCellPositionAreaBase = associatedRtsLayer2.geographicMapCellPositionAreaBase;
        final geographicMapCellPosition : GeographicMapCellPosition = geographicMapCellPositionArea.getNextSurroundingGeographicMapCellPosition();
        this.getHashtable().put(Layer.ID, associatedRtsLayer);
        this.getHashtable().put(UnitRTSFormInput.DECAL_ID, ((cast rtsPlayerLayerInterface : AdvancedRTSPlayerLayerInterface)).getDecalBasicColor());
        if (this.newUnconstructedRTSLayerInterfaceArray[itemIndex] == CollidableDestroyableDamageableLayer.getNullInstance()) {
            this.newUnconstructedRTSLayerInterfaceArray[itemIndex] = this.getInstance(layerManager, item, geographicMapCellPosition);
        } else {
            var cellPoint : GPoint = geographicMapCellPosition.getPoint();
            final rtsLayer : RTSLayer = (cast this.newUnconstructedRTSLayerInterfaceArray[itemIndex] : RTSLayer);
            rtsLayer.setPosition(cellPoint.getX(), cellPoint.getY(), rtsLayer.getZP());
            final geographicMapCompositeInterface : GeographicMapCompositeInterface = (cast rtsLayer.allBinaryGameLayerManagerP : GeographicMapCompositeInterface);
            final geographicMapInterface : BasicGeographicMap = geographicMapCompositeInterface.getGeographicMapInterface()[0];
            rtsLayer.geographicMapCellPositionAreaBase.update(geographicMapInterface);
        }
        final cellPoint : GPoint = geographicMapCellPosition.getMidPoint();
        final rtsLayer : RTSLayer = (cast this.newUnconstructedRTSLayerInterfaceArray[itemIndex] : RTSLayer);
        rtsLayer.setPosition(cellPoint.getX() - rtsLayer.getHalfWidth(), cellPoint.getY() - rtsLayer.getHalfHeight(), rtsLayer.getZP());
        this.attemptBuild(associatedRtsLayer2, rtsPlayerLayerInterface, layerManager, (cast rtsLayer : RTSLayer), itemIndex);
    }

    // throws Exception
    private function attemptBuild(associatedRtsLayer : RTSLayer, rtsPlayerLayerInterface : RTSPlayerLayerInterface, layerManager : AllBinaryLayerManager, layerInterface : RTSLayer, itemIndex : Int) : Void {
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
            rtsPlayerLayerInterface.add(BuildingSound.getInstance());
            capital.removeMoney(cost);
            AssignWaypointsUtil.getInstance().set((cast layerInterface : UnitLayer), (cast associatedRtsLayer : AdvancedRTSGameLayer));
            layerManager.appendAt(layerInterface, PlayersSingletonFactory.total);
            final advancedRTSPlayerLayerInterface : AdvancedRTSPlayerLayerInterface = (cast rtsPlayerLayerInterface : AdvancedRTSPlayerLayerInterface);
            final advancedPlayerOwnedRTSLayers : AdvancedPlayerOwnedRTSLayers = advancedRTSPlayerLayerInterface.getAdvancedPlayerOwnedRTSLayers();
            advancedPlayerOwnedRTSLayers.addUnit(layerInterface);
            if (!rtsPlayerLayerInterface.implmentsArtificialIntelligenceCompositeInterface()) {
                GameNotificationEventHandler.getInstance().fireEvent(this.newUnitGameNotificationEvent);
            }
        } else {
            rtsPlayerLayerInterface.add(ErrorSound.getInstance());
            if (!rtsPlayerLayerInterface.implmentsArtificialIntelligenceCompositeInterface()) {
                GameNotificationEventHandler.getInstance().fireEvent(this.noMoneyGameNotificationEvent);
            }
        }
    }

}

