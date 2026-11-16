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
import org.allbinary.media.ScaleProperties;

class VectorAnimationInterfaceFactory implements AnimationInterfaceFactoryInterface {
    private var currentPoints : haxe.ds.Vector<haxe.ds.Vector<haxe.ds.Vector<Int>>>;
    private var basicColor : BasicColor = BasicColorFactory.getInstance().WHITE;
    public final animationBehaviorFactory : AnimationBehaviorFactory;
    public function new(currentPoints : haxe.ds.Vector<haxe.ds.Vector<haxe.ds.Vector<Int>>>, basicColor : BasicColor, animationBehaviorFactory : AnimationBehaviorFactory) {
        this.currentPoints = currentPoints;
        this.setBasicColorP(basicColor);
        this.animationBehaviorFactory = animationBehaviorFactory;
    }

    // throws Exception
    public function getInstanceFor(instanceId : Int) : Animation {
        return new VectorAnimation(this.currentPoints, this.getBasicColorP(), this.animationBehaviorFactory.getOrCreateInstance());
    }

    public function setBasicColorP(basicColor : BasicColor) : Void {
        this.basicColor = basicColor;
    }

    public function getBasicColorP() : BasicColor {
        return this.basicColor;
    }

    public function setInitialScale(scaleProperties : ScaleProperties) : Void {
    }

}

