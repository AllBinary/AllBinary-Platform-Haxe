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

import org.allbinary.business.user.address.StreetAddress;
import org.allbinary.business.user.commerce.money.Money;
import org.allbinary.business.user.commerce.money.payment.Payment;

interface OrderHistoryInterface {
    function setUserName(value : String) : Void;

    function setDefaultShippingAddress(shippingAddress : StreetAddress) : Void;

    function setBillingAddress(billingAddress : StreetAddress) : Void;

    function setPaymentInfo(payment : Payment) : Void;

    function setShipDate(value : String) : Void;

    function setOrderDate(value : String) : Void;

    function setTransDate(value : String) : Void;

    function setCancelDate(value : String) : Void;

    function setStatus(value : String) : Void;

    function setSubTotal(value : Money) : Void;

    function setShippingCost(value : Money) : Void;

    function setTaxes(value : Money) : Void;

    function setTotal(value : Money) : Void;

    function getUserName() : String;

    function getShippingAddress() : StreetAddress;

    function getBillingAddress() : StreetAddress;

    function getPaymentInfo() : Payment;

    function getShipDate() : String;

    function getOrderDate() : String;

    function getTransDate() : String;

    function getCancelDate() : String;

    function getStatus() : String;

    function getSubTotal() : Money;

    function getShippingCost() : Money;

    function getTaxes() : Money;

    function getTotal() : Money;

    function getPaymentMethod() : String;

}

