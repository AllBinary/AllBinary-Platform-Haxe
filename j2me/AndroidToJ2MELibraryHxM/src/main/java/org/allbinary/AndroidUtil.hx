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
package org.allbinary;

import android.app.Activity;
import android.os.Build;

class AndroidUtil {
    public static final NULL_ACTIVITY : Activity = new Activity();
    private static final version : Int = Std.parseInt(Build.VERSION.SDK);
    public static function isMemoryRestrictive() : Bool {
        if (AndroidUtil.version < 30) {
            return true;
        }
        return false;
    }

    public static function isAndroid() : Bool {
        return true;
    }

    public function new() {
    }
}

