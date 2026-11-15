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
package org.allbinary.animation;

//import javax.microedition.lcdui.Graphics;
import org.allbinary.graphics.color.BasicColor;

class AdjustedVectorAnimation extends VectorAnimation {
    private var dx : Int;
    private var dy : Int;
    public function new(currentPoints : haxe.ds.Vector<haxe.ds.Vector<haxe.ds.Vector<Int>>>, basicColor : BasicColor, dx : Int, dy : Int, animationBehavior : AnimationBehavior) {
        super(currentPoints, basicColor, animationBehavior);
        this.dx = dx;
        this.dy = dy;
    }

    public override function paintXY(graphics : Graphics, x : Int, y : Int) : Void {
        super.paintXY(graphics, x + this.dx, y + this.dy);
    }

}

