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

class ThirdPartyInApplicationPurchase implements ThirdPartyInApplicationPurchaseInterface {
    public function isPurchased(lockableFeature : LockableFeature) : Bool {
        return false;
    }

    public function onCreate(anyType : Any, stateObject : Any) : Void {
    }

    public function onDestroy() : Void {
    }

    public function onStart() : Void {
    }

    public function onActivityResult(requestCode : Int, resultCode : Int, dataObject : Any) : Void {
    }

    public function onSaveInstanceState(anyType : Any) : Void {
    }

    public function onStop() : Void {
    }

    public function requestPurchase(lockableFeature : LockableFeature) : Void {
    }

    public function requestReceipts() : Void {
    }

    public function add(lockableFeature : LockableFeature) : Void {
    }

    public function getUserName() : String {
        return StringUtil.getInstance().EMPTY_STRING;
    }

    public function isEnabled() : Bool {
        return false;
    }

    public function requestProducts() : Void {
    }

    public function new() {
    }
}

