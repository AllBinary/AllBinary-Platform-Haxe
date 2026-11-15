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
package org.allbinary.android.input.api3;

import android.app.Activity;
import android.content.Context;
import android.os.IBinder;
import android.view.View;
import android.view.inputmethod.InputMethodManager;
import org.allbinary.android.activity.ViewCompositeInterface;
import org.allbinary.logic.communication.log.ForcedLogUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;

class HideVirtualKeyboardRunnable implements Runnable {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final activity : Activity;
    public function new(activity : Activity) {
        this.activity = activity;
    }

    public function run() : Void {
        final commonStrings : CommonStrings = CommonStrings.getInstance();
        try {
            final inputMethodManager : InputMethodManager = (cast this.activity.getSystemService(Context.INPUT_METHOD_SERVICE) : InputMethodManager);
            final viewCompositeInterface : ViewCompositeInterface = (cast this.activity : ViewCompositeInterface);
            if (viewCompositeInterface == null) {
                ForcedLogUtil.log("Activity Null", this);
            }
            final view : View = viewCompositeInterface.getView();
            if (view.getWindowToken() == null) {
                this.logUtil.putF("Unable to hide virtual keyboard as window token is null - This usually happens during loading when the view is not attached to a window", this, commonStrings.RUN);
                return;
            }
            final token : IBinder = view.getWindowToken();
            inputMethodManager.hideSoftInputFromWindow(token, 0);
        } catch (e : haxe.Exception) {
            this.logUtil.put(commonStrings.EXCEPTION, this, commonStrings.RUN, e);
        }
    }

}

