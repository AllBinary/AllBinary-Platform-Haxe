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
package org.allbinary.graphics.form.item.validation;

import org.allbinary.graphics.form.item.ABTextFieldItem;
import org.allbinary.logic.control.validate.ValidatorBase;
import org.allbinary.logic.java.bool.BooleanFactory;
import org.allbinary.logic.math.SmallIntegerSingletonFactory;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class NumberTextFieldItemValidator extends ValidatorBase {
    private final textFieldItem : ABTextFieldItem;
    private final min : Int;
    private final max : Int;
    private final maxChars : Int;
    public function new(textFieldItem : ABTextFieldItem, maxChars : Int, min : Int, max : Int) {
        super();
        this.textFieldItem = textFieldItem;
        this.min = min;
        this.max = max;
        this.maxChars = maxChars;
    }

    public function isNumberValid(value : Null<Int>) : Null<Bool> {
        return BooleanFactory.getInstance().TRUE;
    }

    public function toNumberVector(value : Null<Int>) : BasicArrayList {
        return new BasicArrayListD();
    }

    public override function isValid() : Null<Bool> {
        var result : Null<Bool> = BooleanFactory.getInstance().TRUE;
        final string : String = this.textFieldItem.getString();
        var textLength : Int = string.length;
        if (textLength > 0 && textLength < this.maxChars) {
            try {
                Std.parseInt(this.textFieldItem.getString());
            } catch (e : NumberFormatException) {
                result = BooleanFactory.getInstance().FALSE;
            }
        } else {
            if (textLength < 1) {
                result = BooleanFactory.getInstance().FALSE;
            } else if (textLength > this.maxChars) {
                result = BooleanFactory.getInstance().FALSE;
            }
        }
        return result;
    }

    public override function toList() : BasicArrayList {
        final list : BasicArrayList = new BasicArrayListD();
        final string : String = this.textFieldItem.getString();
        var textLength : Int = string.length;
        final label : String = this.textFieldItem.getLabel();
        final name : String = label.substring(0, label.length - 2);
        final smallIntegerSingletonFactory : SmallIntegerSingletonFactory = SmallIntegerSingletonFactory.getInstance();
        final stringMaker : StringMaker = new StringMaker();
        if (textLength > 0 && textLength < this.maxChars) {
            try {
                var number : Null<Int> = smallIntegerSingletonFactory.createInstance(Std.parseInt(this.textFieldItem.getString()));
                if (Std.int(number) > this.min) {
                    stringMaker.delete(0, stringMaker.length());
                    list.add(Std.string(stringMaker.append(name).append(" is to small")));
                } else if (Std.int(number) > this.max) {
                    stringMaker.delete(0, stringMaker.length());
                    list.add(Std.string(stringMaker.append(name).append(" is to large")));
                }
            } catch (e : NumberFormatException) {
                stringMaker.delete(0, stringMaker.length());
                list.add(Std.string(stringMaker.append(name).append(" is not a number")));
            }
        } else {
            if (textLength < 1) {
                stringMaker.delete(0, stringMaker.length());
                list.add(Std.string(stringMaker.append(name).append(" is to short")));
            } else if (textLength > this.maxChars) {
                stringMaker.delete(0, stringMaker.length());
                list.add(Std.string(stringMaker.append(name).append(" is to long")));
            }
        }
        return list;
    }

}

