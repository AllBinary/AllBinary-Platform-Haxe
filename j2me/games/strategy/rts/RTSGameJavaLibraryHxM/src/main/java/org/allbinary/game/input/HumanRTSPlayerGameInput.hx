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

//import javax.microedition.lcdui.Graphics;
import org.allbinary.game.input.form.RTSFormInput;
import org.allbinary.game.layer.MultiSelectPaintable;
import org.allbinary.game.layer.RTSGameStrings;
import org.allbinary.game.layer.RTSLayer;
import org.allbinary.game.layer.RTSLayerInfoPaintable;
import org.allbinary.game.layer.RTSPlayerLayerInterface;
import org.allbinary.game.state.GameStateFactory;
import org.allbinary.input.motion.button.EndLevelNoBuildingSelectedTouchButtonsBuilder;
import org.allbinary.input.motion.button.EndLevelTouchButtonsBuilder;
import org.allbinary.input.motion.button.NoBuildingSelectedTouchButtonsBuilder;
import org.allbinary.input.motion.button.RTSTouchButtonsBuilder;
import org.allbinary.media.audio.SelectBuildingSound;
import org.allbinary.util.BasicArrayList;
import org.allbinary.string.CommonSeps;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.java.bool.BooleanFactory;
import org.allbinary.game.displayable.canvas.AllBinaryGameCanvas;
import org.allbinary.game.layer.AllBinaryGameLayerManager;
import org.allbinary.game.layer.hud.event.GameNotificationEvent;
import org.allbinary.game.layer.hud.event.GameNotificationEventHandler;
import org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer;
import org.allbinary.graphics.GPoint;
import org.allbinary.graphics.PointFactory;
import org.allbinary.graphics.color.BasicColorFactory;
import org.allbinary.graphics.form.ScrollSelectionForm;
import org.allbinary.graphics.form.item.ABCustomItem;
import org.allbinary.graphics.paint.NullInitUpdatePaintable;
import org.allbinary.input.motion.button.TouchButtonsBuilderFactory;
import org.allbinary.input.motion.gesture.MotionGestureInput;
import org.allbinary.input.motion.gesture.TouchMotionGestureFactory;
import org.allbinary.input.motion.gesture.observer.BaseMotionGestureEventListener;
import org.allbinary.input.motion.gesture.observer.BasicMotionGesturesHandler;
import org.allbinary.input.motion.gesture.observer.MotionGestureEvent;
import org.allbinary.layer.AllBinaryLayerManager;
import org.allbinary.logic.math.SmallIntegerSingletonFactory;
import org.allbinary.string.CommonLabels;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.math.RectangleCollisionUtil;
import org.allbinary.media.audio.ErrorSound;
import org.allbinary.media.graphics.geography.map.BasicGeographicMap;
import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition;
import org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface;
import org.allbinary.view.ViewPositionBase;

class HumanRTSPlayerGameInput extends RTSPlayerGameInput implements BaseMotionGestureEventListener {
    private var isDragging : Bool = false;
    public final gameStateFactory : GameStateFactory = GameStateFactory.getInstance();
    private final rectangleCollisionUtil : RectangleCollisionUtil = RectangleCollisionUtil.getInstance();
    private final touchMotionGestureFactory : TouchMotionGestureFactory = TouchMotionGestureFactory.getInstance();
    private final PRESSED : MotionGestureInput = this.touchMotionGestureFactory.PRESSED;
    private final RELEASED : MotionGestureInput = this.touchMotionGestureFactory.RELEASED;
    private final touchButtonsBuilderFactory : TouchButtonsBuilderFactory;
    private final notYoursGameNotificationEvent : GameNotificationEvent;
    private var selectedRtsLayer : CollidableDestroyableDamageableLayer = CollidableDestroyableDamageableLayer.getNullInstance();
    public function new(gameCanvas : AllBinaryGameCanvas, inputList : BasicArrayList, playerInputId : Int, towerInfoPaintable : RTSLayerInfoPaintable, rtsPlayerLayerInterface : RTSPlayerLayerInterface, layerPositionFinderInterface : LayerPositionFinderInterface, selectRTSLayerVisitorFactoryInterface : SelectRTSLayerVisitorFactoryInterface, touchButtonsBuilderFactory : TouchButtonsBuilderFactory) {
        super(gameCanvas, inputList, playerInputId, towerInfoPaintable, rtsPlayerLayerInterface, layerPositionFinderInterface, selectRTSLayerVisitorFactoryInterface);
        this.touchButtonsBuilderFactory = touchButtonsBuilderFactory;
        final basicColorFactory : BasicColorFactory = BasicColorFactory.getInstance();
        this.notYoursGameNotificationEvent = new GameNotificationEvent(this, RTSGameStrings.getInstance().NOT_YOURS, SmallIntegerSingletonFactory.getInstance().getAt(2), basicColorFactory.PINK, BooleanFactory.getInstance().FALSE);
        BasicMotionGesturesHandler.getInstance().addListenerInterface(this);
    }

