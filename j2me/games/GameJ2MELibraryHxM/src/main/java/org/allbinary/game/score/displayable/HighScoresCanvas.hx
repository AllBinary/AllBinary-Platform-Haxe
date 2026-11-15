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
package org.allbinary.game.score.displayable;

//import javax.microedition.lcdui.Command;
//import javax.microedition.lcdui.CommandListener;
//import javax.microedition.lcdui.Graphics;
import org.allbinary.J2MEUtil;
import org.allbinary.game.GameInfo;
import org.allbinary.game.commands.GameCommandsFactory;
import org.allbinary.game.displayable.canvas.GameCommandCanvas;
import org.allbinary.game.layer.AllBinaryGameLayerManager;
import org.allbinary.game.paint.ColorFillBasePaintable;
import org.allbinary.game.paint.ColorFillPaintableFactory;
import org.allbinary.game.score.HighScoreCommandsFactory;
import org.allbinary.game.score.HighScores;
import org.allbinary.game.score.HighScoresCanvasInputProcessor;
import org.allbinary.game.score.HighScoresCanvasInputProcessorFactoryInterface;
import org.allbinary.game.score.HighScoresFactoryInterface;
import org.allbinary.game.score.HighScoresHelperBase;
import org.allbinary.game.score.HighScoresPaintable;
import org.allbinary.game.score.HighScoresResultsListener;
import org.allbinary.game.score.NoHighScoresFactory;
import org.allbinary.game.score.NullHighScoresSingletonFactory;
import org.allbinary.graphics.color.BasicColorFactory;
import org.allbinary.graphics.paint.NullPaintable;
import org.allbinary.graphics.paint.Paintable;
import org.allbinary.graphics.paint.SimpleTextPaintable;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.string.CommonStrings;
import org.allbinary.thread.ARunnable;
import org.allbinary.thread.SecondaryThreadPool;
import org.allbinary.logic.ABSystemWrapper;

class HighScoresCanvas extends GameCommandCanvas implements HighScoresResultsListener {
    public static final NAME : String = "HighScoresCanvas";
    private var paintable : Paintable = NullPaintable.getInstance();
    private final highScoreCommandsFactory : HighScoreCommandsFactory = HighScoreCommandsFactory.getInstance();
    private final waitPaintable : SimpleTextPaintable = new SimpleTextPaintable(this.commonStrings.PLEASE_WAIT_FOR_SERVER, BasicColorFactory.getInstance().WHITE);
    private final highScoresPaintable : HighScoresPaintable;
    private final highScoresFactoryInterface : HighScoresFactoryInterface;
    public var colorFillPaintable : ColorFillBasePaintable;
    private final highScoresHelper : HighScoresHelperBase = new HighScoresHelperBase();
    private final gameInfo : GameInfo;
    private final highScoresCanvasInputProcessor : HighScoresCanvasInputProcessor;
    private var currentCommand : Command = this.highScoreCommandsFactory.HIGH_SCORE_COMMANDS[0];
    private var hasPainted : Bool = false;
    public function new(commandListener : CommandListener, allBinaryGameLayerManager : AllBinaryGameLayerManager, gameInfo : GameInfo, paintable : HighScoresPaintable, highScoresFactoryInterface : HighScoresFactoryInterface, highScoresCanvasInputProcessorFactoryInterface : HighScoresCanvasInputProcessorFactoryInterface) {
        super(commandListener, HighScoresCanvas.NAME, allBinaryGameLayerManager.getBackgroundBasicColor(), allBinaryGameLayerManager.getForegroundBasicColor());
        this.logUtil.putF(this.commonStrings.START, this, this.commonStrings.CONSTRUCTOR);
        this.highScoresPaintable = paintable;
        this.highScoresFactoryInterface = highScoresFactoryInterface;
        this.highScoresCanvasInputProcessor = highScoresCanvasInputProcessorFactoryInterface.getInstance(this);
        this.gameInfo = gameInfo;
        this.waitPaintable.setBasicColorP(allBinaryGameLayerManager.getForegroundBasicColor());
        this.getHighScoresPaintable().setBasicColorP(allBinaryGameLayerManager.getForegroundBasicColor());
        this.colorFillPaintable = ColorFillPaintableFactory.getInstance().getInstance(allBinaryGameLayerManager.getBackgroundBasicColor(), false);
        if (this.highScoresHelper.getHighScoresArray() == NoHighScoresFactory.getInstance().NO_HIGH_SCORES) {
            this.setPaintable(this.waitPaintable);
        } else {
            this.logUtil.putF("Show HighScores that are already loaded", this, this.commonStrings.CONSTRUCTOR);
            this.updateCommand(this.currentCommand);
            this.setPaintable(this.getHighScoresPaintable());
        }
        // Java inner class: Haxe does not nest classes so move this to its own module
        class HighScoreRunnable extends ARunnable {
            public final highScoresCanvas : HighScoresCanvas;
            public function new(highScoresCanvas : HighScoresCanvas) {
                super();
                this.highScoresCanvas = highScoresCanvas;
            }

            public override function run() : Void {
                final commonStrings : CommonStrings = CommonStrings.getInstance();
                final logUtil : LogUtil = LogUtil.getInstance();
                final highScoresCanvas : HighScoresCanvas = this.highScoresCanvas;
                try {
                    final isHTML : Bool = J2MEUtil.isHTML();
                    if (!isHTML) {
                        while (!highScoresCanvas.hasPainted) {
                        }
                        highScoresCanvas.hasPainted = false;
                    }
                    final stringMaker : StringMaker = new StringMaker();
                    final systemWrapper : ABSystemWrapper = ABSystemWrapper.getInstance();
                    final currentTimeMillis : haxe.Int64 = systemWrapper.currentTimeMillis();
                    logUtil.putF(stringMaker.append("HighScoresCanvas - Request repaint to be sure: ").appendlong(currentTimeMillis).toString(), this, commonStrings.RUN);
                    highScoresCanvas.repaintBehavior.onChangeRepaint(highScoresCanvas);
                    if (!isHTML) {
                        while (!highScoresCanvas.hasPainted) {
                        }
                    }
                    stringMaker.delete(0, stringMaker.length());
                    logUtil.putF(stringMaker.append("HighScoresCanvas - Now that the canvas has completed repaint go ahead and fetch the scores: ").appendlong(currentTimeMillis).toString(), this, commonStrings.RUN);
                    highScoresCanvas.executeUpdate();
                } catch (e : haxe.Exception) {
                    logUtil.put(commonStrings.EXCEPTION, this, commonStrings.RUN, e);
                }
            }

        }
        SecondaryThreadPool.getInstance().runTask(new HighScoreRunnable(this));
    }

