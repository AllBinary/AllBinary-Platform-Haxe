// Generated Code Do Not Modify
package org.allbinary.graphics.form.item;

import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.color.BasicColorFactory;
import org.allbinary.logic.string.StringUtil;

class ABCustomGaugeItem extends ABCustomItem {
    public static final NULL_GAUGE_ITEM : ABCustomGaugeItem = new ABCustomGaugeItem(StringUtil.getInstance().EMPTY_STRING, 1, 0, BasicColorFactory.getInstance().BLACK, BasicColorFactory.getInstance().WHITE);
    public function new(label : String, maxValue : Int, initialValue : Int, backgroundBasicColor : BasicColor, foregroundBasicColor : BasicColor) {
        super(label, backgroundBasicColor, foregroundBasicColor);
    }

}