    // throws Exception
    public override function setAllBinaryGameLayerManager(allBinaryGameLayerManager : AllBinaryGameLayerManager) : Void {
        final geographicMapCompositeInterface : GeographicMapCompositeInterface = (cast allBinaryGameLayerManager : GeographicMapCompositeInterface);
        final geographicMapInterface : BasicGeographicMap = geographicMapCompositeInterface.getGeographicMapInterface()[0];
        this.notYoursGameNotificationEvent.setBasicColorP(geographicMapInterface.getForegroundBasicColor());
    }

    // throws Exception
    private function processDraggingMotionInput(layerManager : AllBinaryLayerManager) : Bool {
        final motionGestureEvent : MotionGestureEvent = (cast this.getMotionGestureInputList().get(this.getMotionGestureInputList().size() - 1) : MotionGestureEvent);
        final motionGestureInput : MotionGestureInput = motionGestureEvent.getMotionGesture();
        final rtsFormInput : RTSFormInput = this.getSelectedRtsFormInput();
        if (motionGestureInput == this.PRESSED) {
            final point : GPoint = motionGestureEvent.getCurrentPoint();
            if (this.getRtsPlayerLayerInterface().getCurrentScrollSelectionForm().isInForm(point)) {
                this.isDragging = rtsFormInput.processSticky(this.getSelectedRtsLayer(), this.getRtsPlayerLayerInterface(), layerManager, point);
            }
        } else if (motionGestureInput == this.RELEASED) {
            final point : GPoint = motionGestureEvent.getCurrentPoint();
            if (this.getRtsPlayerLayerInterface().getCurrentScrollSelectionForm().isInForm(point)) {
                rtsFormInput.processAtPoint(this.getSelectedRtsLayer(), this.getRtsPlayerLayerInterface(), layerManager, point);
            } else if (rtsFormInput.isStickyItemSelected()) {
                final previousRtsFormInput : RTSFormInput = rtsFormInput;
                this.select(motionGestureEvent);
                this.getSelectedBuildingPlayerGameInput().selectAllPreselected();
                previousRtsFormInput.processAtPoint(this.getSelectedRtsLayer(), this.getRtsPlayerLayerInterface(), layerManager, point);
                this.getSelectedBuildingPlayerGameInput().deselectAllPreselected();
            } else {
                this.select(motionGestureEvent);
            }
            rtsFormInput.setStickyItemSelected(false);
            rtsFormInput.setSelectedStickyItem(ABCustomItem.getNullInstance());
            rtsFormInput.setSelectedStickyItemIndex(-1);
            return true;
        }
        return false;
    }

