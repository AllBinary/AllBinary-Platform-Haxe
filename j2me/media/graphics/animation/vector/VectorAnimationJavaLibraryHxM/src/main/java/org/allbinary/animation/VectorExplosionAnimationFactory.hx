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

import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.color.BasicColorFactory;

class VectorExplosionAnimationFactory implements ProceduralAnimationInterfaceFactoryInterface {
    private final vectorExplosionGenerator : VectorExplosionGenerator = VectorExplosionGenerator.getInstance();
    private var basicColor : BasicColor = BasicColorFactory.getInstance().WHITE;
    public final animationBehaviorFactory : AnimationBehaviorFactory;
    public function new(basicColor : BasicColor, animationBehaviorFactory : AnimationBehaviorFactory) {
        this.animationBehaviorFactory = animationBehaviorFactory;
        this.setBasicColorP(basicColor);
    }

    // throws Exception
    public function getInstanceAnimation(animationInterface : Animation) : Animation {
        final vectorRotationAnimationInterface : VectorAnimationInterface = (cast animationInterface : VectorAnimationInterface);
        final frame : Int = vectorRotationAnimationInterface.getFrame();
        final framePoints : haxe.ds.Vector<haxe.ds.Vector<Int>> = vectorRotationAnimationInterface.getPoints(frame);
        final points : haxe.ds.Vector<haxe.ds.Vector<haxe.ds.Vector<Int>>> = this.vectorExplosionGenerator.getInstanceFor(framePoints, 6, this.vectorExplosionGenerator.ROTATION);
        return new VectorRotationAnimation(points, this.getBasicColorP(), this.animationBehaviorFactory.getOrCreateInstance());
    }

    private function setBasicColorP(basicColor : BasicColor) : Void {
        this.basicColor = basicColor;
    }

    private function getBasicColorP() : BasicColor {
        return this.basicColor;
    }

}

