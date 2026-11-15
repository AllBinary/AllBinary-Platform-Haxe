// Generated Code Do Not Modify
package org.allbinary.logic.util.cache;


class PoolTypeFactory {
    private static final instance : PoolTypeFactory = new PoolTypeFactory();
    public static function getInstance() : PoolTypeFactory {
        return PoolTypeFactory.instance;
    }

    public var VECTOR_POOL : PoolType = new PoolType(CacheTypeFactory.getInstance().NO_CACHE);
    public function new() {
    }
}

