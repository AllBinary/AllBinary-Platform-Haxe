// Generated Code Do Not Modify
package org.allbinary.graphics.form.item;

//import javax.microedition.lcdui.Graphics;
//import javax.microedition.lcdui.Screen;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.color.BasicColorFactory;
import org.allbinary.logic.NullUtil;
import org.allbinary.logic.string.StringUtil;

class ABCustomItem {
    public static var NULL_CUSTOM_ITEM : Any = NullUtil.getInstance().NULL_OBJECT;
    public static function getNullInstance() : ABCustomItem {
        if (ABCustomItem.NULL_CUSTOM_ITEM == NullUtil.getInstance().NULL_OBJECT) {
            ABCustomItem.NULL_CUSTOM_ITEM = new ABCustomItem(StringUtil.getInstance().EMPTY_STRING, BasicColorFactory.getInstance().BLACK, BasicColorFactory.getInstance().WHITE);
        }
        return (cast ABCustomItem.NULL_CUSTOM_ITEM : ABCustomItem);
    }

    public function new(label : String, backgroundBasicColor : BasicColor, foregroundBasicColor : BasicColor) {
    }

    public function setOwner(owner : Screen) : Void {
    }

    public function paintXY(graphics : Graphics, x : Int, y : Int) : Void {
    }

    public function paintUnselected(graphics : Graphics, x : Int, y : Int) : Void {
    }

    public function isFocusable() : Bool {
        return false;
    }

    public function getLabel() : String {
        return StringUtil.getInstance().EMPTY_STRING;
    }

    public function setLabel(label : String) : Void {
    }

    public function getHeight() : Int {
        return 0;
    }

    public function setHeight(height : Int) : Void {
    }

    public function getValue() : Float {
        return 0.0;
    }

    public function setValue(value : Float) : Void {
    }

    public function getMinimumWidth() : Int {
        return 0;
    }

    public function getMinimumHeight() : Int {
        return 0;
    }

    public function preMeasurement(graphics : Graphics) : Void {
    }

}

