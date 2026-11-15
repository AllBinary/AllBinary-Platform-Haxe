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
package org.allbinary.canvas;

import android.view.View;
import org.allbinary.logic.string.StringMaker;

class ProfilingRefreshHelper extends AndroidGameStatistics {
    private static final instance : ProfilingRefreshHelper = new ProfilingRefreshHelper();
    public static function getInstance() : AndroidGameStatistics {
        return ProfilingRefreshHelper.instance;
    }

    private var firstTime : Bool = true;
    private var bestFrameProcessingTime : Int = 0;
    private var worstFrameProcessingTime : Int = 0;
    private var frameProcessingTimeElapsed : haxe.Int64 = haxe.Int64.ofInt(0);
    public function new() {
        super();
    }

    public override function initView(view : View) : Void {
        super.initView(view);
        this.frameProcessingTimeElapsed = this.getTimeDelayHelper().getStartTime();
        this.bestFrameProcessingTime = Integer.MAX_VALUE;
        this.worstFrameProcessingTime = 0;
    }

    public override function nextFrame() : Void {
        this.frameProcessingTimeElapsed = haxe.Int64.fromFloat(Date.now().getTime()) - this.frameProcessingTimeElapsed;
        if (this.firstTime != true) {
            if (this.frameProcessingTimeElapsed > haxe.Int64.ofInt(this.worstFrameProcessingTime)) {
                this.worstFrameProcessingTime = haxe.Int64.toInt(this.frameProcessingTimeElapsed);
            }
            if (this.frameProcessingTimeElapsed < haxe.Int64.ofInt(this.bestFrameProcessingTime)) {
                this.bestFrameProcessingTime = haxe.Int64.toInt(this.frameProcessingTimeElapsed);
            }
        } else {
            this.firstTime = false;
        }
        super.nextFrame();
    }

    public function toString() : String {
        return new StringMaker().append(super.toString()).append(" Worst: ").appendint(this.worstFrameProcessingTime).append(" Best: ").appendint(this.bestFrameProcessingTime).toString();
    }

}

