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
package org.allbinary.android.api19;

import android.app.Activity;
import android.view.View;
import org.allbinary.android.api5.ActivityFractureUtilAPI5;

class ActivityFractureUtilAPI19 extends ActivityFractureUtilAPI5 {
    private static final instance19 : ActivityFractureUtilAPI19 = new ActivityFractureUtilAPI19();
    public static function getInstance() : ActivityFractureUtilAPI19 {
        return ActivityFractureUtilAPI19.instance19;
    }

    public override function setFullScreen(activity : Activity) : Void {
        final decorView : View = activity.getWindow().getDecorView();
        final visibility : Int = View.SYSTEM_UI_FLAG_IMMERSIVE_STICKY | View.SYSTEM_UI_FLAG_HIDE_NAVIGATION | View.SYSTEM_UI_FLAG_FULLSCREEN;
        decorView.setSystemUiVisibility(visibility);
    }

    public function new() {
        super();
    }
}

