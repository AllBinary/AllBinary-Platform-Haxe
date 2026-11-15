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
package org.allbinary.game.displayable.canvas;

import org.allbinary.graphics.displayable.DisplayInfoSingleton;

class GameRunnable implements Runnable {
    public final WAIT : Int = 240;
    public final FAST : Int = 60;
    public var waitInMillis : haxe.Int64;
    public function new() {
        this.waitInMillis = haxe.Int64.ofInt(this.WAIT);
    }

    public function run() : Void {
        DisplayInfoSingleton.getInstance().process();
    }

    // throws Exception
    public function processLoopSleep() : Void {
        Sys.sleep(haxe.Int64.toInt(this.waitInMillis) / 1000);
    }

}

