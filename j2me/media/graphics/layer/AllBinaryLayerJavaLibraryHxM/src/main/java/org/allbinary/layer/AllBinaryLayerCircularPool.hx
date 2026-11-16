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
package org.allbinary.layer;

import org.allbinary.logic.util.cache.BaseCircularPool;
import org.allbinary.util.CircularIndexUtil;

class AllBinaryLayerCircularPool extends BaseCircularPool {
    public function new() {
        super();
    }

    // throws Exception
    public function initAllBinaryLayerCircularPool(allbinaryLayerFactoryInterface : AllBinaryLayerFactoryInterface, total : Int) : Void {
        this.circularIndexUtil = CircularIndexUtil.createInstance(total);
        this.OBJECT_ARRAY = haxe.ds.Vector.fromArrayCopy([for (index in 0...total) null]);
        for (localIndex in 0...total) {
            this.OBJECT_ARRAY[localIndex] = allbinaryLayerFactoryInterface.getInstanceFor();
        }
    }

}

