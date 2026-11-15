// Generated Code Do Not Modify
package org.allbinary.graphics.form;

//import javax.microedition.lcdui.Graphics;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.form.item.ABCustomItem;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.string.CommonStrings;

class ABCustomForm extends CustomScreen {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    public function new(title : String, items : haxe.ds.Vector<ABCustomItem>, backgroundBasicColor : BasicColor, foregroundBasicColor : BasicColor) {
        super();
    }

    public function getAllitems() : haxe.ds.Vector<ABCustomItem> {
        return haxe.ds.Vector.fromArrayCopy([for (index in 0...0) null]);
    }

    public function size() : Int {
        return 0;
    }

    public function setSelectedIndex(index : Int) : Void {
    }

    public function getSelectedIndex() : Int {
        return 0;
    }

    public function deleteAll() : Void {
    }

    public function delete(itemNum : Int) : Void {
    }

    public function append(item : ABCustomItem) : Int {
        return -1;
    }

    public function insert(itemNum : Int, item : ABCustomItem) : Void {
    }

    public function set(itemNum : Int, item : ABCustomItem) : Void {
    }

    public function get(itemNum : Int) : ABCustomItem {
        return ABCustomItem.getNullInstance();
    }

    public function getWidth() : Int {
        throw new haxe.Exception();
    }

    public function paint(graphics : Graphics) : Void {
    }

    public function getTitle() : String {
        return StringUtil.getInstance().EMPTY_STRING;
    }

}

