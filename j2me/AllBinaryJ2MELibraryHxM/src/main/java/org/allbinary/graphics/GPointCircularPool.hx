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
package org.allbinary.graphics;

import org.allbinary.logic.util.cache.BaseCircularPool;
import org.allbinary.util.CircularIndexUtil;

class GPointCircularPool extends BaseCircularPool {
    public function new(size : Int) {
        super();
        this.circularIndexUtil = CircularIndexUtil.createInstance(size);
        this.OBJECT_ARRAY = haxe.ds.Vector.fromArrayCopy([for (index in 0...size) null]);
        {
            var index : Int = size - 1;
            while (index >= 0) {
            this.OBJECT_ARRAY[index] = CustomGPoint.getInstance3(0, 0);
                index--;
            }
        }
    }

}

