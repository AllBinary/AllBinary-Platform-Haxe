/*
 *
 * AllBinary Open License Version 1
 * Copyright (c) 2011 AllBinary
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
import org.allbinary.util.BasicArrayList;
import org.allbinary.logic.system.security.licensing.LockedFeatureNotificationUtil;
import org.allbinary.logic.system.security.licensing.LockedUtil;
import org.allbinary.canvas.Processor;
import org.allbinary.game.displayable.canvas.AllBinaryGameCanvas;
import org.allbinary.game.displayable.canvas.PreGameSelectorPaintable;
import org.allbinary.game.input.event.GameKeyEventHandler;
import org.allbinary.game.input.event.GameKeyEventUtil;
import org.allbinary.layer.AllBinaryLayerManager;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;
import org.allbinary.media.audio.SecondaryPlayerQueueFactory;
import org.allbinary.media.audio.SelectSound;
import org.allbinary.media.graphics.geography.map.racetrack.MultiLevelRaceTrackGeographicMapInterfaceFactoryInterface;
import org.allbinary.thread.ABRunnable;
import org.allbinary.thread.ThreadObjectUtil;
import org.allbinary.time.TimeDelayHelper;

class MapSelectionGameInputProcessor extends Processor implements GameInputProcessorInterface implements PlayerGameInputCompositeInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final gameCanvas : AllBinaryGameCanvas;
    private final raceTrackGeographicMapInterfaceFactoryInterface : MultiLevelRaceTrackGeographicMapInterfaceFactoryInterface;
    private final preGameSelectorPaintable : PreGameSelectorPaintable;
    private final inputTimeHelper : TimeDelayHelper = new TimeDelayHelper(650);
    private final playerGameInput : PlayerGameInput;
    private final lockedIndex : Int;
    private final abRunnable : ABRunnable = /* anonymous class body:
        public function run() : Void {
            try {
                this.setRunning(true);
                SecondaryPlayerQueueFactory.getInstance().add(SelectSound.getInstance());
                final track : Int = preGameSelectorPaintable.getPreGameSelectionForm().getSelectedIndex() + 1;
                final wave : Int = raceTrackGeographicMapInterfaceFactoryInterface.getFirstWaveWithTrack(track);
                gameCanvas.getLayerManager().getGameInfo().setCurrentLevel(wave);
                gameCanvas.buildGameInit(false);
                GameKeyEventHandler.getInstance().removeListener(getPlayerGameInput());
                this.setRunning(false);
            } catch (e : haxe.Exception) {
                this.setRunning(false);
                final logUtil : LogUtil = LogUtil.getInstance();
                final commonStrings : CommonStrings = CommonStrings.getInstance();
                logUtil.put(commonStrings.EXCEPTION, this, commonStrings.RUN, e);
            }
        }

*/ new ABRunnable();
    public function new(gameCanvas : AllBinaryGameCanvas, raceTrackGeographicMapInterfaceFactoryInterface : MultiLevelRaceTrackGeographicMapInterfaceFactoryInterface, mapSelectorPaintable : PreGameSelectorPaintable, lockedIndex : Int) {
        super();
        this.gameCanvas = gameCanvas;
        this.raceTrackGeographicMapInterfaceFactoryInterface = raceTrackGeographicMapInterfaceFactoryInterface;
        this.preGameSelectorPaintable = mapSelectorPaintable;
        this.playerGameInput = new GameInputProcessorComposite("Map Selection", this);
        this.lockedIndex = lockedIndex;
    }

    // throws Exception
    public override function process() : Void {
        this.getPlayerGameInput().update();
    }

    // throws Exception
    public override function onInput(list : BasicArrayList) : Void {
        var size : Int = list.size();
        for (index in 0...size) {
            var anyType : Any = list.get(index);
            var key : Int = GameKeyEventUtil.getKey(anyType);
            if (key == Canvas.LEFT || key == Canvas.RIGHT || key == Canvas.UP || key == Canvas.DOWN) {
                if (this.inputTimeHelper.isTimeTNT()) {
                    SecondaryPlayerQueueFactory.getInstance().add(SelectSound.getInstance());
                    this.preGameSelectorPaintable.getPreGameSelectionForm().processInputKey(key);
                    break;
                }
            } else if (key == Canvas.KEY_NUM0) {
                var selectedIndex : Int = this.preGameSelectorPaintable.getPreGameSelectionForm().getSelectedIndex();
                if (selectedIndex < this.lockedIndex || !LockedUtil.getInstance().isLocked()) {
                    if (!abRunnable.isRunning()) {
                        abRunnable.setRunning(true);
                        ThreadObjectUtil.getInstance().processThread(abRunnable);
                    }
                    break;
                } else {
                    LockedFeatureNotificationUtil.getInstance().fire();
                }
            }
            list.clear();
        }
    }

    // throws Exception
    public override function processInput(layerManager : AllBinaryLayerManager) : Void {
    }

    public override function initInputProcessors() : Void {
    }

    public override function getName() : String {
        return this.toString();
    }

    public override function getPlayerGameInput() : PlayerGameInput {
        return this.playerGameInput;
    }

}

