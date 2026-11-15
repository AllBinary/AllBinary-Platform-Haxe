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
package org.allbinary.graphics.canvas.transition.progress;

import javax.microedition.lcdui.CommandListener;
import javax.microedition.lcdui.Font;
import javax.microedition.lcdui.Graphics;
import javax.microedition.lcdui.NullCanvas;
import javax.microedition.lcdui.NullCommandListener;
import org.allbinary.canvas.Processor;
import org.allbinary.canvas.RunnableCanvas;
import org.allbinary.game.commands.GameCommandsFactory;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.displayable.CanvasStrings;
import org.allbinary.graphics.font.MyFontProcessor;
import org.allbinary.graphics.font.UpdateMyFontInterface;
import org.allbinary.graphics.font.UpdateMyFontProcessor;
import org.allbinary.graphics.form.item.ABCustomGaugeItem;
import org.allbinary.graphics.paint.NullPaintable;
import org.allbinary.graphics.paint.Paintable;
import org.allbinary.graphics.paint.PaintableInterface;
import org.allbinary.logic.communication.log.PreLogUtil;
import org.allbinary.logic.math.SmallIntegerSingletonFactory;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.midlet.AllBinaryMidlet;
import org.allbinary.thread.PathFindingThreadPool;
import org.allbinary.thread.ThreadPool;

class ProgressCanvas extends RunnableCanvas implements PaintableInterface implements UpdateMyFontInterface {
    public var hasPainted : Bool = false;
    private final backgroundBasicColor : BasicColor;
    public final GAUGE_PAINTABLE : Paintable;
    private final maxValue : Float = 100.0;
    public final gauge : ABCustomGaugeItem;
    private final TEXT : String;
    private final updateMyFontProcessor : MyFontProcessor;
    private var myFontProcessor : MyFontProcessor;
    public var allbinaryMidlet : AllBinaryMidlet = AllBinaryMidlet.getNullInstance();
    private var value : Float = 0.0;
    private var text : String;
    private var background : Bool = true;
    public var paintable : PaintableInterface;
    public var inProgress : Bool = false;
    private final IN_GAME_PROCESSOR : Processor;
    public var inGameProcessor : Processor = Processor.getInstance();
    public var progressEndListener : ProgressEndListener = ProgressEndListener.instance;
    public function new(title : String, backgroundBasicColor : BasicColor, foregroundBasicColor : BasicColor) {
        super(NullCommandListener.NULL_COMMAND_LISTENER, CanvasStrings.getInstance().EMPTY_CHILD_NAME_LIST, false);
        this.GAUGE_PAINTABLE = new ProgressPaintable(this);
        this.TEXT = this.commonStrings.LOADING;
        this.updateMyFontProcessor = new UpdateMyFontProcessor(this);
        this.myFontProcessor = this.updateMyFontProcessor;
        this.text = this.TEXT;
        this.paintable = this.GAUGE_PAINTABLE;
        this.IN_GAME_PROCESSOR = /* anonymous class body:
        private final pathFindingThreadPool : ThreadPool = PathFindingThreadPool.getInstance();
        // throws Exception
        public function process() : Void {
            this.pathFindingThreadPool.runAPriorityTask();
        }

*/ new Processor();
        this.backgroundBasicColor = backgroundBasicColor;
        this.gauge = new ABCustomGaugeItem(StringUtil.getInstance().EMPTY_STRING, Std.int(this.maxValue), 0, backgroundBasicColor, foregroundBasicColor);
    }

    public override function updateMeasurement(graphics : Graphics) : Void {
        final font : Font = graphics.getFont();
        this.gauge.setHeight(font.getHeight() + 2);
        this.myFontProcessor = MyFontProcessor.getInstance();
    }

    public function init(gameMidlet : AllBinaryMidlet) : Void {
        this.allbinaryMidlet = gameMidlet;
    }

    // throws Exception
    public function update(graphics : Graphics) : Void {
    }

    public override function initCommands(cmdListener : CommandListener) : Void {
    }

    public function getMaxValue() : Float {
        return this.maxValue;
    }

