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
package org.allbinary.logic.control.contraints.display.browser;


interface DisplayInBrowserContraintsInterface {
    function isMountable() : Bool;

    function isFrameable() : Bool;

    function isQuickFrameable() : Bool;

    function setMountable(canBeMounted : Bool) : Void;

    function setFrameable(canBeFramed : Bool) : Void;

    function setQuickFrameable(canBeQuickFramed : Bool) : Void;

    function setMountedLink(mountedLink : String) : Void;

    function getMountedLink() : String;

}

