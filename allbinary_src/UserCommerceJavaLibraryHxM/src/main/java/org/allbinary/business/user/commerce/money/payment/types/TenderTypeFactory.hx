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


class TenderTypeFactory {
    private static final instance : TenderTypeFactory = new TenderTypeFactory();
    public static function getInstance() : TenderTypeFactory {
        return TenderTypeFactory.instance;
    }

    public final CREDITCARD : TenderType = new TenderType("Credit Card");
    public final CHECK : TenderType = new TenderType("Check");
    public final ACH : TenderType = new TenderType("Ach");
    public function new() {
    }
}

