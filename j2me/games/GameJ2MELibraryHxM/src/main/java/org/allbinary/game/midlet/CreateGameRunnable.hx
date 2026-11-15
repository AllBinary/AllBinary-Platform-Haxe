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

import org.allbinary.graphics.canvas.transition.progress.ProgressCanvas;
import org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory;
import org.allbinary.graphics.displayable.command.MyCommandsFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;
import org.allbinary.util.ABHashtable;

class CreateGameRunnable implements Runnable {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    private final demoGameMidlet : DemoGameMidlet;
    private final hashtable : ABHashtable<Any, Any>;
    private final startGameMidletEvent : DemoGameMidletEvent;
    public function new(demoGameMidlet : DemoGameMidlet, hashtable : ABHashtable<Any, Any>) {
        this.demoGameMidlet = demoGameMidlet;
        this.hashtable = hashtable;
        this.startGameMidletEvent = new DemoGameMidletEvent(this, DemoGameMidletStateFactory.getInstance().START_GAME);
    }

    public function run() : Void {
        try {
            this.logUtil.putF(this.commonStrings.START_RUNNABLE, this, this.commonStrings.RUN);
            final progressCanvas : ProgressCanvas = ProgressCanvasFactory.getInstance();
            this.demoGameMidlet.commandAction(MyCommandsFactory.getInstance().SET_DISPLAYABLE, progressCanvas);
            this.demoGameMidlet.stopGameCanvasRunnableInterface();
            this.demoGameMidlet.setGameCanvasRunnableInterface(this.demoGameMidlet.createGameCanvasRunnableInterface());
            this.demoGameMidlet.getGameCanvasRunnableInterface().setLoadStateHashtable(this.hashtable);
            this.demoGameMidlet.startGameCanvasRunnableInterface();
            DemoGameMidletEventHandler.getInstance().fireEvent(this.startGameMidletEvent);
            this.logUtil.putF(this.commonStrings.END_RUNNABLE, this, this.commonStrings.RUN);
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.RUN, e);
        }
    }

}

