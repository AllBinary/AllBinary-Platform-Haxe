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

//import javax.microedition.lcdui.CommandListener;
//import javax.microedition.lcdui.Font;
//import javax.microedition.lcdui.Graphics;
//import javax.microedition.lcdui.NullCommandListener;
import org.allbinary.canvas.Processor;
import org.allbinary.game.commands.GameCommandsFactory;
import org.allbinary.game.configuration.feature.Features;
import org.allbinary.game.configuration.feature.InputFeatureFactory;
import org.allbinary.game.displayable.RepaintBehavior;
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
import org.allbinary.graphics.PointFactory;
import org.allbinary.graphics.Rectangle;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.displayable.CanvasStrings;
import org.allbinary.graphics.displayable.DisplayInfoSingleton;
import org.allbinary.graphics.displayable.MyCanvas;
import org.allbinary.graphics.displayable.event.DisplayChangeEvent;
import org.allbinary.graphics.displayable.event.DisplayChangeEventHandler;
import org.allbinary.graphics.displayable.event.DisplayChangeEventListener;
import org.allbinary.graphics.displayable.screen.ScreenRepaintProcessorFactory;
import org.allbinary.graphics.font.MyFontProcessor;
import org.allbinary.graphics.font.UpdateMyFontInterface;
import org.allbinary.graphics.font.UpdateMyFontProcessor;
import org.allbinary.graphics.form.CommandCurrentSelectionFormFactory;
import org.allbinary.graphics.form.FormPaintable;
import org.allbinary.graphics.form.FormTypeFactory;
import org.allbinary.graphics.form.PaintableForm;
import org.allbinary.graphics.form.ScrollSelectionForm;
import org.allbinary.graphics.form.ScrollSelectionFormNoneFactory;
import org.allbinary.graphics.form.item.CommandTextItemArrayFactory;
import org.allbinary.graphics.form.item.ABCustomItem;
import org.allbinary.graphics.form.item.validation.AllCommandsVisitor;
import org.allbinary.graphics.paint.NullPaintable;
import org.allbinary.graphics.paint.Paintable;
import org.allbinary.input.motion.gesture.observer.BasicMotionGesturesHandler;
import org.allbinary.logic.communication.log.ForcedLogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.util.event.AllBinaryEventObject;
import org.allbinary.logic.util.event.EventStrings;
import org.allbinary.string.CommonSeps;
import org.allbinary.util.BasicArrayListD;

class GameCommandCanvas extends MyCanvas implements MenuListener implements DisplayChangeEventListener implements UpdateMyFontInterface {
    private final repaintProcessor : Processor = ScreenRepaintProcessorFactory.getInstance().create(this);
    public final gameInputStrings : GameInputStrings = GameInputStrings.getInstance();
    private static final id : Int = 0;
    public final foregroundBasicColor : BasicColor;
    public final backgroundBasicColor : BasicColor;
    public final inputToGameKeyMapping : InputToGameKeyMapping = PlatformInputMappingFactory.getInstance().getPersistentInputMappingInstance().getInputMapping();
    public final gameKeyFactory : GameKeyFactory = GameKeyFactory.getInstance();
    private final gameKeyEventFactory : GameKeyEventFactory = GameKeyEventFactory.getInstance();
    private final downGameKeyEventHandler : DownGameKeyEventHandler = DownGameKeyEventHandler.getInstance();
    private final upGameKeyEventHandler : UpGameKeyEventHandler = UpGameKeyEventHandler.getInstance();
    public final repaintBehavior : RepaintBehavior;
    public final updateMyFontProcessor : MyFontProcessor = new UpdateMyFontProcessor(this);
    public var myFontProcessor : MyFontProcessor = this.updateMyFontProcessor;
    public var foregroundColor : Int;
    public var backgroundColor : Int;
    private var menuInputProcessor : BasicMenuInputProcessor = NoMenuInputProcessor.getInstance();
    private var menuPaintable : Paintable = NullPaintable.getInstance();
    private var menuForm : PaintableForm = PaintableForm.getNullPaintableForm();
    private var isSingleKeyRepeatableProcessing : Bool = Features.getInstance().isFeature(InputFeatureFactory.getInstance().SINGLE_KEY_REPEAT_PRESS);
    public var fontHeight : Int = 0;
    public function new(cmdListener : CommandListener, name : String, backgroundBasicColor : BasicColor, foregroundBasicColor : BasicColor) {
        super(name, CanvasStrings.getInstance().EMPTY_CHILD_NAME_LIST);
        this.repaintBehavior = RepaintBehavior.getInstance();
        this.foregroundBasicColor = foregroundBasicColor;
        this.backgroundBasicColor = backgroundBasicColor;
        this.foregroundColor = Std.int(this.foregroundBasicColor);
        this.backgroundColor = Std.int(this.backgroundBasicColor);
        this.initCommands(cmdListener);
        if (cmdListener != NullCommandListener.NULL_COMMAND_LISTENER) {
            try {
                this.initMenu();
                this.repaintProcessor.process();
            } catch (e : haxe.Exception) {
                throw new haxe.Exception();
            }
        }
    }

