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
package org.allbinary.business.user.commerce.money.payment.gateway.transaction;

import org.allbinary.business.user.commerce.inventory.order.OrderHistory;
import org.allbinary.business.user.commerce.money.payment.types.TenderType;

interface PaymentTransactionInterfaceFactoryInterface {
    // throws Exception
    function getInstance(orderHistory : OrderHistory) : PaymentTransactionInterface;

    // throws Exception
    function getSaleTransaction(tenderType : TenderType) : PaymentTransactionInterface;

    // throws Exception
    function getCreditTransaction(tenderType : TenderType) : PaymentTransactionInterface;

    // throws Exception
    function getAuthorizationTransaction(tenderType : TenderType) : PaymentTransactionInterface;

    // throws Exception
    function getCaptureDelayedTransaction(tenderType : TenderType) : PaymentTransactionInterface;

    // throws Exception
    function getVoidTransaction(tenderType : TenderType) : PaymentTransactionInterface;

    // throws Exception
    function getInquiryTransaction(tenderType : TenderType) : PaymentTransactionInterface;

}

