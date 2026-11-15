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
import org.allbinary.logic.NullUtil;
import org.allbinary.logic.math.PrimitiveIntUtil;
import org.allbinary.math.AngleInfo;
import org.allbinary.util.CircularIndexUtil;

class VectorBaseRotationAnimation extends RotationAnimation implements VectorAnimationInterface {
    private var currentPoints : haxe.ds.Vector<haxe.ds.Vector<haxe.ds.Vector<Int>>> = NullUtil.getInstance().NULL_INT_ARRAY_ARRAY_ARRAY;
    public function new(angleInfo : AngleInfo, currentPoints : haxe.ds.Vector<haxe.ds.Vector<haxe.ds.Vector<Int>>>, basicColor : BasicColor, animationBehavior : AnimationBehavior) {
        super(angleInfo, CircularIndexUtil.createInstance(360 / angleInfo.getAngleIncrementInfo().getAngleIncrement()), animationBehavior);
        this.setPoints(currentPoints);
        this.setBasicColorP(basicColor);
    }

    // throws Exception
    public override function getAnimationSize() : Int {
        return this.getSize();
    }

    public override function getFrame() : Int {
        return this.circularIndexUtil.getIndex();
    }

    public override function setFrame(index : Int) : Void {
        this.circularIndexUtil.setIndex(index);
    }

    public override function nextFrame() : Void {
        this.circularIndexUtil.next();
    }

    public override function previousFrame() : Void {
        this.circularIndexUtil.previous();
    }

    public override function getSize() : Int {
        return this.currentPoints.length;
    }

    public override function setSequence(sequence : haxe.ds.Vector<Int>) : Void {
    }

    public override function getSequence() : haxe.ds.Vector<Int> {
        return PrimitiveIntUtil.getArrayInstance();
    }

    public override function paintXY(graphics : Graphics, x : Int, y : Int) : Void {
        this.basicSetColorUtil.setBasicColorP(graphics, this.basicColor);
        try {
            var nextPointX : Int = 0;
            var nextPointY : Int = 0;
            var nextPoint : haxe.ds.Vector<Int> = null;
            var point : haxe.ds.Vector<Int> = null;
            final currentPointsFrame : haxe.ds.Vector<haxe.ds.Vector<Int>> = this.currentPoints[this.circularIndexUtil.getIndex()];
            final size : Int = currentPointsFrame.length;
            var index : Int = size - 2;
            while (--index >= 0) {
                nextPoint = currentPointsFrame[index];
                point = currentPointsFrame[index + 1];
                nextPointX = nextPoint[0];
                nextPointY = nextPoint[1];
                if (nextPointX != 1000) {
                    graphics.drawLine(point[0] + x, point[1] + y, nextPointX + x, nextPointY + y);
                } else {
                    index--;
                }
            }
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "paintVectors", e);
        }
    }

    public override function getPoints(frame : Int) : haxe.ds.Vector<haxe.ds.Vector<Int>> {
        return this.currentPoints[frame];
    }

    public function setPoints(currentPoints : haxe.ds.Vector<haxe.ds.Vector<haxe.ds.Vector<Int>>>) : Void {
        this.currentPoints = currentPoints;
        this.circularIndexUtil = CircularIndexUtil.createInstance(this.currentPoints.length);
    }

}

