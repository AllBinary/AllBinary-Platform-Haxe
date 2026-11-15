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
package org.allbinary.animation.caption;

//import javax.microedition.lcdui.Graphics;
//import javax.microedition.media.Player;
import org.allbinary.animation.Animation;
import org.allbinary.animation.AnimationBehavior;
import org.allbinary.animation.AnimationEventHandler;
import org.allbinary.animation.IndexedAnimation;
import org.allbinary.logic.math.PrimitiveIntUtil;
import org.allbinary.logic.util.event.AllBinaryEventObject;
import org.allbinary.time.GameTickTimeDelayHelperFactory;
import org.allbinary.time.TimeDelayHelper;

class CaptionIndexedAnimation extends IndexedAnimation {
    private var animationInterface : Animation;
    private var movieIndexedAnimationInterface : IndexedAnimation;
    private var captionDx : Int;
    private var captionDy : Int;
    private var dx : Int;
    private var dy : Int;
    private var time : Int;
    private var END_EVENT : AllBinaryEventObject;
    private var timeDelayHelper : TimeDelayHelper;
    private var player : Player;
    public function new(animationInterface : Animation, movieIndexedAnimationInterface : IndexedAnimation, player : Player, captionDx : Int, captionDy : Int, dx : Int, dy : Int, time : Int, animationBehavior : AnimationBehavior) {
        super(animationBehavior);
        this.animationInterface = animationInterface;
        this.movieIndexedAnimationInterface = movieIndexedAnimationInterface;
        this.captionDx = captionDx;
        this.captionDy = captionDy;
        this.dx = dx;
        this.dy = dy;
        this.time = time;
        this.END_EVENT = new AllBinaryEventObject(this);
        var timePerFrame : Int = Std.int(this.time / this.getSize());
        this.timeDelayHelper = new TimeDelayHelper(timePerFrame);
        this.player = player;
        this.player.start();
    }

    // throws Exception
    public override function nextFrame() : Void {
        if (this.timeDelayHelper.isTime(GameTickTimeDelayHelperFactory.getInstance().startTime)) {
            this.movieIndexedAnimationInterface.nextFrame();
        }
        if (this.isLastFrame()) {
            AnimationEventHandler.getInstance().fireEvent(this.END_EVENT);
        }
    }

    public override function isLastFrame() : Bool {
        if (this.movieIndexedAnimationInterface.getFrame() == this.getSize() - 1) {
            return true;
        } else {
            return false;
        }
    }

    public override function previousFrame() : Void {
        this.movieIndexedAnimationInterface.previousFrame();
    }

    public override function setFrame(index : Int) : Void {
        this.movieIndexedAnimationInterface.setFrame(index);
    }

    public override function getFrame() : Int {
        return this.movieIndexedAnimationInterface.getFrame();
    }

    public override function getSize() : Int {
        return this.movieIndexedAnimationInterface.getSize();
    }

    public override function setSequence(sequence : haxe.ds.Vector<Int>) : Void {
    }

    public override function getSequence() : haxe.ds.Vector<Int> {
        return PrimitiveIntUtil.getArrayInstance();
    }

    public override function paintXY(graphics : Graphics, x : Int, y : Int) : Void {
        this.animationInterface.paintXY(graphics, x + this.captionDx, y + this.captionDy);
        this.movieIndexedAnimationInterface.paintXY(graphics, x + this.captionDx + this.dx, y + this.captionDy + this.dy);
    }

    public override function paintThreedXYZ(graphics : Graphics, x : Int, y : Int, z : Int) : Void {
        this.animationInterface.paintThreedXYZ(graphics, x + this.captionDx, y + this.captionDy, z);
        this.movieIndexedAnimationInterface.paintThreedXYZ(graphics, x + this.captionDx + this.dx, y + this.captionDy + this.dy, z);
    }

}

