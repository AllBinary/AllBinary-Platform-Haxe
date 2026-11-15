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
package org.allbinary.graphics.color;

import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.util.cache.AutomaticCacheInterface;
import org.allbinary.logic.util.cache.AutomaticCacheInterfaceFactory;
import org.allbinary.logic.util.cache.CachePolicyFactory;
import org.allbinary.logic.util.cache.CacheTypeFactory;
import org.allbinary.string.CommonStrings;

class ColorCacheFactory {
    private static var cacheInterface : AutomaticCacheInterface = null;
    static function __init__() {
        final logUtil : LogUtil = LogUtil.getInstance();
        final commonStrings : CommonStrings = CommonStrings.getInstance();
        final STATIC_BLOCK : String = "Static Block";
        try {
            logUtil.putF(commonStrings.START, ColorCacheFactory, STATIC_BLOCK);
            ColorCacheFactory.cacheInterface = AutomaticCacheInterfaceFactory.getInstance(new ColorCacheableFactory(), CacheTypeFactory.getInstance().CACHE, CachePolicyFactory.getInstance().THIRTY_MINUTES_TEN_THOUSAND_MAX);
            logUtil.putF(commonStrings.END, ColorCacheFactory, STATIC_BLOCK);
        } catch (e : haxe.Exception) {
            logUtil.put(commonStrings.EXCEPTION, ColorCacheFactory, STATIC_BLOCK, e);
        }
    }
    public function new() {
    }

    public static function getInstance() : AutomaticCacheInterface {
        return ColorCacheFactory.cacheInterface;
    }

}

