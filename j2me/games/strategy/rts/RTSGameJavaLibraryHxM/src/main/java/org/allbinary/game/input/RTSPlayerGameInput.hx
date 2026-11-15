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
//import javax.microedition.lcdui.Graphics;
import org.allbinary.game.input.form.RTSFormInput;
import org.allbinary.game.layer.RTSLayer;
import org.allbinary.game.layer.RTSLayerInfoPaintable;
import org.allbinary.game.layer.RTSPlayerLayerInterface;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.game.configuration.feature.Features;
import org.allbinary.game.configuration.feature.InputFeatureFactory;
import org.allbinary.game.displayable.canvas.AllBinaryGameCanvas;
import org.allbinary.game.input.event.GameKeyEvent;
import org.allbinary.game.input.form.NullRTSFormInputFactory;
import org.allbinary.game.layer.AllBinaryGameLayerManager;
import org.allbinary.game.layer.AllBinaryTiledLayer;
import org.allbinary.game.layer.NullRTSLayer;
import org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer;
import org.allbinary.graphics.GPoint;
import org.allbinary.graphics.color.BasicColorFactory;
import org.allbinary.graphics.displayable.event.DisplayChangeEvent;
import org.allbinary.input.motion.gesture.observer.MotionGestureEvent;
import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.layer.AllBinaryLayerManager;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.media.audio.SecondaryPlayerQueueFactory;
import org.allbinary.media.audio.SelectSound;
import org.allbinary.media.graphics.geography.map.BasicGeographicMap;
import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition;
import org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface;
import org.allbinary.media.graphics.geography.map.SimpleGeographicMapCellPositionFactory;
import org.allbinary.string.CommonLabels;

class RTSPlayerGameInput extends PlayerGameInput {
    public final inputProcessorArray : haxe.ds.Vector<GameInputProcessor> = haxe.ds.Vector.fromArrayCopy([for (index in 0...InputFactory.getInstance().MAX) null]);
    public final removeInputProcessorArray : haxe.ds.Vector<GameInputProcessor> = haxe.ds.Vector.fromArrayCopy([for (index in 0...InputFactory.getInstance().MAX) null]);
    private final inputList : BasicArrayList;
    private final isSingleKeyProcessing : Bool = Features.getInstance().isFeature(InputFeatureFactory.getInstance().SINGLE_KEY_REPEAT_PRESS) || Features.getInstance().isFeature(InputFeatureFactory.getInstance().SINGLE_KEY_PRESS);
    private final gameCanvas : AllBinaryGameCanvas;
    private final motionGestureInputList : BasicArrayList = new BasicArrayListD();
    private final scrollPlayerGameInput : ScrollMapPlayerGameInput;
    private final selectedRTSLayerPlayerGameInput : SelectedRTSLayersPlayerGameInput;
    private final towerInfoPaintable : RTSLayerInfoPaintable;
    private final rtsPlayerLayerInterface : RTSPlayerLayerInterface;
    private final layerPositionFinderInterface : LayerPositionFinderInterface;
    private var selectedRtsFormInput : RTSFormInput = NullRTSFormInputFactory.getInstance();
    public function new(gameCanvas : AllBinaryGameCanvas, inputList : BasicArrayList, playerInputId : Int, towerInfoPaintable : RTSLayerInfoPaintable, rtsPlayerLayerInterface : RTSPlayerLayerInterface, layerPositionFinderInterface : LayerPositionFinderInterface, selectRTSLayerVisitorFactoryInterface : SelectRTSLayerVisitorFactoryInterface) {
        super(inputList, new BasicArrayListD(), playerInputId);
        this.initInputProcessors();
        this.gameCanvas = gameCanvas;
        this.inputList = inputList;
        this.towerInfoPaintable = towerInfoPaintable;
        this.rtsPlayerLayerInterface = rtsPlayerLayerInterface;
        this.selectedRTSLayerPlayerGameInput = new SelectedRTSLayersPlayerGameInput(this.getRTSLayerInfoPaintable(), this.getRtsPlayerLayerInterface(), this.inputList, playerInputId, selectRTSLayerVisitorFactoryInterface);
        if (this.rtsPlayerLayerInterface != NullRTSLayer.NULL_RTS_LAYER) {
            this.setSelectedRtsFormInput(this.rtsPlayerLayerInterface.getRTSFormInput());
        }
        final geographicMapCompositeInterface : GeographicMapCompositeInterface = (cast this.gameCanvas.getLayerManager() : GeographicMapCompositeInterface);
        final geographicMapInterface : BasicGeographicMap = geographicMapCompositeInterface.getGeographicMapInterface()[0];
        this.scrollPlayerGameInput = new ScrollMapPlayerGameInput(geographicMapInterface, this.inputList, playerInputId);
        this.layerPositionFinderInterface = layerPositionFinderInterface;
    }

