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

//import javax.microedition.lcdui.ChoiceGroup;
//import javax.microedition.lcdui.CommandListener;
//import javax.microedition.lcdui.Font;
//import javax.microedition.lcdui.Graphics;
//import javax.microedition.lcdui.Item;
//import javax.microedition.lcdui.NullCommandListener;
import org.allbinary.AndroidUtil;
import org.allbinary.J2MEUtil;
import org.allbinary.business.advertisement.GameAdStateFactory;
import org.allbinary.canvas.BaseGameStatistics;
import org.allbinary.canvas.GameStatisticsFactory;
import org.allbinary.canvas.Processor;
import org.allbinary.canvas.RunnableCanvas;
import org.allbinary.debug.DebugFactory;
import org.allbinary.debug.NoDebug;
import org.allbinary.game.GameAdState;
import org.allbinary.game.GameInfo;
import org.allbinary.game.GameStrings;
import org.allbinary.game.GameTypeFactory;
import org.allbinary.game.Intermission;
import org.allbinary.game.IntermissionCompositeInterface;
import org.allbinary.game.IntermissionEnableListenerInterface;
import org.allbinary.game.IntermissionInterface;
import org.allbinary.game.PlayerTypesFactory;
import org.allbinary.game.commands.GameCommandsFactory;
import org.allbinary.game.configuration.InGameFeatures;
import org.allbinary.game.configuration.InGameOptionsForm;
import org.allbinary.game.configuration.event.ChangedGameFeatureListener;
import org.allbinary.game.configuration.event.GameInitializedEvent;
import org.allbinary.game.configuration.event.GameInitializedEventHandler;
import org.allbinary.game.configuration.feature.Features;
import org.allbinary.game.configuration.feature.GameFeatureFactory;
import org.allbinary.game.configuration.feature.GameFeatureUtil;
import org.allbinary.game.configuration.feature.InputFeatureFactory;
import org.allbinary.game.configuration.feature.MainFeatureFactory;
import org.allbinary.game.configuration.feature.SensorFeatureFactory;
import org.allbinary.game.configuration.feature.TouchFeatureFactory;
import org.allbinary.game.displayable.GameLevelDisplayChangeEventListenersFactory;
import org.allbinary.game.init.BasicBuildGameInitializerFactory;
import org.allbinary.game.init.GameInitializationUtil;
import org.allbinary.game.input.GameInputStrings;
import org.allbinary.game.input.InputProcessor;
import org.allbinary.game.input.NoPlayerGameInput;
import org.allbinary.game.input.PlayerGameInput;
import org.allbinary.game.input.event.GameKeyEventHandler;
import org.allbinary.game.layer.AllBinaryGameLayerManager;
import org.allbinary.game.layer.SWTUtil;
import org.allbinary.game.paint.ColorFillBasePaintable;
import org.allbinary.game.paint.ColorFillPaintableFactory;
import org.allbinary.game.resource.ResourceLoadingLevel;
import org.allbinary.game.resource.ResourceLoadingLevelFactory;
import org.allbinary.game.score.HighScore;
import org.allbinary.game.score.HighScoresHelperBaseInterface;
import org.allbinary.game.score.HighScoresFactoryInterface;
import org.allbinary.game.score.HighScoresPaintable;
import org.allbinary.game.score.NullHighScoresSingletonFactory;
import org.allbinary.game.score.displayable.HighScoreTextBox;
import org.allbinary.game.state.GameState;
import org.allbinary.game.state.GameStateFactory;
import org.allbinary.graphics.GraphicsStrings;
import org.allbinary.graphics.Rectangle;
import org.allbinary.graphics.ScreenCapture;
import org.allbinary.graphics.ScreenCaptureFactory;
import org.allbinary.graphics.canvas.transition.progress.ProgressCanvas;
import org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory;
import org.allbinary.graphics.color.BasicColorFactory;
import org.allbinary.graphics.color.BasicColorSetUtil;
import org.allbinary.graphics.displayable.CanvasStrings;
import org.allbinary.graphics.displayable.DisplayInfoSingleton;
import org.allbinary.graphics.displayable.GameTickDisplayInfoSingleton;
import org.allbinary.graphics.displayable.command.MyCommandsFactory;
import org.allbinary.graphics.displayable.event.DisplayChangeEvent;
import org.allbinary.graphics.displayable.event.DisplayChangeEventHandler;
import org.allbinary.graphics.displayable.event.DisplayChangeEventListener;
import org.allbinary.graphics.font.MyFontProcessor;
import org.allbinary.graphics.font.UpdateMyFontInterface;
import org.allbinary.graphics.font.UpdateMyFontProcessor;
import org.allbinary.graphics.form.CommandCurrentSelectionFormFactory;
import org.allbinary.graphics.form.FormPaintable;
import org.allbinary.graphics.form.FormType;
import org.allbinary.graphics.form.FormTypeFactory;
import org.allbinary.graphics.form.ScrollSelectionForm;
import org.allbinary.graphics.form.ScrollSelectionFormNoneFactory;
import org.allbinary.graphics.form.item.CommandTextItemArrayFactory;
import org.allbinary.graphics.form.item.ABCustomItem;
import org.allbinary.graphics.opengles.CurrentDisplayableFactory;
import org.allbinary.graphics.opengles.OpenGLFeatureFactory;
import org.allbinary.graphics.opengles.OpenGLFeatureUtil;
import org.allbinary.graphics.opengles.OpenGLThreadUtil;
import org.allbinary.graphics.paint.InitUpdatePaintable;
import org.allbinary.graphics.paint.NullInitUpdatePaintable;
import org.allbinary.graphics.paint.NullPaintable;
import org.allbinary.graphics.paint.Paintable;
import org.allbinary.graphics.paint.PaintableInterface;
import org.allbinary.image.opengles.OpenGLImageSpecificFactory;
import org.allbinary.input.gyro.SensorGameUpdateProcessor;
import org.allbinary.input.gyro.SingleSensorGameUpdateProcessor;
import org.allbinary.input.motion.button.BaseTouchInput;
import org.allbinary.input.motion.button.NoButtonsTouchInputFactory;
import org.allbinary.input.motion.button.TouchButtonFactory;
import org.allbinary.input.motion.button.TouchButtonsPaintableFactory;
import org.allbinary.input.motion.button.TouchScreenFactory;
import org.allbinary.input.motion.gesture.observer.BasicMotionGesturesHandler;
import org.allbinary.logic.ABSystemWrapper;
import org.allbinary.logic.communication.log.ForcedLogUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.log.PreLogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.system.os.OperatingSystemFactory;
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;
import org.allbinary.logic.util.event.AllBinaryEventObject;
import org.allbinary.logic.util.event.EventStrings;
import org.allbinary.media.audio.AllBinaryMediaManager;
import org.allbinary.media.audio.PlayerQueue;
import org.allbinary.media.audio.PrimaryPlayerQueueFactory;
import org.allbinary.media.audio.SecondaryPlayerQueueFactory;
import org.allbinary.media.audio.SelectSound;
import org.allbinary.string.CommonSeps;
import org.allbinary.string.CommonStrings;
import org.allbinary.thread.SecondaryThreadPool;
import org.allbinary.time.GameTickTimeDelayHelper;
import org.allbinary.time.GameTickTimeDelayHelperFactory;
import org.allbinary.time.TimeDelayHelper;
import org.allbinary.util.ABHashtable;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.util.BasicArrayListUtil;

