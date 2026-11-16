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

import org.allbinary.logic.math.PrimitiveLongSingleton;
import org.allbinary.logic.math.ScaleFactorFactory;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.string.CommonSeps;
import org.allbinary.time.GameTickTimeDelayHelper;
import org.allbinary.time.GameTickTimeDelayHelperFactory;
import org.allbinary.time.TimeDelayHelper;

class BaseGameStatistics {
    private final timeDelayHelper : TimeDelayHelper = new TimeDelayHelper(Integer.MAX_VALUE);
    private final updateDelayHelper : TimeDelayHelper = new TimeDelayHelper(2000);
    private var totalRefreshes : haxe.Int64 = haxe.Int64.ofInt(0);
    private var totalFrames : haxe.Int64 = haxe.Int64.ofInt(0);
    public final gameTickTimeDelayHelper : GameTickTimeDelayHelper = GameTickTimeDelayHelperFactory.getInstance();
    public function new() {
        this.STRING_ARRAY = haxe.ds.Vector.fromArrayCopy(([" Total Time: ", this.EMPTY_STRING, " Total Frames: ", this.EMPTY_STRING, " Frames/10 Sec: ", this.EMPTY_STRING, " Total Paints: ", this.EMPTY_STRING, " Paints/10 Sec: ", this.EMPTY_STRING] : Array<String>));
    }

    public function init() : Void {
        this.timeDelayHelper.setStartTimeTNT();
        this.totalRefreshes = 0;
        this.totalFrames = 0;
    }

    public function add(string : String) : Void {
    }

    public function process() : Void {
    }

    public function nextFrame() : Void {
        this.totalFrames++;
    }

    public function nextRefresh() : Void {
        this.totalRefreshes++;
    }

    private final DEFAULT_SCALE_FACTOR : Int = ScaleFactorFactory.getInstance().DEFAULT_SCALE_FACTOR;
    public function getRefreshRate() : Int {
        var elapsed : haxe.Int64 = this.timeDelayHelper.getElapsed(this.gameTickTimeDelayHelper.startTime);
        if (elapsed > 1) {
            final time : Int = haxe.Int64.toInt((this.totalRefreshes / (elapsed >> this.DEFAULT_SCALE_FACTOR)));
            return time;
        } else {
            return 0;
        }
    }

    public function getTimeDelayHelper() : TimeDelayHelper {
        return this.timeDelayHelper;
    }

