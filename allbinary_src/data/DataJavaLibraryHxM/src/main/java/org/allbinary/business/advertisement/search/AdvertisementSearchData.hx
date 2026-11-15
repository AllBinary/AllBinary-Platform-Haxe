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
package org.allbinary.business.advertisement.search;


class AdvertisementSearchData {
    private static final instance : AdvertisementSearchData = new AdvertisementSearchData();
    public static function getInstance() : AdvertisementSearchData {
        return AdvertisementSearchData.instance;
    }

    public function new() {
    }

    public final TITLE : String = "AFFILIATE_TITLE";
    public final PRICE : String = "AFFILIATE_PRICE";
    public final RELEVANCY : String = "AFFILIATE_RELEVANCY";
    public final POPULARITY : String = "AFFILIATE_POPULARITY";
}

