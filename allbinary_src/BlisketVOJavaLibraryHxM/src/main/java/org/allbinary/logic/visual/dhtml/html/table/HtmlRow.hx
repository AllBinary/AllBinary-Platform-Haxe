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

class HtmlRow extends HtmlTag {
    private final END : String = ">";
    private final START : String = "<tr ";
    private final ENDTAG : String = "</tr>";
    private var numberOfColumns : Int = 0;
    private var before : String;
    private var after : String;
    private var htmlCellsVector : BasicArrayList;
    public function new(before : String, after : String) {
        super();
        this.before = before;
        this.after = after;
        this.htmlCellsVector = new BasicArrayListD();
    }

    public function addCell(htmlCell : HtmlCell) : Void {
        this.htmlCellsVector.add(htmlCell);
        this.numberOfColumns++;
    }

    public function getNumberOfColumns() : Int {
        return this.numberOfColumns;
    }

    public function toString() : String {
        final stringUtil : StringUtil = StringUtil.getInstance();
        var result : String = stringUtil.EMPTY_STRING;
        var attributeKeys : haxe.ds.Vector<Any> = this.otherAttributes.keySet().toArray();
        var attributeSize : Int = attributeKeys.length;
        var cellSize : Int = this.htmlCellsVector.size();
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
        for (i in 0...cellSize) {
            result += this.htmlCellsVector.get(i).toString();
            result += " ";
        }
        result += this.ENDTAG;
        result += this.after;
        return result;
    }

}

