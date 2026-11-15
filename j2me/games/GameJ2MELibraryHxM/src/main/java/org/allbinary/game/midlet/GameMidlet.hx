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
package org.allbinary.game.midlet;

//import java.util.Enumeration;
//import javax.microedition.lcdui.Canvas;
//import javax.microedition.lcdui.Command;
//import javax.microedition.lcdui.CommandListener;
//import javax.microedition.lcdui.Displayable;
//import javax.microedition.lcdui.NullCanvas;
//import javax.microedition.midlet.MIDletStateChangeException;
import org.allbinary.J2MEUtil;
import org.allbinary.TsUtil;
import org.allbinary.business.advertisement.GameAdStateFactory;
import org.allbinary.canvas.FullScreenUtil;
import org.allbinary.canvas.GameStatisticsFactory;
import org.allbinary.debug.DebugFactory;
import org.allbinary.debug.DebugInterface;
import org.allbinary.game.GameAdState;
import org.allbinary.game.GameInfo;
import org.allbinary.game.GameMode;
import org.allbinary.game.GameStrings;
import org.allbinary.game.GameTypeFactory;
import org.allbinary.game.PlayerTypesFactory;
import org.allbinary.game.commands.GameCommandsFactory;
import org.allbinary.game.configuration.GameOptionsForm;
import org.allbinary.game.configuration.GameOptionsFormFactory;
import org.allbinary.game.configuration.InGameFeatures;
import org.allbinary.game.configuration.InGameOptionsForm;
import org.allbinary.game.configuration.InGameOptionsFormFactory;
import org.allbinary.game.configuration.LoadGameForm;
import org.allbinary.game.configuration.event.ChangedGameFeatureListener;
import org.allbinary.game.configuration.event.GameFeatureEventHandler;
import org.allbinary.game.configuration.feature.Features;
import org.allbinary.game.configuration.feature.GameFeatureFormUtil;
import org.allbinary.game.configuration.feature.MainFeatureFactory;
import org.allbinary.game.configuration.persistance.GamePersistanceSingleton;
import org.allbinary.game.configuration.persistance.KeyValuePersistance;
import org.allbinary.game.displayable.canvas.AllBinaryGameCanvas;
import org.allbinary.game.displayable.canvas.BasicPaintablesCanvas;
import org.allbinary.game.displayable.canvas.DemoCanvas;
import org.allbinary.game.displayable.canvas.GameCanvasRunnableInterface;
import org.allbinary.game.displayable.canvas.GameEventHandlerUtil;
import org.allbinary.game.displayable.canvas.GameInputMappingCanvas;
import org.allbinary.game.displayable.canvas.GameInputMappingInstructionsCanvas;
import org.allbinary.game.displayable.canvas.MenuListener;
import org.allbinary.game.displayable.canvas.NullGameCanvasRunnable;
import org.allbinary.game.input.TextNotificationUtil;
import org.allbinary.game.layer.AllBinaryGameLayerManager;
import org.allbinary.game.layer.hud.event.GameNotificationEventHandler;
import org.allbinary.game.paint.help.HelpPaintable;
import org.allbinary.game.score.HighScoreCommands;
import org.allbinary.game.score.HighScoreCommandsFactory;
import org.allbinary.game.score.displayable.HighScoreTextBox;
import org.allbinary.game.score.displayable.HighScoreUtil;
import org.allbinary.game.score.displayable.HighScoresCanvas;
import org.allbinary.game.state.GameStateFactory;
import org.allbinary.graphics.ResizableListenerHandler;
import org.allbinary.graphics.canvas.transition.progress.ProgressCanvas;
import org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory;
import org.allbinary.graphics.color.BasicColorFactory;
import org.allbinary.graphics.color.ColorChangeEventHandler;
import org.allbinary.graphics.displayable.CanvasStrings;
import org.allbinary.graphics.displayable.MyCanvas;
import org.allbinary.graphics.displayable.command.MyCommandsFactory;
import org.allbinary.graphics.displayable.screen.AboutCommandProcessor;
import org.allbinary.graphics.displayable.screen.AboutPaintableFactory;
import org.allbinary.graphics.displayable.screen.CommandForm;
import org.allbinary.graphics.displayable.screen.WebCommandProcessor;
import org.allbinary.input.AllBinarySensorManager;
import org.allbinary.input.event.VirtualKeyboardEventHandler;
import org.allbinary.input.motion.gesture.observer.BasicMotionGesturesHandler;
import org.allbinary.logic.communication.log.ForcedLogUtil;
import org.allbinary.logic.communication.log.PreLogUtil;
import org.allbinary.logic.math.SmallIntegerSingletonFactory;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.system.security.licensing.ClientInformationFactory;
import org.allbinary.logic.system.security.licensing.InApplicationPurchaseFactory;
import org.allbinary.logic.system.security.licensing.LockableFeature;
import org.allbinary.logic.system.security.licensing.LockableFeatureFactory;
import org.allbinary.logic.util.event.AllBinaryEventObject;
import org.allbinary.logic.util.event.EventStrings;
import org.allbinary.media.audio.AllBinaryMediaManager;
import org.allbinary.midlet.MidletStrings;
import org.allbinary.midlet.ProgressMidlet;
import org.allbinary.thread.NullThread;
import org.allbinary.thread.ThreadFactoryUtil;
import org.allbinary.thread.ThreadUtil;
import org.allbinary.time.TimeDelayHelper;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.EnumerationUtil;
import org.allbinary.logic.StdUtil;
import org.allbinary.util.ABHashtable;