class AllBinaryGameCanvas extends RunnableCanvas implements AllBinaryGameCanvasInterface implements GameCanvasRunnableInterface implements MenuListener implements IntermissionCompositeInterface implements IntermissionEnableListenerInterface implements PopupMenuInterface implements DisplayChangeEventListener implements UpdateMyFontInterface {
    public final basicColorFactory : BasicColorFactory = BasicColorFactory.getInstance();
    public final basicSetColorUtil : BasicColorSetUtil = BasicColorSetUtil.getInstance();
    public final touchFeatureFactory : TouchFeatureFactory = TouchFeatureFactory.getInstance();
    public final openGLFeatureFactory : OpenGLFeatureFactory = OpenGLFeatureFactory.getInstance();
    public final touchButtonFactory : TouchButtonFactory = TouchButtonFactory.getInstance();
    public final gameAdStateFactory : GameAdStateFactory = GameAdStateFactory.getInstance();
    public final gameStrings : GameStrings = GameStrings.getInstance();
    public final gameInputStrings : GameInputStrings = GameInputStrings.getInstance();
    public final gameStateFactory : GameStateFactory = GameStateFactory.getInstance();
    private final gameTickTimeDelayHelper : GameTickTimeDelayHelper = GameTickTimeDelayHelperFactory.getInstance();
    private final gameTickDisplayInfoSingleton : GameTickDisplayInfoSingleton = GameTickDisplayInfoSingleton.getInstance();
    public final gameRunnable : GameCanvasRunnable = new GameCanvasRunnable(this);
    public final gamePauseRunnable : GameCanvasPauseRunnable = new GameCanvasPauseRunnable(this);
    public final formUtil : FormUtil = FormUtil.getInstance();
    public final myFormUtil : MyFormUtil = MyFormUtil.getInstance();
    private final updateMyFontProcessor : MyFontProcessor = new UpdateMyFontProcessor(this);
    private var myFontProcessor : MyFontProcessor = this.updateMyFontProcessor;
    public var gameSpecificPaintable : Paintable = NullPaintable.getInstance();
    private final sensorGameUpdateProcessor : SensorGameUpdateProcessor = new SingleSensorGameUpdateProcessor();
    public var endGameInfo : EndGameInfo = new EndGameInfo();
    private final startIntermissionInterface : IntermissionInterface = new Intermission();
    private final endLevelIntermissionInterface : IntermissionInterface = new Intermission();
    private static final id : Int = 0;
    public var gameLayerManager : AllBinaryGameLayerManager = AllBinaryGameLayerManager.getNullInstance();
    private var gameState : GameState = this.gameStateFactory.NO_GAME_STATE;
    private var gameOver : Bool = false;
    private var initialized : Bool = false;
    private final gameStateTimeHelper : TimeDelayHelper = new TimeDelayHelper(0);
    public final highScoresHelper : HighScoresHelperBaseInterface;
    private var highScoreSubmitted : Bool = false;
    private final realHighScoresPaintable : HighScoresPaintable = new HighScoresPaintable();
    private var highScoresPaintable : Paintable = NullPaintable.getInstance();
    private var localPlayerGameInputList : BasicArrayList = new BasicArrayListD();
    private var isCheating : Bool = false;
    private var hashtable : ABHashtable<Any, Any> = this.stdUtil.NULL_TABLE;
    private var isSingleKeyRepeatableProcessing : Bool = false;
    private var gameInitializationInterfaceFactoryInterface : BasicBuildGameInitializerFactory = BasicBuildGameInitializerFactory.NULL_BASE_BUILD_GMAE_INITIALIZER_FACTORY;
    private var touchButtonsPaintable : Paintable = NullPaintable.getInstance();
    public var touchPaintable : Paintable = NullPaintable.getInstance();
    private var cheatProcessor : PlayerGameInput = NoPlayerGameInput.getInstance();
    private var gameInputProcessor : Processor = Processor.getInstance();
    private var endGameProcessor : Processor = Processor.getInstance();
    private var realEndGameProcessor : Processor = Processor.getInstance();
    private var startIntermissionProcessor : Processor = Processor.getInstance();
    private var realStartIntermissionProcessor : Processor = Processor.getInstance();
    private var endGamePaintable : Paintable = NullPaintable.getInstance();
    private var endGameStatePaintable : Paintable = NullPaintable.getInstance();
    public var nonBotPaintable : Paintable = NullPaintable.getInstance();
    private var intermissionPaintable : Paintable = NullPaintable.getInstance();
    private var startIntermissionPaintable : InitUpdatePaintable = NullInitUpdatePaintable.getInstance();
    private var mainStateProcessor : Processor = Processor.getInstance();
    private var processGameProcessor : Processor = Processor.getInstance();
    private final highScoresFactoryInterface : HighScoresFactoryInterface;
    private var startLevel : Int = 0;
    private var mainMenuInputProcessor : BasicMenuInputProcessor = NoMenuInputProcessor.getInstance();
    private var popupMenuInputProcessor : BasicMenuInputProcessor = NoMenuInputProcessor.getInstance();
    private var menuInputProcessor : BasicMenuInputProcessor = NoMenuInputProcessor.getInstance();
    private var menuForm : ScrollSelectionForm = ScrollSelectionForm.getNullScrollSelectionForm();
    private var formPaintable : Paintable = NullPaintable.getInstance();
    private var openMenuPaintable : Paintable = NullPaintable.getInstance();
    private var menuPaintable : Paintable = NullPaintable.getInstance();
    private var currentTouchInputFactory : BaseTouchInput = NoButtonsTouchInputFactory.getInstance();
    public var colorFillPaintable : ColorFillBasePaintable = ColorFillPaintableFactory.getInstance().getInstance(this.basicColorFactory.BLACK, true);
    private final baseGameStatistics : BaseGameStatistics = GameStatisticsFactory.getInstance();
    private final primaryPlayerQueue : PlayerQueue = PrimaryPlayerQueueFactory.getInstance();
    private final secondaryPlayerQueue : PlayerQueue = SecondaryPlayerQueueFactory.getInstance();
    public final BUILD_GAME : String = "buildGame";
    public final gameTypeFactory : GameTypeFactory = GameTypeFactory.getInstance();
    public final screenCapture : ScreenCapture = ScreenCaptureFactory.getInstance();
    private final basicMotionGesturesHandler : BasicMotionGesturesHandler = BasicMotionGesturesHandler.getInstance();
    private final gameKeyEventHandler : GameKeyEventHandler = GameKeyEventHandler.getInstance();
    private final gameBehavior : DemoGameBehavior = null;
    private final menuBehavior : BaseMenuBehavior = null;
    private var progressPaintable : PaintableInterface = ProgressCanvasFactory.getLazyInstance();
    public var fontHeightP : Int = 0;
    public function new(commandListener : CommandListener, gameLayerManager : AllBinaryGameLayerManager, highScoresFactoryInterface : HighScoresFactoryInterface, gameInitializationInterfaceFactoryInterface : BasicBuildGameInitializerFactory, buffered : Bool) {
        super(commandListener, CanvasStrings.getInstance().EMPTY_CHILD_NAME_LIST, true);
        this.highScoresHelper = highScoresFactoryInterface.createHighScoresHelper();
        this.gameInitializationInterfaceFactoryInterface = gameInitializationInterfaceFactoryInterface;
        this.init(gameLayerManager, buffered);
        this.highScoresFactoryInterface = highScoresFactoryInterface;
        if (this.gameLayerManager.getGameInfo().getGameType() == this.gameTypeFactory.BOT || this.gameLayerManager.getGameInfo().getGameType() == this.gameTypeFactory.NONE) {
            this.gameBehavior = DemoGameBehavior.getInstance();
            this.menuBehavior = BaseMenuBehavior.getInstance();
        } else {
            this.gameBehavior = BaseGameBehavior.getInstance();
            this.menuBehavior = this.getInGameMenuBehavior();
        }
        this.initPopupMenu();
        this.initMenu();
        this.initSpecialPaint();
        DisplayChangeEventHandler.getInstance().addListenerInterface(this);
    }

