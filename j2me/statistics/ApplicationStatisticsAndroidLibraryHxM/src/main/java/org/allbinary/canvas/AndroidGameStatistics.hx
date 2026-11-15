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
import org.allbinary.android.view.BaseViewWrapper;
import org.allbinary.android.view.ViewWrapper;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;

class AndroidGameStatistics extends BaseGameStatistics {
    private var view : BaseViewWrapper = BaseViewWrapper.NULL_VIEW_WRAPPER;
    private var totalOnDraws : haxe.Int64 = haxe.Int64.ofInt(0);
    private final ANDROID_STRING_ARRAY : haxe.ds.Vector<String> = haxe.ds.Vector.fromArrayCopy([for (index in 0...14) null]);
    public function new() {
        super();
        final stringUtil : StringUtil = StringUtil.getInstance();
        for (index in 0...this.ANDROID_STRING_ARRAY.length) {
            this.ANDROID_STRING_ARRAY[index] = stringUtil.EMPTY_STRING;
        }
    }

    public function initView(view : View) : Void {
        super.init();
        this.view = new ViewWrapper(view);
        this.totalOnDraws = 0;
    }

    public override function process() : Void {
        this.view.postInvalidate();
    }

    public function nextOnDraw() : Void {
        this.totalOnDraws++;
    }

    private final TOTAL_ONDRAWS : String = " Total onDraws: ";
    private final ONDRAWS_RATE : String = " onDraws(/10) Sec: ";
    public override function toStringArray() : haxe.ds.Vector<String> {
        final stringArray : haxe.ds.Vector<String> = super.toStringArray();
        for (index in 0...stringArray.length) {
            this.ANDROID_STRING_ARRAY[index] = stringArray[index];
        }
        var totalTime : haxe.Int64 = this.getTimeDelayHelper().getElapsed(this.gameTickTimeDelayHelper.startTime);
        totalTime = (totalTime / 10000);
        this.ANDROID_STRING_ARRAY[10] = this.TOTAL_ONDRAWS;
        this.ANDROID_STRING_ARRAY[11] = Std.string(this.totalOnDraws);
        this.ANDROID_STRING_ARRAY[12] = this.ONDRAWS_RATE;
        this.ANDROID_STRING_ARRAY[13] = Std.string(this.totalOnDraws / totalTime);
        return this.ANDROID_STRING_ARRAY;
    }

    public function toString() : String {
        var totalTime : haxe.Int64 = this.getTimeDelayHelper().getElapsed(this.gameTickTimeDelayHelper.startTime);
        totalTime = (totalTime / 1000);
        if (totalTime > 0) {
            final stringBuffer : StringMaker = new StringMaker();
            stringBuffer.append(super.toStringAt(totalTime));
            if (this.totalOnDraws > 0) {
                stringBuffer.append(this.TOTAL_ONDRAWS);
                stringBuffer.append(Std.string(this.totalOnDraws));
                stringBuffer.append(this.ONDRAWS_RATE);
                final drawsOverTime : String = Std.string(this.totalOnDraws / totalTime);
                stringBuffer.append(drawsOverTime);
            }
            return stringBuffer.toString();
        } else {
            return this.NOT;
        }
    }

}

