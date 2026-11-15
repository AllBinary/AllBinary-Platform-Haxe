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
package org.allbinary.animation.image;

import javax.microedition.lcdui.Graphics;
import javax.microedition.lcdui.Image;
import javax.microedition.lcdui.game.Sprite;
import org.allbinary.animation.AnimationBehavior;
import org.allbinary.graphics.Anchor;

class LeftToRightImageAnimation extends ImageSegmentAnimation {
    private var currentWidth : Int;
    public function new(image : Image, sequenceArray : haxe.ds.Vector<Int>, animationBehavior : AnimationBehavior) {
        super(image, sequenceArray, animationBehavior);
        this.currentWidth = 0;
        if (this.getSequence()[0] == -1) {
            this.setFrame(this.getSize() - 1);
        }
    }

    public override function nextFrame() : Void {
        if (this.getSequence()[0] == -1) {
            super.previousFrame();
        } else {
            super.nextFrame();
        }
        this.update();
    }

    public override function previousFrame() : Void {
        if (this.getSequence()[0] == -1) {
            super.nextFrame();
        } else {
            super.previousFrame();
        }
        this.update();
    }

    public override function setFrame(index : Int) : Void {
        super.setFrame(index);
        this.update();
    }

    private function update() : Void {
        this.currentWidth = this.getDrawWidth() * this.getFrame() / this.getSize();
    }

    private var anchor : Int = Anchor.TOP_LEFT;
    public override function paintXY(graphics : Graphics, x : Int, y : Int) : Void {
        graphics.drawRegion(this.getImage(), this.getStartX(), this.getStartY(), this.currentWidth, this.getDrawHeight(), Sprite.TRANS_NONE, x, y, this.anchor);
    }

}