    public override function updateMeasurement(graphics : Graphics) : Void {
        try {
            final font : Font = graphics.getFont();
            this.logUtil.putF(new StringMaker().append(this.commonStrings.START).append(this.canvasStrings.FD_WIDTH).appendint(Std.int(MyFontProcessor.defaultCharWidth(font))).append(this.canvasStrings.FD_HEIGHT).appendint(Std.int(font.getHeight())).toString(), this, this.canvasStrings.UPDATE_MEASUREMENT);
            this.fontHeightP = font.getHeight();
            this.myFormUtil.updateMeasurement(graphics);
            final popupMenuRectangle : Rectangle = this.myFormUtil.getPopupMenuRectangle();
            final basicPopupMenuPaintable : BasicPopupMenuPaintable = ((cast this.getOpenMenuPaintable() : BasicPopupMenuPaintable));
            basicPopupMenuPaintable.init(popupMenuRectangle);
            if (this.getPopupMenuInputProcessor() != NoMenuInputProcessor.getInstance()) {
                final popupMenuInputProcessor : PopupMenuInputProcessor = ((cast this.getPopupMenuInputProcessor() : PopupMenuInputProcessor));
                popupMenuInputProcessor.init(popupMenuRectangle);
            }
            this.myFontProcessor = MyFontProcessor.getInstance();
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.canvasStrings.ON_DISPLAY_CHANGE_EVENT, e);
        }
    }

    public function getInGameMenuBehavior() : BaseMenuBehavior {
        return InGameMenuBehavior.getInstance();
    }

    public override function setCurrentThread() : Void {
        if (J2MEUtil.isHTML()) {
            super.setCurrentThreadFake();
        } else {
            super.setCurrentThread();
        }
    }

    public override function onEvent(eventObject : AllBinaryEventObject) : Void {
        ForcedLogUtil.log(EventStrings.getInstance().PERFORMANCE_MESSAGE, this);
    }

    public override function onDisplayChangeEvent(displayChangeEvent : DisplayChangeEvent) : Void {
        try {
            this.logUtil.putF(new StringMaker().append(this.commonStrings.START).append(DisplayInfoSingleton.getInstance().toString()).toString(), this, this.canvasStrings.UPDATE_MEASUREMENT);
            this.myFontProcessor = this.updateMyFontProcessor;
            this.menuBehavior.onDisplayChangeEvent(this, displayChangeEvent);
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.canvasStrings.ON_DISPLAY_CHANGE_EVENT, e);
        }
    }

    // throws Exception
    public function updateMenuFromEvent(displayChangeEvent : DisplayChangeEvent) : Void {
        final formType : FormType = FormTypeFactory.getInstance().getFormType();
        final rectangle : Rectangle = this.formUtil.createFormRectangle();
        this.menuForm.init(rectangle, formType);
        if (this.currentTouchInputFactory != NoButtonsTouchInputFactory.getInstance()) {
            this.touchButtonFactory.toggle(this.isPaused(), this.currentTouchInputFactory.getList());
        }
        this.myFontProcessor = this.updateMyFontProcessor;
    }

    // throws Exception
    public override function processSleep() : Void {
        super.processSleep();
        if (AllBinaryMediaManager.update()) {
            if (!this.primaryPlayerQueue.process()) {
                this.secondaryPlayerQueue.process();
            }
        }
        if (this.menuInputProcessor.processInputList() != -1) {
            this.runnableCanvasRefreshHelper.process();
        }
    }

    // throws Exception
    public function initPopupMenu() : Void {
        if (this.popupMenuInputProcessor == NoMenuInputProcessor.getInstance()) {
            final features : Features = Features.getInstance();
            final popupMenuRectangle : Rectangle = this.myFormUtil.getPopupMenuRectangle();
            if (features.isFeature(this.touchFeatureFactory.TOUCH_ENABLED)) {
                this.setOpenMenuPaintable(new BasicPopupMenuPaintable(popupMenuRectangle, this.gameLayerManager.getBackgroundBasicColor(), this.gameLayerManager.getForegroundBasicColor()));
                this.setPopupMenuInputProcessor(new PopupMenuInputProcessor(new BasicArrayListD(), -1, this, popupMenuRectangle));
            }
        } else {
        }
    }

    public function initMenu() : Void {
        try {
            this.menuBehavior.initMenu(this);
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "initMenu", e);
        }
    }

    // throws Exception
    public function initMenu2() : Void {
        this.closeMenu();
        final formType : FormType = FormTypeFactory.getInstance().getFormType();
        final gameLimitedCommandTextItemArrayFactory : GameLimitedCommandTextItemArrayFactory = GameLimitedCommandTextItemArrayFactory.getInstance();
        final commandTextItemArrayFactory : CommandTextItemArrayFactory = gameLimitedCommandTextItemArrayFactory.getCommandTextItemArrayFactory();
        final items : haxe.ds.Vector<ABCustomItem> = commandTextItemArrayFactory.getInstance(this.getCommandStack(), this.gameLayerManager.getBackgroundBasicColor(), this.gameLayerManager.getForegroundBasicColor());
        final rectangle : Rectangle = this.formUtil.createFormRectangle();
        this.setMenuForm(CommandCurrentSelectionFormFactory.getInstance(StringUtil.getInstance().EMPTY_STRING, items, rectangle, formType, 25, false, this.gameLayerManager.getBackgroundBasicColor(), this.gameLayerManager.getForegroundBasicColor()));
        final scrollSelectionForm : ScrollSelectionForm = this.getMenuForm();
        final features : Features = Features.getInstance();
        if (features.isFeature(this.touchFeatureFactory.TOUCH_ENABLED)) {
            this.mainMenuInputProcessor = new PopupCommandFormInputProcessor(new BasicArrayListD(), -1, this, scrollSelectionForm, (cast this.getPopupMenuInputProcessor() : PopupMenuInputProcessor));
        } else {
        }
        this.setMenuInputProcessor(this.getPopupMenuInputProcessor());
        if (scrollSelectionForm != ScrollSelectionFormNoneFactory.getInstance()) {
            this.setFormPaintable(new FormPaintable(scrollSelectionForm));
        } else {
        }
        this.closeMenu();
    }

    public function updateMenu() : Void {
        try {
            this.menuBehavior.updateMenu(this);
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "initMenu", e);
        }
    }

    // throws Exception
    public function updateMenu2() : Void {
        final scrollSelectionForm : ScrollSelectionForm = this.getMenuForm();
        scrollSelectionForm.deleteAll();
        final gameLimitedCommandTextItemArrayFactory : GameLimitedCommandTextItemArrayFactory = GameLimitedCommandTextItemArrayFactory.getInstance();
        final commandTextItemArrayFactory : CommandTextItemArrayFactory = gameLimitedCommandTextItemArrayFactory.getCommandTextItemArrayFactory();
        final items : haxe.ds.Vector<ABCustomItem> = commandTextItemArrayFactory.getInstance(this.getCommandStack(), this.gameLayerManager.getBackgroundBasicColor(), this.gameLayerManager.getForegroundBasicColor());
        final size : Int = items.length;
        for (index in 0...size) {
            scrollSelectionForm.append(items[index]);
        }
        final formType : FormType = FormTypeFactory.getInstance().getFormType();
        final rectangle : Rectangle = this.formUtil.createFormRectangle();
        scrollSelectionForm.init(rectangle, formType);
    }

    // synchronized
    public override function pause() : Void {
        this.gameBehavior.pause(this);
        this.closeMenu();
        super.pause();
        this.touchButtonFactory.toggle(this.isPaused(), BasicArrayListUtil.getInstance().getImmutableInstance());
        this.tsUtil.gc();
    }

    // synchronized
    public override function unPause() : Void {
        this.logUtil.putF(this.commonStrings.START, this, this.gameStrings.UNPAUSE);
        this.closeMenu();
        this.tsUtil.gc();
        super.unPause();
        this.touchButtonFactory.toggle(this.isPaused(), BasicArrayListUtil.getInstance().getImmutableInstance());
        this.gameBehavior.unPause(this);
    }

    public override function isPausable() : Bool {
        if (CurrentDisplayableFactory.getInstance().getUsedRunnable() == NullWaitGameRunnable.getInstance()) {
            return true;
        } else {
            return false;
        }
    }

    // throws Exception
    public override function popupMenu() : Void {
        this.menuBehavior.popupMenu(this);
    }

    // throws Exception
    public function popupMenu2() : Void {
        this.primaryPlayerQueue.add(SelectSound.getInstance());
        this.setMenuPaintable(this.getFormPaintable());
        this.setMenuInputProcessor(this.mainMenuInputProcessor);
        this.basicMotionGesturesHandler.addListenerInterface(this.mainMenuInputProcessor);
        this.gameKeyEventHandler.addListener(this.mainMenuInputProcessor);
    }

    // throws Exception
    public override function toggleMenu() : Void {
        this.logUtil.putF(this.commonStrings.START, this, this.gameStrings.TOGGLE_MENU);
        if (this.getMenuPaintable() == this.getOpenMenuPaintable()) {
            this.pause();
            this.updateMenu();
            this.popupMenu();
        } else if (this.getMenuPaintable() == this.getFormPaintable()) {
            this.primaryPlayerQueue.add(SelectSound.getInstance());
            this.unPause();
        }
    }

    public override function closeMenu() : Void {
        this.menuBehavior.closeMenu(this);
    }

    public function closeMenu2() : Void {
        this.setMenuPaintable(this.getOpenMenuPaintable());
        this.basicMotionGesturesHandler.removeListener(this.mainMenuInputProcessor);
        this.gameKeyEventHandler.removeListener(this.mainMenuInputProcessor);
        this.setMenuInputProcessor(this.getPopupMenuInputProcessor());
    }

    public override function open() : Void {
        this.basicMotionGesturesHandler.addListenerInterface(this.menuInputProcessor);
        this.gameKeyEventHandler.addListener(this.menuInputProcessor);
    }

    public override function close() : Void {
        this.basicMotionGesturesHandler.removeListener(this.menuInputProcessor);
        this.gameKeyEventHandler.removeListener(this.menuInputProcessor);
        this.primaryPlayerQueue.clear();
        this.secondaryPlayerQueue.clear();
    }

    // throws Exception
    public function processorInit() : Void {
        this.setMainStateProcessor(Processor.getInstance());
        this.setProcessGameProcessorInit();
    }

    public function setProcessGameProcessorInit() : Void {
        this.setProcessGameProcessor(new GameProcessor(this));
    }

    public function initSpecialPaint() : Void {
        this.menuBehavior.initSpecialPaint(this);
    }

    // throws Exception
    private function init(gameLayerManager : AllBinaryGameLayerManager, buffered : Bool) : Void {
        this.gameStateTimeHelper.setStartTimeTNT();
        this.setHighScoreSubmitted(false);
        this.setLayerManager(gameLayerManager);
        if (!buffered) {
            final BUFF_MESSAGE : String = "XXX Not Buffering Causes Concurrency Issues XXX";
            this.logUtil.putF(BUFF_MESSAGE, this, this.commonStrings.CONSTRUCTOR);
        } else {
            throw new haxe.Exception("Buffering is disabled");
        }
        this.setGameInputProcessor(Processor.getInstance());
        final features : Features = Features.getInstance();
        if (features.isFeature(GameFeatureFactory.getInstance().CHEATING)) {
            this.isCheating = true;
            this.cheatProcessor = new CheatGameInputProcessor(this);
            this.gameKeyEventHandler.addListener(this.cheatProcessor);
        } else {
            this.isCheating = false;
            this.cheatProcessor = NoPlayerGameInput.getInstance();
        }
        this.realEndGameProcessor = new EndGameProcessor(this);
        this.setEndGameProcessor(Processor.getInstance());
        this.realStartIntermissionProcessor = new StartIntermissionProcessor(this);
        this.startIntermissionProcessor = Processor.getInstance();
        this.setEndGameStatePaintable(new EndGamePaintable(this));
        this.setEndGamePaintable(NullPaintable.getInstance());
        this.setIntermissionPaintable(NullPaintable.getInstance());
        this.getStartIntermissionInterface().setListener(this);
    }

    public override function notifyIntermission(enable : Bool) : Void {
        if (enable) {
            this.startIntermissionProcessor = this.realStartIntermissionProcessor;
        } else {
            this.startIntermissionProcessor = Processor.getInstance();
        }
        if (enable) {
            this.setIntermissionPaintable(this.getStartIntermissionPaintable());
        } else {
            this.setIntermissionPaintable(NullPaintable.getInstance());
        }
    }

    // throws Exception
    public function mediaInit() : Void {
        ForcedLogUtil.log(this.commonStrings.NOT_IMPLEMENTED, this);
    }

    // throws Exception
    // synchronized
    public function initConfigurable(abeClientInformation : AbeClientInformationInterface) : Void {
        final progressCanvas : ProgressCanvas = ProgressCanvasFactory.getInstance();
        progressCanvas.addNormalPortion(50, "Setting Configurables");
        GameInitializationUtil.getInstance().initGame(abeClientInformation, this, this.gameInitializationInterfaceFactoryInterface);
        final gameFeatureFactory : GameFeatureFactory = GameFeatureFactory.getInstance();
        final changedGameFeatureListener : ChangedGameFeatureListener = ChangedGameFeatureListener.getInstance();
        if (changedGameFeatureListener.isChangedFeature(gameFeatureFactory.SOUND)) {
            final features : Features = Features.getInstance();
            this.logUtil.putF(new StringMaker().append("Sound Changing To: ").appendboolean(features.isFeature(gameFeatureFactory.SOUND)).toString(), this, "initConfigurable");
            this.mediaInit();
            changedGameFeatureListener.remove(gameFeatureFactory.SOUND);
        }
        final sensorFeatureFactory : SensorFeatureFactory = SensorFeatureFactory.getInstance();
        if (changedGameFeatureListener.isChangedFeature(sensorFeatureFactory.ORIENTATION_SENSORS) || changedGameFeatureListener.isChangedFeature(sensorFeatureFactory.NO_ORIENTATION) || changedGameFeatureListener.isChangedFeature(sensorFeatureFactory.SIMULATED_ORIENTATION_SENSORS)) {
            changedGameFeatureListener.remove(sensorFeatureFactory.NO_ORIENTATION);
            changedGameFeatureListener.remove(sensorFeatureFactory.ORIENTATION_SENSORS);
            changedGameFeatureListener.remove(sensorFeatureFactory.SIMULATED_ORIENTATION_SENSORS);
        }
        final resourceLoadingLevelFactory : ResourceLoadingLevelFactory = ResourceLoadingLevelFactory.getInstance();
        this.loadResourceLoadingLevel(resourceLoadingLevelFactory.LOAD_GAME);
    }

    // throws Exception
    public function initApp(abeClientInformation : AbeClientInformationInterface) : Void {
        this.initConfigurable(abeClientInformation);
        this.processorInit();
        this.sensorGameUpdateProcessor.process(this.gameLayerManager);
        this.sensorGameUpdateProcessor.sendNotifications(this.gameLayerManager);
        this.initTouch();
    }

    // throws Exception
    public function initTouch() : Void {
        final gameInitializedEvent : GameInitializedEvent = GameInitializationUtil.getInstance().EVENT;
        final resourceLoadingLevelFactory : ResourceLoadingLevelFactory = ResourceLoadingLevelFactory.getInstance();
        gameInitializedEvent.setResourceLoadingLevel(resourceLoadingLevelFactory.LOAD_TOUCH);
        GameInitializedEventHandler.getInstance().fireEvent(gameInitializedEvent);
        this.touchButtonFactory.defaultList();
        this.updateTouch();
        this.postInitTouch();
    }

    // throws Exception
    public function updateCurrentTouchInputFactory(nextTouchInput : BaseTouchInput) : Void {
        if (nextTouchInput != this.currentTouchInputFactory) {
            this.currentTouchInputFactory = nextTouchInput;
            PreLogUtil.put(this.currentTouchInputFactory.toString(), this, this.gameInputStrings.UDPATE_CURRENT_TOUCH_INPUT_FACTORY);
            this.touchButtonFactory.toggle(this.isPaused(), this.currentTouchInputFactory.getList());
        }
    }

    // throws Exception
    public function updateTouch() : Void {
        this.gameBehavior.updateTouch(this);
    }

    // throws Exception
    public function updateTouch2() : Void {
        final features : Features = Features.getInstance();
        if (features.isFeature(this.touchFeatureFactory.AUTO_HIDE_SHOW_SCREEN_BUTTONS)) {
            if (this.gameLayerManager.getGameInfo().getCurrentLevel() - this.getStartLevel() == 1) {
                this.setTouchPaintableP(NullPaintable.getInstance());
            }
        }
    }

    // throws Exception
    public function postInitTouch() : Void {
        this.setTouchButtonsPaintable(TouchButtonsPaintableFactory.getInstance(this.gameLayerManager.getForegroundBasicColor()));
        this.updateScreenButtonPaintable();
    }

    public override function initCommands(cmdListener : CommandListener) : Void {
        this.removeAllCommands();
        this.addCommands();
        this.setCommandListener(cmdListener);
    }

    public function addCommands() : Void {
        final gameCommandsFactory : GameCommandsFactory = GameCommandsFactory.getInstance();
        final myCommandsFactory : MyCommandsFactory = MyCommandsFactory.getInstance();
        if (DebugFactory.getInstance() != NoDebug.getInstance()) {
            this.addCommand(gameCommandsFactory.START_TRACE);
        }
        this.addCommand(gameCommandsFactory.RESTART_COMMAND);
        this.addCommand(myCommandsFactory.PAUSE_COMMAND);
        this.addCommand(gameCommandsFactory.QUIT_COMMAND);
        final isOverScan : Bool = OperatingSystemFactory.getInstance().getOperatingSystemInstance().isOverScan();
        if (J2MEUtil.isHTML()) {
        } else if (SWTUtil.isSWT) {
        } else if (!isOverScan) {
            if (TouchScreenFactory.getInstance().isTouch() && new InGameFeatures().isAny()) {
                this.addCommand(InGameOptionsForm.DISPLAY);
            }
            this.addCommand(gameCommandsFactory.SAVE);
            this.addCommand(gameCommandsFactory.DISPLAY_LOAD_FORM);
        }
    }

    public override function itemStateChanged(item : Item) : Void {
        try {
            final itemLabel : String = item.getLabel();
            this.logUtil.putF(new StringMaker().append(this.commonLabels.ITEM_LABEL).append(itemLabel).toString(), this, "itemStateChanged");
            if (Std.isOfType(item, ChoiceGroup)) {
                final gameFeatureUtil : GameFeatureUtil = GameFeatureUtil.getInstance();
                if (gameFeatureUtil.isExclusive(itemLabel)) {
                    gameFeatureUtil.updateExclusiveForChoiceGroup((cast item : ChoiceGroup));
                } else {
                    gameFeatureUtil.updateMultiple((cast item : ChoiceGroup));
                }
            }
            this.sensorGameUpdateProcessor.process(this.gameLayerManager);
            this.updateTouch();
            this.updateScreenButtonPaintable();
            this.sensorGameUpdateProcessor.sendNotifications(this.gameLayerManager);
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "itemStateChanged", e);
        }
    }

    // throws Exception
    public function updateScreenButtonPaintable() : Void {
        this.gameBehavior.updateScreenButtonPaintable(this);
    }

    public function updateScreenButtonPaintable2() : Void {
        final features : Features = Features.getInstance();
        if (features.isFeature(this.touchFeatureFactory.AUTO_HIDE_SHOW_SCREEN_BUTTONS)) {
            this.setTouchPaintableP(this.getTouchButtonsPaintable());
            this.setStartLevel(this.gameLayerManager.getGameInfo().getCurrentLevel());
        } else if (features.isFeature(this.touchFeatureFactory.SHOW_SCREEN_BUTTONS)) {
            this.setTouchPaintableP(this.getTouchButtonsPaintable());
        } else if (features.isFeature(this.touchFeatureFactory.HIDE_SCREEN_BUTTONS)) {
            this.setTouchPaintableP(NullPaintable.getInstance());
        } else {
            this.setTouchPaintableP(NullPaintable.getInstance());
        }
    }

    public override function getLayerManager() : AllBinaryGameLayerManager {
        return this.gameLayerManager;
    }

    public function setLayerManager(layerManager : AllBinaryGameLayerManager) : Void {
        this.gameLayerManager = layerManager;
    }

    // synchronized
    public override function isGameOver() : Bool {
        return this.gameOver;
    }

    // synchronized
    public function setGameOver(gameOver : Bool) : Void {
        this.gameOver = gameOver;
    }

    // throws Exception
    public override function processGameOver() : Void {
        PreLogUtil.put(this.commonStrings.START, this, this.gameStrings.SET_GAME_OVER);
        this.setGameOver(true);
        this.removePauseCommand();
        this.setGameState(this.gameStateFactory.SHOW_END_RESULT_GAME_STATE);
        this.setEndGamePaintable(this.getEndGameStatePaintable());
    }

    public override function isHighScoreSubmitted() : Bool {
        return this.highScoreSubmitted;
    }

    // throws Exception
    public override function setHighScoreSubmitted(highScoreSubmitted : Bool) : Void {
        this.highScoreSubmitted = highScoreSubmitted;
        if (highScoreSubmitted) {
            this.highScoresHelper.setSelectedHighScores(NullHighScoresSingletonFactory.getInstance());
        }
        this.logUtil.putF(new StringMaker().append("isHighScoreSubmitted: ").appendboolean(highScoreSubmitted).toString(), this, "setHighScoreSubmitted");
    }

    public override function getGameState() : GameState {
        return this.gameState;
    }

    // throws Exception
    public override function setGameState(gameState : GameState) : Void {
        this.logUtil.putF(new StringMaker().append(this.gameStrings.GAME_STATE).append(this.stringUtil.toString(gameState)).toString(), this, this.gameStrings.SET_GAME_STATE);
        this.gameState = gameState;
        this.gameStateTimeHelper.setStartTimeTNT();
        this.updateEndGameProcessor();
        this.updateGameKeyEventProcessor();
        this.gameBehavior.setGameState(this);
    }

    // throws Exception
    public function updateGameState() : Void {
        final gameAdState : GameAdState = this.gameAdStateFactory.getCurrentInstance();
        gameAdState.processAdState(this.gameState, this.gameLayerManager.getGameInfo().getGameType());
        if (this.gameState != this.gameStateFactory.PLAYING_GAME_STATE) {
            gameAdState.processPageAdState();
        }
    }

    private function updateGameKeyEventProcessor() : Void {
        if (this.getGameState() != this.gameStateFactory.PLAYING_GAME_STATE || this.isCheating) {
        } else {
        }
    }

    public function removeAllGameKeyInputListenersOnBuild() : Void {
        this.removeAllGameKeyInputListeners();
    }

    public function removeAllGameKeyInputListeners() : Void {
        this.gameBehavior.removeAllGameKeyInputListeners(this);
    }

    public function removeAllGameKeyInputListeners2() : Void {
        this.logUtil.putF("Remove PlayerInput Listeners", this, "removeAllGameKeyInputListeners");
        {
            var index : Int = this.localPlayerGameInputList.size() - 1;
            while (index >= 0) {
            var playerGameInput : PlayerGameInput = (cast this.localPlayerGameInputList.get(index) : PlayerGameInput);
            this.removeKeyInputListener(playerGameInput);
            playerGameInput.removeNonAIInputGameKeyEvents();
                index--;
            }
        }
    }

    public function removeKeyInputListener(playerGameInput : PlayerGameInput) : Void {
        this.gameKeyEventHandler.removeListener(playerGameInput);
    }

    // throws Exception
    public function updateEndGameProcessor() : Void {
        this.gameBehavior.updateEndGameProcessor(this);
    }

    // throws Exception
    public function updateEndGameProcessor2() : Void {
        if (this.getGameState() == this.gameStateFactory.SHOW_END_RESULT_GAME_STATE || this.getGameState() == this.gameStateFactory.SHOW_HIGH_SCORE_GAME_STATE) {
            this.setEndGameProcessor(this.realEndGameProcessor);
        } else {
            this.setEndGameProcessor(Processor.getInstance());
        }
    }

    // throws Exception
    public function buildGameInit(isPortion : Bool) : Void {
    }

    // throws Exception
    public function cleanupGame() : Void {
        this.logUtil.putF(this.commonStrings.START, this, this.commonStrings.CLEANUP);
        final progressCanvas : ProgressCanvas = ProgressCanvasFactory.getInstance();
        progressCanvas.addNormalPortion(10, "Cleaning Up");
        this.primaryPlayerQueue.clear();
        this.secondaryPlayerQueue.clear();
        GameLevelDisplayChangeEventListenersFactory.getInstance().clear();
    }

    // throws Exception
    public function loadResourceLoadingLevel(resourceLoadingLevel : ResourceLoadingLevel) : Void {
        final gameInitializedEvent : GameInitializedEvent = GameInitializationUtil.getInstance().EVENT;
        gameInitializedEvent.setResourceLoadingLevel(resourceLoadingLevel);
        GameInitializedEventHandler.getInstance().fireEvent(gameInitializedEvent);
    }

    // throws Exception
    public function loadResources(level : Int) : Void {
        final gameInitializedEvent : GameInitializedEvent = GameInitializationUtil.getInstance().EVENT;
        gameInitializedEvent.setLevel(level);
        GameInitializedEventHandler.getInstance().fireEvent(gameInitializedEvent);
    }

    // throws Exception
    public function updateColor() : Void {
    }

    // throws Exception
    public function buildGame(portion : Int) : Void {
        this.screenCapture.endRecording();
        this.screenCapture.startRecording();
        final progressCanvas : ProgressCanvas = ProgressCanvasFactory.getInstance();
        final features : Features = Features.getInstance();
        progressCanvas.addNormalPortion(portion, "Generic Build");
        this.removeAllGameKeyInputListenersOnBuild();
        this.updateTouch();
        progressCanvas.addNormalPortion(portion, "High Scores");
        this.highScoresFactoryInterface.fetchHighScores(this.gameLayerManager.getGameInfo(), this.highScoresHelper);
        this.setHighScoresPaintable(NullPaintable.getInstance());
        progressCanvas.addNormalPortion(portion, "Finishing.");
        this.getEndGameInfoP().update(this.getLayerManager().getGameInfo(), this);
        this.isSingleKeyRepeatableProcessing = features.isFeature(InputFeatureFactory.getInstance().SINGLE_KEY_REPEAT_PRESS);
        this.setGameOver(false);
        progressCanvas.addNormalPortion(portion, "Finishing..");
        this.updateColor();
        this.getStartIntermissionPaintable().update();
        if (!this.isRunningInAnotherThread()) {
            return;
        }
        progressCanvas.addNormalPortion(portion, "Finishing...");
        if (this.isMainCanvas() || !this.isInitialized()) {
            if (features.isFeature(MainFeatureFactory.getInstance().LOAD_ONDEMAND)) {
                if (this.getCustomCommandListener() != null) {
                    progressCanvas.end();
                }
            } else {
                progressCanvas.end();
            }
            this.setInitialized(true);
        }
        if (this.getCustomCommandListener() == NullCommandListener.NULL_COMMAND_LISTENER) {
            this.logUtil.putF("Show Game Paintable in DemoCanvas Thread", this, this.BUILD_GAME);
            this.gameCanvasStartListener.showGamePaintable();
        } else {
            this.logUtil.putF("No GameCanvasStartListener", this, this.BUILD_GAME);
        }
        this.colorFillPaintable.setBasicColorP(this.gameLayerManager.getBackgroundBasicColor());
        this.gameBehavior.buildGame(this);
    }

    public function buildGame2() : Void {
        PreLogUtil.put(new StringMaker().append(this.gameInputStrings.ENABLE_PLAYER_GAME_INPUTS).appendint(this.localPlayerGameInputList.size()).toString(), this, this.BUILD_GAME);
        var playerGameInput : PlayerGameInput = null;
        {
            var index : Int = this.localPlayerGameInputList.size() - 1;
            while (index >= 0) {
            playerGameInput = (cast this.localPlayerGameInputList.get(index) : PlayerGameInput);
            PreLogUtil.put(new StringMaker().append(this.gameInputStrings.ENABLE_PLAYER_GAME_INPUT).append(playerGameInput.toString()).toString(), this, this.BUILD_GAME);
            playerGameInput.removeNonAIInputGameKeyEvents();
            this.addKeyInputListener(playerGameInput);
                index--;
            }
        }
    }

    public function addKeyInputListener(playerGameInput : PlayerGameInput) : Void {
        GameKeyEventHandler.getInstance().addListenerForPlayer(playerGameInput, playerGameInput.getPlayerInputId());
    }

    private var gameCanvasStartListener : DemoPaintableInterface = NullDemoPaintable.NULL_DEMO_PAINTABLE;
    public function setGameCanvasStartListener(gameCanvasStartListener : DemoPaintableInterface) : Void {
        this.gameCanvasStartListener = gameCanvasStartListener;
    }

    // throws Exception
    public function loadState() : Void {
        this.logUtil.putF(this.commonStrings.START, this, this.commonStrings.LOAD);
        var hashtable : ABHashtable<Any, Any> = this.getLoadStateHashtable();
        if (hashtable != null && hashtable.size() > 0) {
            final levelAsString : String = (cast hashtable.get((cast GameInfo.LEVEL_NAME : Any)) : String);
            final level : Int = Std.int(Std.string(levelAsString));
            final gameInfo : GameInfo = this.gameLayerManager.getGameInfo();
            gameInfo.setCurrentLevel(level);
        }
    }

    // throws Exception
    public override function getLoadStateHashtable() : ABHashtable<Any, Any> {
        this.logUtil.putF(new StringMaker().append(this.commonLabels.START_LABEL).append(this.stringUtil.toString(this.hashtable)).toString(), this, "getLoadStateHashtable");
        return this.hashtable;
    }

    public override function setLoadStateHashtable(hashtable : ABHashtable<Any, Any>) : Void {
        this.logUtil.putF(new StringMaker().append(this.commonLabels.START_LABEL).append(this.stringUtil.toString(hashtable)).toString(), this, "setLoadStateHashtable");
        this.hashtable = hashtable;
    }

    public override function getCurrentStateHashtable() : ABHashtable<Any, Any> {
        final hashtable : ABHashtable<Any, Any> = this.stdUtil.createHashtable();
        final level : Int = this.gameLayerManager.getGameInfo().getCurrentLevel();
        hashtable.put(GameInfo.LEVEL_NAME.toString(), Std.string(level));
        this.logUtil.putF(new StringMaker().append("End: ").append(this.stringUtil.toString(hashtable)).toString(), this, "getCurrentStateHashtable");
        return hashtable;
    }

    public function paintGameOver(graphics : Graphics) : Void {
        ForcedLogUtil.log(this.commonStrings.NOT_IMPLEMENTED, this);
    }

    public override function draw(graphics : Graphics) : Void {
        this.colorFillPaintable.paint(graphics);
        this.basicSetColorUtil.setBasicColorP(graphics, this.gameLayerManager.getForegroundBasicColor());
        this.gameSpecificPaintable.paint(graphics);
    }

    public function clear(graphics : Graphics) : Void {
        this.colorFillPaintable.paint(graphics);
    }

    public override function paint(graphics : Graphics) : Void {
        this.myFontProcessor.process(graphics);
        this.baseGameStatistics.nextRefresh();
        this.draw(graphics);
        this.menuPaintable.paint(graphics);
        this.progressPaintable.paint(graphics);
    }

    public override function paintThreed(graphics : Graphics) : Void {
    }

    // throws Exception
    public function processEndLevelIntermissionGameState() : Void {
    }

    public function nonBotPaint(graphics : Graphics) : Void {
        this.endGamePaintable.paint(graphics);
        this.intermissionPaintable.paint(graphics);
        this.paintIntermission(graphics);
        this.touchPaintable.paint(graphics);
    }

    public function paintIntermission(graphics : Graphics) : Void {
    }

    private final rawGameInputProcessor : InputProcessor = new GameCanvasInputProcessor(this);
    private final rawInputProcessor : InputProcessor = new FormInputProcessor(this);
    private var inputProcessor : InputProcessor = this.getRawGameInputProcessor();
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
        this.inputProcessor.keyPressedByDevice(keyCode, deviceId);
    }

    public override function keyRepeatedByDevice(keyCode : Int, deviceId : Int) : Void {
        if (this.isSingleKeyRepeatableProcessing) {
            this.inputProcessor.keyPressedByDevice(keyCode, deviceId);
        }
    }

    public override function keyReleasedByDevice(keyCode : Int, deviceId : Int) : Void {
        this.inputProcessor.keyReleasedByDevice(this, keyCode, deviceId);
    }

    // throws Exception
    public function handleRawKey(keyCode : Int, deviceId : Int, repeated : Bool) : Void {
    }

    public function endProgress(isProgress : Bool) : Int {
        var portion : Int = 30;
        if (isProgress && this.isMainCanvas()) {
            final myCommandsFactory : MyCommandsFactory = MyCommandsFactory.getInstance();
            final progressCanvas : ProgressCanvas = ProgressCanvasFactory.getInstance();
            progressCanvas.start();
            this.getCustomCommandListener().commandAction(myCommandsFactory.SET_DISPLAYABLE, progressCanvas);
            portion = 4;
        }
        return portion;
    }

    // throws Exception
    public function processPlayingGame() : Void {
        this.cheatProcessor.update();
        this.sensorGameUpdateProcessor.getInputSensor().update();
        this.gameInputProcessor.process();
        this.gameLayerManager.process();
        this.startIntermissionProcessor.process();
    }

    // throws Exception
    public function threadInit() : Void {
    }

    // throws Exception
    public function processGame() : Void {
        super.process();
        if (AllBinaryMediaManager.update()) {
            if (!this.primaryPlayerQueue.process()) {
                this.secondaryPlayerQueue.process();
            }
        }
        this.mainStateProcessor.process();
        this.menuInputProcessor.processInputList();
        this.endGameProcessor.process();
        this.baseGameStatistics.nextFrame();
    }

    public function notifyDonePainting() : Void {
        // synchronized (this)
        {
            this.threadObjectUtil.notifyObject(this);
        }
    }

    private final YIELD_SLEEP : haxe.Int64 = 100;
    // throws Exception
    public function shouldWait() : Void {
        final features : Features = Features.getInstance();
        if (AndroidUtil.isAndroid()) {
        } else if (features.isFeature(this.openGLFeatureFactory.OPENGL_2D)) {
        } else {
            if (features.isDefault(this.openGLFeatureFactory.OPENGL)) {
                final openGLImageSpecificFactory : OpenGLImageSpecificFactory = OpenGLImageSpecificFactory.getInstance();
                while (openGLImageSpecificFactory.updating) {
                    Sys.sleep(haxe.Int64.toInt(this.YIELD_SLEEP) / 1000);
                }
            }
        }
    }

    public override function run() : Void {
        try {
            this.logUtil.putF(this.commonStrings.START_RUNNABLE, this, this.commonStrings.RUN);
            final progressCanvas : ProgressCanvas = ProgressCanvasFactory.getInstance();
            progressCanvas.addNormalPortion(50, "Game Thread");
            this.setCurrentThread();
            this.setRunning(true);
            if (this.getCustomCommandListener() == NullCommandListener.NULL_COMMAND_LISTENER) {
                Sys.sleep(haxe.Int64.toInt(this.YIELD_SLEEP) / 1000);
            }
            this.shouldWait();
            this.threadInit();
            if (this.getCustomCommandListener() == NullCommandListener.NULL_COMMAND_LISTENER) {
                Sys.sleep(haxe.Int64.toInt(this.YIELD_SLEEP) / 1000);
            }
            this.open();
            final gameAdState : GameAdState = this.gameAdStateFactory.getCurrentInstance();
            gameAdState.init();
            gameAdState.setGameIsReady(true);
            this.gameBehavior.run(this);
            this.logUtil.putF(this.commonStrings.END_RUNNABLE, this, this.commonStrings.RUN);
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.RUN, e);
        }
    }

    // throws Exception
    public function run2() : Void {
        final features : Features = Features.getInstance();
        if (features.isDefault(this.openGLFeatureFactory.OPENGL_AS_GAME_THREAD) || J2MEUtil.isHTML()) {
            if (features.isDefault(this.openGLFeatureFactory.OPENGL_AS_GAME_THREAD)) {
                this.logUtil.putF(this.openGLFeatureFactory.OPENGL_AS_GAME_THREAD.getName(), this, this.commonStrings.RUN);
            }
            if (J2MEUtil.isHTML()) {
                this.logUtil.putF(GraphicsStrings.getInstance().HTML, this, this.commonStrings.RUN);
            }
            final currentDisplayableFactory : CurrentDisplayableFactory = CurrentDisplayableFactory.getInstance();
            currentDisplayableFactory.setRunnable(this.gameRunnable);
            currentDisplayableFactory.setDisplayable(this);
            OpenGLThreadUtil.getInstance().onResume();
        } else if (features.isDefault(this.openGLFeatureFactory.OPENGL_AND_GAME_HAVE_DIFFERENT_THREADS)) {
            this.logUtil.putF(this.openGLFeatureFactory.OPENGL_AND_GAME_HAVE_DIFFERENT_THREADS.getName(), this, this.commonStrings.RUN);
            OpenGLThreadUtil.getInstance().onResume();
            while (this.isRunning()) {
                this.run3();
            }
            this.end();
        } else {
            this.logUtil.putF("this thread", this, this.commonStrings.RUN);
            while (this.isRunning()) {
                this.run3();
            }
            this.end();
        }
    }

    // throws Exception
    public function run3() : Void {
        this.loopTimeHelper.setStartTime(this.gameTickTimeDelayHelper.setStartTime());
        this.gameTickDisplayInfoSingleton.update();
        this.processGame();
        this.processLoopSleep();
    }

    public override function setRunning(running : Bool) : Void {
        super.setRunning(running);
        try {
            final features : Features = Features.getInstance();
            if (running) {
            } else {
                if (features.isDefault(this.openGLFeatureFactory.OPENGL) || SWTUtil.isSWT) {
                    if (this.gameLayerManager.getGameInfo().getGameType() != this.gameTypeFactory.BOT) {
                        final currentDisplayableFactory : CurrentDisplayableFactory = CurrentDisplayableFactory.getInstance();
                        currentDisplayableFactory.clearRunnable();
                    }
                    this.end();
                }
            }
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.SET_RUNNING, e);
        }
    }

    // throws Exception
    public function end() : Void {
        this.screenCapture.endRecording();
        this.baseGameStatistics.add(new StringMaker().append(this.baseGameStatistics.toString()).append(CommonSeps.getInstance().NEW_LINE).toString());
        this.baseGameStatistics.init();
        this.gameKeyEventHandler.removeListener(this.cheatProcessor);
        this.close();
        this.removeAllGameKeyInputListeners();
        this.endGameThread();
    }

    // throws Exception
    public function endGameThread() : Void {
        DisplayChangeEventHandler.getInstance().removeListener(this);
        GameLevelDisplayChangeEventListenersFactory.getInstance().clear();
        var gameAdState : GameAdState = this.gameAdStateFactory.getCurrentInstance();
        gameAdState.notPlayingAdState();
    }

    public function createHighScore(score : haxe.Int64) : HighScore {
        final gameInfo : GameInfo = this.gameLayerManager.getGameInfo();
        return new HighScore(0, "NONE", new GameInfo(gameInfo.getGameType(), gameInfo.getGameMode(), PlayerTypesFactory.getInstance().PLAYER_TYPE_ONE, 0, 0), score);
    }

    // throws Exception
    public function setHighScore(abeClientInformation : AbeClientInformationInterface, name : String, score : haxe.Int64, autoSubmit : Bool, isLast : Bool) : Void {
        this.gameBehavior.setHighScore(abeClientInformation, this, name, score, autoSubmit, isLast);
    }

    // throws Exception
    public function setHighScore2(abeClientInformation : AbeClientInformationInterface, name : String, score : haxe.Int64, autoSubmit : Bool, isLast : Bool) : Void {
        final highScore : HighScore = this.createHighScore(score);
        final textBox : HighScoreTextBox = new HighScoreTextBox(this.highScoresFactoryInterface, this.highScoresHelper, abeClientInformation, this.gameLayerManager.getGameInfo(), this.getCustomCommandListener(), name, highScore, this.gameLayerManager.getBackgroundBasicColor(), this.gameLayerManager.getForegroundBasicColor());
        if (isLast) {
            this.getCustomCommandListener().commandAction(GameCommandsFactory.getInstance().SET_MENU_DISPLAYABLE, textBox);
        }
        if (autoSubmit) {
            // Java inner class: Haxe does not nest classes so move this to its own module
            class SaveHighScoreRunnable implements Runnable {
                private final progressCanvas : ProgressCanvas = ProgressCanvasFactory.getInstance();
                public function run() : Void {
                    final logUtil : LogUtil = LogUtil.getInstance();
                    try {
                        if (isLast) {
                            textBox.submit();
                        } else {
                            textBox.saveHighScore();
                        }
                    } catch (e : haxe.Exception) {
                        final commonStrings : CommonStrings = CommonStrings.getInstance();
                        logUtil.put(commonStrings.EXCEPTION, this, "run", e);
                        this.progressCanvas.end();
                    }
                }

                public function new() {
                }
            }
            SecondaryThreadPool.getInstance().runTask(new SaveHighScoreRunnable());
        }
    }

    public function getGameStateTimeHelper() : TimeDelayHelper {
        return this.gameStateTimeHelper;
    }

    public function setInitialized(initialized : Bool) : Void {
        this.initialized = initialized;
    }

    public override function isInitialized() : Bool {
        return this.initialized;
    }

    public override function getSourceId() : Int {
        return AllBinaryGameCanvas.id;
    }

    public function setProgressPaintable(paintable : PaintableInterface) : Void {
        this.progressPaintable = paintable;
    }

    public override function getStartIntermissionInterface() : IntermissionInterface {
        return this.startIntermissionInterface;
    }

    public override function getEndLevelIntermissionInterface() : IntermissionInterface {
        return this.endLevelIntermissionInterface;
    }

    public function setTouchPaintableP(paintable : Paintable) : Void {
        this.touchPaintable = paintable;
    }

    public function getTouchPaintableP() : Paintable {
        return this.touchPaintable;
    }

    public function setEndGamePaintable(endGamePaintable : Paintable) : Void {
        this.endGamePaintable = endGamePaintable;
    }

    public function getEndGamePaintable() : Paintable {
        return this.endGamePaintable;
    }

    public function setIntermissionPaintable(intermissionPaintable : Paintable) : Void {
        this.intermissionPaintable = intermissionPaintable;
    }

    public function getIntermissionPaintable() : Paintable {
        return this.intermissionPaintable;
    }

    public function getEndGameInfoP() : EndGameInfo {
        return this.endGameInfo;
    }

    public function setHighScoresPaintable(highScoresPaintable : Paintable) : Void {
        this.highScoresPaintable = highScoresPaintable;
    }

    public function getHighScoresPaintable() : Paintable {
        return this.highScoresPaintable;
    }

    public function getRealHighScoresPaintable() : HighScoresPaintable {
        return this.realHighScoresPaintable;
    }

    public function clearPlayerGameInputList() : Void {
        var playerGameInput : PlayerGameInput = null;
        {
            var index : Int = this.localPlayerGameInputList.size() - 1;
            while (index >= 0) {
            playerGameInput = (cast this.localPlayerGameInputList.get(index) : PlayerGameInput);
            this.gameKeyEventHandler.removeListener(playerGameInput);
                index--;
            }
        }
        this.localPlayerGameInputList.clear();
    }

    public function addPlayerGameInput(playerGameInput : PlayerGameInput) : Void {
        this.localPlayerGameInputList.add(playerGameInput);
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

    public function getStartLevel() : Int {
        return this.startLevel;
    }

    public function setStartLevel(startLevel : Int) : Void {
        this.startLevel = startLevel;
    }

    public function setTouchButtonsPaintable(touchButtonsPaintable : Paintable) : Void {
        this.touchButtonsPaintable = touchButtonsPaintable;
    }

    public function getTouchButtonsPaintable() : Paintable {
        return this.touchButtonsPaintable;
    }

    public function setGameInputProcessor(gameInputProcessor : Processor) : Void {
        this.gameInputProcessor = gameInputProcessor;
    }

    public function getGameInputProcessor() : Processor {
        return this.gameInputProcessor;
    }

    public function setEndGameProcessor(endGameProcessor : Processor) : Void {
        this.endGameProcessor = endGameProcessor;
    }

    public function getEndGameProcessor() : Processor {
        return this.endGameProcessor;
    }

    public function setEndGameStatePaintable(endGameStatePaintable : Paintable) : Void {
        this.endGameStatePaintable = endGameStatePaintable;
    }

    public function getEndGameStatePaintable() : Paintable {
        return this.endGameStatePaintable;
    }

    public function setNonBotPaintableP(nonBotPaintable : Paintable) : Void {
        this.nonBotPaintable = nonBotPaintable;
    }

    public function getNonBotPaintableP() : Paintable {
        return this.nonBotPaintable;
    }

    public function setStartIntermissionPaintable(startIntermissionPaintable : InitUpdatePaintable) : Void {
        this.startIntermissionPaintable = startIntermissionPaintable;
    }

    public function getStartIntermissionPaintable() : InitUpdatePaintable {
        return this.startIntermissionPaintable;
    }

    public function setMainStateProcessor(mainStateProcessor : Processor) : Void {
        this.mainStateProcessor = mainStateProcessor;
    }

    public function getMainStateProcessor() : Processor {
        return this.mainStateProcessor;
    }

    public function setProcessGameProcessor(processGameProcessor : Processor) : Void {
        this.processGameProcessor = processGameProcessor;
    }

    public function getProcessGameProcessor() : Processor {
        return this.processGameProcessor;
    }

    public function setOpenMenuPaintable(openMenuPaintable : Paintable) : Void {
        this.openMenuPaintable = openMenuPaintable;
    }

    public function getOpenMenuPaintable() : Paintable {
        return this.openMenuPaintable;
    }

    public function setPopupMenuInputProcessor(popupMenuInputProcessor : BasicMenuInputProcessor) : Void {
        this.popupMenuInputProcessor = popupMenuInputProcessor;
    }

    public function getPopupMenuInputProcessor() : BasicMenuInputProcessor {
        return this.popupMenuInputProcessor;
    }

    public function getSensorGameUpdateProcessor() : SensorGameUpdateProcessor {
        return this.sensorGameUpdateProcessor;
    }

    public function getRawGameInputProcessor() : InputProcessor {
        return this.rawGameInputProcessor;
    }

    public function getRawInputProcessor() : InputProcessor {
        return this.rawInputProcessor;
    }

    public function setInputProcessor(inputProcessor : InputProcessor) : Void {
        this.inputProcessor = inputProcessor;
    }

    public function getInputProcessor() : InputProcessor {
        return this.inputProcessor;
    }

    public function setMenuPaintable(menuPaintable : Paintable) : Void {
        this.menuPaintable = menuPaintable;
    }

    public function getMenuPaintable() : Paintable {
        return this.menuPaintable;
    }

    private function setFormPaintable(formPaintable : Paintable) : Void {
        this.formPaintable = formPaintable;
    }

    public function getFormPaintable() : Paintable {
        return this.formPaintable;
    }

    public function setGameSpecificPaintableP(gameSpecificPaintable : Paintable) : Void {
        this.gameSpecificPaintable = gameSpecificPaintable;
    }

    public function getGameSpecificPaintableP() : Paintable {
        return this.gameSpecificPaintable;
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

    public static final TYPE : Int = 2;
    public override function getType() : Int {
        return AllBinaryGameCanvas.TYPE;
    }

}

