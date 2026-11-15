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

class ShowTitleProgressBarRunnable extends ProgressRunnable {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public function new(midletActivity : Activity, progressCanvas : ProgressCanvas) {
        super(midletActivity, progressCanvas);
    }

    private final FADE_IN_HALF : haxe.ds.Vector<Int> = haxe.ds.Vector.fromArrayCopy([TransistionTypes.getInstance().FADE_IN_TO_HALF_ALPHA, TransistionTypes.getInstance().FADE_IN_FROM_HALF_ALPHA]);
    public override function run() : Void {
        try {
            this.midletActivity.onShowProgress(false, this.FADE_IN_HALF);
        } catch (e : haxe.Exception) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            this.logUtil.put(commonStrings.EXCEPTION, this, commonStrings.RUN, e);
        }
    }

}

