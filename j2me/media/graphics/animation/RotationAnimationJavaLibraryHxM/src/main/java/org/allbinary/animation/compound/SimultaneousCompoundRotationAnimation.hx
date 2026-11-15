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
package org.allbinary.animation.compound;

//import javax.microedition.khronos.opengles.GL;
//import javax.microedition.lcdui.Graphics;
import org.allbinary.animation.AnimationBehavior;
import org.allbinary.animation.RotationAnimation;
import org.allbinary.direction.Direction;
import org.allbinary.logic.math.PrimitiveIntUtil;
import org.allbinary.math.Angle;
import org.allbinary.math.AngleFactory;
import org.allbinary.math.AngleInfo;
import org.allbinary.util.CircularIndexUtil;

class SimultaneousCompoundRotationAnimation extends RotationAnimation {
    private var animationInterfaceArray : haxe.ds.Vector<RotationAnimation>;
    public function new(animationInterfaceArray : haxe.ds.Vector<RotationAnimation>, animationBehavior : AnimationBehavior) {
        super(AngleInfo.getInstance(AngleFactory.getInstance().QUARTER_TOTAL_ANGLE), CircularIndexUtil.createInstance(4), animationBehavior);
        this.animationInterfaceArray = animationInterfaceArray;
    }

    public override function setFrame(frameIndex : Int) : Void {
        {
            var index : Int = this.animationInterfaceArray.length;
            while (--index >= 0) {
            this.animationInterfaceArray[index].setFrame(frameIndex);
            }
        }
    }

    public override function getFrame() : Int {
        return this.animationInterfaceArray[0].getFrame();
    }

    // throws Exception
    public override function getAnimationSize() : Int {
        return this.animationInterfaceArray[0].getAnimationSize();
    }

    public override function getSize() : Int {
        return this.animationInterfaceArray[0].getSize();
    }

    public override function previousFrame() : Void {
        {
            var index : Int = this.animationInterfaceArray.length;
            while (--index >= 0) {
            this.animationInterfaceArray[index].previousFrame();
            }
        }
    }

    // throws Exception
    public override function nextFrame() : Void {
        {
            var index : Int = this.animationInterfaceArray.length;
            while (--index >= 0) {
            this.animationInterfaceArray[index].nextFrame();
            }
        }
    }

    public override function previousRotation() : Void {
        {
            var index : Int = this.animationInterfaceArray.length;
            while (--index >= 0) {
            this.animationInterfaceArray[index].previousRotation();
            }
        }
    }

    public override function nextRotation() : Void {
        {
            var index : Int = this.animationInterfaceArray.length;
            while (--index >= 0) {
            this.animationInterfaceArray[index].nextRotation();
            }
        }
    }

    public override function setSequence(sequence : haxe.ds.Vector<Int>) : Void {
    }

    public override function getSequence() : haxe.ds.Vector<Int> {
        return PrimitiveIntUtil.getArrayInstance();
    }

    public override function paintXY(graphics : Graphics, x : Int, y : Int) : Void {
        {
            var index : Int = this.animationInterfaceArray.length;
            while (--index >= 0) {
            this.animationInterfaceArray[index].paintXY(graphics, x, y);
            }
        }
    }

    public override function paintThreedXYZ(graphics : Graphics, x : Int, y : Int, z : Int) : Void {
        {
            var index : Int = this.animationInterfaceArray.length;
            while (--index >= 0) {
            this.animationInterfaceArray[index].paintThreedXYZ(graphics, x, y, z);
            }
        }
    }

    public override function setFrameByDirection(direction : Direction) : Void {
        {
            var index : Int = this.animationInterfaceArray.length;
            while (--index >= 0) {
            this.animationInterfaceArray[index].setFrameByDirection(direction);
            }
        }
    }

    public override function setFrameToAngle(angle : Angle) : Void {
        {
            var index : Int = this.animationInterfaceArray.length;
            while (--index >= 0) {
            this.animationInterfaceArray[index].setFrameToAngle(angle);
            }
        }
    }

    public override function adjustFrameToAngle(newAngle : Angle) : Void {
        this.adjustFrame(newAngle.getValue());
    }

    public override function adjustFrame(angle : Int) : Void {
        {
            var index : Int = this.animationInterfaceArray.length;
            while (--index >= 0) {
            this.animationInterfaceArray[index].adjustFrame(angle);
            }
        }
    }

    public override function getAngleInfoP() : AngleInfo {
        return this.animationInterfaceArray[0].getAngleInfoP();
    }

    public function getAnimationInterfaceArray() : haxe.ds.Vector<RotationAnimation> {
        return this.animationInterfaceArray;
    }

    public function setAnimationInterfaceArray(animationInterfaceArray : haxe.ds.Vector<RotationAnimation>) : Void {
        this.animationInterfaceArray = animationInterfaceArray;
    }

    // throws Exception
    public override function set(gl : GL) : Void {
        {
            var index : Int = this.animationInterfaceArray.length;
            while (--index >= 0) {
            this.animationInterfaceArray[index].set(gl);
            }
        }
    }

}

