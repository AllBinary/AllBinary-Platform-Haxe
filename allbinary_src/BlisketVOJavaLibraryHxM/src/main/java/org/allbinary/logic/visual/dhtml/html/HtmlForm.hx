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
package org.allbinary.logic.visual.dhtml.html;

import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.visual.dhtml.html.input.HtmlInput;
import org.allbinary.logic.visual.dhtml.html.table.HtmlTable;

class HtmlForm {
    private final FORMBEGIN : String = "<form ";
    private final END : String = ">";
    private final FORMEND : String = "</form>";
    private final ACTION : String = "ACTION=\"";
    private final GET : String = "GET\"";
    private final POST : String = "POST\"";
    private final METHODS : haxe.ds.Vector<String>;
    private final METHOD : String = "METHOD=\"";
    private var method : String = null;
    private var action : String;
    public var inputs : BasicArrayList;
    public function new(action : String) {
        this.METHODS = haxe.ds.Vector.fromArrayCopy([this.GET, this.POST]);
        this.action = action;
        this.inputs = new BasicArrayListD();
    }

    public function setPost() : Void {
        this.method = this.POST;
    }

    public function setGet() : Void {
        this.method = this.GET;
    }

    public function addInput(htmlInput : HtmlInput) : Void {
        this.inputs.add(htmlInput);
    }

    public function addTable(htmlTable : HtmlTable) : Void {
        this.inputs.add(htmlTable);
    }

    public function toString() : String {
        final stringUtil : StringUtil = StringUtil.getInstance();
        var result : String = stringUtil.EMPTY_STRING;
        var inputArray : haxe.ds.Vector<Any> = this.inputs.toArray();
        var inputSize : Int = inputArray.length;
        result = this.FORMBEGIN;
        result += this.METHOD;
        result += this.method;
        result += "\" ";
        result += this.ACTION;
        result += this.action;
        result += "\" ";
        result += this.END;
        for (i in 0...inputSize) {
            result += Std.string(inputArray[i]);
            result += " ";
        }
        result += this.FORMEND;
        return result;
    }

}

