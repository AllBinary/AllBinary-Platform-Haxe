// Generated Code Do Not Modify
package org.allbinary.logic.util.cache;

import org.allbinary.logic.string.StringUtil;

class CacheTypeFactory {
    private static final instance : CacheTypeFactory = new CacheTypeFactory();
    public static function getInstance() : CacheTypeFactory {
        return CacheTypeFactory.instance;
    }

    public var NO_CACHE : CacheType = new CacheType(StringUtil.getInstance().EMPTY_STRING, StringUtil.getInstance().EMPTY_STRING);
    public var CACHE : CacheType = new CacheType(StringUtil.getInstance().EMPTY_STRING, StringUtil.getInstance().EMPTY_STRING);
    public var SET : CacheType = new CacheType(StringUtil.getInstance().EMPTY_STRING, "Set");
    public var CACHE_VECTOR : CacheType = new CacheType(StringUtil.getInstance().EMPTY_STRING, StringUtil.getInstance().EMPTY_STRING);
    public function new() {
    }
}

