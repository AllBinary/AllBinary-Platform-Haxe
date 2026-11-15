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
package org.allbinary.emulator;


class InitEmulatorFactory {
    private static final instance : InitEmulatorFactory = new InitEmulatorFactory();
    public static function getInstance() : InitEmulatorFactory {
        return InitEmulatorFactory.instance;
    }

    public function setInitEmulator(initEmulator : Bool) : Void {
        this.initEmulator = initEmulator;
    }

    public function isInitEmulator() : Bool {
        return this.initEmulator;
    }

    private var initEmulator : Bool = false;
    public function new() {
    }
}

