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

import org.allbinary.string.CommonStrings;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class AbstractArrayListPool implements PoolInterface {
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    public var buffers : BasicArrayList = new BasicArrayListD();
    public var cacheableInterfaceFactoryInterface : CacheableInterfaceFactoryInterface;
    public function new(cacheableInterfaceFactoryInterface : CacheableInterfaceFactoryInterface) {
        this.cacheableInterfaceFactoryInterface = cacheableInterfaceFactoryInterface;
    }

    // throws Exception
    public function clear() : Void {
        throw new jre.lang.JavaException(this.commonStrings.NOT_IMPLEMENTED);
    }

    // throws Exception
    public function remove(key : Any) : CacheableInterface {
        throw new jre.lang.JavaException(this.commonStrings.NOT_IMPLEMENTED);
    }

    // throws Exception
    public function add(cacheableInterface : CacheableInterface) : Void {
        this.buffers.add(cacheableInterface);
    }

    // throws Exception
    public function addArray(cacheableInterfaces : haxe.ds.Vector<CacheableInterface>) : Void {
        for (index in 0...cacheableInterfaces.length) {
            this.buffers.add(cacheableInterfaces[index]);
        }
    }

}

