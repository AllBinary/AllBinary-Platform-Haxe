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

import org.allbinary.canvas.Processor;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;

class StartIntermissionProcessor extends Processor {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    private var gameCanvas : AllBinaryGameCanvas;
    private final WAIT : haxe.Int64 = 5000;
    public function new(gameCanvas : AllBinaryGameCanvas) {
        super();
        this.gameCanvas = gameCanvas;
    }

    // throws Exception
    public override function process() : Void {
        if (this.gameCanvas.getStartIntermissionInterface().getTimeDelayHelper().isElapsedTNT(this.WAIT)) {
            this.logUtil.putF("Intermission End", this, this.commonStrings.PROCESS);
            this.gameCanvas.getStartIntermissionInterface().setEnabled(false);
        }
    }

}

