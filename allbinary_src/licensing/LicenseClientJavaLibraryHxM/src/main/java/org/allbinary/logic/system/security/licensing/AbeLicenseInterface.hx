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

interface AbeLicenseInterface {
    function hasKey() : Bool;

    function getKey(keyName : String) : String;

    function getLicenseId() : String;

    function getServers() : BasicArrayList;

    function getSpecial() : String;

    function getLicenseType() : LicenseType;

    function isValid() : Bool;

    function toString() : String;

}

