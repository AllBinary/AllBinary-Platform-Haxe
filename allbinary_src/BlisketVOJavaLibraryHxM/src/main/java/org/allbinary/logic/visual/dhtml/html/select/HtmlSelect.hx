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
package org.allbinary.logic.visual.dhtml.html.select;

import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.io.LineReader;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.visual.dhtml.html.HtmlTag;

class HtmlSelect extends HtmlTag {
    private final END : String = ">";
    private final STARTSELECT : String = "<SELECT ";
    private final ENDSELECT : String = "</SELECT>";
    private final SIZE : String = "SIZE=\"";
    private final NAME : String = "NAME=\"";
    private final STARTOPTION : String = "<OPTION";
    private final SELETED : String = "SELECTED";
    private final ENDOPTION : String = "</OPTION>";
    private var before : String;
    private var name : String;
    private var after : String;
    private var size : String;
    private var selected : String = null;
    private var options : BasicArrayList;
    private var multiple : String = "multiple";
    private var isMultipleSelect : Bool = false;
    public function new(before : String, size : String, name : String, after : String) {
        super();
        this.before = before;
        this.size = size;
        this.name = name;
        this.after = after;
        this.options = new BasicArrayListD();
    }

    public function addOption(key : String) : Void {
        this.options.add(key);
    }

    public function addOptions(fileName : String) : Void {
        try {
            var lineReader : LineReader = new LineReader(fileName);
            while (lineReader.hasNext()) {
                var option : String = lineReader.next();
                this.addOption(option);
            }
        } catch (e : haxe.Exception) {
            this.addOption("Error");
        }
    }

    public function setSelected(selected : String) : Void {
        this.selected = selected;
    }

    public function isMultiple() : Bool {
        return this.isMultipleSelect;
    }

    public function setMultiple(value : Bool) : Void {
        this.isMultipleSelect = value;
    }

    private function getOptions() : String {
        final stringUtil : StringUtil = StringUtil.getInstance();
        var result : String = stringUtil.EMPTY_STRING;
        var optionsArray : haxe.ds.Vector<Any> = this.options.toArray();
        var optionsSize : Int = optionsArray.length;
        for (i in 0...optionsSize) {
            var value : String = (cast optionsArray[i] : String);
            if (value != null && value.compareTo(stringUtil.EMPTY_STRING) != 0) {
                result += this.STARTOPTION;
                result += this.END;
                result += value;
                result += this.ENDOPTION;
            }
        }
        return result;
    }

    public function toString() : String {
        final stringUtil : StringUtil = StringUtil.getInstance();
        var result : String = stringUtil.EMPTY_STRING;
        var attributeKeys : haxe.ds.Vector<Any> = this.otherAttributes.keySet().toArray();
        var attributeSize : Int = attributeKeys.length;
        result = this.before;
        result += this.STARTSELECT;
        result += this.NAME;
        result += this.name;
        result += "\" ";
        result += this.SIZE;
        result += this.size;
        result += "\" ";
        for (i in 0...attributeSize) {
            var key : String = (cast attributeKeys[i] : String);
            var value : String = (cast otherAttributes.get(key) : String);
            if (value != null && value.compareTo(stringUtil.EMPTY_STRING) != 0) {
                result += key;
                result += "=\"";
                result += value;
                result += "\" ";
            }
        }
        if (this.isMultiple()) {
            result += " " + this.multiple + " ";
        }
        result += this.END;
        result += this.getOptions();
        result += this.ENDSELECT;
        result += this.after;
        return result;
    }

}

