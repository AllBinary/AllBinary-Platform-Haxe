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
package org.allbinary.media.image.cache;

import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.util.cache.CachePolicyFactory;
import org.allbinary.logic.util.cache.PoolInterface;
import org.allbinary.logic.util.cache.PoolInterfaceFactory;
import org.allbinary.logic.util.cache.PoolTypeFactory;
import org.allbinary.string.CommonStrings;

class BufferedImagePoolSingleton {
    private static var poolInterface : PoolInterface = null;
    static function __init__() {
        final logUtil : LogUtil = LogUtil.getInstance();
        final commonStrings : CommonStrings = CommonStrings.getInstance();
        final STATIC_BLOCK : String = "Static Block";
        final instance : String = "BufferedImagePoolSingleton";
        try {
            logUtil.putF(commonStrings.START, instance, STATIC_BLOCK);
            BufferedImagePoolSingleton.poolInterface = PoolInterfaceFactory.getInstance(new BufferedImageCacheableFactory(), PoolTypeFactory.getInstance().VECTOR_POOL, CachePolicyFactory.getInstance().MAX_TIME_THOUSAND_MAX);
            logUtil.putF(commonStrings.END, instance, STATIC_BLOCK);
        } catch (e : haxe.Exception) {
            logUtil.put(commonStrings.EXCEPTION, instance, STATIC_BLOCK, e);
        }
    }
    public function new() {
    }

    public static function getInstance() : PoolInterface {
        return BufferedImagePoolSingleton.poolInterface;
    }

}

