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
import org.allbinary.logic.math.PrimitiveIntUtil;

class RightToLeftImageAnimation extends ImageSegmentAnimation {
    private var startWidth : Int = 0;
    private var currentWidth : Int = 0;
    public function new(image : Image, animationBehavior : AnimationBehavior) {
        super(image, PrimitiveIntUtil.getArrayInstance(), animationBehavior);
        this.setFrame(this.getSize() - 1);
    }

    public override function nextFrame() : Void {
        super.previousFrame();
        this.update();
    }

    public override function previousFrame() : Void {
        super.nextFrame();
        this.update();
    }

    public override function setFrame(index : Int) : Void {
        super.setFrame(index);
        this.update();
    }

    private function update() : Void {
        this.startWidth = jre.lang.JavaNumber.divide(this.getDrawWidth() * this.getFrame(), this.getSize());
        this.currentWidth = this.getDrawWidth() - this.startWidth;
    }

    private var anchor_RightToLeftImageAnimation : Int = Anchor.TOP_LEFT;
    public override function paintXY(graphics : Graphics, x : Int, y : Int) : Void {
        graphics.drawRegion(this.getImage(), this.startWidth, this.getStartY(), this.currentWidth, this.getDrawHeight(), Sprite.TRANS_NONE, x + this.startWidth, y, this.anchor_RightToLeftImageAnimation);
    }

}

