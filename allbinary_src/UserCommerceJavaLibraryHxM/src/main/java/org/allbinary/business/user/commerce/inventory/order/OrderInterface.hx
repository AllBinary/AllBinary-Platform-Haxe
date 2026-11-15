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
package org.allbinary.business.user.commerce.inventory.order;

import org.allbinary.business.user.commerce.inventory.basket.BasketInterface;

interface OrderInterface {
    function setShippingMethod(shippingType : String) : Void;

    function setPaymentMethod(value : String) : Void;

    function setSpecial(special : String) : Void;

    function setStoreName(value : String) : Void;

    function setUserComments(value : String) : Void;

    function setUserCancelComments(value : String) : Void;

    function setStoreComments(value : String) : Void;

    function setStoreCancelComments(value : String) : Void;

    function getBasket() : BasketInterface;

    function getShippingMethod() : String;

    function getPaymentMethod() : String;

    function getSpecial() : String;

    function getId() : String;

    function getStoreName() : String;

    function getUserComments() : String;

    function getUserCancelComments() : String;

    function getStoreComments() : String;

    function getStoreCancelComments() : String;

}

