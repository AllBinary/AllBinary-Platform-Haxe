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

import org.allbinary.J2MEUtil;
import org.allbinary.canvas.RunnableCanvas;
import org.allbinary.game.displayable.canvas.AllBinaryGameCanvas;
import org.allbinary.game.displayable.canvas.DemoCanvas;
import org.allbinary.game.displayable.canvas.GameCanvasRunnableInterface;
import org.allbinary.game.displayable.canvas.RunnableCanvasSingleThreadStartRunnable;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.log.PreLogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.string.CommonStrings;

class ThreadFactoryUtil {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : ThreadFactoryUtil = new ThreadFactoryUtil();
    public static function getInstance() : ThreadFactoryUtil {
        return ThreadFactoryUtil.instance;
    }

    public function getInstanceGameCanvasRunnable(runnable : GameCanvasRunnableInterface) : Thread {
        return this.getInstanceType(runnable, runnable.getType());
    }

    public function getInstanceForRunnable(runnable : ABRunnable) : Thread {
        return this.getInstanceType(runnable, runnable.getType());
    }

    private function getInstanceType(runnable : Runnable, type : Int) : Thread {
        final commonStrings : CommonStrings = CommonStrings.getInstance();
        if (J2MEUtil.isHTML()) {
            if (type == DemoCanvas.TYPE || type == AllBinaryGameCanvas.TYPE) {
                final demoGameSingleThreadStartRunnable : RunnableCanvasSingleThreadStartRunnable = new RunnableCanvasSingleThreadStartRunnable((cast runnable : RunnableCanvas));
                PreLogUtil.put(new StringMaker().append("Using Pseudo Thread for DemoCanvas/AllBinaryGameCanvas under PlayN/HTML5: ").append(StringUtil.getInstance().toString(runnable)).toString(), this, commonStrings.CONSTRUCTOR);
                final primaryThreadPool : ThreadPool = PrimaryThreadPool.getInstance();
                primaryThreadPool.runTask(demoGameSingleThreadStartRunnable);
            } else {
                PreLogUtil.put(new StringMaker().append("Using Pseudo Thread for Runnable under PlayN/HTML5: ").append(StringUtil.getInstance().toString(runnable)).toString(), this, commonStrings.CONSTRUCTOR);
                var primaryThreadPool : ThreadPool = PrimaryThreadPool.getInstance();
                primaryThreadPool.runTask(runnable);
            }
        }
        final thread : Thread = new Thread(runnable, runnable.toString());
        this.logUtil.putF(thread.toString(), this, commonStrings.CONSTRUCTOR);
        return thread;
    }

    public function start(thread : Thread) : Void {
        thread.start();
    }

    public function new() {
    }
}

