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
package org.allbinary.logic;

import org.allbinary.util.ABHashtable;
import org.allbinary.util.ABStack;
import org.allbinary.util.ABVector;

//ActualPlatform
class StdUtil {
    private static final instance : StdUtil = new StdUtil();
    public static function getInstance() : StdUtil {
        return StdUtil.instance;
    }

    public final EMPTY_VECTOR : ABVector<Any> = this.createVector();
    public final NULL_TABLE : ABHashtable<Any, Any> = this.createHashtable();
    public function createStack() : ABStack<Any> {
        return new ABStack<Any>();
    }

    public function createVector() : ABVector<Any> {
        return new ABVector<Any>();
    }

    public function createHashtable() : ABHashtable<Any, Any> {
        return new ABHashtable<Any, Any>();
    }

    public function new() {
    }
}

