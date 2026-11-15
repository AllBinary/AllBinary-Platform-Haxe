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


interface ThirdPartyInApplicationPurchaseInterface {
    function isPurchased(lockableFeature : LockableFeature) : Bool;

    function onCreate(anyType : Any, stateObject : Any) : Void;

    function onDestroy() : Void;

    function onStart() : Void;

    function onActivityResult(requestCode : Int, resultCode : Int, dataObject : Any) : Void;

    function onSaveInstanceState(anyType : Any) : Void;

    function onStop() : Void;

    function requestPurchase(lockableFeature : LockableFeature) : Void;

    function requestReceipts() : Void;

    function add(lockableFeature : LockableFeature) : Void;

    function getUserName() : String;

    function isEnabled() : Bool;

}

