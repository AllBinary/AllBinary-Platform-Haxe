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

import org.allbinary.android.AndroidInfoFactory;
import org.allbinary.android.input.api1.VirtualKeyboardAPI1;
import org.allbinary.android.input.api3.VirtualKeyboardAPI3;
import android.app.Activity;

class VirtualKeyboardFactory {
    private static var virtualKeyboard : VirtualKeyboard = VirtualKeyboard.NULL_VIRTUAL_KEYBOARD;
    public static function init(activity : Activity) : Void {
        var SDK_VERSION : Int = AndroidInfoFactory.getInstance().getVersion();
        if (SDK_VERSION <= 2) {
            VirtualKeyboardFactory.virtualKeyboard = new VirtualKeyboardAPI1(activity);
        } else {
            VirtualKeyboardFactory.virtualKeyboard = new VirtualKeyboardAPI3(activity);
        }
    }

    public static function getInstance() : VirtualKeyboard {
        return VirtualKeyboardFactory.virtualKeyboard;
    }

    public function new() {
    }
}

