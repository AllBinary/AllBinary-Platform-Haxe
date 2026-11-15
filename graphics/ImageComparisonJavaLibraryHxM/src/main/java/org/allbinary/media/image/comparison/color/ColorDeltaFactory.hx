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
package org.allbinary.media.image.comparison.color;

import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.util.cache.AutomaticCacheInterface;
import org.allbinary.logic.util.cache.CacheInterfaceFactory;
import org.allbinary.logic.util.cache.CachePolicyFactory;
import org.allbinary.logic.util.cache.CacheTypeFactory;
import org.allbinary.string.CommonStrings;

class ColorDeltaFactory {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static var cacheInterface : AutomaticCacheInterface = null;
    static function __init__() {
        final logUtil : LogUtil = LogUtil.getInstance();
        final commonStrings : CommonStrings = CommonStrings.getInstance();
        final STATIC_BLOCK : String = "Static Block";
        final instance : String = "ColorDeltaFactory";
        try {
            logUtil.putF(commonStrings.START, instance, STATIC_BLOCK);
            ColorDeltaFactory.cacheInterface = (cast CacheInterfaceFactory.getInstance(CacheTypeFactory.getInstance().CACHE, CachePolicyFactory.getInstance().THIRTY_MINUTES_TEN_THOUSAND_MAX) : AutomaticCacheInterface);
            logUtil.putF(commonStrings.END, instance, STATIC_BLOCK);
        } catch (e : haxe.Exception) {
            logUtil.put(commonStrings.EXCEPTION, instance, STATIC_BLOCK, e);
        }
    }
    public function new() {
    }

    // throws Exception
    public static function getInstance(rgb1 : Int, rgb2 : Int) : ColorDelta {
        var colorDelta : ColorDelta = (cast ColorDeltaFactory.cacheInterface.get(ColorDelta.getKey(rgb1, rgb2)) : ColorDelta);
        if (colorDelta == null) {
            colorDelta = new ColorDelta(rgb1, rgb2);
        }
        return colorDelta;
    }

}

