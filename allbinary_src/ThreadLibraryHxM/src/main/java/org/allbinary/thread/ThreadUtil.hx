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
package org.allbinary.thread;

import org.allbinary.logic.communication.log.LogUtil;

class ThreadUtil {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : ThreadUtil = new ThreadUtil();
    public static function getInstance() : ThreadUtil {
        return ThreadUtil.instance;
    }

    public final JOIN : String = "join";
    public function isRunning(thread : Thread) : Bool {
        if (thread != null && thread.isAlive()) {
            return true;
        } else {
            return false;
        }
    }

    // throws Exception
    public function join(thread : Thread) : Void {
        if (ThreadUtil.getInstance().isRunning(thread)) {
            this.logUtil.putF("Waiting for Thread To Join/End", this, this.JOIN);
            thread.join();
        }
    }

    public function new() {
    }
}