class GameMidlet extends ProgressMidlet implements CommandListener {
    private final enumerationUtil : EnumerationUtil = EnumerationUtil.getInstance();
    public final basicColorFactory : BasicColorFactory = BasicColorFactory.getInstance();
    public final features : Features = Features.getInstance();
    public final midletStrings : MidletStrings = MidletStrings.getInstance();
    public final myCommandsFactory : MyCommandsFactory = MyCommandsFactory.getInstance();
    public final gameStrings : GameStrings = GameStrings.getInstance();
    public final gameAdStateFactory : GameAdStateFactory = GameAdStateFactory.getInstance();
    public final gameStateFactory : GameStateFactory = GameStateFactory.getInstance();
    public final tsUtil : TsUtil = TsUtil.getInstance();
    private final DISPLAYABLE : String = " Displayable: ";
    private final COMMAND_NAME : String = "command Name/Label: ";
    private final NO_COMMAND : String = "No Command";
    private final NO_DISPLAYABLE : String = "No Displayable";
    private final COMMAND_ACTION : String = new StringMaker().append("GameMidlet::").append(this.midletStrings.COMMAND_ACTION).toString();
    private final PAUSE_APP_BACKGROUND : String = "pauseAppBackground";
    private final UN_PAUSE_APP_BACKGROUND : String = "unPauseAppBackground";
    private final aboutCommandProcessor : AboutCommandProcessor = AboutCommandProcessor.getInstance();
    private final webCommandProcessor : WebCommandProcessor = WebCommandProcessor.getInstance();
    private final gameMidletStateFactory : GameMidletStateFactory = GameMidletStateFactory.getInstance();
    public final gameStartTimeHelper : TimeDelayHelper = new TimeDelayHelper(240);
    private final fullScreenUtil : FullScreenUtil = FullScreenUtil.getInstance();
    private final debugInterface : DebugInterface;
    private var allbinaryGameCanvasRunnableInterface : GameCanvasRunnableInterface = NullGameCanvasRunnable.NULL_GAME_CANVAS_RUNNABLE;
    private var thread : Thread = NullThread.NULL_THREAD;
    private var loadGameForm : CommandForm;
    private var isFullScreen : Bool = false;
    private var resized : Bool = false;
    public function new(clientInformationFactory : ClientInformationFactory) {
        super(clientInformationFactory);
        SmallIntegerSingletonFactory.getInstance().initWithRange(0x291, 6);
        this.loadGameForm = CommandForm.getNullCommandForm();
        final progressCanvas : ProgressCanvas = ProgressCanvasFactory.getInstance();
        progressCanvas.init(this);
        GameFeatureEventHandler.getInstance().addListenerInterface(ChangedGameFeatureListener.getInstance());
        GamePersistanceSingleton.getInstance().clear();
        this.debugInterface = DebugFactory.getInstance();
        this.init();
    }

    public function init() : Void {
    }

    // throws Exception
    public function setDemo() : Void {
        throw new haxe.Exception(this.commonStrings.NOT_IMPLEMENTED);
    }

    // throws Exception
    public function createGame() : Void {
        throw new haxe.Exception(this.commonStrings.NOT_IMPLEMENTED);
    }

    // throws Exception
    public function mediaShutdown() : Void {
        throw new haxe.Exception(this.commonStrings.NOT_IMPLEMENTED);
    }

    public function stopAll() : Void {
    }

    public override function pauseApp() : Void {
        this.pauseAppBackground(true);
        final gameAdState : GameAdState = this.gameAdStateFactory.getCurrentInstance();
        gameAdState.getAdvertisements().stopAll();
    }