    public function start() : Void {
        this.logUtil.putF(this.commonStrings.START, this, this.commonStrings.START_METHOD_NAME);
        this.setBackground(true);
        this.gauge.setHeight(30);
        this.gauge.setLabel(this.commonStrings.PLEASE_WAIT);
        this.setText(this.TEXT);
        this.setValue(0);
        this.inGameProcessor = Processor.getInstance();
        this.paintable = this.GAUGE_PAINTABLE;
        this.inProgress = true;
    }

    private final backgroundLabel : String = "Background AI Game Loading...";
    private final START_BACKGROUND : String = "startBackground";
    public function startBackground(background : Bool) : Void {
        this.logUtil.putF(this.commonStrings.START, this, this.START_BACKGROUND);
        this.setBackground(background);
        this.myFontProcessor = this.updateMyFontProcessor;
        this.gauge.setLabel(this.backgroundLabel);
        this.setText(this.TEXT);
        this.setValue(0);
        this.inGameProcessor = Processor.getInstance();
        this.paintable = this.GAUGE_PAINTABLE;
    }

    public function endActual() : Void {
        this.allbinaryMidlet.commandAction(GameCommandsFactory.getInstance().SHOW_GAME_CANVAS, NullCanvas.NULL_CANVAS);
        this.inProgress = false;
        this.inGame();
    }

    public function inGame() : Void {
        this.progressEndListener.onEndEvent();
        this.inGameProcessor = this.IN_GAME_PROCESSOR;
    }

    public function end() : Void {
        this.logUtil.putF(this.commonStrings.START, this, this.commonStrings.END_METHOD_NAME);
        this.gauge.setValue(this.getMaxValue());
        this.endActual();
        this.paintable = NullPaintable.getInstance();
    }

    public function endFromInitialLazyLoadingComplete() : Void {
        this.progressEndListener.onEndEvent();
        this.gauge.setValue(this.getMaxValue());
        this.inGameProcessor = this.IN_GAME_PROCESSOR;
    }

    public function isInGame() : Bool {
        if (this.inGameProcessor == this.IN_GAME_PROCESSOR) {
            return true;
        }
        return false;
    }

    public function endIfPaintedSinceStart() : Void {
    }

    public final ADD_PORTION : String = "addPortion";
    public final ADD_EARLY_PORTION : String = "addEarlyPortion";
    public function addEarlyPortion(value : Int, text : String, index : Int) : Void {
        this.setText(Std.string(new StringMaker().append(text).append(Std.string(SmallIntegerSingletonFactory.getInstance().getAt(index)))));
        this.gauge.setValue(this.gauge.getValue() + this.getMaxValue() / value);
    }

    public function addPortion(value : Int, text : String, index : Int) : Void {
        this.setText(Std.string(new StringMaker().append(text).append(Std.string(SmallIntegerSingletonFactory.getInstance().getAt(index)))));
        PreLogUtil.put(this.text, this, this.ADD_PORTION);
        this.gauge.setValue(this.gauge.getValue() + this.getMaxValue() / value);
    }

    public function addNormalPortion(value : Int, text : String) : Void {
        if (this.text != text) {
            PreLogUtil.put(text, this, this.ADD_PORTION);
        }
        this.setText(text);
        this.gauge.setValue(this.gauge.getValue() + this.getMaxValue() / value);
    }

    public function setValue(value : Int) : Void {
        this.value = value;
        this.gauge.setValue(value);
    }

    public override function paint(graphics : Graphics) : Void {
        this.paintable.paint(graphics);
    }

    public function paint2(graphics : Graphics) : Void {
        this.myFontProcessor.process(graphics);
        graphics.setColor(Std.int(this.backgroundBasicColor));
        graphics.fillRect(0, 0, this.displayInfo.getLastWidth(), this.displayInfo.getLastHeight());
        this.gauge.paintXY(graphics, 0, 0);
        this.hasPainted = true;
    }

    public override function paintThreed(graphics : Graphics) : Void {
    }

    public function getValue() : Float {
        return this.value;
    }

    public function setText(text : String) : Void {
        this.text = text;
    }

    public function getText() : String {
        return this.text;
    }

    public function setBackground(background : Bool) : Void {
        this.background = background;
    }

    public function isBackground() : Bool {
        return this.background;
    }

}

