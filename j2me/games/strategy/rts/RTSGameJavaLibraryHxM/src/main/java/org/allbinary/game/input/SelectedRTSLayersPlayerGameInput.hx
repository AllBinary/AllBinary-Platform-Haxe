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
package org.allbinary.game.input;

//import javax.microedition.lcdui.Canvas;
import org.allbinary.game.layer.RTSGameStrings;
import org.allbinary.game.layer.RTSLayer;
import org.allbinary.game.layer.RTSLayerInfoPaintable;
import org.allbinary.game.layer.RTSPlayerLayerInterface;
import org.allbinary.game.layer.capital.Capital;
import org.allbinary.media.audio.DowngradeSound;
import org.allbinary.media.audio.UpgradeSound;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.util.BasicArrayListUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.java.bool.BooleanFactory;
import org.allbinary.game.configuration.feature.Features;
import org.allbinary.game.configuration.feature.InputFeatureFactory;
import org.allbinary.game.input.event.GameKeyEvent;
import org.allbinary.game.layer.AllBinaryGameLayerManager;
import org.allbinary.game.layer.hud.event.GameNotificationEvent;
import org.allbinary.game.layer.hud.event.GameNotificationEventHandler;
import org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer;
import org.allbinary.graphics.color.BasicColorFactory;
import org.allbinary.layer.AllBinaryLayerManager;
import org.allbinary.logic.util.visitor.Visitor;
import org.allbinary.logic.math.SmallIntegerSingletonFactory;
import org.allbinary.media.audio.ErrorSound;
import org.allbinary.media.graphics.geography.map.BasicGeographicMap;
import org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface;

class SelectedRTSLayersPlayerGameInput extends PlayerGameInput {
    public final inputProcessorArray : haxe.ds.Vector<GameInputProcessor> = haxe.ds.Vector.fromArrayCopy([for (index in 0...InputFactory.getInstance().MAX) null]);
    private final list : BasicArrayList;
    public final isSingleKeyProcessing : Bool = Features.getInstance().isFeature(InputFeatureFactory.getInstance().SINGLE_KEY_REPEAT_PRESS) || Features.getInstance().isFeature(InputFeatureFactory.getInstance().SINGLE_KEY_PRESS);
    private var selectedRTSLayersList : BasicArrayList = new BasicArrayListD();
    private var preSelectedRTSLayersList : BasicArrayList = new BasicArrayListD();
    private var paintSelectedRTSLayersList : BasicArrayList = BasicArrayListUtil.getInstance().getImmutableInstance();
    private var rtsPlayerLayerInterface : RTSPlayerLayerInterface;
    private final selectRTSLayerVisitorInterface : Visitor;
    private final upgradeGameNotificationEvent : GameNotificationEvent;
    private final noMoneyGameNotificationEvent : GameNotificationEvent;
    private final downgradeGameNotificationEvent : GameNotificationEvent;
    public function new(towerInfoPaintable : RTSLayerInfoPaintable, rtsPlayerLayerInterface : RTSPlayerLayerInterface, list : BasicArrayList, playerInputId : Int, selectRTSLayerVisitorFactoryInterface : SelectRTSLayerVisitorFactoryInterface) {
        super(list, new BasicArrayListD(), playerInputId);
        this.initInputProcessors();
        this.rtsPlayerLayerInterface = rtsPlayerLayerInterface;
        this.list = list;
        this.selectRTSLayerVisitorInterface = selectRTSLayerVisitorFactoryInterface.create(this);
        final smallIntegerSingletonFactory : SmallIntegerSingletonFactory = SmallIntegerSingletonFactory.getInstance();
        final basicColorFactory : BasicColorFactory = BasicColorFactory.getInstance();
        this.upgradeGameNotificationEvent = new GameNotificationEvent(this, RTSGameStrings.getInstance().UPGRADE, smallIntegerSingletonFactory.getAt(2), basicColorFactory.PINK, BooleanFactory.getInstance().FALSE);
        this.noMoneyGameNotificationEvent = new GameNotificationEvent(this, RTSGameStrings.getInstance().NO_MONEY, smallIntegerSingletonFactory.getAt(2), basicColorFactory.PINK, BooleanFactory.getInstance().FALSE);
        this.downgradeGameNotificationEvent = new GameNotificationEvent(this, RTSGameStrings.getInstance().DOWNGRADE, smallIntegerSingletonFactory.getAt(2), basicColorFactory.PINK, BooleanFactory.getInstance().FALSE);
    }

