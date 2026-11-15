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
package org.allbinary.logic.system.security.licensing;

import javax.microedition.lcdui.CommandListener;

class LicenseUtil {
    private static final instance : LicenseUtil = new LicenseUtil();
    public static function getInstance() : LicenseUtil {
        return LicenseUtil.instance;
    }

    public function init() : Void {
    }

    // synchronized
    public function isRunning() : Bool {
        return false;
    }

    // synchronized
    public function setRunning(running : Bool) : Void {
    }

    public function shouldWait(commandListener : CommandListener) : Bool {
        return this.isRunning();
    }

    public function new() {
    }
}

