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
package org.allbinary.android.input;

import org.allbinary.input.event.VirtualKeyboardEvent;
import org.allbinary.logic.communication.log.ForcedLogUtil;
import org.allbinary.logic.util.event.AllBinaryEventObject;
import org.allbinary.logic.util.event.EventStrings;

class VirtualKeyboard {
    public static final NULL_VIRTUAL_KEYBOARD : VirtualKeyboard = new VirtualKeyboard();
    public function onEvent(eventObject : AllBinaryEventObject) : Void {
        ForcedLogUtil.log(EventStrings.getInstance().PERFORMANCE_MESSAGE, this);
    }

    public function onVirtualKeyboardEvent(virtualKeyboardEvent : VirtualKeyboardEvent) : Void {
    }

    public function forceHide() : Void {
    }

    public function hide() : Void {
    }

    public function new() {
    }
}

