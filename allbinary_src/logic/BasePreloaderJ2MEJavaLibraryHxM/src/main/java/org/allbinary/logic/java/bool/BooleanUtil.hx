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
package org.allbinary.logic.java.bool;

import org.allbinary.TsUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringValidationUtil;

class BooleanUtil {
    private static final instance : BooleanUtil = new BooleanUtil();
    public static function getInstance() : BooleanUtil {
        return BooleanUtil.instance;
    }

    private final tsUtil : TsUtil = TsUtil.getInstance();
    public function new() {
    }

    // throws Exception
    public function getFromString(booleanString : String) : Bool {
        final stringValidationUtil : StringValidationUtil = StringValidationUtil.getInstance();
        final booleanFactory : BooleanFactory = BooleanFactory.getInstance();
        if (stringValidationUtil.isEmpty(booleanString)) {
            return false;
        }
        final booleanStringLowerCase : String = booleanString.toLowerCase();
        if (this.tsUtil.compareTo(booleanStringLowerCase, booleanFactory.TRUE_STRING) == 0) {
            return true;
        } else if (this.tsUtil.compareTo(booleanStringLowerCase, booleanFactory.FALSE_STRING) == 0) {
            return false;
        } else {
            throw new haxe.Exception("Invalid booleanString - Must be true or false");
        }
    }

    // throws Exception
    public function isStringBoolean(booleanString : String) : Bool {
        final booleanFactory : BooleanFactory = BooleanFactory.getInstance();
        final booleanStringLowerCase : String = booleanString.toLowerCase();
        if (Reflect.compare(booleanStringLowerCase, booleanFactory.TRUE_STRING) == 0 || Reflect.compare(booleanStringLowerCase, booleanFactory.FALSE_STRING) == 0) {
            return true;
        }
        return false;
    }

    public function toStringFromBooleanArray(booleanArray : haxe.ds.Vector<Bool>) : String {
        final stringMaker : StringMaker = new StringMaker();
        final size : Int = booleanArray.length;
        for (index in 0...size) {
            stringMaker.appendboolean(booleanArray[index]);
        }
        return stringMaker.toString();
    }

}

