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

import org.allbinary.game.layer.RTSGameStrings;
import org.allbinary.game.layer.RTSInterface;
import org.allbinary.game.layer.RTSPlayerLayerInterface;
import org.allbinary.game.layer.TechnologyRTSInterfaceImageItem;
import org.allbinary.game.layer.capital.Capital;
import org.allbinary.game.rts.technology.event.TechEventHandler;
import org.allbinary.graphics.form.item.ABCustomItem;
import org.allbinary.media.audio.BuildingSound;
import org.allbinary.string.CommonStrings;
import org.allbinary.logic.java.bool.BooleanFactory;
import org.allbinary.game.identification.Group;
import org.allbinary.game.layer.AllBinaryGameLayerManager;
import org.allbinary.game.layer.hud.event.GameNotificationEvent;
import org.allbinary.game.layer.hud.event.GameNotificationEventHandler;
import org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer;
import org.allbinary.graphics.color.BasicColorFactory;
import org.allbinary.layer.AllBinaryLayerManager;
import org.allbinary.logic.util.event.AllBinaryEventObject;
import org.allbinary.logic.math.SmallIntegerSingletonFactory;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.media.audio.ErrorSound;
import org.allbinary.media.graphics.geography.map.BasicGeographicMap;
import org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface;

class TechRTSFormInput extends RTSFormInput {
    private final EVENT : AllBinaryEventObject = new AllBinaryEventObject(this);
    public final noMoneyGameNotificationEvent : GameNotificationEvent;
    public function new(groupInterface : haxe.ds.Vector<Group>) {
        super(groupInterface);
        final basicColorFactory : BasicColorFactory = BasicColorFactory.getInstance();
        this.noMoneyGameNotificationEvent = new GameNotificationEvent(this, RTSGameStrings.getInstance().NO_MONEY, SmallIntegerSingletonFactory.getInstance().getAt(2), basicColorFactory.WHITE, BooleanFactory.getInstance().FALSE);
    }

    // throws Exception
    public override function setAllBinaryGameLayerManager(allBinaryGameLayerManager : AllBinaryGameLayerManager) : Void {
        super.setAllBinaryGameLayerManager(allBinaryGameLayerManager);
        final geographicMapCompositeInterface : GeographicMapCompositeInterface = (cast allBinaryGameLayerManager : GeographicMapCompositeInterface);
        final geographicMapInterface : BasicGeographicMap = geographicMapCompositeInterface.getGeographicMapInterface()[0];
        this.noMoneyGameNotificationEvent.setBasicColorP(geographicMapInterface.getForegroundBasicColor());
    }

    // throws Exception
    public override function processGameSpecific(associatedRtsLayer : CollidableDestroyableDamageableLayer, rtsPlayerLayerInterface : RTSPlayerLayerInterface, layerManager : AllBinaryLayerManager, item : ABCustomItem, itemIndex : Int) : Void {
        super.process(layerManager);
        final commonStrings : CommonStrings = CommonStrings.getInstance();
        final stringMaker : StringMaker = new StringMaker();
        final technologyRTSInterfaceImageItem : TechnologyRTSInterfaceImageItem = (cast item : TechnologyRTSInterfaceImageItem);
        final rtsInterface : RTSInterface = technologyRTSInterfaceImageItem.getRtsInterface();
        this.logUtil.putF(stringMaker.append("isUpgradeable: ").appendboolean(rtsInterface.isUpgradeable()).toString(), this, commonStrings.PROCESS);
        if (rtsInterface.isUpgradeable()) {
            final cost : Int = rtsInterface.getUpgradeCost();
            final capital : Capital = rtsPlayerLayerInterface.getCapital();
            stringMaker.delete(0, stringMaker.length());
            this.logUtil.putF(stringMaker.appendint(cost).append("<=").appendint(Std.int(capital.getTotalMoney())).toString(), this, commonStrings.PROCESS);
            if (cost <= capital.getTotalMoney()) {
                rtsPlayerLayerInterface.add(BuildingSound.getInstance());
                capital.removeMoney(cost);
                rtsInterface.upgrade();
                technologyRTSInterfaceImageItem.update();
                TechEventHandler.getInstance().fireEvent(this.EVENT);
            } else {
                rtsPlayerLayerInterface.add(ErrorSound.getInstance());
                if (!rtsPlayerLayerInterface.implmentsArtificialIntelligenceCompositeInterface()) {
                    GameNotificationEventHandler.getInstance().fireEvent(this.noMoneyGameNotificationEvent);
                }
            }
        }
    }

}

