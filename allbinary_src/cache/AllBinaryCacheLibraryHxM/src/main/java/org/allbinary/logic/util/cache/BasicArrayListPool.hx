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

import org.allbinary.util.BasicArrayList;

class BasicArrayListPool extends AbstractArrayListPool {
    public function new(cacheableInterfaceFactoryInterface : CacheableInterfaceFactoryInterface) {
        super(cacheableInterfaceFactoryInterface);
    }

    public override function clear() : Void {
        this.buffers.clear();
    }

    // throws Exception
    public override function remove(key : Any) : CacheableInterface {
        var size : Int = this.buffers.size();
        if (size > 0) {
            return (cast this.buffers.removeAt(size - 1) : CacheableInterface);
        } else {
            return this.cacheableInterfaceFactoryInterface.getInstance(key);
        }
    }

    // throws Exception
    public function addAll(usedList : BasicArrayList) : Void {
        {
            var index : Int = usedList.size();
            while (--index >= 0) {
            var anyType : CacheableInterface = (cast usedList.objectArray[index] : CacheableInterface);
            this.add(anyType);
            }
        }
        usedList.clear();
    }

    // throws Exception
    public function releaseUsedBackToPool(usedList : BasicArrayList) : Void {
        {
            var index : Int = usedList.size();
            while (--index >= 0) {
            var list : BasicArrayListCacheable = (cast usedList.objectArray[index] : BasicArrayListCacheable);
            if (list.size() == 0) {
                usedList.removeAt(index);
                this.add(list);
            }
            }
        }
    }

}

