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

import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.visual.dhtml.html.HtmlTag;
import org.allbinary.string.CommonPhoneStrings;

class HtmlTable extends HtmlTag {
    private final END : String = ">";
    private final START : String = "<table ";
    private final ENDTAG : String = "</table>";
    private final CLASS : String = "class";
    private final DIRECTION : String = "dir";
    private final ID : String = "id";
    private final LANG : String = "lang";
    private final UNITS : String = "units";
    private final BORDER : String = "border";
    private final CELLPADDING : String = "cellpadding";
    private final CELLSPACING : String = "cellspacing";
    private final COLS : String = "cols";
    private final FLOAT : String = "float";
    private final FRAME : String = "frame";
    private final RULES : String = "rules";
    private final STYLE : String = "style";
    public final BORDERCOLLAPSE : String = "border-collapse: collapse";
    private var numberOfColumns : Int = 0;
    private var before : String;
    private var border : String = null;
    private var cellpadding : String;
    private var cellspacing : String;
    private var style : String = null;
    private var name : String = null;
    private var after : String;
    private var htmlRowsVector : BasicArrayList;
    public function new(before : String, cellpadding : String, cellspacing : String, after : String) {
        super();
        this.before = before;
        this.cellpadding = cellpadding;
        this.cellspacing = cellspacing;
        this.after = after;
        this.htmlRowsVector = new BasicArrayListD();
        addAttribute(this.BORDER, CommonPhoneStrings.getInstance().ZERO);
        addAttribute(this.CELLPADDING, this.cellpadding);
        addAttribute(this.CELLSPACING, this.cellspacing);
        addAttribute(this.STYLE, this.BORDERCOLLAPSE);
    }

    public function addRow(htmlRow : HtmlRow) : Void {
        if (this.numberOfColumns < htmlRow.getNumberOfColumns()) {
            this.numberOfColumns = htmlRow.getNumberOfColumns();
        }
        this.htmlRowsVector.add(htmlRow);
    }

    public function toString() : String {
        final stringUtil : StringUtil = StringUtil.getInstance();
        var result : String = stringUtil.EMPTY_STRING;
        var attributeKeys : haxe.ds.Vector<Any> = this.otherAttributes.keySet().toArray();
        result = this.before;
        result += this.START;
        result += " ";
        for (i in 0...attributeKeys.length) {
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
        final size : Int = this.htmlRowsVector.size();
        for (i in 0...size) {
            result += this.htmlRowsVector.get(i).toString();
            result += " ";
        }
        result += this.ENDTAG;
        result += this.after;
        return result;
    }

}

