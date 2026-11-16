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
package org.allbinary.logic.util.event;

import org.allbinary.logic.util.cache.BaseCircularPool;
import org.allbinary.util.CircularIndexUtil;

class AllBinaryEventCircularPool extends BaseCircularPool {
    public function new(max : Int) {
        super();
        this.OBJECT_ARRAY = haxe.ds.Vector.fromArrayCopy([for (index in 0...max) null]);
        this.circularIndexUtil = CircularIndexUtil.createInstance(max);
    }

    public function initAllBinaryEventCircularPool(allBinaryEventObjectFactoryInterface : AllBinaryEventObjectFactoryInterface) : Void {
        this.circularIndexUtil.setIndex(0);
        var size : Int = this.circularIndexUtil.getSize();
        for (index in 0...size) {
            this.OBJECT_ARRAY[index] = allBinaryEventObjectFactoryInterface.getInstanceFor();
        }
    }

}

