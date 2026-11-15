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

import org.allbinary.logic.string.StringUtil;

class InApplicationPurchaseFactory {
    private static final instance : InApplicationPurchaseFactory = new InApplicationPurchaseFactory();
    public static function getInstance() : InApplicationPurchaseFactory {
        return InApplicationPurchaseFactory.instance;
    }

    public function new() {
    }

    public function init(anyType : Any, stateObject : Any) : Void {
    }

    public function onCreate(anyType : Any, stateObject : Any) : Void {
    }

    public function onStart() : Void {
    }

    public function onResult(requestCode : Int, resultCode : Int, data : Any) : Void {
    }

    public function onSaveState(anyType : Any) : Void {
    }

    public function onStop() : Void {
    }

    public function onDestroy() : Void {
    }

    public function purchase(lockableFeature : LockableFeature) : Void {
    }

    public function isPurchased(lockableFeature : LockableFeature) : Bool {
        return false;
    }

    public function add(lockableFeature : LockableFeature) : Void {
    }

    public function getUserName() : String {
        return StringUtil.getInstance().EMPTY_STRING;
    }

    public function isEnabled() : Bool {
        return false;
    }

}

