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
package org.allbinary.media.image.comparison.motion;

import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.util.cache.CacheInterface;
import org.allbinary.logic.util.cache.CacheInterfaceFactory;
import org.allbinary.logic.util.cache.CachePolicyFactory;
import org.allbinary.logic.util.cache.CacheTypeFactory;
import org.allbinary.string.CommonStrings;

class ConsolidatedMotionRectanglesResultsCacheSingleton {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static var cacheInterface : CacheInterface = null;
    static function __init__() {
        final logUtil : LogUtil = LogUtil.getInstance();
        final commonStrings : CommonStrings = CommonStrings.getInstance();
        final STATIC_BLOCK : String = "Static Block";
        final instance : String = "MotionRectanglesResultsCacheSingleton";
        try {
            logUtil.putF(commonStrings.START, instance, STATIC_BLOCK);
            ConsolidatedMotionRectanglesResultsCacheSingleton.cacheInterface = CacheInterfaceFactory.getInstance(CacheTypeFactory.getInstance().CACHE, CachePolicyFactory.getInstance().ONE_MINUTE_FIVE_MAX);
            logUtil.putF(commonStrings.END, instance, STATIC_BLOCK);
        } catch (e : haxe.Exception) {
            logUtil.put(commonStrings.EXCEPTION, instance, STATIC_BLOCK, e);
        }
    }
    public function new() {
    }

    public static function getInstance() : CacheInterface {
        return ConsolidatedMotionRectanglesResultsCacheSingleton.cacheInterface;
    }

}

