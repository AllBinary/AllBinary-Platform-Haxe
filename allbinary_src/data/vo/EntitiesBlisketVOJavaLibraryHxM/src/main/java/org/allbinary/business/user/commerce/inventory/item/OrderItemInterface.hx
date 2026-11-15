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
package org.allbinary.business.user.commerce.inventory.item;

import org.allbinary.business.user.address.StreetAddress;

interface OrderItemInterface extends ItemInterface {
    function setGroup(value : String) : Void;

    function setTax(value : String) : Void;

    function setShippingType(value : String) : Void;

    function setShippingCost(value : String) : Void;

    function setShippingAddress(value : StreetAddress) : Void;

    function setSpecial(value : String) : Void;

    function getGroup() : String;

    function getTax() : String;

    function getShippingType() : String;

    function getShippingCost() : String;

    function getShippingAddress() : StreetAddress;

    function getSpecial() : String;

}

