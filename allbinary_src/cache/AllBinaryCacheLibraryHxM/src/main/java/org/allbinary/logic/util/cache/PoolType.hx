/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2007 AllBinary 
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


class PoolType {
    private final cacheType : CacheType;
    public function new(cacheType : CacheType) {
        this.cacheType = cacheType;
    }

    public function getCacheType() : CacheType {
        return this.cacheType;
    }

    public function toString() : String {
        final POOL_TYPE : String = "PoolType: ";
        return POOL_TYPE + this.getCacheType().toString();
    }

}

