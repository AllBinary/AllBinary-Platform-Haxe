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
import org.allbinary.thread.ABRunnable;

class DemoGameStartupRunnable extends ABRunnable {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final demoCanvas : DemoCanvas;
    public function new(demoCanvas : DemoCanvas) {
        super();
        this.demoCanvas = demoCanvas;
    }

    public override function run() : Void {
        try {
            this.setRunning(true);
            this.demoCanvas.stopGameDemo();
            this.demoCanvas.create();
            this.demoCanvas.start();
            this.setRunning(false);
        } catch (e : haxe.Exception) {
            this.setRunning(false);
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            this.logUtil.put(commonStrings.EXCEPTION, this, commonStrings.RUN, e);
        }
    }

    public static final TYPE : Int = 4;
    public override function getType() : Int {
        return DemoGameStartupRunnable.TYPE;
    }

}

