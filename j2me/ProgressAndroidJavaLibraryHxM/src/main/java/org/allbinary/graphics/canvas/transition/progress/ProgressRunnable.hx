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

import android.app.Activity;
import org.allbinary.android.activity.MidletActivityBase;
import org.allbinary.android.activity.SimpleProgressActivityInterface;
import org.allbinary.thread.ARunnable;

class ProgressRunnable extends ARunnable {
    public final midletActivity : SimpleProgressActivityInterface;
    public final progressCanvas : ProgressCanvas;
    public function new(midletActivity : Activity, progressCanvas : ProgressCanvas) {
        super();
        final midletActivity2 : MidletActivityBase = (cast midletActivity : MidletActivityBase);
        this.midletActivity = (cast midletActivity2 : SimpleProgressActivityInterface);
        this.progressCanvas = progressCanvas;
    }

    public override function run() : Void {
    }

}

