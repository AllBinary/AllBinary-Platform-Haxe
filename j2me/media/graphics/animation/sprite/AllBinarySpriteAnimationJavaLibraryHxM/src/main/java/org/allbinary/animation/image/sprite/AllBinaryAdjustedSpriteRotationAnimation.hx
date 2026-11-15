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

import javax.microedition.lcdui.Graphics;
import javax.microedition.lcdui.Image;
import javax.microedition.lcdui.game.Sprite;
import org.allbinary.animation.AnimationBehavior;

class AllBinaryAdjustedSpriteRotationAnimation extends AllBinarySpriteRotationAnimation {
    private var dx : Int;
    private var dy : Int;
    public function new(sprite : Sprite, image : Image, dx : Int, dy : Int, animationBehavior : AnimationBehavior) {
        super(sprite, image, animationBehavior);
        this.dx = dx;
        this.dy = dy;
    }

    public override function paintXY(g : Graphics, x : Int, y : Int) : Void {
        this.sprite.setPosition(x + this.dx, y + this.dy);
        this.paint(g);
    }

}

