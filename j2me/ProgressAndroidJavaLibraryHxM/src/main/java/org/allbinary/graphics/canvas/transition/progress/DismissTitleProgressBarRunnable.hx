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

import org.allbinary.animation.transition.TransistionTypes;
import org.allbinary.string.CommonStrings;
import org.allbinary.logic.communication.log.LogUtil;
import android.app.Activity;

class DismissTitleProgressBarRunnable extends ProgressRunnable {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public function new(midletActivity : Activity, progressCanvas : ProgressCanvas) {
        super(midletActivity, progressCanvas);
    }

    private final ZOOM_OUT_AND_IN : haxe.ds.Vector<Int> = haxe.ds.Vector.fromArrayCopy([TransistionTypes.getInstance().ZOOM_OUT, TransistionTypes.getInstance().ZOOM_IN]);
    public override function run() : Void {
        try {
            this.midletActivity.onDismissProgress(this.ZOOM_OUT_AND_IN);
        } catch (e : haxe.Exception) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            this.logUtil.put(commonStrings.EXCEPTION, this, commonStrings.RUN, e);
        }
    }

}

