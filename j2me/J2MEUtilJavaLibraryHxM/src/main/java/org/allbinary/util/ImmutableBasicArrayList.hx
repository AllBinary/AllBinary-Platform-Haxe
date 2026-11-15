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
package org.allbinary.util;

import org.allbinary.logic.communication.log.ForcedLogUtil;

class ImmutableBasicArrayList extends BasicArrayListS {
    private final name : String;
    public function new(name : String, size : Int) {
        super(size);
        this.name = name;
    }

    public override function add(e : Any) : Bool {
        ForcedLogUtil.log(this.name, this);
        return true;
    }

    public override function addAt(index : Int, element : Any) : Void {
        ForcedLogUtil.log(this.name, this);
    }

    public function toString() : String {
        return this.name;
    }

}

