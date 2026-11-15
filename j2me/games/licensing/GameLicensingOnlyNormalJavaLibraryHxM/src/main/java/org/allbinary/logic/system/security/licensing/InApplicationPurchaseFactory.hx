/*
 * 
 * To change this license header, choose License Headers in Project Properties. 
 * To change this template file, choose Tools | Templates 
 * and open the template in the editor.  
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
        return true;
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

