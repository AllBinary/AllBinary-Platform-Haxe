// Generated Code Do Not Modify
package org.allbinary.thread;

import org.allbinary.TsUtil;

class ThreadObjectUtil {
    private static final instance : ThreadObjectUtil = new ThreadObjectUtil();
    public static function getInstance() : ThreadObjectUtil {
        return ThreadObjectUtil.instance;
    }

    public final NULL_PRIORITY_RUNNABLE : PriorityRunnable = new NullPriorityRunnable();
    public function notifyObject(anyType : Any) : Void {
        jre.lang.JavaObject.notify(anyType);
    }

    // throws Exception
    public function waitObject(anyType : Any) : Void {
        jre.lang.JavaObject.wait(anyType);
    }

    // throws Exception
    public function waitObjectFor(anyType : Any, delay : haxe.Int64) : Void {
        TsUtil.getInstance().waitFor(anyType, delay);
    }

    public function processThread(runnable : Runnable) : Void {
        final thread : Thread = new Thread(runnable);
        thread.start();
    }

    public function new() {
    }
}

