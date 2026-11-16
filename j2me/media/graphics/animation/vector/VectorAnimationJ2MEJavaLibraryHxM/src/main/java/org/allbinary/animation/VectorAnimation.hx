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

import javax.microedition.lcdui.Graphics;
import javax.microedition.lcdui.NullImage;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.logic.NullUtil;
import org.allbinary.logic.math.PrimitiveIntUtil;
import org.allbinary.util.CircularIndexUtil;

class VectorAnimation extends IndexedAnimation implements VectorAnimationInterface {
    public static function createVectorAnimation(currentPoints2 : haxe.ds.Vector<haxe.ds.Vector<Int>>, basicColor : BasicColor, animationBehavior : AnimationBehavior) : VectorAnimation {
        final currentPoints : haxe.ds.Vector<haxe.ds.Vector<haxe.ds.Vector<Int>>> = haxe.ds.Vector.fromArrayCopy([for (index in 0...1) haxe.ds.Vector.fromArrayCopy([for (index2 in 0...currentPoints2.length) haxe.ds.Vector.fromArrayCopy([for (index3 in 0...2) 0])])]);
        var size : Int = currentPoints2.length;
        for (index in 0...size) {
            currentPoints[0][index][0] = currentPoints2[index][0];
            currentPoints[0][index][1] = currentPoints2[index][1];
        }
        return new VectorAnimation(currentPoints, basicColor, animationBehavior);
    }

    private var currentPoints : haxe.ds.Vector<haxe.ds.Vector<haxe.ds.Vector<Int>>> = NullUtil.getInstance().NULL_INT_ARRAY_ARRAY_ARRAY;
    private var circularIndexUtil : CircularIndexUtil = CircularIndexUtil.createInstance(0);
    public function new(currentPoints : haxe.ds.Vector<haxe.ds.Vector<haxe.ds.Vector<Int>>>, basicColor : BasicColor, animationBehavior : AnimationBehavior) {
        super(animationBehavior);
        this.setPoints(currentPoints);
        this.setBasicColorP(basicColor);
    }

    public override function setBasicColorP(basicColor : BasicColor) : Void {
        var changed : Bool = false;
        if (this.getBasicColorP() == null || jre.lang.JavaObject.intValue(this.getBasicColorP()) != basicColor.intValue()) {
            changed = true;
        }
        super.setBasicColorP(basicColor);
        if (changed) {
            this.updateModifiers();
        }
    }

    public override function changeBasicColor(basicColor : BasicColor) : Void {
        var changed : Bool = false;
        if (this.getChangeBasicColor() == null || jre.lang.JavaObject.intValue(this.getChangeBasicColor()) != basicColor.intValue()) {
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

    // throws Exception
    public override function getAnimationSize() : Int {
        return this.getSize();
    }

    public override function getSize() : Int {
        return this.currentPoints.length;
    }

    public override function setSequence(sequence : haxe.ds.Vector<Int>) : Void {
    }

    public override function getSequence() : haxe.ds.Vector<Int> {
        return PrimitiveIntUtil.getArrayInstance();
    }

    public override function nextFrame() : Void {
        this.circularIndexUtil.next();
    }

    public override function previousFrame() : Void {
        this.circularIndexUtil.previous();
    }

    public function paintVectors(graphics : Graphics, x : Int, y : Int) : Void {
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

    public override function paintXY(graphics : Graphics, x : Int, y : Int) : Void {
        this.basicSetColorUtil.setBasicColorP(graphics, this.basicColor);
        this.paintVectors(graphics, x, y);
    }

    public override function getFrame() : Int {
        return this.circularIndexUtil.getIndex();
    }

    public override function setFrame(index : Int) : Void {
        this.circularIndexUtil.setIndex(index);
    }

    public function getPoints(frame : Int) : haxe.ds.Vector<haxe.ds.Vector<Int>> {
        return this.currentPoints[frame];
    }

    public function setPoints(currentPoints : haxe.ds.Vector<haxe.ds.Vector<haxe.ds.Vector<Int>>>) : Void {
        this.currentPoints = currentPoints;
        this.circularIndexUtil = CircularIndexUtil.createInstance(currentPoints.length);
    }

    public override function getBasicColorP() : BasicColor {
        return super.getBasicColorP();
    }

}

