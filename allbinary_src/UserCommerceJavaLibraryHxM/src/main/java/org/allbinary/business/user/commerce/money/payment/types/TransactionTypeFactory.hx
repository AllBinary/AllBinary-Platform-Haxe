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


class TransactionTypeFactory {
    private static final instance : TransactionTypeFactory = new TransactionTypeFactory();
    public static function getInstance() : TransactionTypeFactory {
        return TransactionTypeFactory.instance;
    }

    public final SALE : TransactionType = new TransactionType("Sale");
    public final CREDIT : TransactionType = new TransactionType("Credit");
    public final AUTHORIZATION : TransactionType = new TransactionType("Authorization");
    public final DELAYEDCAPTURE : TransactionType = new TransactionType("Delayed Capture");
    public final VOID : TransactionType = new TransactionType("Void");
    public final INQUIRY : TransactionType = new TransactionType("Inquiry");
    public function new() {
    }
}