    public function pauseAppBackground(background : Bool) : Void {
        this.logUtil.putF(this.commonStrings.START, this, this.PAUSE_APP_BACKGROUND);
        if (this.allbinaryGameCanvasRunnableInterface != NullGameCanvasRunnable.NULL_GAME_CANVAS_RUNNABLE) {
            this.allbinaryGameCanvasRunnableInterface.pause();
        } else {
            this.logUtil.putF("<<<<<< Null", this, this.PAUSE_APP_BACKGROUND);
        }
        AllBinarySensorManager.getInstance().shutdown();
    }

    public function unPauseApp() : Void {
        this.unPauseAppBackground(true);
        final gameAdState : GameAdState = this.gameAdStateFactory.getCurrentInstance();
        gameAdState.getAdvertisements().startAll();
    }

    public function unPauseAppBackground(background : Bool) : Void {
        this.logUtil.putF(this.commonStrings.START, this, this.UN_PAUSE_APP_BACKGROUND);
        AllBinarySensorManager.getInstance().init();
        final gameCanvasRunnableInterface : GameCanvasRunnableInterface = this.allbinaryGameCanvasRunnableInterface;
        if (gameCanvasRunnableInterface != NullGameCanvasRunnable.NULL_GAME_CANVAS_RUNNABLE) {
            gameCanvasRunnableInterface.unPause();
        } else {
            this.logUtil.putF("<<<<<< Null", this, this.UN_PAUSE_APP_BACKGROUND);
        }
    }

    public override function destroyAppInRunnable(unconditional : Bool, isProgress : Bool) : Void {
        final progressCanvas : ProgressCanvas = ProgressCanvasFactory.getInstance();
        if (isProgress) {
            progressCanvas.start();
            this.commandAction(this.myCommandsFactory.SET_DISPLAYABLE, progressCanvas);
        }
        this.destroyApp(unconditional);
        if (isProgress) {
            progressCanvas.end();
        }
    }

