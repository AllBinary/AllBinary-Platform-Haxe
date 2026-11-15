// Generated Code Do Not Modify
package org.allbinary.animation;

import javax.microedition.lcdui.Graphics;
import org.allbinary.graphics.color.BasicColor;

class FillAnimation extends IndexedAnimation {
    private final pixelBuffer : haxe.ds.Vector<Int>;
    private final width : Int;
    private final height : Int;
    public function new(pixelBuffer : haxe.ds.Vector<Int>, width : Int, height : Int, animationBehavior : AnimationBehavior) {
        super(animationBehavior);
        this.width = 100;
        this.height = 100;
        this.pixelBuffer = pixelBuffer;
    }

    public override function setBasicColorP(basicColor : BasicColor) : Void {
        var changed : Bool = false;
        if (this.getBasicColorP() == null || Std.int(this.getBasicColorP()) != Std.int(basicColor)) {
            changed = true;
        }
        super.setBasicColorP(basicColor);
        if (changed) {
            this.updateModifiers();
        }
    }

    public override function changeBasicColor(basicColor : BasicColor) : Void {
        var changed : Bool = false;
        if (this.getChangeBasicColor() == null || Std.int(this.getChangeBasicColor()) != Std.int(basicColor)) {
            changed = true;
        }
        super.changeBasicColor(basicColor);
        if (changed) {
            this.updateModifiers();
        }
    }

    public override function setAlpha(alpha : Int) : Void {
        var changed : Bool = false;
        if (this.alphaP != alpha) {
            changed = true;
        }
        super.setAlpha(alpha);
        if (changed) {
            this.updateModifiers();
        }
    }

    public override function setScale(scaleX : Float, scaleY : Float) : Void {
    }

    public override function setMaxScale(maxScaleX : Float, maxScaleY : Float) : Void {
    }

    private function updateModifiers() : Void {
    }

    public function paint(g : Graphics) : Void {
        g.drawRGB(pixelBuffer, 0, width, 0, 0, width, height, true);
    }

}

