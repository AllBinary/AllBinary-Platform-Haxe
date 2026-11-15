// Generated Code Do Not Modify
package org.allbinary.thread;


class ThreadObjectUtil {
    private static final instance : ThreadObjectUtil = new ThreadObjectUtil();
    public static function getInstance() : ThreadObjectUtil {
        return ThreadObjectUtil.instance;
    }

    public final NULL_PRIORITY_RUNNABLE : PriorityRunnable = new NullPriorityRunnable();
    public function notifyObject(anyType : Any) : Void {
    }

    // throws Exception
    public function waitObject(anyType : Any) : Void {
    }

    // throws Exception
    public function waitObjectFor(anyType : Any, delay : haxe.Int64) : Void {
    }

    public function processThread(runnable : Runnable) : Void {
        runnable.run();
    }

    public function new() {
    }
}

