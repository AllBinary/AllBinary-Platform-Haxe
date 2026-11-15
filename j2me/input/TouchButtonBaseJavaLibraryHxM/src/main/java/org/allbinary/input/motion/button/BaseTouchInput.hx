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
package org.allbinary.input.motion.button;

import org.allbinary.string.CommonStrings;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListUtil;

class BaseTouchInput {
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    private final basicArrayListUtil : BasicArrayListUtil = BasicArrayListUtil.getInstance();
    public function new() {
    }

    public function getList() : BasicArrayList {
        return this.basicArrayListUtil.getImmutableInstance();
    }

    public function toString() : String {
        return Type.getClassName(Type.getClass(this));
    }

}

