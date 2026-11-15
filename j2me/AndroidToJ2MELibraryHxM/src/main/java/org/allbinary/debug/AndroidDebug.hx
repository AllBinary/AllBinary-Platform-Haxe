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

import android.os.Debug;

class AndroidDebug implements DebugInterface {
    private var startTime : haxe.Int64 = Long.MAX_VALUE;
    private var running : Bool = false;
    private var bufferSize : Int = 32 * 1024 * 1024;
    public function start() : Void {
        this.setStartTime(haxe.Int64.fromFloat(Date.now().getTime()));
        Debug.startMethodTracing("trace", this.bufferSize);
        this.setRunning(true);
    }

    public function stop() : Void {
        this.startTime = Long.MAX_VALUE;
        Debug.stopMethodTracing();
        this.setRunning(false);
    }

    public function getMaxTime() : haxe.Int64 {
        return 120000;
    }

    private function setStartTime(startTime : haxe.Int64) : Void {
        this.startTime = startTime;
    }

    public function getStartTime() : haxe.Int64 {
        return this.startTime;
    }

    private function setRunning(running : Bool) : Void {
        this.running = running;
    }

    public function isRunning() : Bool {
        return this.running;
    }

    public function new() {
    }
}

