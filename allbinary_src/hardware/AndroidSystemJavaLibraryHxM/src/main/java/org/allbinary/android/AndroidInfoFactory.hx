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
package org.allbinary.android;

import android.os.Build;

class AndroidInfoFactory {
    private static final instance : AndroidInfoFactory = new AndroidInfoFactory();
    public static function getInstance() : AndroidInfoFactory {
        return AndroidInfoFactory.instance;
    }

    private final version : Int = Std.parseInt(Build.VERSION.SDK);
    public function getVersion() : Int {
        return this.version;
    }

    public function new() {
    }
}

