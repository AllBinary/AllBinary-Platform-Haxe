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
package org.allbinary.thread;


class NullABRunnable extends ABRunnable {
    private static final instance : NullABRunnable = new NullABRunnable();
    public static function getInstance() : NullABRunnable {
        return NullABRunnable.instance;
    }

    // synchronized
    public override function isRunning() : Bool {
        return false;
    }

    public function new() {
        super();
    }
}

