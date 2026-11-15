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
package org.allbinary.time;

import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.string.CommonLabels;

class TimeDelayHelper {
    private var startTime : haxe.Int64 = haxe.Int64.ofInt(-1);
    private var elapsedTimeAtPause : haxe.Int64 = Long.MIN_VALUE;
    public var delay : Int;
    public function new(delay : Int) {
        this.delay = delay;
        this.setStartTimeTNT();
    }

    public function isTimeTNT() : Bool {
        var currentTime : haxe.Int64 = haxe.Int64.fromFloat(Date.now().getTime());
        if (currentTime - this.startTime > haxe.Int64.ofInt(this.delay)) {
            this.startTime = currentTime;
            return true;
        }
        return false;
    }

    public function isTimeSinceTNT(delay : Int) : Bool {
        var currentTime : haxe.Int64 = haxe.Int64.fromFloat(Date.now().getTime());
        if (currentTime - this.startTime > haxe.Int64.ofInt(delay)) {
            this.startTime = currentTime;
            return true;
        }
        return false;
    }

    public function isTime(currentTime : haxe.Int64) : Bool {
        if (currentTime - this.startTime > haxe.Int64.ofInt(this.delay)) {
            this.startTime = currentTime;
            return true;
        }
        return false;
    }

    public function isTimeWithoutReset(currentTime : haxe.Int64) : Bool {
        if (currentTime - this.startTime > haxe.Int64.ofInt(this.delay)) {
            return true;
        }
        return false;
    }

    public function isTimeSince(delay : Int, currentTime : haxe.Int64) : Bool {
        if (currentTime - this.startTime > haxe.Int64.ofInt(this.delay)) {
            this.startTime = currentTime;
            return true;
        }
        return false;
    }

    public function getElapsedTNT() : haxe.Int64 {
        return haxe.Int64.fromFloat(Date.now().getTime()) - this.startTime;
    }

    public function getElapsed(currentTime : haxe.Int64) : haxe.Int64 {
        return currentTime - this.startTime;
    }

    public function isElapsed(currentTime : haxe.Int64, time : haxe.Int64) : Bool {
        if (this.getElapsed(currentTime) > time) {
            return true;
        } else {
            return false;
        }
    }

    public function isElapsedTNT(time : haxe.Int64) : Bool {
        if (this.getElapsedTNT() > time) {
            return true;
        } else {
            return false;
        }
    }

    public function setStartTime(startTime : haxe.Int64) : Void {
        this.startTime = startTime;
    }

    public function getStartTime() : haxe.Int64 {
        return this.startTime;
    }

    public function setStartTimeTNT() : Void {
        this.startTime = haxe.Int64.fromFloat(Date.now().getTime());
    }

    public function pause() : Void {
        this.elapsedTimeAtPause = this.getElapsedTNT();
        this.startTime = Long.MAX_VALUE;
    }

    public function resume() : Bool {
        if (this.elapsedTimeAtPause != Long.MIN_VALUE) {
            this.startTime = haxe.Int64.fromFloat(Date.now().getTime()) + this.elapsedTimeAtPause;
            this.elapsedTimeAtPause = Long.MIN_VALUE;
            this.setStartTimeTNT();
            return true;
        }
        return false;
    }

    public function toStringAt(currentTime : haxe.Int64) : String {
        var elapsed : haxe.Int64 = this.getElapsed(currentTime);
        if (elapsed > 0) {
            final commonLabels : CommonLabels = CommonLabels.getInstance();
            final elapsedAsString : String = Std.string(elapsed);
            return new StringMaker().append(commonLabels.START).appendlong(this.startTime).append(commonLabels.CURRENT).appendlong(currentTime).append(commonLabels.ELAPSED).append(elapsedAsString).toString();
        } else {
            return StringUtil.getInstance().EMPTY_STRING;
        }
    }

    public function toString() : String {
        var currentTime : haxe.Int64 = haxe.Int64.fromFloat(Date.now().getTime());
        var elapsed : haxe.Int64 = this.getElapsed(currentTime);
        if (elapsed > 0) {
            final commonLabels : CommonLabels = CommonLabels.getInstance();
            final elapsedAsString : String = Std.string(elapsed);
            return new StringMaker().append(commonLabels.START).appendlong(this.startTime).append(commonLabels.CURRENT).appendlong(currentTime).append(commonLabels.ELAPSED).append(elapsedAsString).toString();
        } else {
            return StringUtil.getInstance().EMPTY_STRING;
        }
    }

}