    public override function initCommands(cmdListener : CommandListener) : Void {
        this.removeAllCommands();
        this.addCommand(GameCommandsFactory.getInstance().CLOSE_AND_SHOW_GAME_CANVAS);
        this.setCommandListener(cmdListener);
    }

    public override function open() : Void {
        super.open();
        this.highScoresCanvasInputProcessor.open();
    }

    // throws Exception
    public override function close() : Void {
        super.close();
        this.highScoresCanvasInputProcessor.close();
    }

    public override function paint(graphics : Graphics) : Void {
        this.colorFillPaintable.paint(graphics);
        this.paintable.paint(graphics);
        if (this.waitPaintable != this.paintable) {
            this.highScoresCanvasInputProcessor.paint(graphics);
        }
        super.paint(graphics);
        this.hasPainted = true;
    }

    public function executeUpdate() : Void {
        try {
            this.highScoresFactoryInterface.fetchHighScores(this.getGameInfo(), this);
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.UPDATE, e);
        }
    }

    private function getHighScoresPaintable() : HighScoresPaintable {
        return this.highScoresPaintable;
    }

    public override function setHighScoresArray(highScoresArray : haxe.ds.Vector<HighScores>) : Void {
        try {
            if (highScoresArray != null) {
                this.logUtil.putF(new StringMaker().append(this.commonStrings.START).appendint(highScoresArray.length).toString(), this, "setHighScoresArray");
            } else {
                this.logUtil.putF(this.commonStrings.START, this, "setHighScoresArray");
            }
            this.highScoresHelper.setHighScoresArray(highScoresArray);
            this.updateCommand(this.currentCommand);
            this.setPaintable(this.getHighScoresPaintable());
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.UPDATE, e);
        }
    }

    // throws Exception
    public function updateCommand(command : Command) : Void {
        this.logUtil.putF(new StringMaker().append(this.commonStrings.START).append(this.stringUtil.toString(command)).toString(), this, this.commonStrings.UPDATE);
        final gameCommandsFactory : GameCommandsFactory = GameCommandsFactory.getInstance();
        if (this.highScoreCommandsFactory.isHighScoreCommand(command)) {
            final index : Int = this.highScoreCommandsFactory.getIndex(command);
            var nextIndex : Int = index + 1;
            final highScoresArray : haxe.ds.Vector<HighScores> = this.highScoresHelper.getHighScoresArray();
            if (nextIndex >= highScoresArray.length) {
                nextIndex = 0;
            }
            if (highScoresArray.length > 0) {
                this.getHighScoresPaintable().setHighScores(highScoresArray[index]);
            } else {
                this.getHighScoresPaintable().setHighScores(NullHighScoresSingletonFactory.getInstance());
            }
            if (index != nextIndex) {
                this.removeAllCommands();
                this.addCommand(gameCommandsFactory.CLOSE_AND_SHOW_GAME_CANVAS);
                this.addCommand(this.highScoreCommandsFactory.HIGH_SCORE_COMMANDS[nextIndex]);
            }
        }
        this.currentCommand = command;
        this.close();
        super.initMenu();
        this.open();
        this.repaintBehavior.onChangeRepaint(this);
    }

    public function getGameInfo() : GameInfo {
        return this.gameInfo;
    }

    private function setPaintable(paintable : Paintable) : Void {
        this.paintable = paintable;
        this.repaintBehavior.onChangeRepaint(this);
    }

}

