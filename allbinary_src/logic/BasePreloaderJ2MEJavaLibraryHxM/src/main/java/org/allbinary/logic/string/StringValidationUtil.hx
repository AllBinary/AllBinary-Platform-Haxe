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
package org.allbinary.logic.string;

import org.allbinary.TsUtil;

class StringValidationUtil {
    private static final instance : StringValidationUtil = new StringValidationUtil();
    public static function getInstance() : StringValidationUtil {
        return StringValidationUtil.instance;
    }

    private final stringUtil : StringUtil = StringUtil.getInstance();
    private final tsUtil : TsUtil = TsUtil.getInstance();
    public function new() {
    }

    public function containsSpaces(value : String) : Bool {
        if (value.indexOf(" ".code) >= 0) {
            return true;
        }
        return false;
    }

    public function isNumber(value : String) : Bool {
        var numberOfDecimalPoints : Int = 0;
        for (index in 0...value.length) {
            var digit : Int = value.charCodeAt(index);
            if (!this.isNumberFromChar(digit) && digit != ".".code) {
                return false;
            }
            if (digit == ".".code) {
                numberOfDecimalPoints++;
                if (numberOfDecimalPoints > 1) {
                    return false;
                }
            }
        }
        return true;
    }

    public function isNumberFromChar(digit : Int) : Bool {
        if (digit != "0".code && digit != "1".code && digit != "2".code && digit != "3".code && digit != "4".code && digit != "5".code && digit != "6".code && digit != "7".code && digit != "8".code && digit != "9".code) {
            return false;
        }
        return true;
    }

    public function isValidRequired(value : String, min : Int, max : Int) : Bool {
        if (value == null || value.length < min || value.length > max) {
            return false;
        }
        return true;
    }

    public function isValidRequiredNumber(value : String, min : Int, max : Int) : Bool {
        if (this.isEmpty(value) || value.length < min || value.length > max) {
            return false;
        }
        if (!this.isNumber(value)) {
            return false;
        }
        return true;
    }

    public function isValidNotRequired(value : String, min : Int, max : Int) : Bool {
        if (value != null) {
            if (value.length < min || value.length > max) {
                return false;
            }
        }
        return true;
    }

    public function isValidNotRequiredNumber(value : String, min : Int, max : Int) : Bool {
        if (value != null) {
            if (this.tsUtil.compareTo(value, this.stringUtil.NULL_STRING) == 0 || value.length < min || value.length > max) {
                return false;
            }
            if (!this.isNumber(value)) {
                return false;
            }
        }
        return true;
    }

    public function isEmpty(string : String) : Bool {
        if (string != null && this.tsUtil.compareTo(string, this.stringUtil.NULL_STRING) != 0 && this.tsUtil.compareTo(string, this.stringUtil.EMPTY_STRING) != 0) {
            return false;
        } else {
            return true;
        }
    }

}

