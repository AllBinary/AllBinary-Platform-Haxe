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

import org.allbinary.logic.system.os.GenericOperatingSystem;
import org.allbinary.util.ABHashtable;
import org.allbinary.util.BasicArrayList;

interface AbeClientInformationInterface {
    function init() : Void;

    function getOperatingSystemInterface() : GenericOperatingSystem;

    function getName() : String;

    function getSpecialName() : String;

    function getVersion() : String;

    function getLicenseId() : String;

    function getLicenseServers() : BasicArrayList;

    function getLicenseServer(index : Int) : String;

    function getNumberOfLicenseServers() : Int;

    function toHashtable() : ABHashtable<Any, Any>;

    function isSameId(alicenseId : String) : Bool;

    function isLargerOrDifferentServerList(vector : BasicArrayList) : Bool;

    function isHardSale() : Bool;

    function toShortString() : String;

}

