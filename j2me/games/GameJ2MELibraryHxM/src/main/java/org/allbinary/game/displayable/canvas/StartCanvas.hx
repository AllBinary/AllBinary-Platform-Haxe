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
package org.allbinary.game.displayable.canvas;

import javax.microedition.lcdui.Command;
import javax.microedition.lcdui.CommandListener;
import javax.microedition.lcdui.Graphics;
import javax.microedition.lcdui.Item;
import org.allbinary.J2MEUtil;
import org.allbinary.animation.Animation;
import org.allbinary.animation.IndexedAnimationBehavior;
import org.allbinary.animation.special.SpecialAnimation;
import org.allbinary.business.advertisement.GameAdStateFactory;
import org.allbinary.canvas.BaseGameStatistics;
import org.allbinary.canvas.CustomGameMenuUtil;
import org.allbinary.canvas.FullScreenUtil;
import org.allbinary.canvas.GameStatisticsFactory;
import org.allbinary.canvas.RunnableCanvas;
import org.allbinary.game.GameAdState;
import org.allbinary.game.commands.GameCommandsFactory;
import org.allbinary.game.configuration.event.ChangedGameFeatureListener;
import org.allbinary.game.configuration.feature.Features;
import org.allbinary.game.configuration.feature.GameFeatureFactory;
import org.allbinary.game.configuration.feature.InputFeatureFactory;
import org.allbinary.game.configuration.feature.MainFeatureFactory;
import org.allbinary.game.init.BasicBuildGameInitializerFactory;
import org.allbinary.game.init.GameInitializationUtil;
import org.allbinary.game.input.GameInputStrings;
import org.allbinary.game.input.GameKey;
import org.allbinary.game.input.GameKeyFactory;
import org.allbinary.game.input.PlatformInputMappingFactory;
import org.allbinary.game.input.event.DownGameKeyEventHandler;
import org.allbinary.game.input.event.GameKeyEvent;
import org.allbinary.game.input.event.GameKeyEventFactory;
import org.allbinary.game.input.event.GameKeyEventHandler;
import org.allbinary.game.input.event.UpGameKeyEventHandler;
import org.allbinary.game.input.mapping.InputToGameKeyMapping;
import org.allbinary.game.layer.AllBinaryGameLayerManager;
import org.allbinary.game.layer.SWTUtil;
import org.allbinary.game.midlet.DemoGameMidlet;
import org.allbinary.game.score.HighScoreCommands;
import org.allbinary.game.score.HighScores;
import org.allbinary.game.score.HighScoresFactoryInterface;
import org.allbinary.game.score.HighScoresHelper;
import org.allbinary.game.score.HighScoresPaintable;
import org.allbinary.game.score.NullHighScoresSingletonFactory;
import org.allbinary.game.state.GameState;
import org.allbinary.game.state.GameStateFactory;
import org.allbinary.graphics.Rectangle;
import org.allbinary.graphics.ResizableListenerHandler;
import org.allbinary.graphics.canvas.transition.progress.ProgressCanvas;
import org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory;
import org.allbinary.graphics.color.BasicColorFactory;
import org.allbinary.graphics.displayable.command.MyCommandsFactory;
import org.allbinary.graphics.displayable.event.DisplayChangeEvent;
import org.allbinary.graphics.displayable.event.DisplayChangeEventHandler;
import org.allbinary.graphics.displayable.event.DisplayChangeEventListener;
import org.allbinary.graphics.form.FormType;
import org.allbinary.graphics.form.FormTypeFactory;
import org.allbinary.graphics.form.ScrollSelectionForm;
import org.allbinary.graphics.opengles.CurrentDisplayableFactory;
import org.allbinary.graphics.opengles.OpenGLFeatureFactory;
import org.allbinary.graphics.opengles.OpenGLFeatureUtil;
import org.allbinary.graphics.opengles.OpenGLThreadUtil;
import org.allbinary.graphics.paint.InitUpdatePaintable;
import org.allbinary.graphics.paint.NullPaintable;
import org.allbinary.graphics.paint.Paintable;
import org.allbinary.graphics.paint.PaintableInterface;
import org.allbinary.graphics.paint.StatePaintable;
import org.allbinary.graphics.paint.StatePaintableFactory;
import org.allbinary.input.motion.gesture.observer.BasicMotionGesturesHandler;
import org.allbinary.logic.communication.log.ForcedLogUtil;
import org.allbinary.logic.communication.log.PreLogUtil;
import org.allbinary.logic.math.SmallIntegerSingletonFactory;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.system.os.OperatingSystemFactory;
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;
import org.allbinary.logic.system.security.licensing.InApplicationPurchaseFactory;
import org.allbinary.logic.system.security.licensing.LockableFeature;
import org.allbinary.logic.system.security.licensing.LockableFeatureFactory;
import org.allbinary.logic.util.event.AllBinaryEventObject;
import org.allbinary.logic.util.event.EventStrings;
import org.allbinary.media.audio.AllBinaryMediaManager;
import org.allbinary.media.audio.EarlySoundsFactory;
import org.allbinary.string.CommonSeps;
import org.allbinary.time.TimeDelayHelper;
import org.allbinary.util.ABHashtable;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class StartCanvas extends RunnableCanvas implements GameCanvasRunnableInterface implements MenuListener implements DisplayChangeEventListener {
    public final basicColorFactory : BasicColorFactory = BasicColorFactory.getInstance();
    public final features : Features = Features.getInstance();
    public final openGLFeatureFactory : OpenGLFeatureFactory = OpenGLFeatureFactory.getInstance();
    public final myCommandsFactory : MyCommandsFactory = MyCommandsFactory.getInstance();
    public final gameAdStateFactory : GameAdStateFactory = GameAdStateFactory.getInstance();
    public final gameStateFactory : GameStateFactory = GameStateFactory.getInstance();
    public final gameInputStrings : GameInputStrings = GameInputStrings.getInstance();
    public final formUtil : FormUtil = FormUtil.getInstance();
    private var basicGameDemoPaintable : StatePaintable = StatePaintableFactory.getInstance();
    private var specialAnimationInterface : SpecialAnimation = SpecialAnimation.getInstance();
    public var paintedSpecialAnimationInterface : Animation = SpecialAnimation.getInstance();
    private final fullScreenUtil : FullScreenUtil = FullScreenUtil.getInstance();
    private final highScoresHelper : HighScoresHelper = new HighScoresHelper();
    private final realHighScoresPaintable : HighScoresPaintable = new HighScoresPaintable();
    private var highScoresPaintable : Paintable = NullPaintable.getInstance();
    private var state : Int = 0;
    private final timeDelayHelper : TimeDelayHelper = new TimeDelayHelper(6000);
    private final highScoresFactoryInterface : HighScoresFactoryInterface;
    private var menuInputProcessor : BasicMenuInputProcessor = NoMenuInputProcessor.getInstance();
    private var menuForm : ScrollSelectionForm = ScrollSelectionForm.getNullScrollSelectionForm();
    private final gameInitializationInterfaceFactoryInterface : BasicBuildGameInitializerFactory;
    private var initialized : Bool = false;
    private var defaultPaintableInterface : Paintable = NullPaintable.getInstance();
    private var paintableInterface : PaintableInterface = NullPaintable.getInstance();
    private final overlayPaintable : InitUpdatePaintable;
    private var tempWait : Int = NullWaitGameRunnable.getInstance().WAIT;
    private final inputToGameKeyMapping : InputToGameKeyMapping = PlatformInputMappingFactory.getInstance().getPersistentInputMappingInstance().getInputMapping();
    public var gameRunnable : GameRunnable = NullWaitGameRunnable.getInstance();
    private var progressPaintable : PaintableInterface = ProgressCanvasFactory.getLazyInstance();
    public function new(abeClientInformation : AbeClientInformationInterface, commandListener : CommandListener, highScoresFactoryInterface : HighScoresFactoryInterface, paintable : Paintable, overlayPaintable : InitUpdatePaintable, gameInitializationInterfaceFactoryInterface : BasicBuildGameInitializerFactory, isContinue : Bool) {
        super(commandListener, CurrentDisplayableFactory.getInstance().DEFAULT_CHILD_NAME_LIST, true);
        this.isSingleKeyRepeatableProcessing = this.features.isFeature(InputFeatureFactory.getInstance().SINGLE_KEY_REPEAT_PRESS);
        this.setWait(NullWaitGameRunnable.getInstance().WAIT);
        this.gameInitializationInterfaceFactoryInterface = gameInitializationInterfaceFactoryInterface;
        GameInitializationUtil.getInstance().initDemo(abeClientInformation, this, gameInitializationInterfaceFactoryInterface);
        ResizableListenerHandler.getInstance().fireEvent(false);
        this.overlayPaintable = overlayPaintable;
        this.highScoresFactoryInterface = highScoresFactoryInterface;
        this.setDefaultPaintableInterface(paintable);
        this.setPaintableInterface(this.getDefaultPaintableInterface());
        if (isContinue) {
            this.addCommand(GameCommandsFactory.getInstance().CONTINUE_COMMAND);
        }
        if (ChangedGameFeatureListener.getInstance().isChangedFeature(GameFeatureFactory.getInstance().SOUND)) {
            this.mediaInit();
        }
        DisplayChangeEventHandler.getInstance().addListenerInterface(this);
    }

    public function onEvent(eventObject : AllBinaryEventObject) : Void {
        ForcedLogUtil.log(EventStrings.getInstance().PERFORMANCE_MESSAGE, this);
    }

    public function onDisplayChangeEvent(displayChangeEvent : DisplayChangeEvent) : Void {
        try {
            var scrollSelectionForm : ScrollSelectionForm = this.getMenuForm();
            if (scrollSelectionForm != null) {
                var formType : FormType = FormTypeFactory.getInstance().getFormType();
                var rectangle : Rectangle = this.formUtil.createFormRectangle();
                scrollSelectionForm.init(rectangle, formType);
            }
            this.overlayPaintable.init();
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.canvasStrings.ON_DISPLAY_CHANGE_EVENT, e);
        }
    }

    public function getCustomCommands() : haxe.ds.Vector<Any> {
        final gameCommandsFactory : GameCommandsFactory = GameCommandsFactory.getInstance();
        if (J2MEUtil.isHTML()) {
            final commandArray : haxe.ds.Vector<Any> = haxe.ds.Vector.fromArrayCopy([gameCommandsFactory.START_COMMAND, HighScoreCommands.getInstance().DISPLAY, GameInputMappingCanvas.DISPLAY, gameCommandsFactory.DISPLAY_ABOUT]);
            return commandArray;
        } else {
            final commandList : BasicArrayList = new BasicArrayListD();
            commandList.add(gameCommandsFactory.START_COMMAND);
            final inApplicationPurchaseFactory : InApplicationPurchaseFactory = InApplicationPurchaseFactory.getInstance();
            if (inApplicationPurchaseFactory.isEnabled()) {
                final list : BasicArrayList = LockableFeatureFactory.getInstance().getList();
                if (list.size() > 0 && !inApplicationPurchaseFactory.isPurchased((cast list.get(0) : LockableFeature))) {
                    commandList.add(gameCommandsFactory.BUY_COMMAND);
                }
            }
            commandList.add(HighScoreCommands.getInstance().DISPLAY);
            try {
                final isOverScan : Bool = OperatingSystemFactory.getInstance().getOperatingSystemInstance().isOverScan();
                if (SWTUtil.isSWT) {
                    commandList.add(GameInputMappingCanvas.DISPLAY);
                } else if (!isOverScan) {
                    commandList.add(gameCommandsFactory.DISPLAY_OPTIONS);
                    commandList.add(gameCommandsFactory.DISPLAY_LOAD_FORM);
                    commandList.add(GameInputMappingCanvas.DISPLAY);
                }
            } catch (e : haxe.Exception) {
            }
            commandList.add(gameCommandsFactory.DISPLAY_ABOUT);
            final commandArray : haxe.ds.Vector<Any> = commandList.toArray();
            return commandArray;
        }
    }

    public override function initCommands(cmdListener : CommandListener) : Void {
        this.removeAllCommands();
        final commandArray : haxe.ds.Vector<Any> = this.getCustomCommands();
        final size : Int = commandArray.length;
        for (index in 0...size) {
            this.addCommand((cast commandArray[index] : Command));
        }
        CustomGameMenuUtil.add(this);
        this.setCommandListener(cmdListener);
    }

    // throws Exception
    public function initPostPaint() : Void {
    }

    // throws Exception
    public function mediaInit() : Void {
        AllBinaryMediaManager.init(EarlySoundsFactory.getInstance());
    }

    public function itemStateChanged(item : Item) : Void {
        ForcedLogUtil.log(this.commonStrings.NOT_IMPLEMENTED, this);
    }

    // throws Exception
    public function initMenu() : Void {
        this.close();
        this.open();
    }

    public function open() : Void {
        BasicMotionGesturesHandler.getInstance().addListenerInterface(this.getMenuInputProcessor());
        GameKeyEventHandler.getInstance().addListener(this.getMenuInputProcessor());
    }

    public function close() : Void {
        BasicMotionGesturesHandler.getInstance().removeListener(this.getMenuInputProcessor());
        GameKeyEventHandler.getInstance().removeListener(this.getMenuInputProcessor());
    }

    private static final id : Int = 0;
    public function getSourceId() : Int {
        return StartCanvas.id;
    }

    public override function keyPressed(keyCode : Int) : Void {
        this.keyPressedByDevice(keyCode, 0);
    }

    public override function keyReleased(keyCode : Int) : Void {
        this.keyReleasedByDevice(keyCode, 0);
    }

    public override function keyRepeated(keyCode : Int) : Void {
        this.keyRepeatedByDevice(keyCode, 0);
    }

    public override function keyPressedByDevice(keyCode : Int, deviceId : Int) : Void {
        this.addGameKeyEvent(keyCode, false);
    }

    public override function keyReleasedByDevice(keyCode : Int, deviceId : Int) : Void {
        this.removeGameKeyEvent(keyCode, false);
    }

    private var isSingleKeyRepeatableProcessing : Bool;
    public override function keyRepeatedByDevice(keyCode : Int, deviceId : Int) : Void {
        if (this.isSingleKeyRepeatableProcessing) {
            this.addGameKeyEvent(keyCode, true);
        }
    }

    private final NONE : GameKey = GameKeyFactory.getInstance().NONE;
    private final gameKeyEventFactory : GameKeyEventFactory = GameKeyEventFactory.getInstance();
    private function addGameKeyEvent(keyCode : Int, repeated : Bool) : Void {
        try {
            var gameKey : GameKey = this.inputToGameKeyMapping.getInstanceForCanvas(this, keyCode);
            if (gameKey != this.NONE) {
                var gameKeyEvent : GameKeyEvent = this.gameKeyEventFactory.getInstanceForInput(this, gameKey);
                DownGameKeyEventHandler.getInstance().fireEvent(gameKeyEvent);
            } else {
                this.logUtil.putF(Std.string(new StringMaker().append(this.gameInputStrings.NO_KEY).appendint(keyCode)), this, this.gameInputStrings.ADD_KEY_EVENT);
            }
        } catch (e : haxe.Exception) {
            this.logUtil.put("Key Event Error", this, this.gameInputStrings.ADD_KEY_EVENT, e);
        }
    }

    private function removeGameKeyEvent(keyCode : Int, repeated : Bool) : Void {
        try {
            var gameKey : GameKey = this.inputToGameKeyMapping.getInstanceForCanvas(this, keyCode);
            if (gameKey != this.NONE) {
                var gameKeyEvent : GameKeyEvent = this.gameKeyEventFactory.getInstanceForInput(this, gameKey);
                UpGameKeyEventHandler.getInstance().fireEvent(gameKeyEvent);
            } else {
                this.logUtil.putF(Std.string(new StringMaker().append(this.gameInputStrings.NO_KEY).appendint(keyCode)), this, this.gameInputStrings.REMOVE_KEY_EVENT);
            }
        } catch (e : haxe.Exception) {
            this.logUtil.put("Key Event Error", this, this.gameInputStrings.REMOVE_KEY_EVENT, e);
        }
    }

    // synchronized
    public override function pause() : Void {
        this.close();
        this.setPaused(true);
    }

    // synchronized
    public override function unPause() : Void {
        this.open();
        this.setPaused(false);
    }

    public override function isPausable() : Bool {
        if (CurrentDisplayableFactory.getInstance().getUsedRunnable() == NullWaitGameRunnable.getInstance()) {
            return true;
        } else {
            return false;
        }
    }

    public function isGameOver() : Bool {
        this.logUtil.putF(Std.string(new StringMaker().append(this.commonStrings.NOT_IMPLEMENTED).append(" since not a game")), this, "isGameOver");
        return false;
    }

    // throws Exception
    public function setLoadStateHashtable(hashtable : ABHashtable<Any, Any>) : Void {
        this.logUtil.putF("Trying to continue a demo lol - only continue a game canvas not the demo", this, "setLoadStateHashtable");
    }

    // throws Exception
    public function getLoadStateHashtable() : ABHashtable<Any, Any> {
        this.logUtil.putF("Trying to continue a demo lol - only continue a game canvas not the demo", this, "getLoadStateHashtable");
        return this.stdUtil.NULL_TABLE;
    }

    // throws Exception
    public function getCurrentStateHashtable() : ABHashtable<Any, Any> {
        this.logUtil.putF("Trying to save the AI lol", this, "getCurrentStateHashtable");
        return this.stdUtil.NULL_TABLE;
    }

    public function setHighScoreSubmitted(isNotUsed : Bool) : Void {
    }

    public override function paint(graphics : Graphics) : Void {
        this.paintableInterface.paint(graphics);
        this.paintedSpecialAnimationInterface.paintXY(graphics, 0, 0);
        this.highScoresPaintable.paint(graphics);
        this.getBasicGameDemoPaintable().paint(graphics);
        this.overlayPaintable.paint(graphics);
        this.progressPaintable.paint(graphics);
    }

    public function paintThreed(graphics : Graphics) : Void {
        this.paintableInterface.paintThreed(graphics);
        this.paintedSpecialAnimationInterface.paintThreedXYZ(graphics, 0, 0, 0);
    }

    // synchronized
    public function processGameOver() : Void {
        this.logUtil.putF("Not Implemented since not a game", this, "setGameOver");
    }

    public function demoStateChange() : Void {
        var newState : Int = this.state + 1;
        if (newState > 2) {
            newState = 0;
        } else if (newState == 2) {
            if (!this.highScoresHelper.isAnyHighScores()) {
                newState = 0;
            } else {
                final highScores : HighScores = this.highScoresHelper.getNextHighScores();
                if (highScores == NullHighScoresSingletonFactory.getInstance()) {
                    newState = 0;
                } else {
                    this.getRealHighScoresPaintable().setHighScores(highScores);
                }
            }
        }
        this.setState(newState);
        this.updateDemoState();
    }

    private final SET_STATE : String = "setState";
    public function updateDemoState() : Void {
        PreLogUtil.put(Std.string(SmallIntegerSingletonFactory.getInstance().createInstance(this.state)), this, this.SET_STATE);
        this.getBasicGameDemoPaintable().setState(this.state);
        if (this.state == 0) {
            this.highScoresPaintable = NullPaintable.getInstance();
            this.paintedSpecialAnimationInterface = this.getSpecialAnimationInterface();
            this.getSpecialAnimationInterface().reset();
        } else if (this.state == 1) {
            this.paintedSpecialAnimationInterface = SpecialAnimation.getInstance();
        } else if (this.state == 2) {
            this.highScoresPaintable = this.getRealHighScoresPaintable();
        }
        var gameAdState : GameAdState = this.gameAdStateFactory.getCurrentInstance();
        gameAdState.processPageAdState();
    }

    // throws Exception
    public function getNextRandom() : Int {
        throw new jre.lang.JavaException(this.commonStrings.NOT_IMPLEMENTED);
    }

    // throws Exception
    public function createGameLayerManager(randomValue : Int) : AllBinaryGameLayerManager {
        throw new jre.lang.JavaException(this.commonStrings.NOT_IMPLEMENTED);
    }

    // throws Exception
    public function createRunnable(randomLevel : Int) : GameCanvasRunnableInterface {
        throw new jre.lang.JavaException(this.commonStrings.NOT_IMPLEMENTED);
    }

    // throws Exception
    public function createCanvas() : Void {
        this.highScoresPaintable = NullPaintable.getInstance();
        var randomLevel : Int = this.getNextRandom();
    }

    // throws Exception
    public function start() : Void {
    }

    public function preDemoProcess() : Void {
        this.overlayPaintable.update();
    }

    // throws Exception
    public override function process() : Void {
        this.getMenuInputProcessor().processInputList();
        this.preDemoProcess();
        if (this.state == 0) {
            final indexedAnimationBehavior : IndexedAnimationBehavior = (cast this.getSpecialAnimationInterface().getAnimationBehavior() : IndexedAnimationBehavior);
            if (indexedAnimationBehavior.loopIndex < 1) {
                this.timeDelayHelper.setStartTimeTNT();
            }
            var demoGameMidlet : DemoGameMidlet = (cast this.getCustomCommandListener() : DemoGameMidlet);
        }
    }

    // throws Exception
    public function startDemoGame() : Void {
    }

    // throws Exception
    public function processGame() : Void {
        this.gameRunnable.run();
        this.specialAnimationInterface.nextFrame();
        this.process();
    }

    public override function run() : Void {
        this.logUtil.putF(this.commonStrings.START_RUNNABLE, this, this.commonStrings.RUN);
        try {
            final progressCanvas : ProgressCanvas = ProgressCanvasFactory.getInstance();
            progressCanvas.addNormalPortion(50, "Demo Thread");
            this.setCurrentThread();
            this.setRunning(true);
            if (this.features.isFeature(MainFeatureFactory.getInstance().LOAD_ONDEMAND)) {
                progressCanvas.end();
            } else {
                progressCanvas.addNormalPortion(50, "Demo Thread Running");
            }
            this.fullScreenUtil.initOnRun(this, this.getCustomCommandListener());
            this.initMenu();
            this.initPostPaint();
            this.updateDemoState();
            if (this.features.isDefault(this.openGLFeatureFactory.OPENGL_AS_GAME_THREAD)) {
                OpenGLThreadUtil.getInstance().onResume();
            }
            if (this.features.isDefault(this.openGLFeatureFactory.OPENGL_AS_GAME_THREAD) || J2MEUtil.isHTML()) {
            } else {
                while (this.isRunning()) {
                    this.loopTimeHelper.setStartTimeTNT();
                    this.processGame();
                    this.processLoopSleep();
                }
                this.end();
            }
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.RUN, e);
        }
        this.logUtil.putF(this.commonStrings.END_RUNNABLE, this, this.commonStrings.RUN);
    }

    public override function setRunning(running : Bool) : Void {
        super.setRunning(running);
        try {
            if ((this.features.isDefault(this.openGLFeatureFactory.OPENGL) || J2MEUtil.isHTML()) && !running) {
                final currentDisplayableFactory : CurrentDisplayableFactory = CurrentDisplayableFactory.getInstance();
                currentDisplayableFactory.clearRunnable();
                this.end();
            }
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.SET_RUNNING, e);
        }
    }

    private static final BOT_GAME_STATS : String = "Bot Game Statistics: ";
    private final baseGameStatistics : BaseGameStatistics = GameStatisticsFactory.getInstance();
    // throws Exception
    public function end() : Void {
        final progressCanvas : ProgressCanvas = ProgressCanvasFactory.getInstance();
        this.baseGameStatistics.add(Std.string(new StringMaker().append(StartCanvas.BOT_GAME_STATS).append(Std.string(this.baseGameStatistics)).append(CommonSeps.getInstance().NEW_LINE)));
        this.baseGameStatistics.init();
        if (this.features.isFeature(MainFeatureFactory.getInstance().LOAD_ONDEMAND)) {
            progressCanvas.start();
        }
        this.logUtil.putF("Demo End", this, this.commonStrings.RUN);
        this.close();
        DisplayChangeEventHandler.getInstance().removeListener(this);
    }

    public function setGameState(gameState : GameState) : Void {
    }

    public function getGameState() : GameState {
        return this.gameStateFactory.PLAYING_GAME_STATE;
    }

    public function getState() : Int {
        return this.state;
    }

    public function setState(state : Int) : Void {
        this.state = state;
    }

    public function isHighScoreSubmitted() : Bool {
        this.logUtil.putF("Wow the AI got a high score!", this, "isHighScoreSubmitted");
        return false;
    }

    public function getRealHighScoresPaintable() : HighScoresPaintable {
        return this.realHighScoresPaintable;
    }

    public function setSpecialAnimationInterface(specialAnimationInterface : SpecialAnimation) : Void {
        specialAnimationInterface.setFrame(0);
        this.specialAnimationInterface = specialAnimationInterface;
    }

    public function getSpecialAnimationInterface() : SpecialAnimation {
        return this.specialAnimationInterface;
    }

    public function setPaintableInterface(paintableInterface : PaintableInterface) : Void {
        this.paintableInterface = paintableInterface;
    }

    public function getPaintableInterface() : PaintableInterface {
        return this.paintableInterface;
    }

    public function setDefaultPaintableInterface(defaultPaintableInterface : Paintable) : Void {
        this.defaultPaintableInterface = defaultPaintableInterface;
    }

    public function getDefaultPaintableInterface() : Paintable {
        return this.defaultPaintableInterface;
    }

    public function getHighScoresFactoryInterface() : HighScoresFactoryInterface {
        return this.highScoresFactoryInterface;
    }

    public function setMenuInputProcessor(menuInputProcessor : BasicMenuInputProcessor) : Void {
        this.menuInputProcessor = menuInputProcessor;
    }

    public function getMenuInputProcessor() : BasicMenuInputProcessor {
        return this.menuInputProcessor;
    }

    public function getMenuForm() : ScrollSelectionForm {
        return this.menuForm;
    }

    public function setMenuForm(menuForm : ScrollSelectionForm) : Void {
        this.menuForm = menuForm;
    }

    public function isInitialized() : Bool {
        return this.initialized;
    }

    public function getOverlayPaintable() : Paintable {
        return this.overlayPaintable;
    }

    public function setBasicGameDemoPaintable(basicGameDemoPaintable : StatePaintable) : Void {
        this.basicGameDemoPaintable = basicGameDemoPaintable;
    }

    public function getBasicGameDemoPaintable() : StatePaintable {
        return this.basicGameDemoPaintable;
    }

    public function setTempWait(tempWait : Int) : Void {
        this.tempWait = tempWait;
    }

    public function getTempWait() : Int {
        return this.tempWait;
    }

    public override function isSingleThread() : Bool {
        return OpenGLFeatureUtil.getInstance().isAnyThreed() || SWTUtil.isSWT;
    }

    public function isRunningInAnotherThread() : Bool {
        final features : Features = Features.getInstance();
        final openGLFeatureFactory : OpenGLFeatureFactory = OpenGLFeatureFactory.getInstance();
        if (features.isDefault(openGLFeatureFactory.OPENGL_AS_GAME_THREAD)) {
            return true;
        } else {
            return this.isRunning();
        }
    }

    public function getGameInitializationInterfaceFactoryInterface() : BasicBuildGameInitializerFactory {
        return this.gameInitializationInterfaceFactoryInterface;
    }

    public override function getTitle() : String {
        return super.getTitle();
    }

    public override function isPaused() : Bool {
        return super.isPaused();
    }

    public override function getType() : Int {
        return super.getType();
    }

}

