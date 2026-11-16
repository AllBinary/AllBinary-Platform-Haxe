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
package org.allbinary.game.ag.layer.hud.basic.time;

import org.allbinary.logic.math.PrimitiveLongSingleton;
import org.allbinary.logic.math.PrimitiveLongUtil;
import org.allbinary.time.GameTickTimeDelayHelper;
import org.allbinary.time.GameTickTimeDelayHelperFactory;

class HudTimer {
    private var startTime : haxe.Int64 = haxe.Int64.ofInt(-1);
    private var hundredthTime : haxe.Int64 = haxe.Int64.ofInt(0);
    private var maxTime : haxe.Int64;
    private var modifier : haxe.Int64 = haxe.Int64.ofInt(0);
    private var hundrethsString : haxe.ds.Vector<Int> = PrimitiveLongSingleton.getInstance().ZERO;
    private var totalDigits : Int = 1;
    private var primitiveLongUtil : PrimitiveLongUtil;
    private final MAX : haxe.ds.Vector<Int> = haxe.ds.Vector.fromArrayCopy((["L".code, "O".code, "L".code] : Array<Int>));
    private final gameTickTimeDelayHelper : GameTickTimeDelayHelper = GameTickTimeDelayHelperFactory.getInstance();
    public function new(maxTime : Int) {
        this.primitiveLongUtil = PrimitiveLongUtil.createPowerOfTen(maxTime);
        this.maxTime = haxe.Int64.ofInt(maxTime);
    }

    public function start() : Void {
        this.hundredthTime = 0;
        this.startTime = this.gameTickTimeDelayHelper.startTime;
    }

    public function get() : haxe.Int64 {
        return this.hundredthTime;
    }

    public function update() : Void {
        var lastLowerTime : haxe.Int64 = this.hundredthTime;
        var currentTime : haxe.Int64 = ((this.modifier + this.gameTickTimeDelayHelper.startTime) - this.startTime);
        if (currentTime < 0) {
            currentTime = 0;
        }
        this.hundredthTime = currentTime / 100;
        if (this.hundredthTime >= this.maxTime) {
            if (this.startTime > 0) {
                this.hundrethsString = this.MAX;
            }
        } else if (lastLowerTime != this.hundredthTime) {
            this.hundrethsString = this.primitiveLongUtil.getCharArray(haxe.Int64.toInt(this.hundredthTime));
            this.totalDigits = this.primitiveLongUtil.getCurrentTotalDigits();
        }
    }

    public function reduce(value : Int) : Void {
        this.modifier -= haxe.Int64.ofInt(value);
    }

    public function add(value : Int) : Void {
        this.modifier += haxe.Int64.ofInt(value);
    }

    public function getTimeChars() : haxe.ds.Vector<Int> {
        return this.hundrethsString;
    }

    public function getCurrentTotalDigits() : Int {
        return this.totalDigits;
    }

}

