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

import org.allbinary.J2MEUtil;
import org.allbinary.logic.ABSystemWrapper;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.string.CommonStrings;
import org.allbinary.thread.ARunnable;

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
            logUtil.putF(Std.string(stringMaker.append("HighScoresCanvas - Request repaint to be sure: ").appendlong(currentTimeMillis)), this, commonStrings.RUN);
            highScoresCanvas.repaintBehavior.onChangeRepaint(highScoresCanvas);
            if (!isHTML) {
                while (!highScoresCanvas.hasPainted) {
                }
            }
            stringMaker.delete(0, stringMaker.length());
            logUtil.putF(Std.string(stringMaker.append("HighScoresCanvas - Now that the canvas has completed repaint go ahead and fetch the scores: ").appendlong(currentTimeMillis)), this, commonStrings.RUN);
            highScoresCanvas.executeUpdate();
        } catch (e : haxe.Exception) {
            logUtil.put(commonStrings.EXCEPTION, this, commonStrings.RUN, e);
        }
    }

}

