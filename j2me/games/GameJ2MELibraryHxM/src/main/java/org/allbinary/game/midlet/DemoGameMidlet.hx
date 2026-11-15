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

import org.allbinary.game.displayable.canvas.GameCanvasRunnableInterface;
import org.allbinary.game.layer.AllBinaryGameLayerManager;
import org.allbinary.graphics.canvas.transition.progress.ProgressCanvas;
import org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.system.security.licensing.ClientInformationFactory;
import org.allbinary.thread.PrimaryThreadPool;
import org.allbinary.game.displayable.canvas.NullGameCanvasRunnable;
import org.allbinary.util.ABHashtable;

class DemoGameMidlet extends GameMidlet {
    public function new(clientInformationFactory : ClientInformationFactory) {
        super(clientInformationFactory);
    }

    // throws Exception
    public function isContinue() : Bool {
        var hashtable : ABHashtable<Any, Any> = this.getStartStateHashtable();
        if (hashtable != null && hashtable.size() > 0) {
            return true;
        } else {
            return false;
        }
    }

    public function getHighestLevel() : Int {
        return 1;
    }

    // throws Exception
    public function createDemoGameCanvasRunnableInterface() : GameCanvasRunnableInterface {
        this.logUtil.putF(this.commonStrings.NOT_IMPLEMENTED, this, this.commonStrings.CREATE);
        return NullGameCanvasRunnable.NULL_GAME_CANVAS_RUNNABLE;
    }

    // throws Exception
    public function createGameCanvasRunnable(allBinaryGameLayerManager : AllBinaryGameLayerManager) : GameCanvasRunnableInterface {
        throw new haxe.Exception(this.commonStrings.NOT_IMPLEMENTED);
    }

    // throws Exception
    public function createGameCanvasRunnableInterface() : GameCanvasRunnableInterface {
        return this.createGameCanvasRunnable(this.createGameLayerManager());
    }

    public function demoSetup() : Void {
    }

    public function postDemoSetup() : Void {
    }

    // throws Exception
    // synchronized
    public override function setDemo() : Void {
        this.logUtil.putF(this.commonStrings.START, this, "setDemo");
        final progressCanvas : ProgressCanvas = ProgressCanvasFactory.getInstance();
        progressCanvas.start();
        PrimaryThreadPool.getInstance().runTask(new DemoRunnable(this));
    }

    // throws Exception
    // synchronized
    public override function createGame() : Void {
        final CREATE_GAME : String = "createGame";
        this.logUtil.putF(this.commonStrings.START, this, CREATE_GAME);
        final progressCanvas : ProgressCanvas = ProgressCanvasFactory.getInstance();
        progressCanvas.start();
        var hashtable : ABHashtable<Any, Any> = this.getStartStateHashtable();
        this.setStartStateHashtable(StdUtil.getInstance().NULL_TABLE);
        PrimaryThreadPool.getInstance().runTask(new CreateGameRunnable(this, hashtable));
        this.logUtil.putF(this.commonStrings.END, this, CREATE_GAME);
    }

    public function isReady() : Bool {
        return true;
    }

}

