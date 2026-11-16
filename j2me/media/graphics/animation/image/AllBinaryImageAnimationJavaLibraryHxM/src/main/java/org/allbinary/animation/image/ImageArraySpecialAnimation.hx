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
import org.allbinary.animation.AnimationBehavior;
import org.allbinary.animation.special.SpecialAnimationInterface;
import org.allbinary.graphics.displayable.DisplayInfoSingleton;
import org.allbinary.time.GameTickTimeDelayHelperFactory;
import org.allbinary.time.TimeDelayHelper;

class ImageArraySpecialAnimation extends ImageArrayAnimation implements SpecialAnimationInterface {
    private final timeDelayHelper : TimeDelayHelper = new TimeDelayHelper(270);
    public function new(imageArray : haxe.ds.Vector<Image>, animationBehavior : AnimationBehavior) {
        super(imageArray, animationBehavior);
        this.reset();
    }

    private var loopCount : Int = 0;
    public function getLoopCount() : Int {
        return this.loopCount;
    }

    public function setLastFrame() : Void {
        this.circularIndexUtil.setIndex(this.circularIndexUtil.getSize() - 1);
    }

    public override function reset() : Void {
        this.setFrame(this.getSize() - 1);
        this.loopCount = 0;
    }

    public override function nextFrame() : Void {
        if (this.getFrame() > 0) {
            if (this.timeDelayHelper.isTime(GameTickTimeDelayHelperFactory.getInstance().startTime)) {
                this.previousFrame();
                if (this.getFrame() == 0) {
                    this.loopCount++;
                }
            }
        }
    }

    private final loopCountTotal : Int = 1;
    public function isComplete() : Bool {
        if (this.loopCount < this.loopCountTotal || this.getFrame() != 0) {
            return false;
        } else {
            return true;
        }
    }

    public override function paintXY(graphics : Graphics, x : Int, y : Int) : Void {
        x = DisplayInfoSingleton.getInstance().getLastHalfWidth() - (this.getImage(this.circularIndexUtil.getIndex()).getWidth() >> 1);
        y = 5;
        super.paintXY(graphics, x, y);
    }

}

