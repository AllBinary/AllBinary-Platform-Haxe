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

import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class LockableFeatureFactory {
    private static final instance : LockableFeatureFactory = new LockableFeatureFactory();
    public static function getInstance() : LockableFeatureFactory {
        return LockableFeatureFactory.instance;
    }

    private final list : BasicArrayList = new BasicArrayListD();
    public function getList() : BasicArrayList {
        return this.list;
    }

    public function new() {
    }
}

