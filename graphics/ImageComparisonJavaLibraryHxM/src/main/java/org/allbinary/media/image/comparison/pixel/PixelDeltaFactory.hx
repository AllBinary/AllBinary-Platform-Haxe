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
package org.allbinary.media.image.comparison.pixel;

import org.allbinary.graphics.GPoint;
import org.allbinary.graphics.PointFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.util.cache.AutomaticCacheInterface;
import org.allbinary.logic.util.cache.CacheInterfaceFactory;
import org.allbinary.logic.util.cache.CachePolicyFactory;
import org.allbinary.logic.util.cache.CacheTypeFactory;
import org.allbinary.media.image.comparison.color.ColorDelta;
import org.allbinary.media.image.comparison.color.ColorDeltaFactory;
import org.allbinary.string.CommonStrings;

class PixelDeltaFactory {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static var cacheInterface : AutomaticCacheInterface = null;
    static function __init__() {
        final logUtil : LogUtil = LogUtil.getInstance();
        final commonStrings : CommonStrings = CommonStrings.getInstance();
        final STATIC_BLOCK : String = "Static Block";
        final instance : String = "PixelDeltaFactory";
        try {
            logUtil.putF(commonStrings.START, instance, STATIC_BLOCK);
            PixelDeltaFactory.cacheInterface = (cast CacheInterfaceFactory.getInstance(CacheTypeFactory.getInstance().CACHE, CachePolicyFactory.getInstance().THIRTY_MINUTES_TEN_THOUSAND_MAX) : AutomaticCacheInterface);
            logUtil.putF(commonStrings.END, instance, STATIC_BLOCK);
        } catch (e : haxe.Exception) {
            logUtil.put(commonStrings.EXCEPTION, instance, STATIC_BLOCK, e);
        }
    }
    public function new() {
    }

    // throws Exception
    public static function getInstance(x : Int, y : Int, rgb1 : Int, rgb2 : Int) : PixelDelta {
        var point : GPoint = PointFactory.getInstance().createXY(x, y);
        var colorDelta : ColorDelta = ColorDeltaFactory.getInstance(rgb1, rgb2);
        var pixelDelta : PixelDelta = (cast PixelDeltaFactory.cacheInterface.get(PixelDelta.getKey(point, colorDelta)) : PixelDelta);
        if (pixelDelta == null) {
            pixelDelta = new PixelDelta(point, colorDelta);
        }
        return pixelDelta;
    }

}

