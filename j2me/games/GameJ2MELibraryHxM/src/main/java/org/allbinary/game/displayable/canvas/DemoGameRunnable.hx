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

import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;
import org.allbinary.time.GameTickTimeDelayHelper;
import org.allbinary.time.GameTickTimeDelayHelperFactory;

class DemoGameRunnable extends GameRunnable {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final demoCanvas : DemoCanvas;
    public function new(demoCanvas : DemoCanvas) {
        super();
        this.demoCanvas = demoCanvas;
    }

    private final gameTickTimeDelayHelper : GameTickTimeDelayHelper = GameTickTimeDelayHelperFactory.getInstance();
    public override function run() : Void {
        try {
            this.demoCanvas.getLoopTimeHelperP().setStartTime(this.gameTickTimeDelayHelper.setStartTime());
            this.demoCanvas.processGame();
        } catch (e : haxe.Exception) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            this.logUtil.put(commonStrings.EXCEPTION, this, commonStrings.RUN, e);
        }
    }

    // throws Exception
    public override function processLoopSleep() : Void {
        this.demoCanvas.processLoopSleep();
    }

}

