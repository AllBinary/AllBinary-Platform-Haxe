/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2026 AllBinary 
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
package org.allbinary.logic;

import jre.util.Vector;

class VectorUtil {
    private static final instance : VectorUtil = new VectorUtil();
    public static function getInstance() : VectorUtil {
        return VectorUtil.instance;
    }

    public function getSize(anyType : Any) : Int {
        final vector : Vector<Any> = (cast anyType : Vector<Any>);
        return vector.size();
    }

    public function elementAt(anyType : Any, index : Int) : Any {
        final vector : Vector<Any> = (cast anyType : Vector<Any>);
        return vector.elementAt(index);
    }

    public function new() {
    }
}

