/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2022 AllBinary 
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
package org.allbinary.animation.text;

//import javax.microedition.lcdui.Graphics;
import org.allbinary.animation.AnimationBehavior;

class AdjustCustomTextAnimation extends CustomTextAnimation {
    private var dx : Int;
    private var dy : Int;
    public function new(text : String, fontSize : Int, dx : Int, dy : Int, animationBehavior : AnimationBehavior) {
        super(text, fontSize, animationBehavior);
        this.dx = dx;
        this.dy = dy;
    }

    public override function getDx() : Int {
        return this.dx;
    }

    public override function setDx(dx : Int) : Void {
        this.dx = dx;
    }

    public override function getDy() : Int {
        return this.dy;
    }

    public override function setDy(dy : Int) : Void {
        this.dy = dy;
    }

    public override function paintXY(graphics : Graphics, x : Int, y : Int) : Void {
        super.paintXY(graphics, x + this.dx, y + this.dy);
    }

}

