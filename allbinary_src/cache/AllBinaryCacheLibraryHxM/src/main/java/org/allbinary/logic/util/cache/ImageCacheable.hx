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

import org.allbinary.logic.string.StringUtil;

class ImageCacheable {
    private var name : String = StringUtil.getInstance().EMPTY_STRING;
    public function new(name : String, anyType : Any) {
    }

    public function getKey() : Any {
        return this.name;
    }

    public function toString() : String {
        return this.name;
    }

}

