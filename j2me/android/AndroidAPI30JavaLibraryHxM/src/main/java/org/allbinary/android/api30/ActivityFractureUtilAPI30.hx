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
package org.allbinary.android.api30;

import android.app.Activity;
import android.view.Window;
import androidx.core.view.WindowCompat;
import androidx.core.view.WindowInsetsCompat;
import androidx.core.view.WindowInsetsControllerCompat;
import org.allbinary.android.api5.ActivityFractureUtilAPI5;

class ActivityFractureUtilAPI30 extends ActivityFractureUtilAPI5 {
    private static final instance30 : ActivityFractureUtilAPI30 = new ActivityFractureUtilAPI30();
    public static function getInstance() : ActivityFractureUtilAPI30 {
        return ActivityFractureUtilAPI30.instance30;
    }

    public override function setFullScreen(activity : Activity) : Void {
        final window : Window = activity.getWindow();
        final windowInsetsController : WindowInsetsControllerCompat = WindowCompat.getInsetsController(window, window.getDecorView());
        windowInsetsController.hide(WindowInsetsCompat.Type.systemBars());
        windowInsetsController.setSystemBarsBehavior(WindowInsetsControllerCompat.BEHAVIOR_SHOW_TRANSIENT_BARS_BY_SWIPE);
    }

    public function new() {
        super();
    }
}

