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
import org.allbinary.media.ScaleProperties;

class NullAnimationFactory implements AnimationInterfaceFactoryInterface implements ProceduralAnimationInterfaceFactoryInterface {
    public static var NULL_NOT_FOR_USE_ANIMATION_FACTORY : NullAnimationFactory = new NullAnimationFactory();
    private static var NULL_ANIMATION_FACTORY : NullAnimationFactory = new NullAnimationFactory();
    private final NULL_ANIMATION : Animation = /* anonymous class body:
        public function paintXY(graphics : Graphics, x : Int, y : Int) : Void {
        }

*/ new Animation();
    public final EMPTY_ARRAY : haxe.ds.Vector<Animation> = haxe.ds.Vector.fromArrayCopy([for (index in 0...0) null]);
    public function new() {
    }

    public static function getFactoryInstance() : NullAnimationFactory {
        return NullAnimationFactory.NULL_ANIMATION_FACTORY;
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

