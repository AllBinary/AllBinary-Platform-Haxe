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
package org.allbinary.business.user.commerce.money;

import org.allbinary.logic.io.path.AbPathData;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.string.StringValidationUtil;
import org.allbinary.string.CommonPhoneStrings;

class Money {
    private var units : Null<haxe.Int64>;
    private final DEFAULT_CURRENCY : String = "USD";
    public function new(money : Money) {
        this.units = money.getUnits();
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new() {
        this.units = 0;
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(usDollarStr : String) {
        if (usDollarStr != null && StringValidationUtil.getInstance().isNumber(usDollarStr)) {
            this.units = convertUsdToUnits(usDollarStr);
        }
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(units : haxe.Int64) {
        this.units = units;
    }

    public function isValid() : Bool {
        if (this.units != null && haxe.Int64.ofInt(this.units) > 0 && haxe.Int64.ofInt(this.units) < Long.MAX_VALUE) {
            return true;
        } else {
            return false;
        }
    }

    public function add(moreMoney : Money) : Void {
        this.add(moreMoney.toString());
    }

    public function add(usDollarStr : String) : Void {
        this.units = haxe.Int64.ofInt(this.units) + convertUsdToUnits(usDollarStr);
    }

    public function subtract(usDollarStr : String) : Void {
        this.units = haxe.Int64.ofInt(this.units) - convertUsdToUnits(usDollarStr);
    }

    public function multiply(multiplier : Null<Float>) : Void {
        this.units = haxe.Int64.ofInt(haxe.Int64.ofInt(this.units) * multiplier);
    }

    public function multiply(multiplier : Int) : Void {
        this.units = haxe.Int64.ofInt(this.units) * multiplier;
    }

    private function convertUnitsTo(currency : String) : String {
        final stringBuffer : StringMaker = new StringMaker();
        if (Reflect.compare(currency, this.DEFAULT_CURRENCY) == 0) {
            var dollar : haxe.Int64 = haxe.Int64.ofInt(this.units) / 100;
            var cents : haxe.Int64 = haxe.Int64.ofInt(this.units) - (dollar * 100);
            stringBuffer.append(dollar.toString());
            stringBuffer.append(AbPathData.getInstance().EXTENSION_SEP);
            if (cents < 10) {
                stringBuffer.append(CommonPhoneStrings.getInstance().ZERO);
            }
            stringBuffer.append(cents.toString());
        }
        return stringBuffer.toString();
    }

    private function convertUsdToUnits(usDollarStr : String) : haxe.Int64 {
        var localUnit : haxe.Int64 = 0;
        var index : Int = usDollarStr.indexOf(AbPathData.getInstance().EXTENSION_SEP);
        final stringUtil : StringUtil = StringUtil.getInstance();
        var dollarStr : String = stringUtil.EMPTY_STRING;
        var centsStr : String = stringUtil.EMPTY_STRING;
        if (index < 1) {
            dollarStr = usDollarStr;
            centsStr = "00";
        } else {
            dollarStr = usDollarStr.substring(0, index);
            centsStr = usDollarStr.substring(index + 1);
        }
        localUnit = haxe.Int64.ofInt(haxe.Int64.ofInt(dollarStr) * 100);
        localUnit += haxe.Int64.ofInt(centsStr);
        return localUnit;
    }

    public function getUnits() : haxe.Int64 {
        return haxe.Int64.ofInt(this.units);
    }

    public function getUnitsLong() : Null<haxe.Int64> {
        return this.units;
    }

    public function toString() : String {
        return convertUnitsTo(this.DEFAULT_CURRENCY);
    }

}

