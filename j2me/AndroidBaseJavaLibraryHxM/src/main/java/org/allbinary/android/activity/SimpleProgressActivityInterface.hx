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
package org.allbinary.android.activity;


interface SimpleProgressActivityInterface {
    function runOnUiThread(action : Runnable) : Void;

    // throws Exception
    function onSetProgress(value : Int, text : String) : Void;

    // throws Exception
    function onDismissProgress(animationSequence : haxe.ds.Vector<Int>) : Void;

    // throws Exception
    function onShowProgress(indeterminate : Bool, animationSequence : haxe.ds.Vector<Int>) : Void;

}

