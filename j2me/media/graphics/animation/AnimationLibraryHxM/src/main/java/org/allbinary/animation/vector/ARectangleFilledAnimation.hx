// Generated Code Do Not Modify
package org.allbinary.animation.vector;

import javax.microedition.lcdui.Graphics;
import org.allbinary.graphics.color.BasicColorFactory;

class ARectangleFilledAnimation extends RectangleFilledAnimation {
    public var x : Int = 0;
    public var y : Int = 0;
    public function new() {
        super(0, 0, BasicColorFactory.getInstance().BLACK);
    }

    public override function nextFrame() : Void {
    }

    public override function paintXY(graphics : Graphics, unusedX : Int, unusedY : Int) : Void {
        super.paintXY(graphics, this.x, this.y);
    }

}