    // throws Exception
    public function setAllBinaryGameLayerManager(allBinaryGameLayerManager : AllBinaryGameLayerManager) : Void {
        this.selectedRTSLayerPlayerGameInput.setAllBinaryGameLayerManager(allBinaryGameLayerManager);
        if (this.selectedRtsFormInput != NullRTSFormInputFactory.getInstance()) {
            this.selectedRtsFormInput.setAllBinaryGameLayerManager(allBinaryGameLayerManager);
        }
    }

    public function onDisplayChangeEvent(displayChangeEvent : DisplayChangeEvent) : Void {
        try {
            this.logUtil.putF(this.commonStrings.START, this, "onDisplayChangeEvent");
            this.getRTSLayerInfoPaintable().update();
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "onDisplayChangeEvent", e);
        }
    }

    // throws Exception
    public function left() : Void {
        this.rtsPlayerLayerInterface.getCurrentScrollSelectionForm().processInputKey(Canvas.LEFT);
    }

    // throws Exception
    public function right() : Void {
        this.rtsPlayerLayerInterface.getCurrentScrollSelectionForm().processInputKey(Canvas.RIGHT);
    }

    public function initInputProcessors() : Void {
        this.inputProcessorArray[Canvas.LEFT] = new RTSPlayerLeftGameInputProcessor(this);
        this.inputProcessorArray[Canvas.KEY_NUM0] = this.inputProcessorArray[Canvas.LEFT];
        this.inputProcessorArray[Canvas.RIGHT] = new RTSPlayerRightGameInputProcessor(this);
        this.inputProcessorArray[Canvas.KEY_POUND] = this.inputProcessorArray[Canvas.RIGHT];
        this.removeInputProcessorArray[Canvas.KEY_NUM1] = new RTSPlayerFireGameInputProcessor(this);
        this.removeInputProcessorArray[Canvas.KEY_NUM3] = this.removeInputProcessorArray[Canvas.KEY_NUM1];
        this.removeInputProcessorArray[Canvas.KEY_NUM3] = this.removeInputProcessorArray[Canvas.KEY_NUM1];
        this.removeInputProcessorArray[Canvas.LEFT] = this.removeInputProcessorArray[Canvas.KEY_NUM1];
        this.removeInputProcessorArray[Canvas.RIGHT] = this.removeInputProcessorArray[Canvas.KEY_NUM1];
        this.removeInputProcessorArray[Canvas.KEY_NUM0] = this.removeInputProcessorArray[Canvas.KEY_NUM1];
        this.removeInputProcessorArray[Canvas.KEY_POUND] = this.removeInputProcessorArray[Canvas.KEY_NUM1];
        GameInputProcessorUtil.init(this.inputProcessorArray);
        GameInputProcessorUtil.init(this.removeInputProcessorArray);
    }

    // throws Exception
    public function processInput(layerManager : AllBinaryLayerManager) : Void {
        try {
            this.processMotionInput(layerManager);
            var size : Int = this.inputList.size();
            var key : Int = 0;
            for (index in 0...size) {
                var gameKeyEvent : GameKeyEvent = (cast this.inputList.get(index) : GameKeyEvent);
                key = gameKeyEvent.getKey();
                this.getScrollPlayerGameInput().processInputKey(key);
                this.getSelectedBuildingPlayerGameInput().processInputKey(key);
                this.inputProcessorArray[key].processEvent(layerManager, gameKeyEvent);
                this.removeInputProcessorArray[key].processEvent(layerManager, gameKeyEvent);
            }
            if (this.isIsSingleKeyProcessing()) {
                this.clear();
            } else {
                this.update();
            }
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.gameInputStrings.PROCESS_INPUT, e);
        }
    }

    // throws Exception
    public function processMotionInput(layerManager : AllBinaryLayerManager) : Void {
    }

    // throws Exception
    public function select(motionGestureEvent : MotionGestureEvent) : Void {
        final point : GPoint = motionGestureEvent.getCurrentPoint();
        final geographicMapCompositeInterface : GeographicMapCompositeInterface = (cast this.gameCanvas.getLayerManager() : GeographicMapCompositeInterface);
        final geographicMapInterface : BasicGeographicMap = geographicMapCompositeInterface.getGeographicMapInterface()[0];
        final allBinaryTiledLayer : AllBinaryTiledLayer = geographicMapInterface.getAllBinaryTiledLayer();
        final x : Int = point.getX() + allBinaryTiledLayer.getXP();
        final y : Int = point.getY() + allBinaryTiledLayer.getYP();
        var geographicMapCellPosition : GeographicMapCellPosition = geographicMapInterface.getCellPositionAtXYNoThrow(x, y);
        if (geographicMapCellPosition != SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION) {
            SecondaryPlayerQueueFactory.getInstance().add(SelectSound.getInstance());
            var layer : AllBinaryLayer = this.layerPositionFinderInterface.getLayerInterface(geographicMapCellPosition);
            if (layer == AllBinaryLayer.NULL_ALLBINARY_LAYER) {
                layer = CollidableDestroyableDamageableLayer.getNullInstance();
            } else {
                geographicMapCellPosition = geographicMapInterface.getCellPositionAtXY(layer.getXP(), layer.getYP());
            }
            final foundRTSLayer : CollidableDestroyableDamageableLayer = (cast layer : CollidableDestroyableDamageableLayer);
            this.setSelectedRTSLayer(foundRTSLayer, geographicMapCellPosition);
        } else {
            final commonLabels : CommonLabels = CommonLabels.getInstance();
            this.logUtil.putF(new StringMaker().append("Off Of Map -").append(commonLabels.WIDTH_LABEL).appendint(Std.int(allBinaryTiledLayer.getWidth())).append(commonLabels.HEIGHT_LABEL).appendint(Std.int(allBinaryTiledLayer.getHeight())).toString(), this, "select");
        }
    }

    // throws Exception
    public function setSelectedRTSLayer(rtsLayer : CollidableDestroyableDamageableLayer, geographicMapCellPosition : GeographicMapCellPosition) : Void {
        this.getSelectedBuildingPlayerGameInput().setSelectedRTSLayer(rtsLayer);
    }

    public function paint(graphics : Graphics) : Void {
        final geographicMapCellPosition : GeographicMapCellPosition = this.getSelectedRtsFormInput().getSelectedGeographicCellPosition();
        final geographicMapCompositeInterface : GeographicMapCompositeInterface = (cast this.gameCanvas.getLayerManager() : GeographicMapCompositeInterface);
        final geographicMapInterface : BasicGeographicMap = geographicMapCompositeInterface.getGeographicMapInterface()[0];
        final allBinaryTiledLayer : AllBinaryTiledLayer = geographicMapInterface.getAllBinaryTiledLayer();
        graphics.setColor(Std.int(BasicColorFactory.getInstance().GREEN));
        var list : BasicArrayList = this.getSelectedBuildingPlayerGameInput().getPaintSelectedRTSLayersList();
        var width : Int = 0;
        var height : Int = 0;
        if (list.size() > 0) {
            {
                var index : Int = list.size() - 1;
                while (index >= 0) {
                var rtsLayer : RTSLayer = (cast list.get(index) : RTSLayer);
                width = rtsLayer.getWidth();
                height = rtsLayer.getHeight();
                graphics.drawRect(rtsLayer.getXP() - allBinaryTiledLayer.getXP(), rtsLayer.getYP() - allBinaryTiledLayer.getYP(), width, height);
                    index--;
                }
            }
        } else if (geographicMapCellPosition != SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION) {
            var point : GPoint = geographicMapCellPosition.getPoint();
            width = allBinaryTiledLayer.getCellWidth();
            height = allBinaryTiledLayer.getCellHeight();
            graphics.drawRect(point.getX() - allBinaryTiledLayer.getXP(), point.getY() - allBinaryTiledLayer.getYP(), width, height);
        }
    }

    public function updatePaintable() : Void {
    }

    public function getSelectedBuildingPlayerGameInput() : SelectedRTSLayersPlayerGameInput {
        return this.selectedRTSLayerPlayerGameInput;
    }

    public function getSelectedRtsFormInput() : RTSFormInput {
        return this.selectedRtsFormInput;
    }

    public function setSelectedRtsFormInput(selectedRtsFormInput : RTSFormInput) : Void {
        this.logUtil.putF(new StringMaker().append("RTSFormInput: ").append(StringUtil.getInstance().toString(selectedRtsFormInput)).toString(), this, "setSelectedRtsFormInput");
        this.selectedRtsFormInput = selectedRtsFormInput;
    }

    public function getRtsPlayerLayerInterface() : RTSPlayerLayerInterface {
        return this.rtsPlayerLayerInterface;
    }

    public function getRTSLayerInfoPaintable() : RTSLayerInfoPaintable {
        return this.towerInfoPaintable;
    }

    public function getMotionGestureInputList() : BasicArrayList {
        return this.motionGestureInputList;
    }

    public function getGameCanvas() : AllBinaryGameCanvas {
        return this.gameCanvas;
    }

    public function isIsSingleKeyProcessing() : Bool {
        return this.isSingleKeyProcessing;
    }

    public function getScrollPlayerGameInput() : ScrollMapPlayerGameInput {
        return this.scrollPlayerGameInput;
    }

}

