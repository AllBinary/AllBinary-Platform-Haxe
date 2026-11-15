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

import org.allbinary.graphics.displayable.GameTickDisplayInfoSingleton;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;
import org.allbinary.time.GameTickTimeDelayHelper;
import org.allbinary.time.GameTickTimeDelayHelperFactory;

class GameFrameRunnable extends GameRunnable {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final gameTickDisplayInfoSingleton : GameTickDisplayInfoSingleton = GameTickDisplayInfoSingleton.getInstance();
    private final allBinaryGameCanvas : AllBinaryGameCanvas;
    public function new(allBinaryGameCanvas : AllBinaryGameCanvas) {
        super();
        this.allBinaryGameCanvas = allBinaryGameCanvas;
    }

    private final gameTickTimeDelayHelper : GameTickTimeDelayHelper = GameTickTimeDelayHelperFactory.getInstance();
    public override function run() : Void {
        try {
            final allBinaryGameCanvas : AllBinaryGameCanvas = this.allBinaryGameCanvas;
            allBinaryGameCanvas.getLoopTimeHelperP().setStartTime(this.gameTickTimeDelayHelper.setStartTime());
            this.gameTickDisplayInfoSingleton.update();
            allBinaryGameCanvas.processGame();
            if (!allBinaryGameCanvas.isRunning() || allBinaryGameCanvas.isPaused()) {
                allBinaryGameCanvas.notifyDonePainting();
            }
        } catch (e : haxe.Exception) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            this.logUtil.put(commonStrings.EXCEPTION, this, commonStrings.RUN, e);
        }
    }

}

