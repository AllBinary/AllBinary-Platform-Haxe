/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2022 AllBinary 
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
package org.allbinary.time;


class GameTickTimeDelayHelper {
    public var timeDelta : haxe.Int64 = haxe.Int64.ofInt(0);
    public var startTime : haxe.Int64;
    public var lastStartTime : haxe.Int64;
    public function new(startTime : haxe.Int64) {
        this.startTime = startTime;
        this.lastStartTime = 0;
    }

    public function setStartTime() : haxe.Int64 {
        this.startTime = haxe.Int64.fromFloat(Date.now().getTime());
        return this.startTime;
    }

    public function loop() : Void {
        if (this.lastStartTime == Long.MIN_VALUE) {
            this.timeDelta = 0;
        } else {
            this.timeDelta = haxe.Int64.fromFloat(Date.now().getTime()) - this.lastStartTime;
        }
    }

    public function getTimeFromStart() : haxe.Int64 {
        return this.startTime - this.lastStartTime;
    }

}