    public override function destroyApp(unconditional : Bool) : Void {
        final METHOD_NAME : String = "GameMidlet::destroyApp";
        try {
            PreLogUtil.put(GameStatisticsFactory.getInstance().toString(), this, METHOD_NAME);
            final gameAdState : GameAdState = this.gameAdStateFactory.getCurrentInstance();
            gameAdState.getAdvertisements().stopAll();
            if (!this.isDestroyed()) {
                this.stopGameCanvasRunnableInterface();
                this.setGameCanvasRunnableInterface(NullGameCanvasRunnable.NULL_GAME_CANVAS_RUNNABLE);
                this.mediaShutdown();
            } else {
                this.logUtil.putF("Midlet Managment Error: Midlet Should Only Be Destroyed Once", this, METHOD_NAME);
            }
            super.destroyApp(true);
            PreLogUtil.put(this.commonStrings.END, this, METHOD_NAME);
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, METHOD_NAME, e);
        }
        this.logUtil.putF(this.commonStrings.END, this, METHOD_NAME);
    }

    // throws MIDletStateChangeException
    public override function startApp() : Void {
        try {
            final gameAdState : GameAdState = this.gameAdStateFactory.getCurrentInstance();
            gameAdState.getAdvertisements().startAll();
            final START_APP : String = "startApp";
            this.logUtil.putF(this.commonStrings.START, this, START_APP);
            final gameCanvasRunnableInterface : Any = this.allbinaryGameCanvasRunnableInterface;
            if (gameCanvasRunnableInterface == NullGameCanvasRunnable.NULL_GAME_CANVAS_RUNNABLE) {
                this.gameMidletStateFactory.setCurrentGameState(this.gameStateFactory.NO_GAME_STATE);
                this.setDemo();
            } else {
                this.logUtil.putF("GameCanvasRunnableInterface is available", this, START_APP);
                if (gameCanvasRunnableInterface == this.getCurrentDisplayable()) {
                    this.unPauseAppBackground(false);
                } else {
                    this.logUtil.putF("GameCanvasRunnableInterface is not current displayable", this, START_APP);
                }
            }
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "startApp", e);
            this.destroyApp(false);
            this.notifyDestroyed();
        }
    }

    // synchronized
    public override function commandAction(command : Command, displayable : Displayable) : Void {
        try {
            var displayableAsString : String = this.NO_DISPLAYABLE;
            if (displayable != null) {
                displayableAsString = displayable.toString();
            }
            var label : String = this.NO_COMMAND;
            if (command != null) {
                label = command.getLabel();
            }
            PreLogUtil.put(new StringMaker().append(this.COMMAND_NAME).append(label).append(this.DISPLAYABLE).append(displayableAsString).toString(), this, this.COMMAND_ACTION);
            final gameCommandsFactory : GameCommandsFactory = GameCommandsFactory.getInstance();
            final allbinaryGameCanvasRunnableInterface : GameCanvasRunnableInterface = this.allbinaryGameCanvasRunnableInterface;
            final gameCanvasRunnableInterface : Any = allbinaryGameCanvasRunnableInterface;
            if (command == gameCommandsFactory.SHOW_GAME_CANVAS) {
                if (this.getDisplay().getCurrent() != gameCanvasRunnableInterface && allbinaryGameCanvasRunnableInterface.getType() != NullGameCanvasRunnable.NULL_GAME_CANVAS_RUNNABLE.getType()) {
                    this.setDisplay((cast gameCanvasRunnableInterface : Displayable));
                }
                this.unPauseAppBackground(false);
            } else if (command == gameCommandsFactory.CLOSE_AND_SHOW_GAME_CANVAS) {
                final menuListener : MenuListener = (cast displayable : MenuListener);
                menuListener.close();
                this.setDisplay((cast gameCanvasRunnableInterface : Displayable));
                this.unPauseAppBackground(false);
            } else if (command == gameCommandsFactory.EXIT_COMMAND) {
                if (GameMidletEventHandler.getInstance().getEventListenerInterfaceListP().size() == 0) {
                    this.exitProgress(true);
                }
                GameMidletEventHandler.getInstance().fireEvent(new DemoGameMidletEvent(this, DemoGameMidletStateFactory.getInstance().NONE));
            } else if (command == gameCommandsFactory.EXIT_WITHOUT_PROGRESS_COMMAND) {
                this.exitProgress(false);
            } else if (command == gameCommandsFactory.START_COMMAND || command == gameCommandsFactory.RESTART_COMMAND || command == gameCommandsFactory.CONTINUE_COMMAND) {
                if (this.gameMidletStateFactory.getCurrentGameState() != this.gameStateFactory.PLAYING_GAME_STATE || command == gameCommandsFactory.RESTART_COMMAND) {
                    if (this.gameStartTimeHelper.isTimeTNT()) {
                        if (command == gameCommandsFactory.START_COMMAND && this.isDemoLoading()) {
                            this.logUtil.putF("Trying to Start Game Before Loading Complete", this, this.midletStrings.COMMAND_ACTION);
                        } else {
                            this.startedBefore = true;
                            this.createGame();
                            this.gameMidletStateFactory.setCurrentGameState(this.gameStateFactory.PLAYING_GAME_STATE);
                        }
                    } else {
                        this.logUtil.putF("Starting Game Too Often", this, this.midletStrings.COMMAND_ACTION);
                    }
                } else {
                    this.logUtil.putF("Already in playing state", this, this.COMMAND_ACTION);
                }
            } else if (command == gameCommandsFactory.BUY_COMMAND) {
                var inApplicationPurchaseFactory : InApplicationPurchaseFactory = InApplicationPurchaseFactory.getInstance();
                final list : BasicArrayList = LockableFeatureFactory.getInstance().getList();
                final lockableFeature : LockableFeature = (cast list.get(0) : LockableFeature);
                if (list.size() > 0 && !inApplicationPurchaseFactory.isPurchased(lockableFeature)) {
                    inApplicationPurchaseFactory.purchase(lockableFeature);
                } else {
                    TextNotificationUtil.getInstance().fireSuccess("Already Purchased");
                }
            } else if (command == gameCommandsFactory.QUIT_COMMAND) {
                if (this.gameStartTimeHelper.isTimeTNT()) {
                    if (Std.isOfType(displayable, HighScoreTextBox)) {
                        final menuListener : MenuListener = (cast displayable : MenuListener);
                        menuListener.close();
                    }
                    this.stopGameCanvasRunnableInterface();
                    this.gameMidletStateFactory.setCurrentGameState(this.gameStateFactory.NO_GAME_STATE);
                    this.setDemo();
                }
            } else if (command == this.myCommandsFactory.RESUME_COMMAND) {
                this.unPauseAppBackground(false);
            } else if (command == this.myCommandsFactory.PAUSE_COMMAND) {
                this.pauseAppBackground(false);
            } else if (command == this.myCommandsFactory.SET_DISPLAYABLE) {
                this.pauseAppBackground(false);
                this.setDisplay(displayable);
            } else if (command == gameCommandsFactory.SET_MENU_DISPLAYABLE) {
                this.pauseAppBackground(false);
                final menuListener : MenuListener = (cast displayable : MenuListener);
                menuListener.open();
                this.setDisplay(displayable);
            } else if (command == gameCommandsFactory.START_TRACE) {
                this.debugInterface.start();
                final gameCanvas : AllBinaryGameCanvas = (cast allbinaryGameCanvasRunnableInterface : AllBinaryGameCanvas);
                gameCanvas.addCommand(gameCommandsFactory.STOP_TRACE);
                gameCanvas.removeCommand(gameCommandsFactory.START_TRACE);
            } else if (command == gameCommandsFactory.STOP_TRACE) {
                this.pauseAppBackground(false);
                this.debugInterface.stop();
                this.unPauseAppBackground(false);
                final gameCanvas : AllBinaryGameCanvas = (cast allbinaryGameCanvasRunnableInterface : AllBinaryGameCanvas);
                gameCanvas.addCommand(gameCommandsFactory.START_TRACE);
                gameCanvas.removeCommand(gameCommandsFactory.STOP_TRACE);
            } else if (command == gameCommandsFactory.DEFAULT_OPTIONS) {
                final tempDisplayable : Displayable = displayable;
                if (Std.isOfType(tempDisplayable, GameOptionsForm)) {
                    GameFeatureFormUtil.getInstance().setDefault((cast tempDisplayable : CommandForm));
                }
            } else if (command == GameInputMappingInstructionsCanvas.DISPLAY) {
                final tempDisplayable : Displayable = displayable;
                if (Std.isOfType(tempDisplayable, GameInputMappingCanvas)) {
                    var gameInputMappingCanvas : GameInputMappingCanvas = (cast tempDisplayable : GameInputMappingCanvas);
                    gameInputMappingCanvas.update();
                }
                this.commandAction(gameCommandsFactory.SET_MENU_DISPLAYABLE, this.getInputMappingInstructionsCanvas());
            } else if (HighScoreCommandsFactory.getInstance().isHighScoreCommand(command)) {
                final tempDisplayable : Displayable = displayable;
                if (Std.isOfType(tempDisplayable, HighScoresCanvas)) {
                    final highScoresCanvas : HighScoresCanvas = (cast tempDisplayable : HighScoresCanvas);
                    highScoresCanvas.updateCommand(command);
                }
            } else if (command == HighScoreCommands.getInstance().DISPLAY) {
                this.commandAction(gameCommandsFactory.SET_MENU_DISPLAYABLE, this.createHighScoresCanvas());
            } else if (command == GameInputMappingInstructionsCanvas.CLOSE) {
                final menuListener : MenuListener = (cast displayable : MenuListener);
                menuListener.close();
                this.commandAction(GameInputMappingCanvas.DISPLAY, NullCanvas.NULL_CANVAS);
            } else if (command == GameInputMappingCanvas.DISPLAY) {
                if (J2MEUtil.isHTML()) {
                    this.pauseAppBackground(false);
                }
                this.commandAction(gameCommandsFactory.SET_MENU_DISPLAYABLE, this.getInputMappingCanvas());
            } else if (command == GameInputMappingCanvas.DEFAULT) {
                final tempDisplayable : Displayable = displayable;
                if (Std.isOfType(tempDisplayable, GameInputMappingCanvas)) {
                    var gameInputMappingCanvas : GameInputMappingCanvas = (cast tempDisplayable : GameInputMappingCanvas);
                    gameInputMappingCanvas.setDefault();
                }
            } else if (command == InGameOptionsForm.DISPLAY) {
                this.pauseAppBackground(false);
                final progressCanvas : ProgressCanvas = ProgressCanvasFactory.getInstance();
                progressCanvas.addNormalPortion(50, "In Game Options");
                final layerManager : AllBinaryGameLayerManager = this.createGameLayerManager();
                final inGameOptionsFormFactory : InGameOptionsFormFactory = InGameOptionsFormFactory.getInstance();
                inGameOptionsFormFactory.init(this, new InGameFeatures(), "Options In Game", layerManager.getBackgroundBasicColor(), layerManager.getForegroundBasicColor());
                final inGameOptionsForm : CommandForm = inGameOptionsFormFactory.get();
                inGameOptionsForm.setItemStateListener(allbinaryGameCanvasRunnableInterface);
                this.commandAction(gameCommandsFactory.SET_MENU_DISPLAYABLE, inGameOptionsForm);
            } else if (command == InGameOptionsForm.DEFAULT) {
                final inGameOptionsForm : InGameOptionsForm = (cast InGameOptionsFormFactory.getInstance().get() : InGameOptionsForm);
                GameFeatureFormUtil.getInstance().setDefault(inGameOptionsForm);
            } else if (command == gameCommandsFactory.DISPLAY_OPTIONS) {
                AllBinaryMediaManager.setMuted(true);
                this.stopAll();
                final mainFeatureFactory : MainFeatureFactory = MainFeatureFactory.getInstance();
                this.isFullScreen = this.features.isFeature(mainFeatureFactory.FULL_SCREEN);
                ResizableListenerHandler.getInstance().fireEvent(true);
                this.setResized(false);
                this.commandAction(gameCommandsFactory.SET_MENU_DISPLAYABLE, this.getGameOptionsForm());
            } else if (command == gameCommandsFactory.CLOSE_OPTIONS) {
                ResizableListenerHandler.getInstance().fireEvent(false);
                this.commandAction(gameCommandsFactory.CLOSE_AND_SHOW_GAME_CANVAS, displayable);
                final stringBuffer : StringMaker = new StringMaker();
                stringBuffer.append("Close isFullScreen/change: ");
                stringBuffer.appendboolean(this.isFullScreen);
                stringBuffer.appendboolean(this.fullScreenUtil.isScreenChange(this.isFullScreen));
                stringBuffer.append(" isResized: ");
                stringBuffer.appendboolean(this.isResized());
                PreLogUtil.put(stringBuffer.toString(), this, this.COMMAND_ACTION);
                if (this.isResized() || this.fullScreenUtil.isScreenChange(this.isFullScreen)) {
                    this.updateFullScreen();
                }
                AllBinaryMediaManager.setMuted(false);
            } else if (command == gameCommandsFactory.DISPLAY_LOAD_FORM) {
                this.pauseAppBackground(false);
                final keyValuePersistance : KeyValuePersistance = GamePersistanceSingleton.getInstance();
                keyValuePersistance.clear();
                keyValuePersistance.loadAll(this.abeClientInformation);
                if (this.getLoadGameForm() == CommandForm.getNullCommandForm()) {
                    final layerManager : AllBinaryGameLayerManager = this.createGameLayerManager();
                    this.setLoadGameForm(new LoadGameForm(this, "Load Game", layerManager.getBackgroundBasicColor(), layerManager.getForegroundBasicColor()));
                } else {
                    this.getLoadGameForm().update();
                }
                this.commandAction(gameCommandsFactory.SET_MENU_DISPLAYABLE, this.getLoadGameForm());
            } else if (command == gameCommandsFactory.LOAD_FILE) {
                final loadGameForm : LoadGameForm = (cast this.getLoadGameForm() : LoadGameForm);
                final index : Int = loadGameForm.getSelectedId();
                if (index != -1) {
                    final keyValuePersistance : KeyValuePersistance = GamePersistanceSingleton.getInstance();
                    this.setStartStateHashtable(keyValuePersistance.get(index));
                    final menuListener : MenuListener = this.getLoadGameForm();
                    menuListener.close();
                    PreLogUtil.put(BasicMotionGesturesHandler.getInstance().toString(), this, this.COMMAND_ACTION);
                    this.commandAction(gameCommandsFactory.START_COMMAND, NullCanvas.NULL_CANVAS);
                    PreLogUtil.put(BasicMotionGesturesHandler.getInstance().toString(), this, this.COMMAND_ACTION);
                }
            } else if (command == gameCommandsFactory.DELETE_FILE) {
                final loadGameForm : LoadGameForm = (cast this.getLoadGameForm() : LoadGameForm);
                final index : Int = loadGameForm.getSelectedText();
                if (index != -1) {
                    final keyValuePersistance : KeyValuePersistance = GamePersistanceSingleton.getInstance();
                    keyValuePersistance.delete(this.abeClientInformation, index);
                    keyValuePersistance.clear();
                    keyValuePersistance.loadAllSize(this.abeClientInformation, 1);
                    this.getLoadGameForm().update();
                }
            } else if (command == gameCommandsFactory.SAVE) {
                final keyValuePersistance : KeyValuePersistance = GamePersistanceSingleton.getInstance();
                this.pauseAppBackground(false);
                keyValuePersistance.save(this.abeClientInformation, this.getCurrentStateHashtable());
                this.unPauseAppBackground(false);
            } else if (command == HighScoreUtil.SUBMIT_TEXTBOX_COMMAND) {
                this.logUtil.putF("Submitted Score", this, this.COMMAND_ACTION);
                if (Std.isOfType(displayable, HighScoreTextBox)) {
                    final highScoreTextBox : HighScoreTextBox = (cast displayable : HighScoreTextBox);
                    highScoreTextBox.submitted = true;
                }
                allbinaryGameCanvasRunnableInterface.setHighScoreSubmitted(true);
                this.commandAction(gameCommandsFactory.CLOSE_AND_SHOW_GAME_CANVAS, displayable);
            } else if (command == gameCommandsFactory.DISPLAY_ABOUT) {
                this.aboutCommandProcessor.process(this, gameCommandsFactory.SET_MENU_DISPLAYABLE, this.getAboutCanvas());
            } else if (command == gameCommandsFactory.OPEN_WEB_URL) {
                this.webCommandProcessor.process(this, gameCommandsFactory.OPEN_WEB_URL, NullCanvas.NULL_CANVAS);
            } else if (command == gameCommandsFactory.TOGGLE_KEYBOARD) {
                final virtualKeyboardEventHandler : VirtualKeyboardEventHandler = VirtualKeyboardEventHandler.getInstance();
                virtualKeyboardEventHandler.fireEvent(virtualKeyboardEventHandler.SHOW_EVENT);
            } else if (this.tsUtil.compareTo(command.getLabel(), gameCommandsFactory.TOGGLE_FULLSCREEN.getLabel()) == 0) {
                final mainFeatureFactory : MainFeatureFactory = MainFeatureFactory.getInstance();
                final isFullScreen : Bool = this.features.isFeature(mainFeatureFactory.FULL_SCREEN);
                if (isFullScreen) {
                    this.features.removeDefault(mainFeatureFactory.FULL_SCREEN);
                } else {
                    this.features.addDefault(mainFeatureFactory.FULL_SCREEN);
                }
                this.updateFullScreen();
            }
        } catch (e : haxe.Exception) {
            this.logUtil.put(new StringMaker().append(this.commonStrings.EXCEPTION_LABEL).append(command.getLabel()).toString(), this, this.midletStrings.COMMAND_ACTION, e);
            if (command != GameCommandsFactory.getInstance().EXIT_COMMAND) {
                this.exitProgress(false);
            }
        }
    }

    private function updateFullScreen() : Void {
        final mainFeatureFactory : MainFeatureFactory = MainFeatureFactory.getInstance();
        final isFullScreen : Bool = this.features.isFeature(mainFeatureFactory.FULL_SCREEN);
        final displayable : Displayable = this.getDisplay().getCurrent();
        if (Std.isOfType(displayable, Canvas)) {
            final canvas : Canvas = (cast displayable : Canvas);
            canvas.setFullScreenMode(isFullScreen);
        }
    }

    public function onEvent(eventObject : AllBinaryEventObject) : Void {
        ForcedLogUtil.log(EventStrings.getInstance().PERFORMANCE_MESSAGE, this);
    }

    // throws Exception
    public function getInputMappingInstructionsCanvas() : MyCanvas {
        return new GameInputMappingInstructionsCanvas(this, this.createGameLayerManager());
    }

    // throws Exception
    public function getInputMappingCanvas() : MyCanvas {
        return new GameInputMappingCanvas(this.abeClientInformation, this, this.createGameLayerManager(), this.getHelpPaintable());
    }

    // throws Exception
    public function getAboutCanvas() : MyCanvas {
        return new BasicPaintablesCanvas(this, CanvasStrings.getInstance().ABOUT, this.createGameLayerManager(), AboutPaintableFactory.getInstance().paintableArray);
    }

    // throws Exception
    public function getHelpPaintable() : HelpPaintable {
        throw new haxe.Exception(this.commonStrings.NOT_IMPLEMENTED);
    }

    // throws Exception
    public function createHighScoresCanvas() : HighScoresCanvas {
        throw new haxe.Exception(this.commonStrings.NOT_IMPLEMENTED);
    }

    // throws Exception
    public function startGameCanvasRunnableInterface() : Void {
        final threadFactoryUtil : ThreadFactoryUtil = ThreadFactoryUtil.getInstance();
        this.thread = threadFactoryUtil.getInstanceGameCanvasRunnable(this.allbinaryGameCanvasRunnableInterface);
        this.logUtil.putF(new StringMaker().append("Thread Priority: ").appendint(Std.int(this.thread.getPriority())).toString(), this, "startGameCanvasRunnableInterface");
        this.allbinaryGameCanvasRunnableInterface.setThread(this.thread);
        threadFactoryUtil.start(this.thread);
    }

    // throws Exception
    public function stopGameCanvasRunnableInterface() : Void {
        this.logUtil.putF(this.commonStrings.START, this, this.gameStrings.STOP_GAME_CANVAS_RUNNABLE_INTERFACE);
        GameNotificationEventHandler.getInstance().removeAllListeners();
        ColorChangeEventHandler.getInstance().removeAllListeners();
        GameEventHandlerUtil.removeAllListeners();
        final gameCanvasRunnableInterface : GameCanvasRunnableInterface = this.allbinaryGameCanvasRunnableInterface;
        if (gameCanvasRunnableInterface != NullGameCanvasRunnable.NULL_GAME_CANVAS_RUNNABLE) {
            this.logUtil.putF(new StringMaker().append("Set Running False: ").append(gameCanvasRunnableInterface.toString()).toString(), this, this.gameStrings.STOP_GAME_CANVAS_RUNNABLE_INTERFACE);
            gameCanvasRunnableInterface.setRunning(false);
        } else {
            this.logUtil.putF("StopGame - Could Not Stop", this, this.gameStrings.STOP_GAME_CANVAS_RUNNABLE_INTERFACE);
        }
        ThreadUtil.getInstance().join(this.thread);
        final progressCanvas : ProgressCanvas = ProgressCanvasFactory.getInstance();
        if (this.features.isFeature(MainFeatureFactory.getInstance().LOAD_ALL)) {
            progressCanvas.addNormalPortion(50, "Stopped Game Runnable");
        } else {
            progressCanvas.addNormalPortion(50, "Stopped Main Runnable");
        }
        this.logUtil.putF(this.commonStrings.END, this, this.gameStrings.STOP_GAME_CANVAS_RUNNABLE_INTERFACE);
    }

    public function getGameCanvasRunnableInterface() : GameCanvasRunnableInterface {
        return this.allbinaryGameCanvasRunnableInterface;
    }

    public function setGameCanvasRunnableInterface(gameCanvasRunnableInterface : GameCanvasRunnableInterface) : Void {
        this.allbinaryGameCanvasRunnableInterface = gameCanvasRunnableInterface;
    }

    public function createGameLayerManager() : AllBinaryGameLayerManager {
        final gameInfo : GameInfo = new GameInfo(GameTypeFactory.getInstance().SINGLE_PLAYER, GameMode.SERVER, PlayerTypesFactory.getInstance().PLAYER_TYPE_ONE, 1, 1);
        return new AllBinaryGameLayerManager(this.basicColorFactory.BLACK, this.basicColorFactory.WHITE, gameInfo);
    }

    public function getGameOptionsForm() : CommandForm {
        final layerManager : AllBinaryGameLayerManager = this.createGameLayerManager();
        return GameOptionsFormFactory.getInstance().init(this, "Game Options", layerManager.getBackgroundBasicColor(), layerManager.getForegroundBasicColor());
    }

    // throws Exception
    public function save() : Void {
        this.logUtil.putF(this.commonStrings.START, this, this.commonStrings.SAVE);
        final hashtable : ABHashtable<Any, Any> = this.getCurrentStateHashtable();
        GamePersistanceSingleton.getInstance().save(this.abeClientInformation, hashtable);
    }

    // throws Exception
    public override function getCurrentStateHashtable() : ABHashtable<Any, Any> {
        this.logUtil.putF(this.commonStrings.START, this, "getCurrentStateHashtable");
        final hashtable : ABHashtable<Any, Any> = StdUtil.getInstance().createHashtable();
        if (this.allbinaryGameCanvasRunnableInterface != NullGameCanvasRunnable.NULL_GAME_CANVAS_RUNNABLE) {
            final currentHashtable : ABHashtable<Any, Any> = this.allbinaryGameCanvasRunnableInterface.getCurrentStateHashtable();
            final enumeration : Enumeration = currentHashtable.keys();
            var key : Any = null;
            while (this.enumerationUtil.hasMoreElements(enumeration)) {
                key = this.enumerationUtil.nextElement(enumeration);
                hashtable.put(key, currentHashtable.get(key));
            }
        }
        return hashtable;
    }

    public function setLoadGameForm(loadGameForm : LoadGameForm) : Void {
        this.loadGameForm = loadGameForm;
    }

    public function getLoadGameForm() : CommandForm {
        return this.loadGameForm;
    }

    public function setResized(resized : Bool) : Void {
        this.resized = resized;
    }

    public function isResized() : Bool {
        return this.resized;
    }

    private var startedBefore : Bool = false;
    public function isDemoLoading() : Bool {
        if (this.startedBefore) {
            return false;
        }
        final displayable : Displayable = this.getDisplay().getCurrent();
        if (Std.isOfType(displayable, DemoCanvas)) {
            final demoCanvas : DemoCanvas = (cast displayable : DemoCanvas);
            if (demoCanvas.isDemoLoading()) {
                return true;
            }
        }
        return false;
    }

}

