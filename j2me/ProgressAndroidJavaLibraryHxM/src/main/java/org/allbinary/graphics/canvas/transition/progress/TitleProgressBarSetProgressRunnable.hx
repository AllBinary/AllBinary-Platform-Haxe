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
package org.allbinary.graphics.canvas.transition.progress;

import org.allbinary.string.CommonStrings;
import org.allbinary.logic.communication.log.LogUtil;
import android.app.Activity;

class TitleProgressBarSetProgressRunnable extends ProgressRunnable {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public function new(midletActivity : Activity, progressCanvas : ProgressCanvas) {
        super(midletActivity, progressCanvas);
    }

    public override function run() : Void {
        try {
            this.midletActivity.onSetProgress(Std.int(this.progressCanvas.getValue()), this.progressCanvas.getText());
        } catch (e : haxe.Exception) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            this.logUtil.put(commonStrings.EXCEPTION, this, commonStrings.RUN, e);
        }
    }

}