    private var startPoint : GPoint = PointFactory.getInstance().ZERO_ZERO;
    private var endPoint : GPoint = PointFactory.getInstance().ZERO_ZERO;
    public final POSSIBLE : String = "Possible: ";
    public final AT : String = "At: ";
    public final METHOD : String = "makeSelection";
    public final ADDING : String = "Adding: ";
    public final SPACE : String = CommonSeps.getInstance().SPACE;
    private function makeSelection() : Void {
        final rtsLayerList : BasicArrayList = this.getRtsPlayerLayerInterface().getPlayerOwnedRTSLayers().rtsLayerList;
        var rectX1 : Int = this.startPoint.getX();
        var rectY1 : Int = this.startPoint.getY();
        var rectX2 : Int = this.endPoint.getX();
        var rectY2 : Int = this.endPoint.getY();
        if (rectX1 > rectX2) {
            rectX2 = rectX1;
            rectX1 = this.endPoint.getX();
        }
        if (rectY1 > rectY2) {
            rectY2 = rectY1;
            rectY1 = this.endPoint.getY();
        }
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(this.AT);
        stringBuffer.appendint(rectX1);
        stringBuffer.append(this.SPACE);
        stringBuffer.appendint(rectY1);
        stringBuffer.append(this.SPACE);
        stringBuffer.appendint(rectX2);
        stringBuffer.append(this.SPACE);
        stringBuffer.appendint(rectY2);
        this.logUtil.putF(stringBuffer.toString(), this, this.METHOD);
        var rtsLayer : RTSLayer = null;
        {
            var index : Int = rtsLayerList.size() - 1;
            while (index >= 0) {
            rtsLayer = (cast rtsLayerList.get(index) : RTSLayer);
            stringBuffer.delete(0, stringBuffer.length());
            final viewPosition : ViewPositionBase = rtsLayer.getViewPosition();
            stringBuffer.append(this.POSSIBLE);
            stringBuffer.append(rtsLayer.getName());
            stringBuffer.append(this.SPACE);
            stringBuffer.append(this.AT);
            stringBuffer.appendint(Std.int((viewPosition.getX() + rtsLayer.getHalfWidth())));
            stringBuffer.append(this.SPACE);
            stringBuffer.appendint(Std.int((viewPosition.getY() + rtsLayer.getHalfHeight())));
            this.logUtil.putF(stringBuffer.toString(), this, this.METHOD);
            if (this.rectangleCollisionUtil.isInside(rectX1, rectY1, rectX2, rectY2, viewPosition.getX() + rtsLayer.getHalfWidth(), viewPosition.getY() + rtsLayer.getHalfHeight())) {
                this.logUtil.putF(new StringMaker().append(this.ADDING).append(rtsLayer.getName()).toString(), this, this.METHOD);
                rtsLayer.select();
                this.getSelectedBuildingPlayerGameInput().addSelectedRTSLayer(rtsLayer);
            }
                index--;
            }
        }
        final gameLayer : CollidableDestroyableDamageableLayer = this.getSelectedBuildingPlayerGameInput().getLastSelectedRtsLayer();
        if (gameLayer != CollidableDestroyableDamageableLayer.getNullInstance()) {
            final lastRTSLayer : RTSLayer = (cast gameLayer : RTSLayer);
            if (lastRTSLayer.getScrollSelectionForm() != ScrollSelectionForm.getNullScrollSelectionForm()) {
                this.updateForm(lastRTSLayer.getScrollSelectionForm(), lastRTSLayer.getRTSFormInput());
                this.setSelectedRtsLayer(lastRTSLayer);
            }
        }
        this.updatePaintable();
    }

    // throws Exception
    private function processSelectionBoxMotionInput(layerManager : AllBinaryLayerManager) : Void {
        {
            var index : Int = this.getMotionGestureInputList().size() - 1;
            while (index >= 0) {
            final motionGestureEvent : MotionGestureEvent = (cast this.getMotionGestureInputList().get(index) : MotionGestureEvent);
            final motionGestureInput : MotionGestureInput = motionGestureEvent.getMotionGesture();
            final point : GPoint = motionGestureEvent.getCurrentPoint();
            if (motionGestureInput == this.touchMotionGestureFactory.PRESSED) {
                this.startPoint = point;
                this.endPoint = point;
            } else if (motionGestureInput == this.touchMotionGestureFactory.RELEASED) {
                this.endPoint = point;
                this.makeSelection();
                this.startPoint = PointFactory.getInstance().ZERO_ZERO;
                this.endPoint = PointFactory.getInstance().ZERO_ZERO;
            } else {
                this.endPoint = point;
            }
                index--;
            }
        }
    }

    // throws Exception
    public override function processMotionInput(layerManager : AllBinaryLayerManager) : Void {
        if (this.getMotionGestureInputList().size() > 0) {
            var endDrag : Bool = this.processDraggingMotionInput(layerManager);
            if (!this.isDragging) {
                this.processSelectionBoxMotionInput(layerManager);
            }
            if (endDrag) {
                this.isDragging = false;
            }
        }
        this.getMotionGestureInputList().clear();
    }

