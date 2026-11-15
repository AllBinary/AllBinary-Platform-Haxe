// Generated Code Do Not Modify
package org.allbinary.graphics.form.item;

import javax.microedition.lcdui.Canvas;
import javax.microedition.lcdui.Font;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.util.visitor.Visitor;

class ABTextFieldItem extends ABTextItem {
    private var font : Font;
    public function new(canvas : Canvas, visitor : Visitor, label : String, value : String, maxSize : Int, layout : Int, altText : String, font : Font, backgroundBasicColor : BasicColor, foregroundBasicColor : BasicColor) {
        super(label, layout, altText, backgroundBasicColor, foregroundBasicColor);
        this.font = font;
    }

    public override function getLabel() : String {
        return StringUtil.getInstance().EMPTY_STRING;
    }

    public override function setLabel(label : String) : Void {
    }

    public function getString() : String {
        return StringUtil.getInstance().EMPTY_STRING;
    }

    public function setString(string : String) : Void {
    }

    public function setFocus(state : Bool) : Void {
    }

    public function getFontHeight() : Int {
        return this.font.getHeight();
    }

    public function setBackgroundBasicColorP(basicColor : BasicColor) : Void {
    }

    public function setForegroundBasicColorP(basicColor : BasicColor) : Void {
    }

}

