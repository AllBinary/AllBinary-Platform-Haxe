/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2007 AllBinary 
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
package org.allbinary.input.motion.button;

import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class TouchButtonsListBuilder extends BaseTouchInput {
    private final baseTouchInputList : BasicArrayList = new BasicArrayListD();
    public function addList(list : BasicArrayList) : Void {
        final size : Int = this.baseTouchInputList.size();
        var baseTouchInput : BaseTouchInput = null;
        for (index in 0...size) {
            baseTouchInput = (cast this.baseTouchInputList.get(index) : BaseTouchInput);
            list.addAllList(baseTouchInput.getList());
        }
    }

    public function add(baseTouchInput : BaseTouchInput) : Void {
        this.baseTouchInputList.add(baseTouchInput);
    }

    public function new() {
        super();
    }
}