    public override function setSelectedRtsFormInput(selectedRtsFormInput : RTSFormInput) : Void {
        final logUtil : LogUtil = LogUtil.getInstance();
        this.logUtil.putF(new StringMaker().append(CommonLabels.getInstance().START).append(StringUtil.getInstance().toString(selectedRtsFormInput)).toString(), this, "setSelectedRtsFormInput");
        super.setSelectedRtsFormInput(selectedRtsFormInput);
        this.setSelectedRtsLayer(CollidableDestroyableDamageableLayer.getNullInstance());
    }

    private function updateFormForLayer(rtsLayer : RTSLayer) : Void {
        final scrollSelectionForm : ScrollSelectionForm = rtsLayer.getScrollSelectionForm();
        if (scrollSelectionForm != ScrollSelectionForm.getNullScrollSelectionForm() && this.getRtsPlayerLayerInterface().getGroupInterface()[0] == rtsLayer.getGroupInterface()[0]) {
            this.updateForm(scrollSelectionForm, rtsLayer.getRTSFormInput());
            this.getSelectedBuildingPlayerGameInput().setSelectedRTSLayer(CollidableDestroyableDamageableLayer.getNullInstance());
            this.setSelectedRtsLayer(rtsLayer);
        } else {
            this.getRtsPlayerLayerInterface().setCurrentScrollSelectionForm(this.getRtsPlayerLayerInterface().getBuildingScrollSelectionForm());
            this.setSelectedRtsFormInput(this.getRtsPlayerLayerInterface().getRTSFormInput());
            this.getSelectedBuildingPlayerGameInput().setSelectedRTSLayer(CollidableDestroyableDamageableLayer.getNullInstance());
        }
    }

    private function updateForm(scrollSelectionForm : ScrollSelectionForm, rtfFormInput : RTSFormInput) : Void {
        this.getRtsPlayerLayerInterface().setCurrentScrollSelectionForm(scrollSelectionForm);
        this.setSelectedRtsFormInput(rtfFormInput);
    }

    // throws Exception
    public override function setSelectedRTSLayer(rtSLayer : CollidableDestroyableDamageableLayer, geographicMapCellPosition : GeographicMapCellPosition) : Void {
        if (rtSLayer != CollidableDestroyableDamageableLayer.getNullInstance() && this.getRtsPlayerLayerInterface().getGroupInterface()[0] != rtSLayer.getGroupInterface()[0]) {
            this.getRtsPlayerLayerInterface().add(ErrorSound.getInstance());
            GameNotificationEventHandler.getInstance().fireEvent(this.notYoursGameNotificationEvent);
            return;
        }
        final gameCanvas : AllBinaryGameCanvas = this.getGameCanvas();
        if (rtSLayer != CollidableDestroyableDamageableLayer.getNullInstance()) {
            this.getRtsPlayerLayerInterface().add(SelectBuildingSound.getInstance());
            final rtsLayer : RTSLayer = (cast rtSLayer : RTSLayer);
            rtsLayer.select();
            this.updateFormForLayer(rtsLayer);
            if (gameCanvas.getGameState() == this.gameStateFactory.PLAYING_GAME_STATE) {
                if (rtsLayer.isSelfUpgradeable()) {
                    gameCanvas.updateCurrentTouchInputFactory(new RTSTouchButtonsBuilder());
                } else {
                    gameCanvas.updateCurrentTouchInputFactory(new NoBuildingSelectedTouchButtonsBuilder());
                }
            } else {
                final endLevelTouchButtonsBuilder : EndLevelTouchButtonsBuilder = new EndLevelTouchButtonsBuilder();
                if (this.touchButtonsBuilderFactory != null) {
                    endLevelTouchButtonsBuilder.add(this.touchButtonsBuilderFactory.getInstance());
                }
                gameCanvas.updateCurrentTouchInputFactory(endLevelTouchButtonsBuilder);
            }
        } else {
            this.logUtil.putF("Set Player Default Form", this, "setSelectedRTSLayer");
            this.getRtsPlayerLayerInterface().setCurrentScrollSelectionForm(this.getRtsPlayerLayerInterface().getBuildingScrollSelectionForm());
            this.setSelectedRtsFormInput(this.getRtsPlayerLayerInterface().getRTSFormInput());
            this.getSelectedBuildingPlayerGameInput().setSelectedRTSLayer(CollidableDestroyableDamageableLayer.getNullInstance());
            if (gameCanvas.getGameState() == this.gameStateFactory.PLAYING_GAME_STATE) {
                gameCanvas.updateCurrentTouchInputFactory(new NoBuildingSelectedTouchButtonsBuilder());
            } else {
                final endLevelNoBuildingSelectedTouchButtonsBuilder : EndLevelNoBuildingSelectedTouchButtonsBuilder = new EndLevelNoBuildingSelectedTouchButtonsBuilder();
                if (this.touchButtonsBuilderFactory != null) {
                    endLevelNoBuildingSelectedTouchButtonsBuilder.add(this.touchButtonsBuilderFactory.getInstance());
                }
                gameCanvas.updateCurrentTouchInputFactory(endLevelNoBuildingSelectedTouchButtonsBuilder);
            }
        }
        this.getSelectedRtsFormInput().setSelectedGeographicCellPosition(geographicMapCellPosition);
        this.getSelectedBuildingPlayerGameInput().setSelectedRTSLayer(rtSLayer);
        this.updatePaintable();
    }

