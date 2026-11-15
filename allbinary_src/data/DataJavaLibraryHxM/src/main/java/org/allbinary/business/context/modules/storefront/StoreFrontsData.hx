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
package org.allbinary.business.context.modules.storefront;


class StoreFrontsData {
    private static final instance : StoreFrontsData = new StoreFrontsData();
    public static function getInstance() : StoreFrontsData {
        return StoreFrontsData.instance;
    }

    public final TYPE : String = "STOREFRONTS_TYPE";
    public final RETAIL : String = "STOREFRONTS_RETAIL";
    public final SUBSCRIPTION : String = "STOREFRONTS_SUBSCRIPTION";
    public final AUCTION : String = "STOREFRONTS_AUCTION";
    public final NEWS : String = "STOREFRONTS_NEWS";
    public final BLOG : String = "STOREFRONTS_BLOG";
    public final FORUM : String = "STOREFRONTS_FORUM";
    public function new() {
    }
}

