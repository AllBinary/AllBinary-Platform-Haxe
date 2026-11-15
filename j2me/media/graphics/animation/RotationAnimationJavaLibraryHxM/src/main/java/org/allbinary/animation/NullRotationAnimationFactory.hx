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
import org.allbinary.math.AngleFactory;
import org.allbinary.math.AngleInfo;
import org.allbinary.media.ScaleProperties;
import org.allbinary.util.CircularIndexUtil;

class NullRotationAnimationFactory implements AnimationInterfaceFactoryInterface implements ProceduralAnimationInterfaceFactoryInterface {
    private static var NULL_ROTATION_ANIMATION_FACTORY : NullRotationAnimationFactory = new NullRotationAnimationFactory();
    public final NULL_ROTATION_ANIMATION_ARRAY : haxe.ds.Vector<RotationAnimation> = haxe.ds.Vector.fromArrayCopy([for (index in 0...0) null]);
    // Java inner class: Haxe does not nest classes so move this to its own module
    class NullRotationAnimation2 extends NullRotationAnimation {
        public function new() {
            super(AngleInfo.getInstance(AngleFactory.getInstance().QUARTER_TOTAL_ANGLE), CircularIndexUtil.createInstance(4), new IndexedAnimationBehavior(1, 250));
        }

        public override function paintXY(graphics : Graphics, x : Int, y : Int) : Void {
        }

    }
    private final NULL_ANIMATION : Animation = new NullRotationAnimation2();
    public function new() {
    }

    public static function getFactoryInstance() : NullRotationAnimationFactory {
        return NullRotationAnimationFactory.NULL_ROTATION_ANIMATION_FACTORY;
    }

    public function getInstance(instanceId : Int) : Animation {
        return this.NULL_ANIMATION;
    }

    // throws Exception
    public function getInstanceAnimation(animationInterface : Animation) : Animation {
        return this.NULL_ANIMATION;
    }

    public function setInitialScale(scaleProperties : ScaleProperties) : Void {
    }

}

