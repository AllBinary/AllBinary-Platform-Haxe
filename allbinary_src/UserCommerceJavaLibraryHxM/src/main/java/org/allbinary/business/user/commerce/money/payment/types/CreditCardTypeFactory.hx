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
package org.allbinary.business.user.commerce.money.payment.types;


class CreditCardTypeFactory {
    private static final instance : CreditCardTypeFactory = new CreditCardTypeFactory();
    public static function getInstance() : CreditCardTypeFactory {
        return CreditCardTypeFactory.instance;
    }

    public final VISA : CreditCardType = new CreditCardType("Visa");
    public final MASTERCARD : CreditCardType = new CreditCardType("MasterCard");
    public final DISCOVER : CreditCardType = new CreditCardType("Discover");
    public final AMERICANEXPRESS : CreditCardType = new CreditCardType("AMX");
    public function new() {
    }
}

