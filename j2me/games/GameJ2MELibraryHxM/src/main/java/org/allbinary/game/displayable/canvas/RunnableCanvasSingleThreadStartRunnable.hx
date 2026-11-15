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

import org.allbinary.canvas.RunnableCanvas;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;

class RunnableCanvasSingleThreadStartRunnable extends GameRunnable {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final runnableCanvas : RunnableCanvas;
    public function new(demoCanvas : RunnableCanvas) {
        super();
        this.runnableCanvas = demoCanvas;
    }

    public override function run() : Void {
        try {
            this.runnableCanvas.run();
        } catch (e : haxe.Exception) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            this.logUtil.put(commonStrings.EXCEPTION, this, commonStrings.RUN, e);
        }
    }

    // throws Exception
    public override function processLoopSleep() : Void {
        this.runnableCanvas.processLoopSleep();
    }

}