    private final multiSelectPaintable : MultiSelectPaintable = new MultiSelectPaintable();
    public override function updatePaintable() : Void {
        final list : BasicArrayList = this.getSelectedBuildingPlayerGameInput().getSelectedBasicArrayList();
        if (list.size() > 1) {
            final geographicMapCompositeInterface : GeographicMapCompositeInterface = (cast this.getGameCanvas() : GeographicMapCompositeInterface);
            final geographicMapInterface : BasicGeographicMap = geographicMapCompositeInterface.getGeographicMapInterface()[0];
            this.multiSelectPaintable.setBasicColorP(geographicMapInterface.getForegroundBasicColor());
            this.multiSelectPaintable.update(list);
            this.getRTSLayerInfoPaintable().updateRTSLayerInfoSelection(this.multiSelectPaintable);
        } else if (list.size() == 1) {
            var rtsLayer : RTSLayer = (cast list.get(0) : RTSLayer);
            this.getRTSLayerInfoPaintable().updateRTSLayerInfoSelection(rtsLayer.createHudPaintable());
        } else {
            this.getRTSLayerInfoPaintable().updateRTSLayerInfoInit(NullInitUpdatePaintable.getInstance());
        }
    }

    public override function paint(graphics : Graphics) : Void {
        super.paint(graphics);
        if (this.startPoint != PointFactory.getInstance().ZERO_ZERO && this.endPoint != PointFactory.getInstance().ZERO_ZERO) {
            graphics.setColor(Std.int(BasicColorFactory.getInstance().RED));
            var rectX1 : Int = this.startPoint.getX();
            var rectY1 : Int = this.startPoint.getY();
            var rectX2 : Int = this.endPoint.getX();
            var rectY2 : Int = this.endPoint.getY();
            if (rectX1 > rectX2) {
                rectX2 = rectX1;
                rectX1 = this.endPoint.getX();
            }
            if (rectY1 > rectY2) {
                rectY2 = rectY1;
                rectY1 = this.endPoint.getY();
            }
            graphics.drawRect(rectX1, rectY1, rectX2 - rectX1, rectY2 - rectY1);
        }
    }

    public override function onMotionGestureEvent(motionGestureEvent : MotionGestureEvent) : Void {
        this.getMotionGestureInputList().add(motionGestureEvent);
    }

    public override function onScrolledMotionGestureEvent(motionGestureEvent : MotionGestureEvent) : Void {
    }

    private function getSelectedRtsLayer() : CollidableDestroyableDamageableLayer {
        return this.selectedRtsLayer;
    }

    private function setSelectedRtsLayer(selectedRtsLayer : CollidableDestroyableDamageableLayer) : Void {
        this.selectedRtsLayer = selectedRtsLayer;
    }

}

