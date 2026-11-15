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
package org.allbinary.business.user.commerce.inventory.basket;

//import java.util.HashMap;
//import java.util.Set;
import org.allbinary.business.user.commerce.money.Money;
import org.allbinary.business.user.commerce.money.MoneyException;

interface BasketInterface {
    function addItem(id : String, num : String) : Void;

    function removeItem(id : String) : Void;

    function adjustItem(id : String, num : String) : Void;

    function getTotalWeight() : String;

    function getNumberOfItems() : Null<Int>;

    function getIds() : Set;

    function getItems() : HashMap;

    function getNumberOf(product : String) : Null<Int>;

    // throws MoneyException
    function getSubTotal() : Money;

}

