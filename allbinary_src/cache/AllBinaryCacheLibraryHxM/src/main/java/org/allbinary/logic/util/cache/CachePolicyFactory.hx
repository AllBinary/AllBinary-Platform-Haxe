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
package org.allbinary.logic.util.cache;


class CachePolicyFactory {
    private static final instance : CachePolicyFactory = new CachePolicyFactory();
    public static function getInstance() : CachePolicyFactory {
        return CachePolicyFactory.instance;
    }

    public final NAME : String = "lru";
    public var MAX_TIME_THOUSAND_MAX : CachePolicy = new CachePolicy(this.NAME, Long.MAX_VALUE, 1000);
    public var THIRTY_MINUTES_TEN_THOUSAND_MAX : CachePolicy = new CachePolicy(this.NAME, 1000 * 60 * 30, 10000);
    public var THIRTY_MINUTES_FIFTY_THOUSAND_MAX : CachePolicy = new CachePolicy(this.NAME, 1000 * 60 * 30, 100000);
    public var ONE_MINUTE_FIVE_MAX : CachePolicy = new CachePolicy(this.NAME, 1000 * 60 * 1, 5);
    public var ONE_MINUTE_TEN_MAX : CachePolicy = new CachePolicy(this.NAME, 1000 * 60 * 1, 10);
    public var ONE_MINUTE_ONE_HUNDRED_MAX : CachePolicy = new CachePolicy(this.NAME, 1000 * 60 * 1, 100);
    public function new() {
    }
}

