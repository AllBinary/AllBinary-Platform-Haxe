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
package org.allbinary.logic.util.queue;

import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class BasicQueue {
    public final queueVector : BasicArrayList = new BasicArrayListD();
    public function new() {
    }

    // throws Exception
    // synchronized
    public function offer(anyType : Any) : Bool {
        this.queueVector.add(anyType);
        return true;
    }

    // synchronized
    public function remove(anyType : Any) : Void {
        this.queueVector.remove(anyType);
    }

    // synchronized
    public function removeLast() : Any {
        var anyType : Any = this.queueVector.get(this.queueVector.size() - 1);
        this.queueVector.remove(anyType);
        return anyType;
    }

}

