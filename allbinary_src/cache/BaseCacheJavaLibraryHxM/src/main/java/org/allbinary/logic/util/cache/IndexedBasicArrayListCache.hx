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

//import jsinterop.annotations.JsType;
import org.allbinary.string.CommonStrings;
//import jsinterop.annotations.JsMethod;
//import jsinterop.annotations.JsConstructor;
//import jsinterop.annotations.JsProperty;

class IndexedBasicArrayListCache extends BaseBasicArrayListCache implements CacheInterface {
    // throws Exception
    public static function createCache(size : Int) : IndexedBasicArrayListCache {
        final indexedBasicArrayListCache : IndexedBasicArrayListCache = new IndexedBasicArrayListCache();
        indexedBasicArrayListCache.init(size);
        return indexedBasicArrayListCache;
    }

    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    private var size : Int = 0;
    public var index : Int = 0;
    public function new() {
        super();
    }

    // throws Exception
    public function init(size : Int) : Void {
        if (this.size < size) {
            this.list.ensureCapacity(size);
            {
                var index : Int = size - 1;
                while (index >= this.size) {
                this.addDefault();
                    index--;
                }
            }
            this.size = size;
        }
    }

    public function getAt(index : Int) : Any {
        return this.list.objectArray[index];
    }

    // throws Exception
    public function addDefault() : Void {
    }

    // throws Exception
    public function addObject(anyType : Any) : Void {
        this.list.add(anyType);
    }

    // throws Exception
    public function add(cacheableInterface : CacheableInterface) : Void {
        this.list.add(cacheableInterface);
    }

    // throws Exception
    public function addArray(cacheableInterfaces : haxe.ds.Vector<CacheableInterface>) : Void {
        throw new jre.lang.JavaException("No Imple");
    }

    public function clear() : Void {
        this.index = 0;
    }

}

