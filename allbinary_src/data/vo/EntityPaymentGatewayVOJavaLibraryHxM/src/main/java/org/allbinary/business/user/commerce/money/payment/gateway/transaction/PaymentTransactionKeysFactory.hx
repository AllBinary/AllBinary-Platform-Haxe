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


class PaymentTransactionKeysFactory {
    private static final instance : PaymentTransactionKeysFactory = new PaymentTransactionKeysFactory();
    public static function getInstance() : PaymentTransactionKeysFactory {
        return PaymentTransactionKeysFactory.instance;
    }

    public final TRXTYPE : PaymentTransactionKeys = new PaymentTransactionKeys("TRXTYPE");
    public final TENDER : PaymentTransactionKeys = new PaymentTransactionKeys("TENDER");
    public final ACCT : PaymentTransactionKeys = new PaymentTransactionKeys("ACCT");
    public final EXPDATE : PaymentTransactionKeys = new PaymentTransactionKeys("EXPDATE");
    public final AMT : PaymentTransactionKeys = new PaymentTransactionKeys("AMT");
    public final AUTHCODE : PaymentTransactionKeys = new PaymentTransactionKeys("AUTHCODE");
    public final MICR : PaymentTransactionKeys = new PaymentTransactionKeys("MICR");
    public final CHECKNUM : PaymentTransactionKeys = new PaymentTransactionKeys("CHECKNUM");
    public final NAME : PaymentTransactionKeys = new PaymentTransactionKeys("NAME");
    public final STREET : PaymentTransactionKeys = new PaymentTransactionKeys("STREET");
    public final CITY : PaymentTransactionKeys = new PaymentTransactionKeys("CITY");
    public final STATE : PaymentTransactionKeys = new PaymentTransactionKeys("STATE");
    public final ZIP : PaymentTransactionKeys = new PaymentTransactionKeys("ZIP");
    public final DL : PaymentTransactionKeys = new PaymentTransactionKeys("DL");
    public final EMAIL : PaymentTransactionKeys = new PaymentTransactionKeys("EMAIL");
    public final COMMENT1 : PaymentTransactionKeys = new PaymentTransactionKeys("COMMENT1");
    public final COMMENT2 : PaymentTransactionKeys = new PaymentTransactionKeys("COMMENT2");
    public final ORIGID : PaymentTransactionKeys = new PaymentTransactionKeys("ORIGID");
    public final PONUM : PaymentTransactionKeys = new PaymentTransactionKeys("PONUM");
    public final DESC : PaymentTransactionKeys = new PaymentTransactionKeys("PaymentTransactionDESC");
    public final DESC1TO4 : PaymentTransactionKeys = new PaymentTransactionKeys("DESC1TO4");
    public final INVNUM : PaymentTransactionKeys = new PaymentTransactionKeys("INVNUM");
    public final SHIPTOZIP : PaymentTransactionKeys = new PaymentTransactionKeys("SHIPTOZIP");
    public final SWIPE : PaymentTransactionKeys = new PaymentTransactionKeys("SWIPE");
    public final TAXAMT : PaymentTransactionKeys = new PaymentTransactionKeys("TAXAMT");
    public final COMMCARD : PaymentTransactionKeys = new PaymentTransactionKeys("COMMCARD");
    public final DUTYAMT : PaymentTransactionKeys = new PaymentTransactionKeys("DUTYAMT");
    public final FRIEGHTAMT : PaymentTransactionKeys = new PaymentTransactionKeys("FRIEGHTAMT");
    public final ORDERDATE : PaymentTransactionKeys = new PaymentTransactionKeys("ORDERDATE");
    public final TAXEXEMPT : PaymentTransactionKeys = new PaymentTransactionKeys("TAXEXEMPT");
    public final COUNTRYCODE : PaymentTransactionKeys = new PaymentTransactionKeys("COUNTRYCODE");
    public final CUSTCODE : PaymentTransactionKeys = new PaymentTransactionKeys("CUSTCODE");
    public final CVV2 : PaymentTransactionKeys = new PaymentTransactionKeys("CVV2");
    public final ABA : PaymentTransactionKeys = new PaymentTransactionKeys("ABA");
    public final ACCTTYPE : PaymentTransactionKeys = new PaymentTransactionKeys("ACCTTYPE");
    public final DISCOUNT : PaymentTransactionKeys = new PaymentTransactionKeys("DISCOUNT");
    public final FIRSTNAME : PaymentTransactionKeys = new PaymentTransactionKeys("FIRSTNAME");
    public final LASTNAME : PaymentTransactionKeys = new PaymentTransactionKeys("LASNAME");
    public final SHIPFROMZIP : PaymentTransactionKeys = new PaymentTransactionKeys("SHIPFROMZIP");
    public final PRENOTE : PaymentTransactionKeys = new PaymentTransactionKeys("PRENOTE");
    public final CHKTYPE : PaymentTransactionKeys = new PaymentTransactionKeys("CHKTYPE");
    public final DOB : PaymentTransactionKeys = new PaymentTransactionKeys("DOB");
    public final PHONENUM : PaymentTransactionKeys = new PaymentTransactionKeys("PHONENUM");
    public final SS : PaymentTransactionKeys = new PaymentTransactionKeys("SS");
    public final COMPANYNAME : PaymentTransactionKeys = new PaymentTransactionKeys("COMPANYNAME");
    public final COUNTRY : PaymentTransactionKeys = new PaymentTransactionKeys("COUNTRY");
    public final FREIGHTAMT : PaymentTransactionKeys = new PaymentTransactionKeys("FREIGHTAMT");
    public final SHIPTOCITY : PaymentTransactionKeys = new PaymentTransactionKeys("SHIPTOCITY");
    public final SHIPTOFIRSTNAME : PaymentTransactionKeys = new PaymentTransactionKeys("SHIPTOFIRSTNAME");
    public final SHIPTOLASTNAME : PaymentTransactionKeys = new PaymentTransactionKeys("SHIPTOLASTNAME");
    public final SHIPTOSTATE : PaymentTransactionKeys = new PaymentTransactionKeys("SHIPTOSTATE");
    public final SHIPTOSTREET : PaymentTransactionKeys = new PaymentTransactionKeys("SHIPTOSTREET");
    public final SPECIAL1 : PaymentTransactionKeys = new PaymentTransactionKeys("SPECIAL1");
    public final SPECIAL2 : PaymentTransactionKeys = new PaymentTransactionKeys("SPECIAL2");
    public final SPECIAL3 : PaymentTransactionKeys = new PaymentTransactionKeys("SPECIAL3");
    public final PARTNER : PaymentTransactionKeys = new PaymentTransactionKeys("PARTNER");
    public final VENDOR : PaymentTransactionKeys = new PaymentTransactionKeys("VENDOR");
    public final USER : PaymentTransactionKeys = new PaymentTransactionKeys("USER");
    public final PWD : PaymentTransactionKeys = new PaymentTransactionKeys("PWD");
    public final CHKNUM : PaymentTransactionKeys = new PaymentTransactionKeys("CHKNUM");
    public final AVSADDR : PaymentTransactionKeys = new PaymentTransactionKeys("AVSADDR");
    public final AVSZIP : PaymentTransactionKeys = new PaymentTransactionKeys("AVSZIP");
    public final PNREF : PaymentTransactionKeys = new PaymentTransactionKeys("PNREF");
    public final RESPMSG : PaymentTransactionKeys = new PaymentTransactionKeys("RESPMSG");
    public final RESULT : PaymentTransactionKeys = new PaymentTransactionKeys("RESULT");
    public final ORIGRESULT : PaymentTransactionKeys = new PaymentTransactionKeys("ORIGRESULT");
    public final STATUS : PaymentTransactionKeys = new PaymentTransactionKeys("STATUS");
    public final FRAUDCODE : PaymentTransactionKeys = new PaymentTransactionKeys("FRAUDCODE");
    public final FRAUDMSG : PaymentTransactionKeys = new PaymentTransactionKeys("FRAUDMSG");
    public final ERRCODE : PaymentTransactionKeys = new PaymentTransactionKeys("ERRCODE");
    public final SCORE : PaymentTransactionKeys = new PaymentTransactionKeys("SCORE");
    public final REASON1 : PaymentTransactionKeys = new PaymentTransactionKeys("REASON1");
    public final REASON2 : PaymentTransactionKeys = new PaymentTransactionKeys("REASON2");
    public final REASON3 : PaymentTransactionKeys = new PaymentTransactionKeys("REASON3");
    public final EXCEPTION1 : PaymentTransactionKeys = new PaymentTransactionKeys("EXCEPTION1");
    public final EXCEPTION2 : PaymentTransactionKeys = new PaymentTransactionKeys("EXCEPTION2");
    public final EXCEPTION3 : PaymentTransactionKeys = new PaymentTransactionKeys("EXCEPTION3");
    public final EXCEPTION4 : PaymentTransactionKeys = new PaymentTransactionKeys("EXCEPTION4");
    public final EXCEPTION5 : PaymentTransactionKeys = new PaymentTransactionKeys("EXCEPTION5");
    public final EXCEPTION6 : PaymentTransactionKeys = new PaymentTransactionKeys("EXCEPTION6");
    public final EXCEPTION7 : PaymentTransactionKeys = new PaymentTransactionKeys("EXCEPTION7");
    public function new() {
    }
}

