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
package org.allbinary.android.api5;

import android.app.Activity;
import org.allbinary.input.motion.button.TouchScreenTypeFactory;
import org.allbinary.string.CommonStrings;
import org.allbinary.logic.communication.log.PreLogUtil;
import org.allbinary.android.api1.ActivityFractureUtilAPI1;
import org.allbinary.input.motion.button.TouchScreenFactory;

class ActivityFractureUtilAPI5 extends ActivityFractureUtilAPI1 {
    private static final instance5 : ActivityFractureUtilAPI5 = new ActivityFractureUtilAPI5();
    public static function getInstance() : ActivityFractureUtilAPI5 {
        return ActivityFractureUtilAPI5.instance5;
    }

    private final FEATURE_TOUCHSCREEN_MULTITOUCH : String = "android.hardware.touchscreen.multitouch";
    private final FEATURE_TOUCHSCREEN : String = "android.hardware.touchscreen";
    private final FEATURE_TOUCHSCREEN_MULTITOUCH_DISTINCT : String = "android.hardware.touchscreen.multitouch.distinct";
    public override function process(activity : Activity) : Void {
        final touchScreenFactory : TouchScreenFactory = TouchScreenFactory.getInstance();
        final touchScreenTypeFactory : TouchScreenTypeFactory = TouchScreenTypeFactory.getInstance();
        touchScreenFactory.setTouch(this.isTouch(activity));
        touchScreenFactory.setMultiTouch(this.isMultiTouch(activity));
        touchScreenFactory.setMultiTouchDistinct(this.isMultiTouchDistinct(activity));
        touchScreenTypeFactory.update(activity);
        final commonStrings : CommonStrings = CommonStrings.getInstance();
        PreLogUtil.put(touchScreenFactory.toString(), this, commonStrings.PROCESS);
    }

    private function isTouch(activity : Activity) : Bool {
        return this.isFeature(activity, this.FEATURE_TOUCHSCREEN);
    }

    private function isMultiTouch(activity : Activity) : Bool {
        return this.isFeature(activity, this.FEATURE_TOUCHSCREEN_MULTITOUCH);
    }

    private function isMultiTouchDistinct(activity : Activity) : Bool {
        return this.isFeature(activity, this.FEATURE_TOUCHSCREEN_MULTITOUCH_DISTINCT);
    }

    private function isFeature(activity : Activity, property : String) : Bool {
        return activity.getPackageManager().hasSystemFeature(property);
    }

    public function new() {
        super();
    }
}

