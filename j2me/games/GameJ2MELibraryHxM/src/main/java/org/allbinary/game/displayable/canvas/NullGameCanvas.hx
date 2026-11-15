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

import javax.microedition.lcdui.CommandListener;
import javax.microedition.lcdui.Graphics;
import javax.microedition.lcdui.NullCommandListener;
import org.allbinary.game.init.BasicBuildGameInitializerFactory;
import org.allbinary.game.layer.AllBinaryGameLayerManager;
import org.allbinary.game.score.NoHighScoresFactory;
import org.allbinary.logic.NullUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;

class NullGameCanvas extends AllBinaryGameCanvas {
    private static function createNull() : NullGameCanvas {
        try {
            return new NullGameCanvas(AllBinaryGameLayerManager.getNullInstance());
        } catch (e : haxe.Exception) {
            LogUtil.getInstance().put(CommonStrings.getInstance().EXCEPTION, "NullGameCanvas", CommonStrings.getInstance().GET_INSTANCE, e);
            throw new jre.lang.JavaException();
        }
    }

    private static var instance : Any = NullUtil.getInstance().NULL_OBJECT;
    public static function getInstance() : NullGameCanvas {
        if (NullGameCanvas.instance == NullUtil.getInstance().NULL_OBJECT) {
            NullGameCanvas.instance = NullGameCanvas.createNull();
        }
        return (cast NullGameCanvas.instance : NullGameCanvas);
    }

    // throws Exception
    public static function createCanvas(gameLayerManager : AllBinaryGameLayerManager) : NullGameCanvas {
        final nullGameCanvas : NullGameCanvas = new NullGameCanvas(gameLayerManager);
        nullGameCanvas.setInitialized(true);
        nullGameCanvas.setTitle(NullGameCanvas.NO_GAME);
        return nullGameCanvas;
    }

    public static final NO_GAME : String = "No Background Game";
    public function new(gameLayerManager : AllBinaryGameLayerManager) {
        super(NullCommandListener.NULL_COMMAND_LISTENER, gameLayerManager, NoHighScoresFactory.getInstance(), BasicBuildGameInitializerFactory.NULL_BASE_BUILD_GMAE_INITIALIZER_FACTORY, false);
        super.setWait(1200);
    }

    // synchronized
    public override function isGameOver() : Bool {
        return false;
    }

    private var runningNull : Bool = true;
    public override function setRunning(running : Bool) : Void {
        this.runningNull = running;
    }

    // synchronized
    public override function isRunning() : Bool {
        return this.runningNull;
    }

    // synchronized
    public override function pause() : Void {
        this.setPaused(true);
    }

    // synchronized
    public override function unPause() : Void {
        this.setPaused(false);
    }

    public override function initCommands(cmdListener : CommandListener) : Void {
        this.removeAllCommands();
        this.setCommandListener(cmdListener);
    }

    // throws Exception
    public override function buildGameInit(isProgress : Bool) : Void {
    }

    public override function draw(graphics : Graphics) : Void {
    }

    public override function run() : Void {
        try {
            this.logUtil.putF(this.commonStrings.START_RUNNABLE, this, this.commonStrings.RUN);
            this.logUtil.putF(this.commonStrings.END_RUNNABLE, this, this.commonStrings.RUN);
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.RUN, e);
        }
    }

    public static final TYPE : Int = 1;
    public override function getType() : Int {
        return NullGameCanvas.TYPE;
    }

}