    public override function updateMeasurement(graphics : Graphics) : Void {
        try {
            final font : Font = graphics.getFont();
            this.logUtil.putF(new StringMaker().append(this.commonStrings.START).append(this.canvasStrings.FD_WIDTH).appendint(Std.int(MyFontProcessor.defaultCharWidth(font))).append(this.canvasStrings.FD_HEIGHT).appendint(Std.int(font.getHeight())).toString(), this, this.canvasStrings.UPDATE_MEASUREMENT);
            this.fontHeight = font.getHeight();
            final rectangle : Rectangle = this.createRectangle(this.menuForm.size());
            this.menuForm.init(rectangle, FormTypeFactory.getInstance().VERTICAL_CENTER_FORM);
            this.update();
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.canvasStrings.ON_DISPLAY_CHANGE_EVENT, e);
        }
        this.myFontProcessor = MyFontProcessor.getInstance();
    }

    public override function onEvent(eventObject : AllBinaryEventObject) : Void {
        ForcedLogUtil.log(EventStrings.getInstance().PERFORMANCE_MESSAGE, this);
    }

    public override function onDisplayChangeEvent(displayChangeEvent : DisplayChangeEvent) : Void {
        this.logUtil.putF(new StringMaker().append(this.commonStrings.START).append(DisplayInfoSingleton.getInstance().toString()).toString(), this, this.canvasStrings.ON_DISPLAY_CHANGE_EVENT);
        this.myFontProcessor = this.updateMyFontProcessor;
    }

    public function initCommands(cmdListener : CommandListener) : Void {
        this.removeAllCommands();
        this.addCommand(GameCommandsFactory.getInstance().CLOSE_AND_SHOW_GAME_CANVAS);
        this.setCommandListener(cmdListener);
    }

    // throws Exception
    public function initMenu() : Void {
        final form : ScrollSelectionForm = this.createForm();
        this.menuForm = form;
        if (form != ScrollSelectionFormNoneFactory.getInstance()) {
            this.setMenuInputProcessor(new ImmediateCommandFormInputProcessor(new BasicArrayListD(), -1, this, form));
            this.menuPaintable = new FormPaintable(form);
        }
        this.repaintBehavior.onChangeRepaint(this);
    }

    // throws Exception
    public function createForm() : ScrollSelectionForm {
        final items : haxe.ds.Vector<ABCustomItem> = new CommandTextItemArrayFactory(new AllCommandsVisitor()).getInstance(this.getCommandStack(), this.backgroundBasicColor, this.foregroundBasicColor);
        final rectangle : Rectangle = this.createRectangle(items.length);
        return CommandCurrentSelectionFormFactory.getInstance(StringUtil.getInstance().EMPTY_STRING, items, rectangle, FormTypeFactory.getInstance().VERTICAL_CENTER_FORM, 15, false, this.backgroundBasicColor, this.foregroundBasicColor);
    }

    public function createRectangle(size : Int) : Rectangle {
        final height : Int = size * this.fontHeight;
        final startY : Int = (this.displayInfo.getLastHeight() * 2 / 3) - height;
        final pointFactory : PointFactory = PointFactory.getInstance();
        final rectangle : Rectangle = new Rectangle(pointFactory.createXY(30, startY), this.displayInfo.getLastWidth() - 30, startY);
        return rectangle;
    }

    public override function open() : Void {
        this.logUtil.putF(this.commonStrings.START, this, "open");
        BasicMotionGesturesHandler.getInstance().addListenerInterface(this.getMenuInputProcessor());
        GameKeyEventHandler.getInstance().addListener(this.getMenuInputProcessor());
        DisplayChangeEventHandler.getInstance().addListenerInterface(this);
    }

    // throws Exception
    public override function close() : Void {
        this.logUtil.putF(this.commonStrings.START, this, this.commonStrings.CLOSE);
        BasicMotionGesturesHandler.getInstance().removeListener(this.getMenuInputProcessor());
        GameKeyEventHandler.getInstance().removeListener(this.getMenuInputProcessor());
        DisplayChangeEventHandler.getInstance().removeListener(this);
    }

    // throws Exception
    public function update() : Void {
        this.repaintProcessor.process();
    }

    public override function getSourceId() : Int {
        return GameCommandCanvas.id;
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
        this.logUtil.putF(new StringMaker().append(CommonSeps.getInstance().SPACE).appendint(keyCode).toString(), this, this.gameInputStrings.KEY_PRESSED);
        this.addGameKeyEvent(keyCode, 0, false);
    }

    public override function keyReleasedByDevice(keyCode : Int, deviceId : Int) : Void {
        this.removeGameKeyEvent(keyCode, deviceId, false);
    }

    public override function keyRepeatedByDevice(keyCode : Int, deviceId : Int) : Void {
        if (this.isSingleKeyRepeatableProcessing) {
            this.addGameKeyEvent(keyCode, deviceId, true);
        }
    }

    private function addGameKeyEvent(keyCode : Int, deviceId : Int, repeated : Bool) : Void {
        try {
            final gameKey : GameKey = this.inputToGameKeyMapping.getInstanceForCanvas(this, keyCode);
            if (gameKey != this.gameKeyFactory.NONE) {
                final gameKeyEvent : GameKeyEvent = this.gameKeyEventFactory.getInstanceForInput(this, gameKey);
                this.downGameKeyEventHandler.fireEvent(gameKeyEvent);
                this.downGameKeyEventHandler.getInstanceForDevice(deviceId).fireEvent(gameKeyEvent);
            } else {
                this.logUtil.putF(new StringMaker().append(this.gameInputStrings.NO_KEY).appendint(keyCode).toString(), this, this.gameInputStrings.ADD_KEY_EVENT);
            }
        } catch (e : haxe.Exception) {
            this.logUtil.put("Key Event Error", this, this.gameInputStrings.ADD_KEY_EVENT, e);
        }
    }

    private function removeGameKeyEvent(keyCode : Int, deviceId : Int, repeated : Bool) : Void {
        try {
            final gameKey : GameKey = this.inputToGameKeyMapping.getInstanceForCanvas(this, keyCode);
            if (gameKey != this.gameKeyFactory.NONE) {
                final gameKeyEvent : GameKeyEvent = this.gameKeyEventFactory.getInstanceForInput(this, gameKey);
                this.upGameKeyEventHandler.fireEvent(gameKeyEvent);
                this.upGameKeyEventHandler.getInstanceForDevice(deviceId).fireEvent(gameKeyEvent);
            } else {
                this.logUtil.putF(new StringMaker().append(this.gameInputStrings.NO_KEY).appendint(keyCode).toString(), this, this.gameInputStrings.REMOVE_KEY_EVENT);
            }
        } catch (e : haxe.Exception) {
            this.logUtil.put("Key Event Error", this, this.gameInputStrings.REMOVE_KEY_EVENT, e);
        }
    }

    public override function paint(graphics : Graphics) : Void {
        this.myFontProcessor.process(graphics);
        this.menuPaintable.paint(graphics);
        this.repaintBehavior.repaint(this);
    }

    private function setMenuInputProcessor(menuInputProcessor : BasicMenuInputProcessor) : Void {
        this.menuInputProcessor = menuInputProcessor;
    }

    public function getMenuInputProcessor() : BasicMenuInputProcessor {
        return this.menuInputProcessor;
    }

}

