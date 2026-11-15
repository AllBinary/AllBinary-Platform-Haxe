// Generated Code Do Not Modify
package org.allbinary.graphics.form.item;

import javax.microedition.lcdui.Graphics;
import org.allbinary.graphics.color.BasicColor;

class ABTextItem extends CustomCustomItem implements ABCustomItemInterface {
    public function new(label : String, layout : Int, altText : String, backgroundBasicColor : BasicColor, foregroundBasicColor : BasicColor) {
        super(label, backgroundBasicColor, foregroundBasicColor);
    }

    public function keyPressed(keyCode : Int) : Void {
    }

    public override function paintUnselected(graphics : Graphics, x : Int, y : Int) : Void {
    }

    public function getLabelStringComponent() : ABStringComponent {
        return ABStringComponent.NULL_STRING_COMPONENT;
    }

    public override function getMinimumWidth() : Int {
        return super.getMinimumWidth();
    }

    public override function getMinimumHeight() : Int {
        return super.getMinimumHeight();
    }

    public override function getLabel() : String {
        return super.getLabel();
    }

    public override function paintXY(graphics : Graphics, x : Int, y : Int) : Void {
        super.paintXY(graphics, x, y);
    }

}