    public final NOT : String = "Not enough Time to Calculate";
    private final EMPTY_STRING : String = StringUtil.getInstance().EMPTY_STRING;
    private final STRING_ARRAY : haxe.ds.Vector<String>;
    private final SPACE_CHAR : Int = " ".code;
    private final PLUS_CHAR : Int = "+".code;
    private final X_CHAR : Int = "X".code;
    private final CHAR_ARRAY : haxe.ds.Vector<haxe.ds.Vector<Int>> = haxe.ds.Vector.fromArrayCopy([haxe.ds.Vector.fromArrayCopy((["F".code, "r".code, "a".code, "m".code, "e".code, "s".code, "/".code, "1".code, "0".code, " ".code, "S".code, "e".code, "c".code, ":".code] : Array<Int>)), haxe.ds.Vector.fromArrayCopy((["X".code, "X".code] : Array<Int>)), haxe.ds.Vector.fromArrayCopy((["P".code, "a".code, "i".code, "n".code, "t".code, "s".code, "/".code, "1".code, "0".code, " ".code, "S".code, "e".code, "c".code, ":".code] : Array<Int>)), haxe.ds.Vector.fromArrayCopy((["X".code, "X".code] : Array<Int>))]);
    private final primitiveLongSingleton : PrimitiveLongSingleton = PrimitiveLongSingleton.getInstance();
    public function to2DCharArray() : haxe.ds.Vector<haxe.ds.Vector<Int>> {
        var totalTime : haxe.Int64 = this.timeDelayHelper.getElapsed(this.gameTickTimeDelayHelper.startTime);
        totalTime = (totalTime >> this.DEFAULT_SCALE_FACTOR);
        if (totalTime > 0 && this.updateDelayHelper.isTime(this.gameTickTimeDelayHelper.startTime)) {
            var framesPerSec : Int = haxe.Int64.toInt((this.totalFrames / totalTime));
            if (framesPerSec < 10) {
                this.CHAR_ARRAY[1][0] = this.SPACE_CHAR;
                this.CHAR_ARRAY[1][1] = this.primitiveLongSingleton.NUMBER_CHAR_ARRAY[framesPerSec];
            } else if (framesPerSec < 100) {
                var tens : Int = Std.int(framesPerSec / 10);
                var removeTens : Int = tens * 10;
                this.CHAR_ARRAY[1][0] = this.primitiveLongSingleton.NUMBER_CHAR_ARRAY[tens];
                this.CHAR_ARRAY[1][1] = this.primitiveLongSingleton.NUMBER_CHAR_ARRAY[framesPerSec - removeTens];
            } else {
                this.CHAR_ARRAY[1][0] = this.PLUS_CHAR;
                this.CHAR_ARRAY[1][1] = this.PLUS_CHAR;
            }
            var refreshesPerSec : Int = haxe.Int64.toInt((this.totalRefreshes / totalTime));
            if (refreshesPerSec < 10) {
                this.CHAR_ARRAY[3][0] = this.X_CHAR;
                this.CHAR_ARRAY[3][1] = this.primitiveLongSingleton.NUMBER_CHAR_ARRAY[refreshesPerSec];
            } else if (refreshesPerSec < 100) {
                var tens : Int = Std.int(refreshesPerSec / 10);
                var removeTens : Int = tens * 10;
                this.CHAR_ARRAY[3][0] = this.primitiveLongSingleton.NUMBER_CHAR_ARRAY[Std.int(refreshesPerSec / 10)];
                this.CHAR_ARRAY[3][1] = this.primitiveLongSingleton.NUMBER_CHAR_ARRAY[refreshesPerSec - removeTens];
            } else {
                this.CHAR_ARRAY[3][0] = this.PLUS_CHAR;
                this.CHAR_ARRAY[3][1] = this.PLUS_CHAR;
            }
        }
        return this.CHAR_ARRAY;
    }

    public function toStringArray() : haxe.ds.Vector<String> {
        var totalTime : haxe.Int64 = this.timeDelayHelper.getElapsed(this.gameTickTimeDelayHelper.startTime);
        totalTime = (totalTime / 10000);
        if (totalTime > 0) {
            this.STRING_ARRAY[1] = Std.string(totalTime);
            this.STRING_ARRAY[3] = Std.string(this.totalFrames);
            this.STRING_ARRAY[5] = Std.string(this.totalFrames / totalTime);
            this.STRING_ARRAY[7] = Std.string(this.totalRefreshes);
            this.STRING_ARRAY[9] = Std.string(this.totalRefreshes / totalTime);
        } else {
            var string : String = this.EMPTY_STRING;
            this.STRING_ARRAY[1] = string;
            this.STRING_ARRAY[3] = string;
            this.STRING_ARRAY[5] = string;
            this.STRING_ARRAY[7] = string;
            this.STRING_ARRAY[9] = string;
        }
        return this.STRING_ARRAY;
    }

    public function toStringAt(totalTime : haxe.Int64) : String {
        var stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(this.STRING_ARRAY[0]);
        stringBuffer.appendlong(totalTime);
        stringBuffer.append(this.STRING_ARRAY[2]);
        stringBuffer.appendlong(this.totalFrames);
        stringBuffer.append(this.STRING_ARRAY[4]);
        stringBuffer.appendlong(this.totalFrames / totalTime);
        if (this.totalRefreshes > 0) {
            stringBuffer.append(this.STRING_ARRAY[6]);
            stringBuffer.appendlong(this.totalRefreshes);
            stringBuffer.append(this.STRING_ARRAY[8]);
            stringBuffer.appendlong(this.totalRefreshes / totalTime);
            stringBuffer.append(CommonSeps.getInstance().NEW_LINE);
        }
        return Std.string(stringBuffer);
    }

    public function toString() : String {
        var totalTime : haxe.Int64 = this.timeDelayHelper.getElapsed(this.gameTickTimeDelayHelper.startTime);
        totalTime = (totalTime / 1000);
        if (totalTime > 0) {
            return this.toStringAt(totalTime);
        } else {
            return this.NOT;
        }
    }

}

