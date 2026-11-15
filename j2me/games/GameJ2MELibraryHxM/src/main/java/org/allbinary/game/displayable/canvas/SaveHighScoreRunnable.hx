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

import org.allbinary.game.score.displayable.HighScoreTextBox;
import org.allbinary.graphics.canvas.transition.progress.ProgressCanvas;
import org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;

class SaveHighScoreRunnable implements Runnable {
    private final progressCanvas : ProgressCanvas = ProgressCanvasFactory.getInstance();
    private final isLast : Bool;
    private final textBox : HighScoreTextBox;
    public function new(isLast : Bool, textBox : HighScoreTextBox) {
        this.isLast = isLast;
        this.textBox = textBox;
    }

    public function run() : Void {
        final logUtil : LogUtil = LogUtil.getInstance();
        try {
            if (this.isLast) {
                this.textBox.submit();
            } else {
                this.textBox.saveHighScore();
            }
        } catch (e : haxe.Exception) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            logUtil.put(commonStrings.EXCEPTION, this, "run", e);
            this.progressCanvas.end();
        }
    }

}

