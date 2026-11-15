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
package org.allbinary.business.quoterequest;


class QuoteRequestData {
    private static final instance : QuoteRequestData = new QuoteRequestData();
    public static function getInstance() : QuoteRequestData {
        return QuoteRequestData.instance;
    }

    public function new() {
    }

    public final ID : String = "QUOTEREQUEST_ID";
    public final PROJECT_INFO : String = "QUOTEREQUEST_PROJECT_INFO";
    public final CUSTOMER_COMMENTS : String = "QUOTEREQUEST_CUSTOMER_COMMENTS";
    public final BUDGET : String = "QUOTEREQUEST_BUDGET";
    public final TIMEFRAME : String = "QUOTEREQUEST_TIMEFRAME";
    public final COMMENTS : String = "QUOTEREQUEST_COMMENTS";
}

