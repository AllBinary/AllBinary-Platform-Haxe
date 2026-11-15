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

import jsinterop.annotations.JsType;

class ABSystemWrapper {
    private static final instance : ABSystemWrapper = new ABSystemWrapper();
    public static function getInstance() : ABSystemWrapper {
        return ABSystemWrapper.instance;
    }

    public function arraycopy(src : Any, srcPos : Int, dest : Any, destPos : Int, length : Int) : Void {
        haxe.ds.Vector.blit(src, srcPos, dest, destPos, length);
    }

    public function currentTimeMillis() : haxe.Int64 {
        return haxe.Int64.fromFloat(Date.now().getTime());
    }

    public function new() {
    }
}

