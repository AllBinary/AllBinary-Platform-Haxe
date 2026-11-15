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
package org.allbinary.android.api1;

import org.allbinary.android.ActivityFractureUtil;
import android.app.Activity;
import android.view.WindowManager;

class ActivityFractureUtilAPI1 extends ActivityFractureUtil {
    private static final instance : ActivityFractureUtilAPI1 = new ActivityFractureUtilAPI1();
    public static function getInstance() : ActivityFractureUtilAPI1 {
        return ActivityFractureUtilAPI1.instance;
    }

    // throws Exception
    public override function process(activity : Activity) : Void {
    }

    public override function setFullScreen(activity : Activity) : Void {
        activity.getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN, WindowManager.LayoutParams.FLAG_FULLSCREEN);
    }

    public function new() {
        super();
    }
}

