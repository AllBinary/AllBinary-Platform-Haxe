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
package org.allbinary.animation.image.sprite;

//import javax.microedition.lcdui.Graphics;
//import javax.microedition.lcdui.Image;
//import javax.microedition.lcdui.game.Sprite;
import org.allbinary.animation.AnimationBehavior;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.color.BasicColorUtil;

class AdjustedSpriteIndexedAnimation extends SpriteIndexedAnimation {
    private var dx : Int;
    private var dy : Int;
    public function new(sprite : Sprite, image : Image, basicColorArray : haxe.ds.Vector<BasicColor>, dx : Int, dy : Int, animationBehavior : AnimationBehavior) {
        super(sprite, image, basicColorArray, animationBehavior);
        this.dx = dx;
        this.dy = dy;
    }

    public override function paintFrame(graphics : Graphics, frame : Int, x : Int, y : Int) : Void {
        this.setFrame(frame);
        this.sprite.setPosition(x + this.dx, y + this.dy);
        super.paint(graphics);
    }

    public override function paintXY(g : Graphics, x : Int, y : Int) : Void {
        this.sprite.setPosition(x + this.dx, y + this.dy);
        super.paint(g);
    }

    public override function paint(g : Graphics) : Void {
        this.sprite.setPosition(this.dx, this.dy);
        super.paint(g);
    }

}

