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


class LockedUtil implements LockedUtilInterface {
    private static final instance : LockedUtil = new LockedUtil();
    public static function getInstance() : LockedUtil {
        return LockedUtil.instance;
    }

    public function isLocked() : Bool {
        return true;
    }

    public function isLockedFeature(lockableFeatrue : LockableFeature) : Bool {
        return true;
    }

    public function new() {
    }
}

