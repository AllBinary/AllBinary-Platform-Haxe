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
package org.allbinary.data.tables.user.commerce.money.payment;

import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.business.user.commerce.money.payment.PaymentInterface;
import org.allbinary.data.tables.BasicDataTableInterface;

interface PaymentEntityInterface extends BasicDataTableInterface {
    function getLastId(userName : String) : String;

    function setDefault(userName : String, index : Null<Int>) : Void;

    function getDefault(userName : String) : PaymentInterface;

    function get(userName : String) : BasicArrayList;

    function add(userName : String, paymentInterface : PaymentInterface) : Void;

    function remove(userName : String, index : Null<Int>) : Void;

    function insert(values : BasicArrayList) : Void;

}

