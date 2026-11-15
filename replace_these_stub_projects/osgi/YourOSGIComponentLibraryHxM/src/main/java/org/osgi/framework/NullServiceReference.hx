/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2025 AllBinary 
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
package org.osgi.framework;

import org.allbinary.logic.NullUtil;
import org.allbinary.logic.string.StringUtil;

class NullServiceReference {
    public function getProperty(key : String) : Any {
        return NullUtil.getInstance().NULL_OBJECT;
    }

    public function getPropertyKeys() : haxe.ds.Vector<String> {
        return StringUtil.getInstance().getArrayInstance();
    }

    public function compareTo(o : Any) : Int {
        throw new haxe.Exception();
    }

    public function new() {
    }
}

