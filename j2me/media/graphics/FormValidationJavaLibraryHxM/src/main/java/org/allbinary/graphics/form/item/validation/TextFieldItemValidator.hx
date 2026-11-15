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
import org.allbinary.logic.string.StringMaker;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class TextFieldItemValidator extends ValidatorBase {
    private final textFieldItem : ABTextFieldItem;
    private var min : Int;
    private var max : Int;
    private var allowOnEmpty : Bool;
    public function new(textFieldItem : ABTextFieldItem, min : Int, max : Int, allowOnEmpty : Bool) {
        super();
        this.textFieldItem = textFieldItem;
        this.min = min;
        this.max = max;
        this.allowOnEmpty = allowOnEmpty;
    }

    public override function isValid() : Null<Bool> {
        var booleanFactory : BooleanFactory = BooleanFactory.getInstance();
        var result : Null<Bool> = booleanFactory.TRUE;
        final string : String = this.textFieldItem.getString();
        var textLength : Int = string.length;
        if ((textLength == 0 && this.allowOnEmpty) || textLength > this.min && textLength < this.max) {
        } else {
            if (textLength < this.min) {
                result = booleanFactory.FALSE;
            } else if (textLength > this.max) {
                result = booleanFactory.FALSE;
            }
        }
        return result;
    }

    public override function toList() : BasicArrayList {
        final list : BasicArrayList = new BasicArrayListD();
        final string : String = this.textFieldItem.getString();
        var textLength : Int = string.length;
        if (textLength > this.min && textLength < this.max) {
        } else {
            final label : String = this.textFieldItem.getLabel();
            final name : String = label.substring(0, label.length - 2);
            if (textLength < this.min) {
                list.add(Std.string(new StringMaker().append(name).append(" is to short")));
            } else if (textLength > this.max) {
                list.add(Std.string(new StringMaker().append(name).append(" is to long")));
            }
        }
        return list;
    }

}

