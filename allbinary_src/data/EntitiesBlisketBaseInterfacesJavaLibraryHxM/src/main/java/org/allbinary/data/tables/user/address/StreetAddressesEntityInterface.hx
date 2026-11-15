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
package org.allbinary.data.tables.user.address;

import org.allbinary.business.user.address.StreetAddress;
import org.allbinary.data.tables.BasicDataTableInterface;

interface StreetAddressesEntityInterface extends BasicDataTableInterface {
    function remove(index : Null<Int>) : Void;

    function add(address : StreetAddress) : Void;

    function update(address : StreetAddress) : Void;

    function getLastId() : String;

    function getDefault() : StreetAddress;

    function setDefault(value : String) : Void;

}

