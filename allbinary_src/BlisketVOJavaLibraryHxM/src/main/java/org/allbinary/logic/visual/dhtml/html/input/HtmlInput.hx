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
package org.allbinary.logic.visual.dhtml.html.input;

import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.visual.dhtml.html.HtmlTag;

class HtmlInput extends HtmlTag {
    private final END : String = ">";
    private final STARTINPUT : String = "<INPUT ";
    private final ENDINPUT : String = "</INPUT>";
    private final TYPE : String = "TYPE=\"";
    private final NAME : String = "NAME=\"";
    private var before : String;
    private var type : String;
    private var name : String;
    private var after : String;
    public function new(before : String, type : String, name : String, after : String) {
        super();
        this.before = before;
        this.type = type;
        this.name = name;
        this.after = after;
    }

    public function toString() : String {
        final stringUtil : StringUtil = StringUtil.getInstance();
        var result : String = stringUtil.EMPTY_STRING;
        var attributeKeys : haxe.ds.Vector<Any> = this.otherAttributes.keySet().toArray();
        var attributeSize : Int = attributeKeys.length;
        result = this.before;
        result += this.STARTINPUT;
        result += this.TYPE;
        result += this.type;
        result += "\" ";
        result += this.NAME;
        result += this.name;
        result += "\" ";
        for (i in 0...attributeSize) {
            var key : String = (cast attributeKeys[i] : String);
            var value : String = (cast otherAttributes.get(key) : String);
            if (value != null && Reflect.compare(value, stringUtil.EMPTY_STRING) != 0) {
                result += key;
                result += "=\"";
                result += value;
                result += "\" ";
            }
        }
        result += this.END;
        result += this.ENDINPUT;
        result += this.after;
        return result;
    }

}