    // throws Exception
    public function setAllBinaryGameLayerManager(allBinaryGameLayerManager : AllBinaryGameLayerManager) : Void {
        final geographicMapCompositeInterface : GeographicMapCompositeInterface = (cast allBinaryGameLayerManager : GeographicMapCompositeInterface);
        final geographicMapInterface : BasicGeographicMap = geographicMapCompositeInterface.getGeographicMapInterface()[0];
        this.upgradeGameNotificationEvent.setBasicColorP(geographicMapInterface.getForegroundBasicColor());
        this.noMoneyGameNotificationEvent.setBasicColorP(geographicMapInterface.getForegroundBasicColor());
        this.downgradeGameNotificationEvent.setBasicColorP(geographicMapInterface.getForegroundBasicColor());
    }

    public function isSelected(rtsLayer : RTSLayer) : Bool {
        if (this.selectedRTSLayersList.contains(rtsLayer)) {
            return true;
        } else {
            return false;
        }
    }

    // throws Exception
    public function upgrade() : Void {
        var anyChanged : Bool = false;
        {
            var index : Int = this.selectedRTSLayersList.size() - 1;
            while (index >= 0) {
            var rtsLayer : RTSLayer = (cast this.selectedRTSLayersList.get(index) : RTSLayer);
            if (rtsLayer.isUpgradeable()) {
                var capital : Capital = this.rtsPlayerLayerInterface.getCapital();
                var upgradeCost : Int = rtsLayer.getUpgradeCost();
                if (upgradeCost <= capital.getTotalMoney()) {
                    anyChanged = true;
                    this.rtsPlayerLayerInterface.add(UpgradeSound.getInstance());
                    rtsLayer.upgrade();
                    capital.removeMoney(upgradeCost);
                    if (!this.rtsPlayerLayerInterface.implmentsArtificialIntelligenceCompositeInterface()) {
                        GameNotificationEventHandler.getInstance().fireEvent(this.upgradeGameNotificationEvent);
                    }
                } else {
                    this.rtsPlayerLayerInterface.add(ErrorSound.getInstance());
                    if (!this.rtsPlayerLayerInterface.implmentsArtificialIntelligenceCompositeInterface()) {
                        GameNotificationEventHandler.getInstance().fireEvent(this.noMoneyGameNotificationEvent);
                    }
                }
            }
                index--;
            }
        }
        if (anyChanged) {
            final rtsPlayerGameInput : RTSPlayerGameInput = ((cast this.rtsPlayerLayerInterface.getPlayerGameInput() : RTSPlayerGameInput));
            rtsPlayerGameInput.updatePaintable();
        }
    }

    // throws Exception
    public function downgrade() : Void {
        var anyChanged : Bool = false;
        {
            var index : Int = this.selectedRTSLayersList.size();
            while (--index >= 0) {
            var rtsLayer : RTSLayer = (cast this.selectedRTSLayersList.get(index) : RTSLayer);
            if (rtsLayer.isDowngradeable()) {
                anyChanged = true;
                this.rtsPlayerLayerInterface.add(DowngradeSound.getInstance());
                var downgradeCost : Int = rtsLayer.getDowngradeCost();
                rtsLayer.downgrade();
                var capital : Capital = this.rtsPlayerLayerInterface.getCapital();
                capital.addMoney(downgradeCost);
                if (!this.rtsPlayerLayerInterface.implmentsArtificialIntelligenceCompositeInterface()) {
                    GameNotificationEventHandler.getInstance().fireEvent(this.downgradeGameNotificationEvent);
                }
            }
            }
        }
        if (anyChanged) {
            final rtsPlayerGameInput : RTSPlayerGameInput = ((cast this.rtsPlayerLayerInterface.getPlayerGameInput() : RTSPlayerGameInput));
            rtsPlayerGameInput.updatePaintable();
        }
    }

    public function initInputProcessors() : Void {
        this.inputProcessorArray[Canvas.KEY_NUM1] = new SelectedRTSLayersPlayerUpgradeGameInputProcessor(this);
        this.inputProcessorArray[Canvas.KEY_NUM3] = new SelectedRTSLayersPlayerDowngradeGameInputProcessor(this);
        GameInputProcessorUtil.init(this.inputProcessorArray);
    }

    // throws Exception
    public function processInputKey(key : Int) : Void {
        if (this.selectedRTSLayersList != null) {
            this.inputProcessorArray[key].processEvent(AllBinaryGameLayerManager.getNullInstance(), GameKeyEvent.NONE);
        }
    }

