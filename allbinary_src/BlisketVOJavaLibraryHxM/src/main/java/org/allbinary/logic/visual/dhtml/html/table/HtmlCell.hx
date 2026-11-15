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
package org.allbinary.logic.visual.dhtml.html.table;

import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.visual.dhtml.html.HtmlTag;

class HtmlCell extends HtmlTag {
    private final END : String = ">";
    private final START : String = "<td ";
    private final ENDTAG : String = "</td>";
    private final HEIGHT : String = "height";
    private final WIDTH : String = "width";
    private var height : String;
    private var width : String;
    private var before : String;
    private var body : String = null;
    private var after : String;
    public function new(before : String, width : String, height : String, after : String) {
        super();
        this.before = before;
        this.after = after;
        this.height = height;
        this.width = width;
        addAttribute(this.HEIGHT, this.height);
        addAttribute(this.WIDTH, this.width);
    }

    public function addText(body : String) : Void {
        this.body = body;
    }

    public function toString() : String {
        final stringUtil : StringUtil = StringUtil.getInstance();
        var result : String = stringUtil.EMPTY_STRING;
        var attributeKeys : haxe.ds.Vector<Any> = this.otherAttributes.keySet().toArray();
        var attributeSize : Int = attributeKeys.length;
        result = this.before;
        result += this.START;
        result += " ";
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
        result += this.body;
        result += this.ENDTAG;
        result += this.after;
        return result;
    }

}

