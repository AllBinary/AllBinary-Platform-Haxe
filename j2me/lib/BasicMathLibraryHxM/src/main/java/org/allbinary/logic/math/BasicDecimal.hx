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
package org.allbinary.logic.math;


class BasicDecimal {
    public static final ZERO_BIGDECIMAL : BasicDecimal = new BasicDecimal(0);
    public static function createBigDecimal(bigDecimal : BasicDecimal) : BasicDecimal {
        return new BasicDecimal(bigDecimal.getUnscaled());
    }

    private var units : haxe.Int64;
    public function new(units : haxe.Int64) {
        this.units = units;
        this.updateScaled();
    }

    public function setint(value : Int) : Void {
        this.units = haxe.Int64.ofInt(value);
        this.updateScaled();
    }

    public function setlong(value : haxe.Int64) : Void {
        this.units = value;
        this.updateScaled();
    }

    public function set(bigDecimal : BasicDecimal) : Void {
        this.units = bigDecimal.getUnscaled();
        this.updateScaled();
    }

    public function addint(value : Int) : Void {
        this.units = this.units + haxe.Int64.ofInt(value);
        this.updateScaled();
    }

    public function addlong(value : haxe.Int64) : Void {
        this.units = this.units + value;
        this.updateScaled();
    }

    public function add(bigDecimal : BasicDecimal) : Void {
        this.units = this.units + bigDecimal.getUnscaled();
        this.updateScaled();
    }

    public function subtractint(value : Int) : Void {
        this.units = this.units - haxe.Int64.ofInt(value);
        this.updateScaled();
    }

    public function subtractlong(value : haxe.Int64) : Void {
        this.units = this.units - value;
        this.updateScaled();
    }

    public function subtract(bigDecimal : BasicDecimal) : Void {
        this.units = this.units - bigDecimal.getUnscaled();
        this.updateScaled();
    }

    public function multiplyint(value : Int) : Void {
        this.units = this.units * haxe.Int64.ofInt(value);
        this.updateScaled();
    }

    public function multiplylong(value : haxe.Int64) : Void {
        this.units = this.units * value;
        this.updateScaled();
    }

    public function multiply(bigDecimal : BasicDecimal) : Void {
        this.units = this.units * bigDecimal.getUnscaled();
        this.updateScaled();
    }

    public function divideint(value : Int) : Void {
        this.units = this.units / haxe.Int64.ofInt(value);
        this.updateScaled();
    }

    public function dividelong(value : haxe.Int64) : Void {
        this.units = this.units / value;
        this.updateScaled();
    }

    public function divide(bigDecimal : BasicDecimal) : Void {
        this.units = this.units / bigDecimal.getUnscaled();
        this.updateScaled();
    }

    public function getUnscaled() : haxe.Int64 {
        return this.units;
    }

    private var scaled : Int = 0;
    private function updateScaled() : Void {
        this.scaled = haxe.Int64.toInt((this.units / haxe.Int64.ofInt(this.factorValue)));
    }

    public function getScaled() : Int {
        return this.scaled;
    }

    public function toString() : String {
        return Std.string(this.units);
    }

    private final factor : Int = ScaleFactorFactory.getInstance().DEFAULT_SCALE_FACTOR;
    private final factorValue : Int = ScaleFactorFactory.getInstance().DEFAULT_SCALE_VALUE;
    public function getScaledFactor() : Int {
        return this.factor;
    }

    public function getScaledFactorValue() : Int {
        return this.factorValue;
    }

}