    // throws Exception
    public function processInput(layerManager : AllBinaryLayerManager) : Void {
        try {
            var size : Int = this.list.size();
            var key : Int = 0;
            for (index in 0...size) {
                var gameKeyEvent : GameKeyEvent = (cast this.list.get(index) : GameKeyEvent);
                key = gameKeyEvent.getKey();
                this.processInputKey(key);
            }
            if (this.isSingleKeyProcessing) {
                this.clear();
            } else {
                this.update();
            }
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.gameInputStrings.PROCESS_INPUT, e);
        }
    }

    public function getSelectedBasicArrayList() : BasicArrayList {
        return this.selectedRTSLayersList;
    }

    public function addSelectedRTSLayer(selectedLayer : RTSLayer) : Void {
        this.paintSelectedRTSLayersList = BasicArrayListUtil.getInstance().getImmutableInstance();
        if (selectedLayer == CollidableDestroyableDamageableLayer.getNullInstance()) {
            this.deselectAll();
            this.selectedRTSLayersList.clear();
        } else {
            if (!this.selectedRTSLayersList.contains(selectedLayer)) {
                this.selectedRTSLayersList.add(selectedLayer);
            }
        }
        this.paintSelectedRTSLayersList = this.selectedRTSLayersList;
    }

    public function setSelectedRTSLayer(selectedLayer : CollidableDestroyableDamageableLayer) : Void {
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append("Selected Layer: ");
        if (selectedLayer != null) {
            stringBuffer.append(selectedLayer.getName());
        }
        this.logUtil.putF(stringBuffer.toString(), this, "setSelectedRTSLayer");
        this.paintSelectedRTSLayersList = BasicArrayListUtil.getInstance().getImmutableInstance();
        this.selectRTSLayerVisitorInterface.visit(selectedLayer);
        this.deselectAll();
        if (this.selectedRTSLayersList.size() > 0) {
            this.getPreSelectedRTSLayersList().clear();
            final tempList : BasicArrayList = this.getPreSelectedRTSLayersList();
            this.preSelectedRTSLayersList = this.selectedRTSLayersList;
            this.selectedRTSLayersList = tempList;
            this.logUtil.putF(new StringMaker().append("Preselected: ").append(this.preSelectedRTSLayersList.toString()).toString(), this, "setSelectedRTSLayer");
        }
        if (selectedLayer != CollidableDestroyableDamageableLayer.getNullInstance()) {
            this.selectedRTSLayersList.add(selectedLayer);
        }
        this.paintSelectedRTSLayersList = this.selectedRTSLayersList;
    }

    public function getLastSelectedRtsLayer() : CollidableDestroyableDamageableLayer {
        if (this.isAnyRTSLayerSelected()) {
            return (cast this.selectedRTSLayersList.get(this.selectedRTSLayersList.size() - 1) : CollidableDestroyableDamageableLayer);
        } else {
            return CollidableDestroyableDamageableLayer.getNullInstance();
        }
    }

    public function selectAllPreselected() : Void {
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append("Select all Preselected: ");
        stringBuffer.append(this.preSelectedRTSLayersList.toString());
        this.logUtil.putF(stringBuffer.toString(), this, "selectAllPreselected");
        {
            var index : Int = this.preSelectedRTSLayersList.size() - 1;
            while (index >= 0) {
            var rtsLayer : RTSLayer = (cast this.preSelectedRTSLayersList.get(index) : RTSLayer);
            rtsLayer.select();
                index--;
            }
        }
    }

    public function deselectAllPreselected() : Void {
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append("Deselect all Preselected: ");
        stringBuffer.append(this.preSelectedRTSLayersList.toString());
        this.logUtil.putF(stringBuffer.toString(), this, "deselectAllPreselected");
        {
            var index : Int = this.preSelectedRTSLayersList.size() - 1;
            while (index >= 0) {
            var rtsLayer : RTSLayer = (cast this.preSelectedRTSLayersList.get(index) : RTSLayer);
            rtsLayer.deselect();
                index--;
            }
        }
        this.preSelectedRTSLayersList.clear();
    }

    public function deselectAll() : Void {
        {
            var index : Int = this.selectedRTSLayersList.size() - 1;
            while (index >= 0) {
            var rtsLayer : RTSLayer = (cast this.selectedRTSLayersList.get(index) : RTSLayer);
            rtsLayer.deselect();
                index--;
            }
        }
    }

    public function isAnyRTSLayerSelected() : Bool {
        if (this.selectedRTSLayersList.size() == 0) {
            return false;
        }
        return true;
    }

    public function getPaintSelectedRTSLayersList() : BasicArrayList {
        return this.paintSelectedRTSLayersList;
    }

    public function getPreSelectedRTSLayersList() : BasicArrayList {
        return this.preSelectedRTSLayersList;
    }

}

