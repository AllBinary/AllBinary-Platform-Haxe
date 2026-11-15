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
package org.allbinary.debug;


class NoDebug implements DebugInterface {
    private static var SINGLETON : DebugInterface = new NoDebug();
    public static function getInstance() : DebugInterface {
        return NoDebug.SINGLETON;
    }

    public function start() : Void {
    }

    public function stop() : Void {
    }

    public function getMaxTime() : haxe.Int64 {
        return 10000;
    }

    public function getStartTime() : haxe.Int64 {
        return 0;
    }

    public function isRunning() : Bool {
        return false;
    }

    public function new() {
    }
}

