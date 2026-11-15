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
import org.allbinary.android.input.VirtualKeyboard;
import org.allbinary.input.event.VirtualKeyboardEvent;
import org.allbinary.input.event.VirtualKeyboardEventHandler;
import org.allbinary.input.event.VirtualKeyboardEventListenerInterface;
import org.allbinary.logic.communication.log.ForcedLogUtil;
import org.allbinary.logic.util.event.AllBinaryEventObject;
import org.allbinary.logic.util.event.EventStrings;

class VirtualKeyboardAPI3 extends VirtualKeyboard implements VirtualKeyboardEventListenerInterface {
    public static var MAX_API : Int = Integer.MAX_VALUE;
    public static var MIN_API : Int = 3;
    private var virtualKeyboard : Bool = false;
    private var activity : Activity;
    private final showVirtualKeyboardRunnable : Runnable;
    private final hideVirtualKeyboardRunnable : Runnable;
    public function new(activity : Activity) {
        super();
        this.activity = activity;
        this.showVirtualKeyboardRunnable = new ShowVirtualKeyboardRunnable(this.activity);
        this.hideVirtualKeyboardRunnable = new HideVirtualKeyboardRunnable(this.activity);
        final virtualKeyboardEventHandler : VirtualKeyboardEventHandler = VirtualKeyboardEventHandler.getInstance();
        virtualKeyboardEventHandler.removeAllListeners();
        virtualKeyboardEventHandler.addListenerInterface(this);
    }

    public override function onEvent(eventObject : AllBinaryEventObject) : Void {
        ForcedLogUtil.log(EventStrings.getInstance().PERFORMANCE_MESSAGE, this);
    }

    public override function onVirtualKeyboardEvent(virtualKeyboardEvent : VirtualKeyboardEvent) : Void {
        final isShow : Null<Bool> = (cast virtualKeyboardEvent.getSource() : Null<Bool>);
        if (isShow) {
            this.showVirtualKeyboard();
        } else {
            this.hideVirtualKeyboard();
        }
    }

    public override function forceHide() : Void {
        this.hideVirtualKeyboard();
    }

    public override function hide() : Void {
        if (this.virtualKeyboard) {
            this.forceHide();
        }
    }

    private function showVirtualKeyboard() : Void {
        this.activity.runOnUiThread(this.showVirtualKeyboardRunnable);
        this.virtualKeyboard = true;
    }

    private function hideVirtualKeyboard() : Void {
        this.activity.runOnUiThread(this.hideVirtualKeyboardRunnable);
        this.virtualKeyboard = false;
    }

}

