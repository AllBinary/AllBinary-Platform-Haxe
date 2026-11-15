// Generated Code Do Not Modify
package org.allbinary.graphics.form.item;

import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.color.BasicColorFactory;

class ABStringComponent {
    public static final NULL_STRING_COMPONENT : ABStringComponent = new ABStringComponent(BasicColorFactory.getInstance().BLACK, BasicColorFactory.getInstance().WHITE);
    public function getBackgroundBasicColor() : BasicColor {
        return BasicColorFactory.getInstance().WHITE;
    }

    public function new(backgroundBasicColor : BasicColor, foregroundBasicColor : BasicColor) {
    }

    public function getForegroundBasicColor() : BasicColor {
        return BasicColorFactory.getInstance().WHITE;
    }

    public function setForegroundBasicColor(foregroundBasicColor : BasicColor) : Void {
    }

}

