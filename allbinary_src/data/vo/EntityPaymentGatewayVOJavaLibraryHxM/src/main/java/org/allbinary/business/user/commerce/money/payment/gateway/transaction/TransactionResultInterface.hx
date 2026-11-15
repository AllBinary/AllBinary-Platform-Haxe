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

import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

interface TransactionResultInterface {
    function toString() : String;

    function getValues() : BasicArrayList;

    function getResult() : String;

    function getPnRef() : String;

    function getRespMsg() : String;

    function getAvsAddr() : String;

    function getAvsZip() : String;

    function getOrigResult() : String;

    function getStatus() : String;

    function getFraudCode() : String;

    function getFraudMsg() : String;

    function getErrCode() : String;

    function getScore() : String;

    function getReason1() : String;

    function getReason2() : String;

    function getReason3() : String;

    function getException1() : String;

    function getException2() : String;

    function getException3() : String;

    function getException4() : String;

    function getException5() : String;

    function getException6() : String;

    function getException7() : String;

}

